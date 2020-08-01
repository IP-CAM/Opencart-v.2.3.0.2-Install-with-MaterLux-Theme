<?php echo $header; ?>
<link href="view/javascript/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<script src="view/javascript/colorpicker/js/bootstrap-colorpicker.min.js"></script>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-settings" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
		<div class="pull-right">
			Stores :
		  <select onchange="location = this.options[this.selectedIndex].value;" name="store_id">
			<option value="<?php echo $redirect.'&store_id=0'; ?>"><?php echo $text_default; ?></option>
			<?php foreach($stores as $store){ 
				if($store['store_id']==$store_id){
				   $select = 'selected=selected';
				}else{
				   $select = '';
				}
			?>
			<option <?php echo $select; ?> value="<?php echo $redirect.'&store_id='.$store['store_id']; ?>"><?php echo $store['name']; ?></option>
			<?php } ?>
		  </select>
		</div>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-settings" class="form-horizontal">
		
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
				<div class="col-sm-10">
				  <select name="megamenu_setting_status" id="input-status" class="form-control">
					<?php if ($megamenu_setting_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				  </select>
				</div>
			</div>
			
			<div class="row">

				<!-- Menu Bg Color -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-menubg"><?php echo $entry_menubg; ?></label>
						<div class="col-sm-12">
							<div class="cp input-group colorpicker-component">
								<input type="text" value="<?php echo $megamenu_setting_menubg; ?>" class="form-control" name="megamenu_setting_menubg" /> <span class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- Menu Font Color -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-menufontcolor"><?php echo $entry_menu_font_color; ?></label>
						<div class="col-sm-12">
							<div class="cp input-group colorpicker-component">
								<input type="text" value="<?php echo $megamenu_setting_menufontcolor; ?>" class="form-control" name="megamenu_setting_menufontcolor" /> <span class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Menu Hover Color -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-menuhovercolor"><?php echo $entry_menu_hover_color; ?></label>
						<div class="col-sm-12">
							<div class="cp input-group colorpicker-component">
								<input type="text" value="<?php echo $megamenu_setting_menuhovercolor; ?>" class="form-control" name="megamenu_setting_menuhovercolor" /> <span class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Menu Font Hover Color -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-menufonthovercolor"><?php echo $entry_menu_font_hover_color; ?></label>
						<div class="col-sm-12">
							<div class="cp input-group colorpicker-component">
								<input type="text" value="<?php echo $megamenu_setting_menufonthovercolor; ?>" class="form-control" name="megamenu_setting_menufonthovercolor" /> <span class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Inner Dropdown Link Color -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-menufonthovercolor"><?php echo $entry_inner_link_color; ?></label>
						<div class="col-sm-12">
							<div class="cp input-group colorpicker-component">
								<input type="text" value="<?php echo $megamenu_setting_inner_link_color; ?>" class="form-control" name="megamenu_setting_inner_link_color" /> <span class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Inner Dropdown Link Color -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-headingcolor"><?php echo $entry_heading_color; ?></label>
						<div class="col-sm-12">
							<div class="cp input-group colorpicker-component">
								<input type="text" value="<?php echo $megamenu_setting_listing_heading_color; ?>" class="form-control" name="megamenu_setting_listing_heading_color" /> <span class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Menu Dropdown -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-menudropdown"><?php echo $entry_menu_menudropdown; ?></label>
						<div class="col-sm-12">
							<div class="cp input-group colorpicker-component">
								<input type="text" value="<?php echo $megamenu_setting_menudropdown; ?>" class="form-control" name="megamenu_setting_menudropdown" /> <span class="input-group-addon"><i></i></span>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- Product Limit -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-product_limit"><?php echo $entry_menu_product_limit; ?></label>
						<div class="col-sm-12">
							<input type="text" value="<?php echo $megamenu_setting_product_limit; ?>" class="form-control" name="megamenu_setting_product_limit" /> 
						</div>
					</div>
				</div>
				
				
				<!-- Product Width -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-product_limit"><?php echo $entry_product_width; ?></label>
						<div class="col-sm-12">
							<input type="text" value="<?php echo $megamenu_setting_product_width; ?>" class="form-control" name="megamenu_setting_product_width" /> 
						</div>
					</div>
				</div>
				
				
				<!-- Product Height -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-product_limit"><?php echo $entry_product_height; ?></label>
						<div class="col-sm-12">
							<input type="text" value="<?php echo $megamenu_setting_product_height; ?>" class="form-control" name="megamenu_setting_product_height" /> 
						</div>
					</div>
				</div>
				
				
				<!-- Product Name -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-product_limit"><?php echo $entry_product_name; ?></label>
						<div class="col-sm-12">
							<select class="form-control" name="megamenu_setting_product_name">
								<?php if($megamenu_setting_product_name){ ?>
								<option value="1" selected><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else{ ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				
				
				<!-- Product Price -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-product_limit"><?php echo $entry_product_prices; ?></label>
						<div class="col-sm-12">
							<select class="form-control" name="megamenu_setting_product_price">
								<?php if($megamenu_setting_product_price){ ?>
								<option value="1" selected><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else{ ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				
				
				<!-- Product Description -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-product_limit"><?php echo $entry_product_description; ?></label>
						<div class="col-sm-12">
							<select class="form-control" name="megamenu_setting_product_description">
								<?php if($megamenu_setting_product_description){ ?>
								<option value="1" selected><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else{ ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				
				<!-- Menu Full Width -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-product_limit"><?php echo $entry_menu_full; ?></label>
						<div class="col-sm-12">
							<select class="form-control" name="megamenu_setting_menuwidth">
								<?php if($megamenu_setting_menuwidth){ ?>
								<option value="1" selected><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else{ ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				
				<!-- Dropdown Content -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-product_limit"><?php echo $entry_dropdwon_content_full; ?></label>
						<div class="col-sm-12">
							<select class="form-control" name="megamenu_setting_dropdown_content">
								<?php if($megamenu_setting_dropdown_content){ ?>
								<option value="1" selected><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else{ ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				
				<!-- Menu Border Radius -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-borderradius"><?php echo $entry_menuborderradius; ?></label>
						<div class="col-sm-12">
							<input type="text" value="<?php echo $megamenu_setting_menuborderradius; ?>" class="form-control" name="megamenu_setting_menuborderradius" /> 
						</div>			
					</div>
				</div>
				
				<!-- Menu icons -->
				<div class="col-sm-4">
					<div class="form-group">	
						<label class="col-sm-12" for="input-borderradius"><?php echo $entry_menuicons; ?></label>
						<div class="col-sm-12">
							<select class="form-control" name="megamenu_setting_menuicons">
								<?php if($megamenu_setting_menuicons){ ?>
								<option value="1" selected><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else{ ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>		
					</div>
				</div>
				
				<!-- Menu Icon Position -->
				<div class="col-sm-4">
					<div class="form-group">
						<label class="col-sm-12" for="input-borderradius"><?php echo $entry_menuiconposition; ?></label>
						<div class="col-sm-12">
							<select class="form-control" name="megamenu_setting_menuiconposition">
								<?php if($megamenu_setting_menuiconposition){ ?>
								<option value="1" selected>Right</option>
								<option value="0">Left</option>
								<?php } else{ ?>
								<option value="1">Right</option>
								<option value="0" selected>Left</option>
								<?php } ?>
							</select>
						</div>			
					</div>
				</div>			
			</div>
		
        </form>
		<style>
		  .form-control{border-radius:0; height:40px;}
		  .colorpicker-2x .colorpicker-saturation {
			  width: 200px;
			  height: 200px;
		  }
		  .colorpicker-2x .colorpicker-hue,
		  .colorpicker-2x .colorpicker-alpha {
			  width: 30px;
			  height: 200px;
		  }
		  .colorpicker-2x .colorpicker-color,
		  .colorpicker-2x .colorpicker-color div {
			  height: 30px;
		  }
	  </style>
	  <script>
		   $('.cp').colorpicker({ customClass: 'colorpicker-2x', sliders: { saturation: { maxLeft: 200, maxTop: 200 }, hue: { maxTop: 200 }, alpha: { maxTop: 200 } } });	  
	  </script>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>