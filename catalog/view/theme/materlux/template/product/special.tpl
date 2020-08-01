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
	</div>	
	<section class="about special_top">
			<div class="about_cont">
				<div class="about_text home_about">
					<?php echo $content_bottom; ?>
				</div>
				<div class="about_right special_top_right">
				<div class="about_info">
				    <img src="catalog/view/theme/materlux/img/blockquote.png">
				    <span>С любовью и заботой к каждому </br>нашему клиенту.</span>
					</div>
					<div class="slider_about">
						<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_hslides'])) { ?>
			        		<?php echo implode('', $vie_module_groups['vie_hslides']); ?>
			        	<?php } ?>
					</div>
					
				</div>
			</div>
	</section>
	<section class="section_title">
			<div class="content_box">
				<div class="title">
					Действующие акции
				</div>
				</div>
	</section>
	<?php echo $column_left; ?>
	<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_proakcii'])) { ?>
        	<?php echo implode('', $vie_module_groups['vie_proakcii']); ?>
        <?php } ?>
</div>
<?php echo $footer; ?>