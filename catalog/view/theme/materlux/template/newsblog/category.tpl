<?php echo $header; ?>
<div class="content">	
	<div class="content_box content_info">
		<ul class="breacrumb">
			<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
				<?php if($i+1<count($breadcrumbs)) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } else { ?>
					<li><?php echo $breadcrumb['text']; ?></li>
				<?php } ?>
			<?php } ?>
		</ul>
		<h1><?php echo $heading_title; ?></h1>
		<ul class="list_news">
			<?php foreach ($articles as $article) { ?>
				<li>
					<div class="news">
						<span class="date"><?php echo $article['date']; ?></span>
						<span class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></span>
					</div>
				</li>
			<?php } ?>
		</ul>
		<?php echo $pagination; ?>
	</div>
</div>
<?php echo $footer; ?>