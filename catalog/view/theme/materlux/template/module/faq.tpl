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
		<?php if(!empty($sections)):?>
			<?php $i = 0; ?>
                <?php foreach($sections as $section):?>
                  	<?php if(!empty($section['items'])):?>
                  		<?php $s = 1; ?>
                  		<?php foreach($section['items'] as $item):?>
							<h4><?php echo $s . '. ' . $item['question']; ?></h4>
							<p><?php echo $item['answer']; ?></p>
							<?php $i++; $s++; ?>
					<?php endforeach; ?>
					<?php endif; ?>
                <?php endforeach; ?>
		<?php endif; ?>
		
	</div>
</div>
<?php echo $footer; ?>