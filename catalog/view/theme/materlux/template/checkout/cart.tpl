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
		<?php if ($attention) { ?>
			<div class="alert alert-info"><?php echo $attention; ?></div>
		<?php } ?>

		<?php if ($success) { ?>
			<div class="alert alert-success"><?php echo $success; ?></div>
		<?php } ?>

		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><?php echo $error_warning; ?></div>
		<?php } ?>

		<div class="basket_name"> 
			<div>Фото</div>
			<div>Название</div>
			<div>Характеристики</div>
			<div>Цена за ед.</div>
			<div>Кол-во</div>
			<div>Итого</div>
		</div>
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="formcart">
			<?php foreach ($products as $product) { ?>
				<div class="basket_item">
					<div class="col1">
						<div class="img_box">
							<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
						</div>
					</div>
					<div class="col2">
						<span class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							<?php if (!$product['stock']) { ?>
								<span class="text-danger">***</span>
							<?php } ?>
						</span>
						<?php if ($product['option']) { ?>
							<?php foreach ($product['option'] as $option) { ?>
								<?php if($option['option_id'] == '5') { ?>
									<div class="order_size"><?php echo $option['value']; ?></div>
								<?php } ?>
							<?php } ?>
						<?php } ?>
						
					</div>
					<div class="col3">
						<?php if ($product['attribute_groups']) { ?>
							<ul class="data">
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
					</div>
					<div class="col4">
						<div class="price"><?php echo $product['price']; ?></div>
					</div>
					<div class="col5">
						<div class="much">
							<span class="minus">-</span>
							<input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>"/>
							<span class="plus">+</span>
						</div>
					</div>
					<div class="col6">
						<div class="price_all"><?php echo $product['total']; ?></div>
						<a href="javascript:void(0);" class="delete" onclick="cart.remove('<?php echo $product['cart_id']; ?>'); return false;">+</a>
					</div>
				</div>
			<?php } ?>
		</form>

		<div class="basket_bot">
			<?php echo $coupon; ?>
			
			<div class="basket_bot_right">
				<table class="basket_price">
					<?php foreach ($totals as $total) { ?>
						<?php if($total['code'] == 'coupon') { ?>
							<tr>
								<td>Сумма скидок:</td>
								<td><span class="price"><?php echo $total['text']; ?></span></td>
							</tr>
						<?php } ?>
					<?php } ?>
					<tr>
						<td>Стоимость доставки:</td>
						<td>
							<a href="#" class="reprice open_popup" data-id-popup="p_calccart">
								Посмотреть 
							</a>
						</td>
					</tr>
					<?php foreach ($totals as $total) { ?>
						<?php if($total['code'] == 'total') { ?>
							<tr class="total">
								<td>Итоговая стоимость:</td>
								<td><span class="price"><?php echo $total['text']; ?></span></td>
							</tr>
						<?php } ?>
					<?php } ?>
				</table>
			</div>
		</div>

		<div class="basket_button">
			<div class="basket_button_left">
				<a href="<?php echo $continue; ?>" class="btn btn_color">Продолжить покупки</a>
			</div>
			<div class="basket_button_right">
				<a href="javascript:void(0);" class="recalc">Пересчитать</a>
				<a href="<?php echo $checkout; ?>" class="btn">Оформить заказ</a>
			</div>
		</div>

	</div>
</div>
<script type="text/javascript">
	$("input[name^='quantity']").change(function() {
	    $("input[name^='quantity']").closest('form').submit();
	});
	$('.recalc').click(function() {
		$('#formcart').submit();
	});
</script>
<div class="popup" id="p_calccart">
	<div class="popup_box form_footer">
		<a href="#" class="close_popup"></a>
		<div class="popup_title">Стоимость доставки</div>
		<div class="table_popup">
			<?php echo $content_bottom; ?>
		</div>
	</div>
</div>
<?php echo $footer; ?>