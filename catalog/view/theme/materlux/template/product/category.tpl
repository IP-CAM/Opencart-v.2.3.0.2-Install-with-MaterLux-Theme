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
					<a href="#" class="link_filter">фильтры</a>
				</div>
				<?php if ($products) { ?>
					<div class="cat_sep">
						<div class="cat_sep_box">
							<span class="name">Сортировка по:</span>
							<ul class="nav_sep">
								<?php foreach ($sorts as $sorts) { ?>
									<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
										<li><a href="<?php echo $sorts['href']; ?>" class="active"><?php echo $sorts['text']; ?></a></li>
									<?php } else {?>
										<li><a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a></li>
									<?php } ?>
								<?php } ?>
							</ul>
						</div>
						<div class="see_item">
							<div class="sel_box">
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
					</div>
					
					<ul class="list_catalog">
						
						<?php $i = 1; foreach ($products as $product) { ?>
							<li>
								<div class="item">
									<div class="img_box">
										<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/></a>
										<?php if($product['sale']) { ?>
											<span class="sale"> <?php echo $product['sale']; ?></span>
										<?php } ?>
									</div>
									<span class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
									
									<?php if ($product['options']) { ?>
										<div class="item_size" id="option_<?php echo $product['product_id']; ?>">
											<?php foreach ($product['options'] as $option) { ?>
												<?php if ($option['type'] == 'select') { ?>
													<?php if($option['option_id'] == '5') { ?>
													<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
										              	<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
										                
										                <?php foreach ($option['product_option_value'] as $option_value) { ?>
										                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
											                <?php if ($option_value['price'] != '0.0000') { ?>
											                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											                <?php } ?>
										                </option>
										                <?php } ?>
										              	</select>
										            </div>
													<?php } ?>
												<?php } ?>
											<?php } ?>
										</div>
									<?php } ?>

									<?php if ($product['attribute_groups']) { ?>
										<ul class="item_data">
											<?php foreach ($product['attribute_groups'] as $attribute_group) { ?>
												<?php if($attribute_group['attribute_group_id'] == '4') { ?>
												<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
													<?php if($key < 4) { ?>
														<li>
															<span class="sub"><?php echo $attribute['name']; ?>:</span>
															<span class="sub"><?php echo $attribute['text']; ?></span>
														</li>
													<?php } ?>
												<?php } ?>
												<?php } ?>
											<?php } ?>
										</ul>
									<?php } ?> 
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
							<?php if($i == '8') { ?>
								<li>
									<div class="question_call">
										<h2>Затрудняетесь с выбором матраса?</h2>
										<p>Наши опытные специалисты помогут подобрать матрас с необходимыми вам характеристиками</p>
										<a href="#" class="btn_call open_popup" data-id-popup="p_call"><i class="icon-phone"></i></a>
									</div>
								</li>
							<?php } ?>
						<?php $i++; } ?>	
					</ul>

					<div class="btn_center pagination-wrap">
						<? if( ceil($pagination_object->total / $pagination_object->limit) > $pagination_object->page ){?>
							<a class="btn btn_color more" href="<?=
								str_replace(
									"{page}", 
									$pagination_object->page + 1, 
									$pagination_object->url
								);
							?>">Показать еще</a>
						<? } ?>	                
					</div>

					<?php if ($description) { ?>
						<?php echo $description; ?>
					<?php } ?>

					<?php if($filterdesc) { ?>
						<?php echo $content_bottom; ?>
					<?php } ?>

				<?php } else { ?>
					<p><?php echo $text_empty; ?></p>
				<?php } ?>

			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>