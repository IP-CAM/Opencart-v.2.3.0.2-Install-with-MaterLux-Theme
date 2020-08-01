<?php if ($heading_title) { ?>
<h2><?php echo $heading_title; ?></h2>
<?php } ?>
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
<a href="<?php echo $link_to_category; ?>" class="all_news">Все публикации</a>