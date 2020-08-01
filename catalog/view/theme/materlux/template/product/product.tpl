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
			<h1><?php echo $heading_title; ?></h1>
			<div class="card">
				<div class="card_left">
					<?php if($lifemattress) { ?>
						<div class="year_card">
						    <a href="/index.php?route=information/information&amp;information_id=21">
							<span class="lifes_card_val"><?php echo $kolvolifes; ?></span>
							<span class="yer">лет</span>
							 </a>
						</div>
					<?php } ?>
					<?php if ($special) { ?>
						<div class="percent_card">
						<a href="<?php echo $linksale; ?>">
							<span class="percent_card_val">
								<?php echo $sale; ?>
							</span>
						</a>
						</div>
					<?php } ?>
					<div class="SliderCard thumbnails" >
						<?php if ($thumb) { ?>
							<div>
								<a class="img_box img_zoom" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>">
									<img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
								</a>
							</div>
						<?php } ?>
						<?php if ($images) { ?>
				            <?php foreach ($images as $image) { ?>
				            	<div ><a class="img_box img_zoom" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/></a></div>
				            <?php } ?>
			            <?php } ?>
					</div>
				</div>
				<div class="card_right" id="product">
					<div class="card_top">
						<?php if ($price) { ?>
							<div class="card_price">
								<?php if (!$special) { ?>
									<span class="price_old" style="opacity: 0;">&nbsp;</span>
									<span class="price"><?php echo $price; ?></span>
								<?php } else { ?>
									<span class="price_old"><?php echo $price; ?></span>
									<span class="sale"><?php echo $sale; ?></span>
									<span class="price"><?php echo $special; ?></span>
									<span class="price_dicount">Ваша экономия: <?php echo $specialprice; ?></span>
								<?php } ?>
							</div>
						<?php } ?>
						<?php if ($options) { ?>
							<?php foreach ($options as $option) { ?>
								<?php if ($option['type'] == 'select') { ?>
									<?php if($option['option_id'] == '15') { ?>
										<div class="card_discount <?php echo ($option['required'] ? ' required' : ''); ?>">
											<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
											<select class="select_grey" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
												<option value="">Выберите</option>
											<?php foreach ($option['product_option_value'] as $option_value) { ?>

												<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
												</option>
											<?php } ?>
											</select>
										</div>
								<?php } ?>

								<?php } ?>
							<?php } ?>
						<?php } ?>
					</div>


					<div class="card_check">

						<?php if ($options) { ?>
							<?php foreach ($options as $option) { ?>
								<?php if ($option['type'] == 'select') { ?>
									<?php if($option['option_id'] == '13' or $option['option_id'] == '5') { ?>
									<div class="card_check_box <?php echo ($option['required'] ? ' required' : ''); ?>">
										<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label>
										<select class="select_middle" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
											<option value="">Выберите</option>
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
										<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
										</option>
										<?php } ?>
										</select>
									</div>
								<?php } ?>

								<?php } ?>
							<?php } ?>
						<?php } ?>

						<?php 
							$date1 = date("d.m.Y",strtotime("+1 day"));
							$date2 = date("d.m.Y",strtotime("+2 day"));
							$date3 = date("d.m.Y",strtotime("+3 day"));
							$date4 = date("d.m.Y",strtotime("+4 day"));
						?>
						
						<?php if ($options) { ?>
							<?php foreach ($options as $option) { ?>

								<?php if ($option['type'] == 'date') { ?>
									
									<div class="card_check_one">
										<label>Дата доставки:</label>
										<select class="select_middle select_grey" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>">
											<option value="<?php echo $date1; ?>"><?php echo $date1; ?></option>
											<option value="<?php echo $date2; ?>"><?php echo $date2; ?></option>
											<option value="<?php echo $date3; ?>"><?php echo $date3; ?></option>
											<option  value="<?php echo $date4; ?>"><?php echo $date4; ?></option>
										</select>
									</div>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					</div>
					<div class="another_size">Не нашли свой размер? Сделаем! <a href="#" class="open_popup" data-id-popup="p_calc">Жмите</a></div>
					<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
					<input type="hidden" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" />
					<div class="card_data">
						<div class="card_btn">
							<a href="javascript:void(0);" class="btn" id="button-cart">
								<i class="icon-basket"></i>
								купить
							</a>
						</div>
						<div class="card_data_click">
							<a href="#" class="buy_one_click open_popup" data-id-popup="p_buy_one_click">Купить в 1 клик</a>
						</div>
						
					</div>
					<div class="link_card">
						<ul class="card_link">
							<li>
								<a href="#" class="open_popup" data-id-popup="p_calc">
									Расчет нестандартных <br> размеров
								</a>
							</li>
							<li>
								<a href="/index.php?route=information/information&information_id=15">
									Бесплатная <br> утилизация
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<ul class="card_nav CardTabNav">
				<?php if(strip_tags($description)) { ?>
					<li><a href="#">Описание</a></li>
				<?php } ?>

				<?php if(strip_tags($composition)) { ?>
					<li><a href="#">Состав</a></li>
				<?php } ?>

				<?php if ($attribute_groups) { ?>
					<li><a href="#">Характеристики</a></li>
				<?php } ?>

				<li><a href="#">Доставка</a></li>
				<li><a href="#">Оплата</a></li>
			</ul>

			<div class="CardTab">
				<!--TAB-->
				<?php if(strip_tags($description)) { ?>
					<div class="CardTabBox">
						<?php echo $description; ?>
					</div>
				<?php } ?>
				<!--TAB-->
				<?php if(strip_tags($composition)) { ?>
					<div class="CardTabBox">
						<?php echo $composition; ?>
					</div>
				<?php } ?>
				<!--TAB-->
				<?php if ($attribute_groups) { ?>
					<div class="CardTabBox">
						<table class="table table-bordered">
							<?php foreach ($attribute_groups as $attribute_group) { ?>
								<thead>
									<tr>
										<td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
									</tr>
								</thead>
								<tbody>
									<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
										<tr>
											<td><?php echo $attribute['name']; ?></td>
											<td><?php echo $attribute['text']; ?></td>
										</tr>
									<?php } ?>
								</tbody>
							<?php } ?>
						</table>
					</div>
				<?php } ?>

				<!--TAB-->
				<div class="CardTabBox">
					<?php echo $column_right; ?>
				</div>

				<!--TAB-->
				<div class="CardTabBox">
					<?php echo $content_bottom; ?>
				</div>
				
			</div>


		</div>

		<?php if($products) { ?>
			<section class="section_item">
				<div class="title">
					<h2>Вам также может быть интересно</h2>
				</div>
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
			</section>
		<?php } ?>
	</div>
<script type="text/javascript"><!--


$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
	
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('#p_cart').addClass('active');
				$('#cart-total').html(json['total']);
			}	
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>

<div class="popup" id="p_buy_one_click">
	<div class="popup_box form_footer">
		<a href="#" class="close_popup"></a>
		<div class="popup_title">Купить в 1 клик</div>
		<form id="formoneclick" name="formoneclick" method="post">
			<input type="hidden" name="subject" value="Купить в 1 клик">
			<input type="hidden" name="title" value="Купить в 1 клик">
			<input type="hidden" name="product" value="<?php echo $heading_title; ?>">
			<input type="hidden" name="productlink" value="<?php echo $share; ?>">
			<div class="form_popup">
				<div class="in_box">
					<input type="text" class="tx" required name="name" placeholder="Ваше имя">
				</div>
				<div class="in_box">
					<input type="text" class="tx in_phone" required name="phone" placeholder="+7 ____ - ___ - ___">
				</div>
				<div class="btn_center">
					<button class="btn" type="submit">Купить в 1 клик</button>
				</div>
			</div>
		</form>
	</div>
</div>

<?php echo $footer; ?>