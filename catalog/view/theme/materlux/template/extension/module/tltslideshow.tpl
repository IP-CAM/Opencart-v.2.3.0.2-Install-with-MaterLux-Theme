<div class="slider_index">
	<div class="SliderIndex">
		<?php foreach ($slides as $slide) { ?>
			<div>
				<div class="slids_index">
					<?php if ($slide['link']) { ?>
					<a class="imgBox" href="<?php echo $slide['link']; ?>">
						<img src="<?php echo $slide['image']; ?>" alt="<?php echo $slide['title']; ?>"/>
					</a>
				<?php } else {?>
					<div class="imgBox">
						<img src="<?php echo $slide['image']; ?>" alt="<?php echo $slide['title']; ?>"/>
					</div>
				<?php } ?>
					<?php if ($slide['description']) { ?>
						<div class="sl_disocunt">
							<span><?php echo $slide['description']; ?></span>
						</div>
					<?php } ?>
					<?php if ($slide['header']) { ?>
						<div class="slids_index_text">
							<span class="name"><?php echo $slide['header']; ?></span>
							<?php echo $slide['title']; ?>
						</div>
					<?php } ?>
				</div>
			</div>
		<?php } ?>
	</div>
</div>