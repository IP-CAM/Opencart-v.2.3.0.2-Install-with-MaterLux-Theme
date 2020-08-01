<div class="basket_bot_left">
	<div class="basket_code">
	<label class="col-sm-2 control-label" for="input-coupon">Промокод</label>
		<div class="basket_code_box">
			<input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="код купона" id="input-coupon" class="tx" />
			<?php if($coupon) { ?>
				<a href="javascript:void(0);" class="delete button-coupon">+</a>
			<?php } else { ?>
				<input type="button" value="Ок"  class="btn button-coupon" />
			<?php } ?>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
$('.delete').on('click', function() {
	$('#input-coupon').val('');
	location.reload();
});
$('.button-coupon').on('click', function() { 
	$.ajax({
		url: 'index.php?route=extension/total/coupon/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('.breacrumb').after('<div class="alert alert-danger">' + json['error'] + '</div>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}

			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
//--></script>
