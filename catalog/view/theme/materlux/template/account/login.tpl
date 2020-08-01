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
		<?php if ($success) { ?>
			<div class="alert alert-success"><?php echo $success; ?></div>
		<?php } ?>
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><?php echo $error_warning; ?></div>
		<?php } ?>
		<h1><?php echo $heading_title; ?></h1>
		<div class="checkout">
			<div class="checkout_box account">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
					<div class="form_login">
						<div class="form_login_box">
							<span class="form_name">&nbsp;</span>
							<div class="in_box">
								<input type="text" name="email" value="<?php echo $email; ?>" placeholder="E-mail" id="input-email" class="tx" />
							</div>
							<div class="in_box">
								<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="tx" />
							</div>
							<div class="form_login_bot">
								<div class="check">
									<label>
										<input type="checkbox">
										<i></i>
										Запомнить меня
									</label>
								</div>
								<button class="btn" type="submit">Войти</button>
							</div>
							<p><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></p>
							<p><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></p>
						</div>
					</div>
					<?php if ($redirect) { ?>
						<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
					<?php } ?>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>