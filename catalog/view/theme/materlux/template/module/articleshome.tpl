<?php if ($heading_title) { ?>
<h2><?php echo $heading_title; ?></h2>
<?php } ?>
<ul class="list_article">
	<?php foreach ($articles as $article) { ?>
		<li>
			<div class="article">
				<span class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></span>
				<?php echo $article['preview']; ?>
			</div>
		</li>
	<?php } ?>
</ul>