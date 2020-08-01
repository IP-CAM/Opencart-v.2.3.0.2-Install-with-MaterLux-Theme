<div class="content_top">
	<div class="slider_box">
		<div class="Slider">
			<?php foreach ($banners as $banner) { ?>
				<div>
					<div class="slids">
						<span class="name"><?php echo $banner['title']; ?></span>
						<?php if ($banner['link']) { ?>
							<a href="<?php echo $banner['link']; ?>" class="btn_more">Подробнее</a>
						<?php } ?>
					</div>
				</div>
			<?php } ?>
		</div>
		<div class="SliderNav"></div>
	</div>
</div>