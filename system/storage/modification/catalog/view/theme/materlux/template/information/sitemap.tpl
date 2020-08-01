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
		<h1><?php echo $heading_title; ?></h1>
			<div class="default_row">
			
			<ul>
			<?php foreach ($categories as $category_1) { ?>
			<li><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
			<?php if ($category_1['children']) { ?>
			<ul>
			<?php foreach ($category_1['children'] as $category_2) { ?>
			<li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
			<?php if ($category_2['children']) { ?>
			<ul>
			<?php foreach ($category_2['children'] as $category_3) { ?>
			<li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
			<?php } ?>
			</ul>
			<?php } ?>
			</li>
			<?php } ?>
			</ul>
			<?php } ?>
			</li>
			<?php } ?>
			</ul>
			
			
			<ul>
			<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
			<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
			<ul>
			<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
			<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
			<li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
			<li><a href="<?php echo $history; ?>"><?php echo $text_history; ?></a></li>
			</ul>
			</li>
			<li><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></li>
			<li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
			<li><a href="<?php echo $search; ?>"><?php echo $text_search; ?></a></li>

      	<?php foreach ($newsblog_categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
              <?php if ($category['children']) { ?>
              <ul>
                <?php foreach ($category['children'] as $article) { ?>
                <li><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
		
			<li><?php echo $text_information; ?>
			<ul>
			<?php foreach ($informations as $information) { ?>
			<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
			<?php } ?>
			<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
			</ul>
			</li>
			</ul>
			
			</div>
	</div>
</div>
<?php echo $footer; ?>