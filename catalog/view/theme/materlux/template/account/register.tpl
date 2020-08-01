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
							<span class="form_name"><?php echo $text_account_already; ?></span>
							<div class="hidden">
								<input type="text" name="firstname" value="<?php echo $entry_firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
								<?php if ($error_firstname) { ?>
								<div class="text-danger"><?php echo $error_firstname; ?></div>
								<?php } ?>
							</div>
							<div class="hidden">
								<input type="text" name="lastname" value="<?php echo $entry_lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
								<?php if ($error_lastname) { ?>
								<div class="text-danger"><?php echo $error_lastname; ?></div>
								<?php } ?>
							</div>
							<div class="hidden">
								<input type="tel" name="telephone" value="<?php echo $entry_telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
								<?php if ($error_telephone) { ?>
								<div class="text-danger"><?php echo $error_telephone; ?></div>
								<?php } ?>
							</div>
							
							<div class="hidden">
								<input type="text" name="fax" value="<?php echo $entry_fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
							</div>

							<div class="hidden">
								<input type="text" name="company" value="<?php echo $entry_company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
							</div>

							<div class="hidden">
								<input type="text" name="address_1" value="<?php echo $entry_address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
								<?php if ($error_address_1) { ?>
								<div class="text-danger"><?php echo $error_address_1; ?></div>
								<?php } ?>
							</div>

							<div class="hidden">
								<input type="text" name="address_2" value="<?php echo $entry_address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
							</div>

							<div class="hidden">
								<input type="text" name="city" value="<?php echo $entry_city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
							<?php if ($error_city) { ?>
								<div class="text-danger"><?php echo $error_city; ?></div>
							<?php } ?>
							</div>

							<div class="hidden">
								<input type="text" name="postcode" value="<?php echo $entry_postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
								<?php if ($error_postcode) { ?>
									<div class="text-danger"><?php echo $error_postcode; ?></div>
								<?php } ?>
							</div>

							<div class="hidden">
								<label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
								<input type="text" value="176" name="country_id" id="input-payment-country" class="form-control">
							</div>

							<div class="hidden">
								<label class="control-label" for="input-payment-zone"><?php echo $entry_zone; ?></label>
								<input type="text" value="2761" name="zone_id" id="input-payment-zone" class="form-control">
							</div>

							<div class="hidden">
								<input type="checkbox" name="agree" value="1" checked="checked" />
							</div>
							
							<div class="in_box">
								<input type="text" name="email" value="<?php echo $email; ?>" placeholder="E-mail" id="input-email" class="tx" />
								<?php if ($error_email) { ?>
									<div class="text-danger"><?php echo $error_email; ?></div>
								<?php } ?>
							</div>
							<div class="in_box">
								<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="tx" />
								<?php if ($error_password) { ?>
									<div class="text-danger"><?php echo $error_password; ?></div>
								<?php } ?>
							</div>
							<div class="in_box">
								<input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="tx" />
								<?php if ($error_confirm) { ?>
									<div class="text-danger"><?php echo $error_confirm; ?></div>
								<?php } ?>
							</div>
							<div class="form_login_bot">
								
								<button class="btn" type="submit">Регистрация</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>