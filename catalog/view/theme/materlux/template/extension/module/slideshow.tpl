<div class="SliderInner">
	<?php foreach ($banners as $banner) { ?>
		<div>
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/>
		</div>
	<?php } ?>
</div>
<div class="SliderInnerNav">
	<?php foreach ($banners as $banner) { ?>
		<div>
			<img src="<?php echo $banner['imagesmall']; ?>" alt="<?php echo $banner['title']; ?>"/>
		</div>
	<?php } ?>
</div>