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
							<div class="form_login_bot">
								<div class="check">
									
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