<script>
	function regNewsletter()
	{
		var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var email = $('#txtemail').val();
		
		if(email != "")
		{
			if(!emailpattern.test(email)) 
			{
				$("#text-danger-newsletter").remove();
				$("#form-newsletter-error").removeClass("has-error");
				$("#newsletter-email").append('<div class="text-danger" id="text-danger-newsletter"><?php echo $error_news_email_invalid; ?></div>');
				$("#form-newsletter-error").addClass("has-error");

				return false;
			}
			else
			{
				$.ajax({
					url: 'index.php?route=extension/module/newsletters/add',
					type: 'post',
					data: 'email=' + $('#txtemail').val(),
					dataType: 'json',
					async:false,

					success: function(json) {

						if (json.message == true) {
							alert('<?php echo $error_newsletter_sent; ?>');
							document.getElementById("form-newsletter").reset();
							return true;						
						}
						else {
							$("#text-danger-newsletter").remove();
							$("#form-newsletter-error").removeClass("has-error");
							$("#newsletter-email").append(json.message);
							$("#form-newsletter-error").addClass("has-error");
						}
					}
				});
				return false;
			}
		}
		else
		{

			$("#text-danger-newsletter").remove();
			$("#form-newsletter-error").removeClass("has-error");
			$("#newsletter-email").append('<div class="text-danger" id="text-danger-newsletter"><?php echo $error_news_email_required; ?></div>');
			$("#form-newsletter-error").addClass("has-error");

			return false;
		}
	}
</script>

<div><h3><?php echo $heading_title; ?></h3></div>
<div class="panel panel-default">
	<div style="height: 30px;"></div>
	<form action="" method="post" class="form-horizontal" id="form-newsletter">
		<div class="form-group" id="form-newsletter-error">
			<label for="input-firstname" class="control-label col-xs-2"><?php echo $text_email; ?></label>
			<div class="col-xs-7" id="newsletter-email">
				<input type="email" name="txtemail" id="txtemail" value="" placeholder="<?php echo $text_subscribe_placeholder; ?>" class="form-control"/>
			</div>
			<span class="col-xs-2">
				<button type="submit" onclick="return regNewsletter();" style="
					padding: 7.5px 12px;
					font-size: 12px;
					border: 1px solid #cccccc;
					border-radius: 4px;
					box-shadow: inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);
					color: #ffffff;
					text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
					background-color: #229ac8;
					background-image: linear-gradient(to bottom, #23a1d1, #1f90bb);
					background-repeat: repeat-x;
					border-color: #1f90bb #1f90bb #145e7a;">
					<i class="fa fa-envelope"></i>
					<span class="hidden-xs hidden-xs hidden-md" style="padding-left: 3px;"><?php echo $text_subscribe_btn; ?></span>
				</button>
			</div>
		</div>
	</form>
	<div style="height: 10px;"></div>
</div>