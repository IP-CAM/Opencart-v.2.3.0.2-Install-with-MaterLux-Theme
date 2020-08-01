<div class="SliderAbout">
	<?php foreach ($banners as $banner) { ?>
		<?php 
			$youtube = strpos($banner['link'], 'youtube');
		?>
		<?php if($youtube) { ?>
			<div>
				<div class="slids_about">
					<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
					<a href="<?php echo $banner['link']; ?>" class="play"></a>
				</div>
			</div>
		<?php } elseif(!empty($banner['link'])) {?>
			<div>
				<a href="<?php echo $banner['link']; ?>" class="slids_about">
					<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
				</a>
			</div>
		<?php } else { ?>
			<div>
				<a href="<?php echo $banner['imagefull']; ?>" class="slids_about thumb">
					<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
				</a>
			</div>
		<?php } ?>
	<?php } ?>
</div>