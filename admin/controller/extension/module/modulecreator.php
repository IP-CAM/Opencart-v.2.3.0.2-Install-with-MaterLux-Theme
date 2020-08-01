<?php
class ControllerExtensionModulemodulecreator extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/modulecreator');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		
		$this->load->model('localisation/language');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->createmodule($this->request->post['name']);
		}
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_select_all'] = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_files'] = $this->language->get('entry_files');
		$data['entry_setting_clone'] = $this->language->get('entry_setting_clone');
		$data['entry_module'] = $this->language->get('entry_module');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['name'] = '';
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/modulecreator', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/modulecreator', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['modulecreator_status'])) {
			$data['modulecreator_status'] = $this->request->post['modulecreator_status'];
		} else {
			$data['modulecreator_status'] = $this->config->get('modulecreator_status');
		}
		
		$module_list = glob(DIR_APPLICATION . 'controller/extension/module/*.php');
		foreach ($module_list as $module) {
			$data['module_list'][] = basename($module, ".php");
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/modulecreator', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/modulecreator')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	
	protected function rsearch($folder, $pattern) {
		$modulefiles = array();
		$iti = new RecursiveDirectoryIterator($folder);
		foreach(new RecursiveIteratorIterator($iti) as $file){
			 if(strpos($file , $pattern) !== false){
				$modulefiles[] = $file;
			 }
		}
		return $modulefiles;
	}
	protected function createmodule($modulename) {
		
		if (!file_exists(DIR_CACHE . 'modulecreator/')) {
			mkdir(DIR_CACHE . 'modulecreator/', 0777, true);
		}
		
		if ($this->request->post['module'] != '') {	
			
			$zipfile = DIR_CACHE . 'modulecreator/' . $this->request->post['module'] . '.ocmod.zip';
			$zip = new ZipArchive();
			$zip->open($zipfile, ZipArchive::CREATE | ZipArchive::OVERWRITE);
		
			$modulefiles = $this->rsearch(str_replace("/admin", "", DIR_APPLICATION), "/" . $this->request->post['module']);
		
			
			
			
			foreach ($modulefiles as $mfile) {
				$mfiledir = DIR_CACHE . 'modulecreator/upload/' . str_replace(str_replace("/admin", "", DIR_APPLICATION), "", $mfile->getPath());
				$zip->addFile($mfile->getRealPath(), 'upload/' . str_replace(str_replace("/admin", "", DIR_APPLICATION), "", $mfile->getRealPath()));
			}
			
		}
		else {
			$zipfile = DIR_CACHE . 'modulecreator/' . mb_strtolower(str_replace(' ', '', $modulename)) . '.ocmod.zip';
			$zip = new ZipArchive();
			$zip->open($zipfile, ZipArchive::CREATE | ZipArchive::OVERWRITE);
			$crfile = $this->request->post['createfile'];
			if (in_array('admin/controller', $crfile)) {
				$filetext = "<?php
class ControllerExtensionModule" . str_replace(' ', '', $modulename) . " extends Controller {
	private \$error = array();

	public function index() {
		
		";
		if (in_array('admin/model', $crfile)) {
			$filetext .= "\$this->load->model('extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . "');
			
		";
		}
		$filetext .= "\$this->load->language('extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . "');

		\$this->document->setTitle(\$this->language->get('heading_title'));
		
		";
		
		if ($this->request->post['setting_clone'] == 0) {
			$filetext .= "\$this->load->model('setting/setting');
		
		";
		}
		else {
			$filetext .= "\$this->load->model('extension/module');
		
		";
		}
		
		
		$filetext .= "if ((\$this->request->server['REQUEST_METHOD'] == 'POST') && \$this->validate()) {
			";
		if ($this->request->post['setting_clone'] == 0) {
			$filetext .= "\$this->model_setting_setting->editSetting('" . mb_strtolower(str_replace(' ', '', $modulename)) . "', \$this->request->post);
			";
		}
		else {
			$filetext .= "if (!isset(\$this->request->get['module_id'])) {
				\$this->model_extension_module->addModule('" . mb_strtolower(str_replace(' ', '', $modulename)) . "', \$this->request->post);
			} else {
				\$this->model_extension_module->editModule(\$this->request->get['module_id'], \$this->request->post);
			}
			";
		}
			$filetext .= "

			\$this->session->data['success'] = \$this->language->get('text_success');

			\$this->response->redirect(\$this->url->link('extension/extension', 'token=' . \$this->session->data['token'], 'SSL'));
		}

		\$data['heading_title'] = \$this->language->get('heading_title');
		
		\$data['text_edit'] = \$this->language->get('text_edit');
		\$data['text_enabled'] = \$this->language->get('text_enabled');
		\$data['text_disabled'] = \$this->language->get('text_disabled');
		
		";
		if ($this->request->post['setting_clone'] != 0) {
			$filetext .= "\$data['entry_name'] = \$this->language->get('entry_name');
			";
		}
		$filetext .= "\$data['entry_status'] = \$this->language->get('entry_status');

		\$data['button_save'] = \$this->language->get('button_save');
		\$data['button_cancel'] = \$this->language->get('button_cancel');

		if (isset(\$this->error['warning'])) {
			\$data['error_warning'] = \$this->error['warning'];
		} else {
			\$data['error_warning'] = '';
		}
		
		";
		if ($this->request->post['setting_clone'] != 0) {
			$filetext .= "if (isset(\$this->error['name'])) {
			\$data['error_name'] = \$this->error['name'];
		} else {
			\$data['error_name'] = '';
		}
		
		";
		}

		$filetext .= "\$data['breadcrumbs'] = array();

		\$data['breadcrumbs'][] = array(
			'text' => \$this->language->get('text_home'),
			'href' => \$this->url->link('common/dashboard', 'token=' . \$this->session->data['token'], true)
		);

		\$data['breadcrumbs'][] = array(
			'text' => \$this->language->get('text_extension'),
			'href' => \$this->url->link('extension/extension', 'token=' . \$this->session->data['token'] . '&type=module', true)
		);

		\$data['breadcrumbs'][] = array(
			'text' => \$this->language->get('heading_title'),
			'href' => \$this->url->link('extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . "', 'token=' . \$this->session->data['token'], true)
		);

		if (!isset(\$this->request->get['module_id'])) {
			\$data['action'] = \$this->url->link('extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . "', 'token=' . \$this->session->data['token'], true);
		} else {
			\$data['action'] = \$this->url->link('extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . "', 'token=' . \$this->session->data['token'] . '&module_id=' . \$this->request->get['module_id'], true);
		}
		
		\$data['cancel'] = \$this->url->link('extension/extension', 'token=' . \$this->session->data['token'] . '&type=module', true);
		
		";
		if ($this->request->post['setting_clone'] != 0) {
			$filetext .= "if (isset(\$this->request->get['module_id']) && (\$this->request->server['REQUEST_METHOD'] != 'POST')) {
			\$module_info = \$this->model_extension_module->getModule(\$this->request->get['module_id']);
		}
		
		if (isset(\$this->request->post['name'])) {
			\$data['name'] = \$this->request->post['name'];
		} elseif (!empty(\$module_info)) {
			\$data['name'] = \$module_info['name'];
		} else {
			\$data['name'] = '';
		}
		
		";
		}
		if ($this->request->post['setting_clone'] != 0) {
			
			$filetext .= "if (isset(\$this->request->post['status'])) {
			\$data['status'] = \$this->request->post['status'];
		} elseif (!empty(\$module_info)) {
			\$data['status'] = \$module_info['status'];
		} else {
			\$data['status'] = '';
		}
		
		";
		}
		else {
			$filetext .= "if (isset(\$this->request->post['" . mb_strtolower(str_replace(' ', '', $modulename)) . "_status'])) {
			\$data['" . mb_strtolower(str_replace(' ', '', $modulename)) . "_status'] = \$this->request->post['" . mb_strtolower(str_replace(' ', '', $modulename)) . "_status'];
		} else {
			\$data['" . mb_strtolower(str_replace(' ', '', $modulename)) . "_status'] = \$this->config->get('" . mb_strtolower(str_replace(' ', '', $modulename)) . "_status');
		}

		";
		}
		$filetext .= "\$data['header'] = \$this->load->controller('common/header');
		\$data['column_left'] = \$this->load->controller('common/column_left');
		\$data['footer'] = \$this->load->controller('common/footer');

		\$this->response->setOutput(\$this->load->view('extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . "', \$data));
	}
	
	protected function validate() {
		if (!\$this->user->hasPermission('modify', 'extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . "')) {
			\$this->error['warning'] = \$this->language->get('error_permission');
		}
		
		";
		if ($this->request->post['setting_clone'] != 0) {
			$filetext .= "if ((utf8_strlen(\$this->request->post['name']) < 3) || (utf8_strlen(\$this->request->post['name']) > 64)) {
			\$this->error['name'] = \$this->language->get('error_name');
		}
		
		";
		}
		$filetext .= "return !\$this->error;
	}
}";
				$zip->addFromString("upload/admin/controller/extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . ".php", $filetext);
			  }
			  if (in_array('admin/model', $crfile)) {
				$filetext = "<?php
class ModelExtensionModule" . str_replace(' ', '', $modulename) . " extends Model {
}";
				$zip->addFromString("upload/admin/model/extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . ".php", $filetext);
			  }
			  $languages = $this->model_localisation_language->getLanguages();
			  foreach ($languages as $language) {
				if (in_array('admin/language/' . $language['code'], $crfile)) {
				  if ($this->request->post['setting_clone'] == 0) {
					$filetext = file_get_contents(DIR_APPLICATION . 'language/' . $language['code'] .'/extension/module/category.php');
					$filetext = preg_replace('/.+heading_title.+/', "\$_['heading_title']    = '" . $this->request->post['title'][$language['language_id']] . "';", $filetext);
				  }
				  else {
					$filetext = file_get_contents(DIR_APPLICATION . 'language/' . $language['code'] .'/extension/module/html.php');
					$filetext = preg_replace('/.+heading_title.+/', "\$_['heading_title']    = '" . $this->request->post['title'][$language['language_id']] . "';", $filetext);
				  }
				  $zip->addFromString("upload/admin/language/" . $language['code'] ."/extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . ".php", $filetext);
			    }
			  }
			  if (in_array('admin/view', $crfile)) {
				$filetext = '<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-' . mb_strtolower(str_replace(' ', '', $modulename)) . '" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb[\'href\']; ?>"><?php echo $breadcrumb[\'text\']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-' . mb_strtolower(str_replace(' ', '', $modulename)) . '" class="form-horizontal">
		  ';
				$status_name = 'status';
				if ($this->request->post['setting_clone'] != 0) {
					$filetext .= '<div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
		  ';
				}
				else {
					$status_name = mb_strtolower(str_replace(' ', '', $modulename)) . '_status';
				}
				$filetext .= '<div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="' . $status_name . '" id="input-status" class="form-control">
                <?php if ($' . $status_name . ') { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<?php echo $footer; ?>';
				$zip->addFromString("upload/admin/view/template/extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . ".tpl", $filetext);
			  }
			  if (in_array('catalog/controller', $crfile)) {
				$filetext = "<?php
class ControllerExtensionModule" . str_replace(' ', '', $modulename) . " extends Controller {
	public function index(\$setting) {
		\$this->load->language('extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . "');
		
		";
				if (in_array('catalog/model', $crfile)) {
					$filetext .= "\$this->load->model('extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . "');
				
		";
				}
				$filetext .= "\$data['heading_title'] = \$this->language->get('heading_title');
		return \$this->load->view('extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . "', \$data);
	}
}";
				$zip->addFromString("upload/catalog/controller/extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . ".php", $filetext);
			  }
			  if (in_array('catalog/model', $crfile)) {
				$filetext = "<?php
class ModelExtensionModule" . str_replace(' ', '', $modulename) . " extends Model {
}";
				$zip->addFromString("upload/catalog/model/extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . ".php", $filetext);
			  }
			  $languages = $this->model_localisation_language->getLanguages();
			  foreach ($languages as $language) {
				if (in_array('catalog/language/' . $language['code'], $crfile)) {
				  $filetext = "<?php
// Heading
\$_['heading_title'] = '" . $this->request->post['title'][$language['language_id']] . "';";
				  $zip->addFromString("upload/catalog/language/" . $language['code'] ."/extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . ".php", $filetext);
			    }
			  }
			  if (in_array('catalog/view', $crfile)) {
				$filetext = '<div>
  <?php if($heading_title) { ?>
    <h2><?php echo $heading_title; ?></h2>
  <?php } ?>
</div>';
				$zip->addFromString("upload/catalog/view/theme/default/template/extension/module/" . mb_strtolower(str_replace(' ', '', $modulename)) . ".tpl", $filetext);
			  }
			}

		$zip->close();
			
		header('Content-Type: application/zip');
		header('Content-Length: ' . filesize($zipfile));
		header('Content-Disposition: attachment; filename="' .  basename($zipfile) . '"');
		readfile($zipfile);
		
		unlink($zipfile);
    }
}