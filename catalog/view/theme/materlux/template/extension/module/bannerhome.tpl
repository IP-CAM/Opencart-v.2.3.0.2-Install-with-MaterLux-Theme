<?php $i = 1; foreach ($banners as $banner) { ?>
	<?php if($i == '1') { ?>
	<?php if ($banner['link']) { ?>
		<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
	<?php } else { ?>
		<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"/>
	<?php } ?>
	<?php } ?>
<?php $i++; } ?>