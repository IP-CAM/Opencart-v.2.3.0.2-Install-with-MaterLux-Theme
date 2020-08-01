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
		<div class="checkout">
			<div class="checkout_box account">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
					<div class="form_login">
						<div class="form_login_box">
							<span class="form_name">&nbsp;</span>
							<div class="in_box">
								<input type="password" name="password" value="<?php echo $password; ?>" id="input-password" class="tx" placeholder="Пароль" />
								<?php if ($error_password) { ?>
									<div class="text-danger"><?php echo $error_password; ?></div>
								<?php } ?>
							</div>
							<div class="in_box">
								<input type="password" name="confirm" value="<?php echo $confirm; ?>" id="input-confirm" class="tx" placeholder="<?php echo $entry_confirm; ?>" />
								<?php if ($error_confirm) { ?>
									<div class="text-danger"><?php echo $error_confirm; ?></div>
								<?php } ?>
							</div>
							<div class="form_login_bot">
								<div class="check">
									<a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a>
								</div>
								<button class="btn" type="submit">Восстановить</button>
							</div>
							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>