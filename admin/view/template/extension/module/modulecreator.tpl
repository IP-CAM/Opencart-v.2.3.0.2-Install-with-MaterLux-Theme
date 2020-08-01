<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module"><?php echo $entry_module; ?></label>
            <div class="col-sm-10">
			  <select name="module" id="input-module" class="form-control">
			  <option value="" id="input-module"></option>
			  <?php foreach ($module_list as $module) { ?>
				<option value="<?php echo $module; ?>" id="input-module"><?php echo $module; ?></option>
			  <?php } ?>
			  </select>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
            <div class="col-sm-10">
			  <?php foreach ($languages as $language) { ?>
              <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="title[<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" />
              </div>
              <?php } ?>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-setting-clone"><?php echo $entry_setting_clone; ?></label>
            <div class="col-sm-10">
              <select name="setting_clone" id="input-setting-clone" class="form-control">
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
              </select>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_files; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 250px; overflow: auto;">
                <div class="checkbox">
                  <label>
					<input onclick="return false;" type="checkbox" name="createfile[]" value="admin/controller" checked="checked" />
					admin/controller
                  </label>
                </div>
				<div class="checkbox">
                  <label>
					<input type="checkbox" name="createfile[]" value="admin/model" checked="checked" />
					admin/model
                  </label>
                </div>
				<?php foreach ($languages as $language) { ?>
				<div class="checkbox">
                  <label>
					<input onclick="return false;" type="checkbox" name="createfile[]" value="admin/language/<?php echo $language['code']; ?>" checked="checked" />
					admin/language/<?php echo $language['code']; ?>
                  </label>
                </div>
				<?php } ?>
				<div class="checkbox">
                  <label>
					<input onclick="return false;" type="checkbox" name="createfile[]" value="admin/view" checked="checked" />
					admin/view
                  </label>
                </div>
				<div class="checkbox">
                  <label>
					<input type="checkbox" name="createfile[]" value="catalog/controller" checked="checked" />
					catalog/controller
                  </label>
                </div>
				<div class="checkbox">
                  <label>
					<input type="checkbox" name="createfile[]" value="catalog/model" checked="checked" />
					catalog/model
                  </label>
                </div>
				<?php foreach ($languages as $language) { ?>
				<div class="checkbox">
                  <label>
					<input type="checkbox" name="createfile[]" value="catalog/language/<?php echo $language['code']; ?>" checked="checked" />
					catalog/language/<?php echo $language['code']; ?>
                  </label>
                </div>
				<?php } ?>
				<div class="checkbox">
                  <label>
					<input type="checkbox" name="createfile[]" value="catalog/view" checked="checked" />
					catalog/view
                  </label>
                </div>
              </div>
              <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script>
$('#input-module').on('change', function(){
	if ($(this).val() == '') {
		$('[name=\'name\']').parent().parent().removeClass('hidden');
		$('[name^=\'title\']').parent().parent().parent().removeClass('hidden');
		$('[name=\'setting_clone\']').parent().parent().removeClass('hidden');
		$('.well').parent().parent().removeClass('hidden');
	}
	else {
		$('[name=\'name\']').parent().parent().addClass('hidden');
		$('[name^=\'title\']').parent().parent().parent().addClass('hidden');
		$('[name=\'setting_clone\']').parent().parent().addClass('hidden');
		$('.well').parent().parent().addClass('hidden');
	}
});
</script>
<?php echo $footer; ?>
