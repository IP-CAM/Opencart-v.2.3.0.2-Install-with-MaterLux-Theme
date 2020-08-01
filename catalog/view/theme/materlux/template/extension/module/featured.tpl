<div class="TabCont">
	<div class="carusel">
		<?php foreach ($products as $product) { ?>
			<div>
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
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
							              	<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>">
							                
								                <?php foreach ($option['product_option_value'] as $option_value) { ?>
									                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
										                <?php if ($option_value['price'] != '0.0000') { ?>
										                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										                <?php } ?>
									                </option>
								                <?php } ?>
							              	</select>
							            </div>
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
			</div>
		<?php } ?>
	</div>
</div>