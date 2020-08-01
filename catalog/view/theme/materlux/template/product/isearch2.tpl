<?php echo $header; ?>
<div class="content">	
	<div class="content_box">
  <ul class="breacrumb">
			<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
				<?php if($i+1<count($breadcrumbs)) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } else { ?>
					<li><?php echo $breadcrumb['text']; ?></li>
				<?php } ?>
			<?php } ?>
		</ul>
  <div class="catalog">
			<!--LEFT COLUMN-->
			<?php echo $column_left; ?>

			<!--RIGHT COLUMN-->
            <div class="catalog_cont">
				<div class="catalog_title">
					<h1><?php echo $heading_title; ?></h1>
				</div>
				<div class="params_block_search">
				   <div class="param_item param_item_search">
				   <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="txsearch" />
				   </div>
				   <div class="param_item">
				   <select name="category_id" class="select_small">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
				   </div>
				   <div class="param_item">
				   <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
				   </div>
				   <div class="param_item">
				   <label class="checkbox-inline">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
				   </div>			   
				<div class="param_button">
				<input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
				</div>
			</div>
			<div class="catalog_result_title">
					<h2><?php echo $text_search; ?></h2>
			</div>
			<?php if ($products) { ?>
			<div class="results_search_params">
			    <div class="results_search_item results_search_item_compare hidden_destop">
				   <a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>
				</div>
			    <div class="results_search_item">
				 <label class="control-label hidden_mobile" for="input-sort"><?php echo $text_sort; ?></label>
				 <select id="input-sort" class="select_small" onchange="location = this.value;">
                 <?php foreach ($sorts as $sorts) { ?>
                 <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                 <?php } else { ?>
                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                 <?php } ?>
                 <?php } ?>
                 </select>
				</div>
				<div class="results_search_item hidden_mobile">
				   <a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>
				</div>
				<div class="results_search_item" style="float:right;">
				<label class="control-label hidden_mobile" for="input-limit"><?php echo $text_limit; ?></label>
				<select id="input-limit" class="select_small" onchange="location = this.value;">
                  <?php foreach ($limits as $limits) { ?>
                  <?php if ($limits['value'] == $limit) { ?>
                  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                  <?php } ?>
                  <?php } ?>
                 </select>
				</div>
			</div>
			
			<ul class="list_catalog list_search_catalog">
						
						<?php foreach ($products as $product) { ?>
							<li>
								<div class="item">
									<div class="img_box">
										<a href="<?php echo $product['href']; ?>">
										<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/></a>
									</div>
									<span class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
									

									<div class="item_bot">
										<div class="price_box">
											<?php if ($product['price']) { ?>
												<?php if (!$product['special']) { ?>
													<span class="price"><?php echo $product['price']; ?></span>
												<?php } else { ?>
													<span class="price"><?php echo $product['special']; ?></span>
												<?php } ?>
											<?php } ?>
										</div>
										<a href="javascript:void(0);" class="in_basket" onclick="add_bc('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>', event);">
											<i class="icon-basket"></i>
											купить
										</a>
									</div>
								</div>
							</li>
						<?php } ?>	
					</ul>

      <div class="row search_pagination">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
	  <div class="no_content">
      <p><?php echo $text_empty; ?></p>
	  </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script> 
<?php echo $footer; ?> 