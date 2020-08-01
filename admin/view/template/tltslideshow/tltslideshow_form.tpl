<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-tltslideshow" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-tltslideshow" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
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
          <table id="slides" class="table table-striped table-bordered table-hover">
            <tbody>
              <?php $slide_row = 0; ?>
              <?php foreach ($slides as $slide) { ?>
              <tr id="slide-row<?php echo $slide_row; ?>">
                <td class="text-left" style="width: 95%">
                    <ul class="nav nav-tabs">
                      <li class="active"><a href="#tab-general<?php echo $slide_row; ?>" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                      <li><a href="#tab-design<?php echo $slide_row; ?>" data-toggle="tab"><?php echo $tab_design; ?></a></li>
                    </ul>
          			<div class="tab-content">
            			<div class="tab-pane active" id="tab-general<?php echo $slide_row; ?>">
                            <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                              <div class="col-sm-10">
                                <a href="" id="thumb-image<?php echo $slide_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $slide['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                <input type="hidden" name="slide[<?php echo $slide_row; ?>][image]" value="<?php echo $slide['image']; ?>" id="input-image<?php echo $slide_row; ?>" />
                              </div>
                            </div>            
                            <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-date-start"><span data-toggle="tooltip" title="<?php echo $help_date; ?>"><?php echo $entry_date_start; ?></span></label>
                              <div class="col-sm-2">
                              	<div class="input-group" id="date-start<?php echo $slide_row; ?>">
                                	<input type="text" name="slide[<?php echo $slide_row; ?>][date_start]" value="<?php if ($slide['date_start'] != '0000-00-00') echo $slide['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                    <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                    </span>
                                </div>
                                <?php if (isset($error_slide[$slide_row]['date_start'])) { ?>
                                <div class="text-danger"><?php echo $error_slide[$slide_row]['date_start']; ?></div>
                              	<?php } ?>
                              </div>
                            </div>            
                            <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-date-end"><span data-toggle="tooltip" title="<?php echo $help_date; ?>"><?php echo $entry_date_end; ?></span></label>
                              <div class="col-sm-2">
                              	<div class="input-group" id="date-end<?php echo $slide_row; ?>">
                                	<input type="text" name="slide[<?php echo $slide_row; ?>][date_end]" value="<?php if ($slide['date_end'] != '0000-00-00') echo $slide['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                    <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                    </span>
                                </div>
                                <?php if (isset($error_slide[$slide_row]['date_end'])) { ?>
                                <div class="text-danger"><?php echo $error_slide[$slide_row]['date_end']; ?></div>
                              	<?php } ?>
                              </div>
                            </div>            
                            <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                              <div class="col-sm-10">
                                <input type="text" name="slide[<?php echo $slide_row; ?>][sort_order]" value="<?php echo $slide['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />
                              </div>
                            </div>
						</div>
                        <div class="tab-pane" id="tab-design<?php echo $slide_row; ?>">            
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
                                <div class="col-sm-10">
                                	<?php $counter = 0; ?>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php if ($counter) { ?>
                                        <div>&nbsp;</div>
                                        <?php } ?>
                                        <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>
                                          <input type="text" name="slide[<?php echo $slide_row; ?>][slide_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($slide['slide_description'][$language['language_id']]) ? $slide['slide_description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                                        </div>
                                        <?php if (isset($error_slide[$slide_row][$language['language_id']]['title'])) { ?>
                                            <div class="text-danger"><?php echo $error_slide[$slide_row][$language['language_id']]['title']; ?></div>
                                        <?php } ?>
                                        <?php $counter++; ?>
                                    <?php } ?>
                                </div>  
                            </div>            
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-link"><?php echo $entry_link; ?></label>
                                <div class="col-sm-10">
                                	<?php $counter = 0; ?>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php if ($counter) { ?>
                                        <div>&nbsp;</div>
                                        <?php } ?>
                                        <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>
                                          <input type="text" name="slide[<?php echo $slide_row; ?>][slide_description][<?php echo $language['language_id']; ?>][link]" value="<?php echo isset($slide['slide_description'][$language['language_id']]) ? $slide['slide_description'][$language['language_id']]['link'] : ''; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
                                        </div>
                                        <?php $counter++; ?>
                                    <?php } ?>
                                </div>  
                            </div>            
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-textbox"><span data-toggle="tooltip" title="<?php echo $help_textbox; ?>"><?php echo $entry_textbox; ?></span></label>
                                <div class="col-sm-10">
                                    <div class="checkbox">
                                      <label>
                                        <?php if ($slide['textbox']) { ?>
                                        <input type="checkbox" name="slide[<?php echo $slide_row; ?>][textbox]" value="1" checked="checked" id="input-textbox" />
                                        <?php } else { ?>
                                        <input type="checkbox" name="slide[<?php echo $slide_row; ?>][textbox]" value="1" id="input-textbox" />
                                        <?php } ?>
                                        &nbsp; </label>
                                    </div>
                                </div>  
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-header"><span data-toggle="tooltip" title="<?php echo $help_header; ?>"><?php echo $entry_header; ?></span></label>
                                <div class="col-sm-10">
                                	<?php $counter = 0; ?>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php if ($counter) { ?>
                                        <div>&nbsp;</div>
                                        <?php } ?>
                                        <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>
                                          <input type="text" name="slide[<?php echo $slide_row; ?>][slide_description][<?php echo $language['language_id']; ?>][header]" value="<?php echo isset($slide['slide_description'][$language['language_id']]) ? $slide['slide_description'][$language['language_id']]['header'] : ''; ?>" placeholder="<?php echo $entry_header; ?>" class="form-control" />
                                        </div>
                                        <?php if (isset($error_slide[$slide_row][$language['language_id']]['header'])) { ?>
                                            <div class="text-danger"><?php echo $error_slide[$slide_row][$language['language_id']]['header']; ?></div>
                                        <?php } ?>
                                        <?php $counter++; ?>
                                    <?php } ?>
                                </div>  
                            </div>            
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-description"><span data-toggle="tooltip" title="<?php echo $help_description; ?>"><?php echo $entry_description; ?></span></label>
                                <div class="col-sm-10">
                                	<?php $counter = 0; ?>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php if ($counter) { ?>
                                        <div>&nbsp;</div>
                                        <?php } ?>
                                        <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>
                                          <textarea name="slide[<?php echo $slide_row; ?>][slide_description][<?php echo $language['language_id']; ?>][description]" rows="3" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $slide_row; ?>-<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($slide['slide_description'][$language['language_id']]) ? $slide['slide_description'][$language['language_id']]['description'] : ''; ?></textarea>
                                        </div>
                                        <?php $counter++; ?>
                                    <?php } ?>
                                </div>  
                            </div>            
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-use-html"><span data-toggle="tooltip" title="<?php echo $help_use_html; ?>"><?php echo $entry_use_html; ?></span></label>
                                <div class="col-sm-10">
                                    <div class="checkbox">
                                      <label>
                                        <?php if ($slide['use_html']) { ?>
                                        <input type="checkbox" name="slide[<?php echo $slide_row; ?>][use_html]" value="1" checked="checked" id="input-use-html" />
                                        <?php } else { ?>
                                        <input type="checkbox" name="slide[<?php echo $slide_row; ?>][use_html]" value="1" id="input-use-html" />
                                        <?php } ?>
                                        &nbsp; </label>
                                    </div>
                                </div>  
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-html"><span data-toggle="tooltip" title="<?php echo $help_html; ?>"><?php echo $entry_html; ?></span></label>
                                <div class="col-sm-10">
                                	<?php $counter = 0; ?>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php if ($counter) { ?>
                                        <div>&nbsp;</div>
                                        <?php } ?>
                                        <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>
                                          <textarea name="slide[<?php echo $slide_row; ?>][slide_description][<?php echo $language['language_id']; ?>][html]" rows="5" placeholder="<?php echo $entry_html; ?>" class="form-control"><?php echo isset($slide['slide_description'][$language['language_id']]) ? $slide['slide_description'][$language['language_id']]['html'] : ''; ?></textarea>
                                        </div>
                                        <?php $counter++; ?>
                                    <?php } ?>
                                </div>  
                            </div>            
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-css"><span data-toggle="tooltip" title="<?php echo $help_css; ?>"><?php echo $entry_css; ?></span></label>
                                <div class="col-sm-10">
                                	<input type="text" name="slide[<?php echo $slide_row; ?>][css]" value="<?php echo $slide['css']; ?>" placeholder="<?php echo $entry_css; ?>" class="form-control" />
                                </div>  
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-override"><span data-toggle="tooltip" title="<?php echo $help_override; ?>"><?php echo $entry_override; ?></span></label>
                                <div class="col-sm-10">
                                    <div class="checkbox">
                                      <label>
                                        <?php if ($slide['override']) { ?>
                                        <input type="checkbox" name="slide[<?php echo $slide_row; ?>][override]" value="1" checked="checked" id="input-override" />
                                        <?php } else { ?>
                                        <input type="checkbox" name="slide[<?php echo $slide_row; ?>][override]" value="1" id="input-override" />
                                        <?php } ?>
                                        &nbsp; </label>
                                    </div>
                                </div>  
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-background"><span data-toggle="tooltip" title="<?php echo $help_background; ?>"><?php echo $entry_background; ?></span></label>
                                <div class="col-sm-5">
                                	<input type="color" name="slide[<?php echo $slide_row; ?>][background]" value="<?php echo $slide['background']; ?>" class="form-control" />
                                    <?php if (isset($error_slide[$slide_row]['background'])) { ?>
                                            <div class="text-danger"><?php echo $error_slide[$slide_row]['background']; ?></div>
                                    <?php } ?>
                                </div>  
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-opacity"><span data-toggle="tooltip" title="<?php echo $help_opacity; ?>"><?php echo $entry_opacity; ?></span></label>
                                <div class="col-sm-5">
                                	<input type="text" name="slide[<?php echo $slide_row; ?>][opacity]" value="<?php echo $slide['opacity']; ?>" placeholder="<?php echo $entry_opacity; ?>" class="form-control" />
                                    <?php if (isset($error_slide[$slide_row]['opacity'])) { ?>
                                            <div class="text-danger"><?php echo $error_slide[$slide_row]['opacity']; ?></div>
                                    <?php } ?>
                                </div>  
                            </div>
						</div>
					</div>            
                </td>
                <td class="text-center">
                	<button type="button" onclick="$('#slide-row<?php echo $slide_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                </td>
              </tr>
              <?php $slide_row++; ?>
              <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="2" class="text-right"><button type="button" onclick="addSlide();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
var slide_row = <?php echo $slide_row; ?>;

function addSlide() {
html = '<tr id="slide-row' + slide_row + '">';
html += '<td class="text-left" style="width: 95%">';
html += '<ul class="nav nav-tabs">';
html += '<li class="active"><a href="#tab-general' + slide_row + '" data-toggle="tab"><?php echo $tab_general; ?></a></li>';
html += '<li><a href="#tab-design' + slide_row + '" data-toggle="tab"><?php echo $tab_design; ?></a></li>';
html += '</ul>';
html += '<div class="tab-content">';
html += '<div class="tab-pane active" id="tab-general' + slide_row + '">';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>';
html += '<div class="col-sm-10">';
html += '<a href="" id="thumb-image' + slide_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>';
html += '<input type="hidden" name="slide[' + slide_row + '][image]" value="" id="input-image' + slide_row + '" />';
html += '</div>';
html += '</div>';            
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-date-start"><span data-toggle="tooltip" title="<?php echo $help_date; ?>"><?php echo $entry_date_start; ?></span></label>';
html += '<div class="col-sm-2">';
html += '<div class="input-group" id="date-start' + slide_row + '">';
html += '<input type="text" name="slide[' + slide_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />';
html += '<span class="input-group-btn">';
html += '<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
html += '</span>';
html += '</div>';
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-date-end"><span data-toggle="tooltip" title="<?php echo $help_date; ?>"><?php echo $entry_date_end; ?></span></label>';
html += '<div class="col-sm-2">';
html += '<div class="input-group" id="date-end' + slide_row + '">';
html += '<input type="text" name="slide[' + slide_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />';
html += '<span class="input-group-btn">';
html += '<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
html += '</span>';
html += '</div>';
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>';
html += '<div class="col-sm-10">';
html += '<input type="text" name="slide[' + slide_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />';
html += '</div>';
html += '</div>';
html += '</div>';
html += '<div class="tab-pane" id="tab-design' + slide_row + '">';           
html += '<div class="form-group required">';
html += '<label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>';
html += '<div class="col-sm-10">';
<?php $counter = 0; ?>
<?php foreach ($languages as $language) { ?>
<?php if ($counter) { ?>
html += '<div>&nbsp;</div>';
<?php } ?>
html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>';
html += '<input type="text" name="slide[' + slide_row + '][slide_description][<?php echo $language['language_id']; ?>][title]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" />';
html += '</div>';
<?php $counter++; ?>
<?php } ?>
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-link"><?php echo $entry_link; ?></label>';
html += '<div class="col-sm-10">';
<?php $counter = 0; ?>
<?php foreach ($languages as $language) { ?>
<?php if ($counter) { ?>
html += '<div>&nbsp;</div>';
<?php } ?>
html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>';
html += '<input type="text" name="slide[' + slide_row + '][slide_description][<?php echo $language['language_id']; ?>][link]" value="" placeholder="<?php echo $entry_link; ?>" class="form-control" />';
html += '</div>';
<?php $counter++; ?>
<?php } ?>
html += '</div>';
html += '</div>';

html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-textbox"><span data-toggle="tooltip" title="<?php echo $help_textbox; ?>"><?php echo $entry_textbox; ?></span></label>';
html += '<div class="col-sm-10">';
html += '<div class="checkbox">';
html += '<label>';
html += '<input type="checkbox" name="slide[' + slide_row + '][textbox]" value="1" checked="checked" id="input-textbox" />';
html += '&nbsp; </label>';
html += '</div>';
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-header"><span data-toggle="tooltip" title="<?php echo $help_header; ?>"><?php echo $entry_header; ?></span></label>';
html += '<div class="col-sm-10">';
<?php $counter = 0; ?>
<?php foreach ($languages as $language) { ?>
<?php if ($counter) { ?>
html += '<div>&nbsp;</div>';
<?php } ?>
html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>';
html += '<input type="text" name="slide[' + slide_row + '][slide_description][<?php echo $language['language_id']; ?>][header]" value="" placeholder="<?php echo $entry_header; ?>" class="form-control" />';
html += '</div>';
<?php $counter++; ?>
<?php } ?>
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-description"><span data-toggle="tooltip" title="<?php echo $help_description; ?>"><?php echo $entry_description; ?></span></label>';
html += '<div class="col-sm-10">';
<?php $counter = 0; ?>
<?php foreach ($languages as $language) { ?>
<?php if ($counter) { ?>
html += '<div>&nbsp;</div>';
<?php } ?>
html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>';
html += '<textarea name="slide[' + slide_row + '][slide_description][<?php echo $language['language_id']; ?>][description]" rows="3" placeholder="<?php echo $entry_description; ?>" class="form-control"></textarea>';
html += '</div>';
<?php $counter++; ?>
<?php } ?>
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-use-html"><span data-toggle="tooltip" title="<?php echo $help_use_html; ?>"><?php echo $entry_use_html; ?></span></label>';
html += '<div class="col-sm-10">';
html += '<div class="checkbox">';
html += '<label>';
html += '<input type="checkbox" name="slide[' + slide_row + '][use_html]" value="1" id="input-use-html" />';
html += '&nbsp; </label>';
html += '</div>';
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-html"><span data-toggle="tooltip" title="<?php echo $help_html; ?>"><?php echo $entry_html; ?></span></label>';
html += '<div class="col-sm-10">';
<?php $counter = 0; ?>
<?php foreach ($languages as $language) { ?>
<?php if ($counter) { ?>
html += '<div>&nbsp;</div>';
<?php } ?>
html += '<div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />&nbsp;</span>';
html += '<textarea name="slide[' + slide_row + '][slide_description][<?php echo $language['language_id']; ?>][html]" rows="5" id="input-html' + slide_row + '-<?php echo $language['language_id']; ?>" placeholder="<?php echo $entry_html; ?>" class="form-control"></textarea>';
html += '</div>';
<?php $counter++; ?>
<?php } ?>
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-css"><span data-toggle="tooltip" title="<?php echo $help_css; ?>"><?php echo $entry_css; ?></span></label>';
html += '<div class="col-sm-10">';
html += '<input type="text" name="slide[' + slide_row + '][css]" value="" placeholder="<?php echo $entry_css; ?>" class="form-control" />';
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-override"><span data-toggle="tooltip" title="<?php echo $help_override; ?>"><?php echo $entry_override; ?></span></label>';
html += '<div class="col-sm-10">';
html += '<div class="checkbox">';
html += '<label>';
html += '<input type="checkbox" name="slide[' + slide_row + '][override]" value="1" id="input-override" />';
html += '&nbsp; </label>';
html += '</div>';
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-background"><span data-toggle="tooltip" title="<?php echo $help_background; ?>"><?php echo $entry_background; ?></span></label>';
html += '<div class="col-sm-5">';
html += '<input type="color" name="slide[' + slide_row + '][background]" value="#000000" class="form-control" />';
html += '</div>';
html += '</div>';
html += '<div class="form-group">';
html += '<label class="col-sm-2 control-label" for="input-opacity"><span data-toggle="tooltip" title="<?php echo $help_opacity; ?>"><?php echo $entry_opacity; ?></span></label>';
html += '<div class="col-sm-5">';
html += '<input type="text" name="slide[' + slide_row + '][opacity]" value="0.6" placeholder="<?php echo $entry_opacity; ?>" class="form-control" />';
html += '</div>'; 
html += '</div>';
html += '</div>';
html += '</div>';
html += '</td>';
html += '<td class="text-center">';
html += '<button type="button" onclick="$(\'#slide-row' + slide_row + ', .tooltip\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>';
html += '</td>';
html += '</tr>';
	
$('#slides tbody').append(html);

$('#date-start' + slide_row).datetimepicker({
	pickTime: false
});
$('#date-end' + slide_row).datetimepicker({
	pickTime: false
});
	
slide_row++;
}
//--></script>
<script type="text/javascript"><!--
<?php for ($i = 0; $i < $slide_row; $i++) { ?>
$('#date-start<?php echo $i; ?>').datetimepicker({
	pickTime: false
});
$('#date-end<?php echo $i; ?>').datetimepicker({
	pickTime: false
});
<?php } ?>
//--></script>
</div>
<?php echo $footer; ?>
