<div class="filter">
	<div class="filter_box">
		<h3>Личный Кабинет</h3>
		<ul class="list_check accountlink">
			<?php if ($logged) { ?>
			<li>
				<div class="check">
					<a href="<?php echo $order; ?>"><?php echo $text_order; ?></a> 
				</div>
			</li>
			<li>
				<div class="check">
					<a href="<?php echo $address; ?>"><?php echo $text_address; ?></a> 
				</div>
			</li>
			<li>
				<div class="check">
					<a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a> 
				</div>
			</li>
			<li>
				<div class="check">
					<a href="<?php echo $password; ?>"><?php echo $text_password; ?></a>
			  	</div>
			</li>
			<li>
				<div class="check">
					<a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a> 
				</div>
			</li>
			<?php } ?>
		</ul>
	</div>
</div>