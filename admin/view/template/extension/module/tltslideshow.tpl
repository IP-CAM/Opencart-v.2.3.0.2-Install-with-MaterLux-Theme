<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-slideshow" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
	<div class="alert alert-info">
    		<i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_donation; ?><br />
  			<?php echo $text_copyright; ?>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-tltslideshow" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-options" data-toggle="tab"><?php echo $tab_options; ?></a></li>
          </ul>
          <div class="tab-content">
		  	<div class="tab-pane active" id="tab-general">
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
                  <div class="col-sm-10">
                      <?php $counter = 0; ?>
                      <?php foreach ($languages as $language) { ?>
                          <?php if ($counter) { ?>
                          <div>&nbsp;</div>
                          <?php } ?>
                          <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>
                            <input type="text" name="module_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($module_description[$language['language_id']]['title']) ? $module_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                          </div>
                          <?php if (isset($error_title[$language['language_id']])) { ?>
                              <div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
                          <?php } ?>
                          <?php $counter++; ?>
                      <?php } ?>
                  </div>  
              </div>            
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-show-title"><?php echo $entry_show_title; ?></label>
                <div class="col-sm-10">
                  <select name="show_title" id="input-show-title" class="form-control">
                    <?php if ($show_title) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-slideshow"><?php echo $entry_slideshow; ?></label>
                <div class="col-sm-10">
                  <select name="slideshow_id" id="input-slideshow" class="form-control">
                    <?php foreach ($slideshows as $slideshow) { ?>
                    <?php if ($slideshow['slideshow_id'] == $slideshow_id) { ?>
                    <option value="<?php echo $slideshow['slideshow_id']; ?>" selected="selected"><?php echo $slideshow['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $slideshow['slideshow_id']; ?>"><?php echo $slideshow['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
                  <?php if ($error_width) { ?>
                  <div class="text-danger"><?php echo $error_width; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
                  <?php if ($error_height) { ?>
                  <div class="text-danger"><?php echo $error_height; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
		  	<div class="tab-pane" id="tab-options">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-auto"><span data-toggle="tooltip" title="<?php echo $help_auto; ?>"><?php echo $entry_auto; ?></span></label>
                <div class="col-sm-10">
                  <select name="auto" id="input-auto" class="form-control">
                    <?php if ($auto) { ?>
                    <option value="1" selected="selected"><?php echo $text_auto; ?></option>
                    <option value="0"><?php echo $text_manual; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_auto; ?></option>
                    <option value="0" selected="selected"><?php echo $text_manual; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-pause"><span data-toggle="tooltip" title="<?php echo $help_pause; ?>"><?php echo $entry_pause; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="pause" value="<?php echo $pause; ?>" placeholder="<?php echo $entry_pause; ?>" id="input-pause" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-pagination"><span data-toggle="tooltip" title="<?php echo $help_pagination; ?>"><?php echo $entry_pagination; ?></span></label>
                <div class="col-sm-10">
                  <select name="pagination" id="input-pagination" class="form-control">
                    <?php if ($pagination) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-controls"><span data-toggle="tooltip" title="<?php echo $help_controls; ?>"><?php echo $entry_controls; ?></span></label>
                <div class="col-sm-10">
                  <select name="controls" id="input-controls" class="form-control">
                    <?php if ($controls) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-auto-hover"><span data-toggle="tooltip" title="<?php echo $help_auto_hover; ?>"><?php echo $entry_auto_hover; ?></span></label>
                <div class="col-sm-10">
                  <select name="auto_hover" id="input-auto-hover" class="form-control">
                    <?php if ($auto_hover) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-additional"><span data-toggle="tooltip" title="<?php echo $help_additional; ?>"><?php echo $entry_additional; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="additional" value="<?php echo $additional; ?>" placeholder="<?php echo $entry_additional; ?>" id="input-additional" class="form-control" />
                </div>
              </div>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>