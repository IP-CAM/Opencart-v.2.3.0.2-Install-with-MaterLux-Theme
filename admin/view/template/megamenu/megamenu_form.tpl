<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-megamenu" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-megamenu" class="form-horizontal">
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
							<div class="col-sm-10">
								<select class="form-control" name="menu_type">
									<option value="0"><?php echo $text_select; ?></option>
										<?php foreach($menutypes as $key => $type){
											if($key==$menu_type){
												$select = "selected=selected";
											}else{
												$select = '';
											}
										?>
									<option <?php echo $select; ?> value="<?php echo $key; ?>"><?php echo $type; ?></option>
									<?php } ?>
							 </select>
							<?php if($error_menu_type){ ?>
								<div class="text-danger"><?php echo $error_menu_type; ?></div>
							<?php } ?>
							</div>
					</div>
			 <div class="selected_categories hide">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-categorytitle"><?php echo $entry_title; ?></label>
						<div class="col-sm-10">
						<?php if(VERSION >= '2.2.0.0'){ ?>
							<?php foreach ($languages as $language){ ?>
								<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
									<input class="form-control" type="text" name="megamenu_description[<?php echo $language['language_id']; ?>][category_title]" value="<?php echo isset($megamenu_description[$language['language_id']]) ? $megamenu_description[$language['language_id']]['category_title'] : ''; ?>"/>
								</div>
								<?php if(isset($error_category_title[$language['language_id']])){ ?>
									<div class="text-danger"><?php echo $error_category_title[$language['language_id']]; ?></div>
								<?php } ?>
							<?php } ?>
							<?php }else{ ?>
							<?php foreach ($languages as $language){ ?>
								<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									<input class="form-control" type="text" name="megamenu_description[<?php echo $language['language_id']; ?>][category_title]" value="<?php echo isset($megamenu_description[$language['language_id']]) ? $megamenu_description[$language['language_id']]['category_title'] : ''; ?>"/>
								</div>
								 <?php if(isset($error_category_title[$language['language_id']])){ ?>
									<div class="text-danger"><?php echo $error_category_title[$language['language_id']]; ?></div>
								<?php } ?>
							<?php } ?>
						<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
						<div class="col-sm-10">
							<input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
							<div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
								<?php foreach ($product_categories as $product_category) { ?>
								<div id="product-category<?php echo $product_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_category['name']; ?>
									<input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
								</div>
								<?php } ?>
							</div>
							<label><input type="checkbox" <?php echo ($subcategory ? 'checked=checked' : ''); ?> name="subcategory" value="1"/> Sub Categories</label> <br/>
							<label><input type="checkbox" <?php echo ($cate_image ? 'checked=checked' : ''); ?> name="cate_image" value="1"/> Category Image</label>
						</div>
          </div>
				</div>
			 <div class="category hide">
				 <div class="form-group">
					<label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?></label>
					<div class="col-sm-10">
					  <select class="form-control" name="category_id">
						<option value="0"><?php echo $text_select; ?></option>
						<?php foreach($categories as $category){
							if($category['category_id']==$category_id){
								$select = 'selected=selected';
							}else{
								$select = '';
							}
						?>
							<option <?php echo $select; ?> value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
						<?php } ?>
					  </select>
					   <?php if($error_category_id){ ?>
						<div class="text-danger"><?php echo $error_category_id; ?></div>
						<?php } ?>
					</div>
				 </div>
				 <div class="form-group">
					<label class="col-sm-2 control-label" for="input-subcategory"><span data-toggle="tooltip" title="<?php echo $help_subcategories; ?>"><?php echo $entry_subcategory; ?></span></label>
					 <div class="col-sm-10">
						  <div class="checkbox">
							<label><input <?php echo ($multilevel==1 ? 'checked=checked' : ''); ?> type="radio" name="multilevel" value="1" id="input-subcategory"/>&nbsp; First Level Without Dropdown</label><br/>
							<label><input <?php echo ($multilevel==2 ? 'checked=checked' : ''); ?> type="radio" name="multilevel" value="2" id="input-subcategory"/>&nbsp; Upto five Level in Simple Dropdown</label><br/>
							<label><input <?php echo ($multilevel==3 ? 'checked=checked' : ''); ?> type="radio" name="multilevel" value="3" id="input-subcategory"/>&nbsp; Full Width Mega Menu With Third Level Categories</label><br/>
							<label><input <?php echo ($multilevel==4 ? 'checked=checked' : ''); ?> type="radio" name="multilevel" value="4" id="input-subcategory"/>&nbsp; Half Width Mega Menu With Third Level Categories</label><br/>
						  </div>
					  </div>
				 </div>
				 <!--<div class="form-group">
					<label class="col-sm-2 control-label" for="input-column"><span data-toggle="tooltip" title="Number of columns to use for the bottom 3 categories. Only works for the top parent categories."><?php echo $entry_column; ?></span></label>
					 <div class="col-sm-10"><input class="form-control" type="text" name="column" value="<?php echo $column; ?>"/></div>
				 </div>--->
				 
				 <div class="form-group input-category_images">
					<label class="col-sm-2 control-label" for="input-category_images">Category Images</label>
					<div class="col-sm-10">
					  <select name="category_images" id="input-category_images" class="form-control">
						<?php if ($category_images) { ?>
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
			 
			 <div class="products hide">
				 <div class="form-group">
					<label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
					<div class="col-sm-10">
					<?php if(VERSION >= '2.2.0.0'){ ?>
						<?php foreach ($languages as $language){ ?>
							<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
								<input class="form-control" type="text" name="megamenu_description[<?php echo $language['language_id']; ?>][product_title]" value="<?php echo isset($megamenu_description[$language['language_id']]) ? $megamenu_description[$language['language_id']]['product_title'] : ''; ?>"/>
							</div>
							<?php if(isset($error_product_title[$language['language_id']])){ ?>
								<div class="text-danger"><?php echo $error_product_title[$language['language_id']]; ?></div>
							<?php } ?>
						<?php } ?>
					  <?php }else{ ?>
					  <?php foreach ($languages as $language){ ?>
							<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
								<input class="form-control" type="text" name="megamenu_description[<?php echo $language['language_id']; ?>][product_title]" value="<?php echo isset($megamenu_description[$language['language_id']]) ? $megamenu_description[$language['language_id']]['product_title'] : ''; ?>"/>
							</div>
							 <?php if(isset($error_product_title[$language['language_id']])){ ?>
								<div class="text-danger"><?php echo $error_product_title[$language['language_id']]; ?></div>
							<?php } ?>
						<?php } ?>
					<?php } ?>
					</div>
				</div>
				 <div class="form-group">
					<label class="col-sm-2 control-label" for="input-subcategory"><span data-toggle="tooltip" title="<?php echo $help_products; ?>"><?php echo $entry_products; ?></span></label>
					 <div class="col-sm-10">
						  <div class="checkbox">
							<label><input <?php echo ($product=='latest' ? 'checked=checked' : ''); ?> type="radio" name="product" value="latest" />&nbsp; Latest Products</label>
						  </div>
						  <div class="checkbox">
							<label><input <?php echo ($product=='featured' ? 'checked=checked' : ''); ?> type="radio" name="product" value="featured" />&nbsp; Featured Products</label>
						  </div>
						  <div class="checkbox">
							<label><input <?php echo ($product=='special' ? 'checked=checked' : ''); ?> type="radio" name="product" value="special" />&nbsp; Special Products</label>
						  </div>
						  <div class="checkbox">
							<label><input <?php echo ($product=='bestseller' ? 'checked=checked' : ''); ?> type="radio" name="product" value="bestseller" />&nbsp; Bestseller Products</label>
						  </div>
						  <div class="checkbox">
							<label><input <?php echo ($product=='category' ? 'checked=checked' : ''); ?> type="radio" name="product" value="category" />&nbsp; Choose From specific Category</label>
						  </div>
						  <div class="col-sm-10 relatedproducts hide">
						  <br/>
							 <select class="form-control" name="cate_id">
								<option value="0"><?php echo $text_select; ?></option>
								<?php foreach($categories as $category){
									if($category['category_id']==$cate_id){
										$select = 'selected=selected';
									}else{
										$select = '';
									}
								?>
									<option <?php echo $select; ?> value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
								<?php } ?>
							  </select>
						  </div>
						  <br/>
						  <div class="col-sm-12 selectproducts hide">
						  <input type="text" name="product_name" value="" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
						  <div id="selected-product" class="well well-sm" style="height: 150px; overflow: auto;">
							<?php foreach ($featured_products as $featured_product) { ?>
							<div id="selected-product<?php echo $featured_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $featured_product['name']; ?>
							  <input type="hidden" name="featured_product[]" value="<?php echo $featured_product['product_id']; ?>" />
							</div>
							<?php } ?>
						  </div>
						</div>
					 </div>
				 </div>
			 </div>
			 <div class="form-group information hide">
                <label class="col-sm-2 control-label" for="input-information"><?php echo $entry_information; ?></label>
                <div class="col-sm-10">
                  <select class="form-control" name="information_id">
				    <option value="0"><?php echo $text_select; ?></option>
					<?php foreach($informations as $information){
						if($information['information_id']==$information_id){
							$select = 'selected=selected';
						}else{
							$select = '';
						}
					?>
						<option <?php echo $select; ?> value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
					<?php } ?>
				  </select>
				    <?php if($error_information_id){ ?>
						<div class="text-danger"><?php echo $error_information_id; ?></div>
					<?php } ?>
                </div>
             </div>
			 <div class="custom hide">
				 <div class="form-group">
					<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_custom_link; ?></label>
					<div class="col-sm-10">
						<div class="table-responsive">
						  <table class="table table-bordered table-hover">
							  <thead>
								 <tr>
									<td><?php echo $entry_title; ?></td>
									<td><?php echo $entry_link; ?></td>
								 </tr>
							  </thead>
							  <tbody>
								 <tr>
									<td>
									 <?php if(VERSION >= '2.2.0.0'){ ?>
										<?php foreach ($languages as $language){ ?>
											<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
												<input class="form-control" type="text" name="megamenu_description[<?php echo $language['language_id']; ?>][custom_title]" value="<?php echo isset($megamenu_description[$language['language_id']]) ? $megamenu_description[$language['language_id']]['custom_title'] : ''; ?>"/>
											</div>
											<?php if(isset($error_custom_title[$language['language_id']])){ ?>
												<div class="text-danger"><?php echo $error_custom_title[$language['language_id']]; ?></div>
											<?php } ?>
										<?php } ?>
									  <?php }else{ ?>
									  <?php foreach ($languages as $language){ ?>
											<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
												<input class="form-control" type="text" name="megamenu_description[<?php echo $language['language_id']; ?>][custom_title]" value="<?php echo isset($megamenu_description[$language['language_id']]) ? $megamenu_description[$language['language_id']]['custom_title'] : ''; ?>"/>
											</div>
											 <?php if(isset($error_custom_title[$language['language_id']])){ ?>
												<div class="text-danger"><?php echo $error_custom_title[$language['language_id']]; ?></div>
											<?php } ?>
										<?php } ?>
									  
									    <?php } ?>
										
									</td>
									<td>
										<input class="form-control" type="text" name="link" value="<?php echo $link; ?>"/>
									</td>
								 </tr>
							   </tbody>
							</table>
						 </div>
					</div>
				</div>
			</div>
			<div class="editor hide">
				<ul class="nav nav-tabs" id="language">
                <?php if(VERSION >= '2.2.0.0'){ ?>
								   <?php foreach ($languages as $language) { ?>
									<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								  <?php } ?>
								  <?php }else{ ?>
								  <?php foreach($languages as $language){ ?>
									 <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								  <?php } ?>
								  <?php } ?>
				</ul>
				<div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
				  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="megamenu_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($megamenu_description[$language['language_id']]) ? $megamenu_description[$language['language_id']]['name'] : ''; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
				  <div class="form-group">
					<label class="col-sm-2 control-label" for="input-editor"><span data-toggle="tooltip" title="<?php echo $help_custom; ?>"><?php echo $entry_custom_editor; ?></span></label>
					<div class="col-sm-10">
					  <textarea name="megamenu_description[<?php echo $language['language_id']; ?>][description]"  id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($megamenu_description[$language['language_id']]) ? $megamenu_description[$language['language_id']]['description'] : ''; ?></textarea>
					</div>
				  </div>
				</div>
				 <?php } ?>
				</div>
			</div>
			<div class="form-group hide column-class">
				<label class="col-sm-2 control-label" for="input-column"><span data-toggle="tooltip" title="Number of columns to use for the bottom 3 categories. Only works for the top parent categories."><?php echo $entry_column; ?></span></label>
				<div class="col-sm-10"><input class="form-control" type="text" name="column" value="<?php echo $column; ?>"/></div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-image">Menu icon</label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#iconmodal">Select icon</button>
					<span id="activeicon"><i class="fa btn btn-sm btn-warning selectedicon <?php echo $menu_icon; ?>"></i></span>
					
					<div class="iconmodal modal fade" id="iconmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					  <div class="modal-dialog" role="document">
						<div class="modal-content">
						  <div class="modal-body">
							<div class="well">
								<?php
									if($fonts){
										foreach ($fonts as $fontawesome){
											echo "<i class='fontawesomeicon fa ".$fontawesome."' rel='".$fontawesome."'></i>";
										}
										echo "<i class='fontawesomeicon fa fa-close icon_close' rel=''></i>";
									}
								?>
							<input type="hidden" id="menuicon" name="menu_icon" value="<?php echo $menu_icon; ?>" />
							</div>
							
							<hr />
							
							<div class="menuimage">
								<label>Menu Custom icon</label><br />
								<a href="" id="thumb-image1" data-toggle="image" class="img-thumbnail"><img src="<?php echo $menuthumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden" name="menuimage" value="<?php echo $menuimage; ?>" id="input-image1" />
							</div>
						  </div>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_bg_image; ?></label>
			   <div class="col-sm-10">
				<div class="col-sm-10">
					<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
					<input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
				</div>
			   </div>
			</div>
			<div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <?php if (in_array(0, $megamenu_store)) { ?>
                        <input type="checkbox" name="megamenu_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="megamenu_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $megamenu_store)) { ?>
                        <input type="checkbox" name="megamenu_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="megamenu_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
             </div>
			<div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
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
        </form>
      </div>
    </div>
</div>
<style>
.form-group + .form-group {
    border-top:none;
}
.selectedicon{
	font-size:22px;
	margin-left:20px;
}
.iconmodal .modal-content{
	border-radius:0px;
}
.iconmodal .modal-content .well{
	overflow:scroll;
	height:200px;
	overflow-x: hidden;
}
.iconmodal .modal-content .well i{
	background-color: #e2e2e2;
    cursor: pointer;
    font-size: 18px;
    margin-bottom: 6px;
    margin-right: 6px;
    padding: 10px;
    text-align: center;
    width: 40px;
	color:#000;
}
.iconmodal .well i:focus, .iconmodal .well i:hover{
	color:#fff;
	background-color: #1e91cf;
}
.iconmodal .well i.active{
	color:#fff;
	background-color: #1e91cf;
}
.icon_close{
	background-color:red !important;
	color:#fff !important;
}
</style>
<?php if(VERSION > '2.2.0.0'){ ?>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script> 
<?php } ?>

<?php if(VERSION < '2.2.0.0'){ ?>
<script type="text/javascript"><!--
 <?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({
	height: 150
});
<?php } ?>
//--></script>
 <?php } ?>
<script type="text/javascript"><!--
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');

		$('#product-category' + item['value']).remove();

		$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Products
$('input[name=\'product_name\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\'product_name\']').val('');
		
		$('#selected-product' + item['value']).remove();
		
		$('#selected-product').append('<div id="selected-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="featured_product[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#selected-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});


/* if($('input[name="product"]:checked').val()=='category'){
	$('.relatedproducts').removeClass('hide');
}else{
	$('.relatedproducts').addClass('hide');
} */

$('input[name="product"]').click(function(){
 if($(this).val()=='category'){
	$('.relatedproducts').removeClass('hide');
	$('.selectproducts').addClass('hide');
 }else if($(this).val()=='featured'){
	$('.relatedproducts').addClass('hide');
	$('.selectproducts').removeClass('hide');
 }else{
	 $('.relatedproducts').addClass('hide');
	 $('.selectproducts').addClass('hide');
 }
});

$('input[name="product"]:checked').trigger('click');

$(document).ready(function(){
  var value = $('select[name="menu_type"] option:selected').attr('value');
  simple(value);
});

$('select[name="menu_type"]').on('change',function(){
	var value = $('select[name="menu_type"] option:selected').attr('value');
	simple(value);
});


$('input[name="multilevel"]').click(function(){
	simaple2();
});

function simaple2(){
	level = $('input[name="multilevel"]:checked').val();
	if(level==1 || level==2){
		$('.input-category_images').addClass('hide');
		$('.column-class').addClass('hide');
	}else{
		$('.input-category_images').removeClass('hide');
		$('.column-class').removeClass('hide');
	}
}


function simple(value){
	if(value=='category'){
		$('.category').removeClass('hide');
		$('.column-class').removeClass('hide');
		$('.products').addClass('hide');
		$('.information').addClass('hide');
		$('.custom').addClass('hide');
		$('.editor').addClass('hide');
		$('.selected_categories').addClass('hide');
		simaple2();
	}else if(value=='selected_categories'){
		$('.selected_categories').removeClass('hide');
		$('.column-class').removeClass('hide');
		$('.input-category_images').removeClass('hide');
		$('.category').addClass('hide');
		$('.products').addClass('hide');
		$('.information').addClass('hide');
		$('.custom').addClass('hide');
		$('.editor').addClass('hide');
	}else if(value=='information'){
		$('.information').removeClass('hide');
		$('.products').addClass('hide');
		$('.category').addClass('hide');
		$('.custom').addClass('hide');
		$('.column-class').addClass('hide');
		$('.editor').addClass('hide');
		$('.selected_categories').addClass('hide');
	}else if(value=='custom'){
		$('.custom').removeClass('hide');
		$('.products').addClass('hide');
		$('.category').addClass('hide');
		$('.information').addClass('hide');
		$('.column-class').addClass('hide');
		$('.editor').addClass('hide');
		$('.selected_categories').addClass('hide');
	}else if(value=='editor'){
		$('.editor').removeClass('hide');
		$('.custom').addClass('hide');
		$('.products').addClass('hide');
		$('.column-class').addClass('hide');
		$('.category').addClass('hide');
		$('.information').addClass('hide');
		$('.selected_categories').addClass('hide');
	}else if(value=='products'){
		$('.products').removeClass('hide');
		$('.column-class').removeClass('hide');
		$('.editor').addClass('hide');
		$('.custom').addClass('hide');
		$('.category').addClass('hide');
		$('.information').addClass('hide');
		$('.selected_categories').addClass('hide');
	}else{
		$('.products').addClass('hide');
		$('.column-class').addClass('hide');
		$('.editor').addClass('hide');
		$('.custom').addClass('hide');
		$('.category').addClass('hide');
		$('.information').addClass('hide');
		$('.selected_categories').addClass('hide');
	}
	
}

$('.fontawesomeicon').click(function(){
    $('#menuicon').val($(this).attr('rel'));
	$(this).addClass('active').siblings().removeClass('active');
	var html = '<i class="fa btn btn-sm btn-warning selectedicon ' + $(this).attr('rel') + '"></i>';
	$('#activeicon').html(html);
});

//--></script>
 <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script>
</div>
<?php echo $footer; ?>