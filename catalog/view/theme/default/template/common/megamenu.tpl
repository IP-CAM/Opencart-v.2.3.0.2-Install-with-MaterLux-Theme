<link href="catalog/view/theme/default/stylesheet/megamenu.css" rel="stylesheet"/>
<?php if($results){ ?>
<style>
.navbar{
	border-radius:<?php echo $megamenu_setting_menuborderradius; ?>px;
}
.navbar-default{
	background-color:<?php echo $megamenu_setting_menubg; ?>;
}
#megamenu .nav > li > a{
	color:<?php echo $megamenu_setting_menufontcolor; ?>;
}
.mega-menu .li_header a{
	color:<?php echo $megamenu_setting_listing_heading_color; ?>;
	padding:5px 0;
	display:block;
	text-transform:uppercase;
	font-weight:bold;
}
.nav > li > a:hover, .nav > li > a:focus{
	color:<?php echo $megamenu_setting_menufonthovercolor; ?>;
	background-color:<?php echo $megamenu_setting_menuhovercolor; ?>;
}
.mega .dropdown-menu{
	clear:both;
	background-color:<?php echo $megamenu_setting_menudropdown; ?>;
}
.mega .dropdown-menu li > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > li > a{
	background:none!important;
	color:<?php echo $megamenu_setting_listing_heading_color; ?>;
}
.dropdown-menu a, .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover{
	color:<?php echo $megamenu_setting_inner_link_color; ?>;
}
</style>
<div <?php if(!$megamenu_setting_menuwidth){ echo "class='container'"; } ?>>
	<nav class="navbar navbar-default mega" role="navigation">
	
		<div class="navbar-header">
			<span class="navbar-menu pull-left visible-xs"><?php echo $text_category; ?></span>
			<button type="button" data-toggle="collapse" data-target="#megamenu" class="navbar-toggle pull-right"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
		</div><!-- end navbar-header -->
		
		<div id="megamenu" class="navbar-collapse collapse">
		<div <?php if($megamenu_setting_menuwidth){ echo "class='container'"; } ?>>
			<ul class="nav navbar-nav">
			<?php foreach ($results as $menu) { ?>
			<?php if($menu['children']){ ?> 
					
					<!-- Category START -->
					<?php if($menu['type']=='category'){ ?>
					<?php if($menu['multilevel'] == 2){ ?>	
							<li class="dropdown">
								<a href="<?php echo $menu['href']; ?>" class="dropdown-toggle" data-toggle="dropdown">
									<?php if(!$megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
									if($menu['menuimage']){
									echo '<img src="'.$menu['menuimage'].'" alt="" width="15" height="15" /> ';
									}else{
									echo '<i class="fa '.$menu['menu_icon'].'"></i> ';
									}
									} ?>
									<?php echo $menu['name']; if(!$megamenu_setting_menuiconposition){ echo ' <i class="fa fa-angle-down"></i>'; };
									if($megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
										if($menu['menuimage']){
												echo ' <img src="'.$menu['menuimage'].'" alt="" width="15" height="15" />';
												}else{
													echo ' <i class="fa '.$menu['menu_icon'].'"></i>';
												}
										} ?>
								</a>
								<ul class="dropdown-menu paddinglf" role="menu" <?php if($menu['bgimage']){ ?> style="background-image:url('<?php echo $menu['bgimage']; ?>');" <?php } ?>>
									<?php foreach (array_chunk($menu['children'], ceil(count($menu['children']) / $menu['column'])) as $children) { ?>
									<?php foreach ($children as $child){ ?>
											<li class="<?php echo (!empty($child['children3_data']) ? 'dropdown-submenu' : ''); ?>"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
												<ul class="dropdown-menu paddinglf" <?php if($menu['bgimage']){ ?> style="background-image:url('<?php echo $menu['bgimage']; ?>');" <?php } ?>>
													<?php foreach ($child['children3_data'] as $child3){ ?>
													<li class="<?php echo (!empty($child3['children4_data']) ? 'dropdown-submenu' : ''); ?>"><a href="<?php echo $child3['href']; ?>"><?php echo $child3['name']; ?></a>
														<ul class="dropdown-menu paddinglf" <?php if($menu['bgimage']){ ?> style="background-image:url('<?php echo $menu['bgimage']; ?>');" <?php } ?>>
														<?php foreach ($child3['children4_data'] as $child4){ ?>
															<li class="<?php echo (!empty($child4['children5_data']) ? 'dropdown-submenu' : ''); ?>"  ><a href="<?php echo $child4['href']; ?>"><?php echo $child4['name']; ?></a>
																<ul class="dropdown-menu paddinglf" <?php if($menu['bgimage']){ ?> style="background-image:url('<?php echo $menu['bgimage']; ?>');" <?php } ?>>
																	<?php foreach ($child4['children5_data'] as $child5){ ?>
																		<li><a href="<?php echo $child5['href']; ?>"><?php echo $child5['name']; ?></a></li>
																	<?php } ?>
																</ul>
															</li>
														<?php } ?>
														</ul>
													</li>
													<?php } ?>
												</ul>
											</li>
											<?php } } ?>
										<li><a href="<?php echo $menu['href']; ?>"><?php echo $text_all; ?> <?php echo $menu['name']; ?></a></li>
								</ul>
							</li>
					<?php } ?>
					<?php if($menu['multilevel'] == 3){ ?>	
						<li class="dropdown mega-menu"><a href="<?php echo $menu['href']; ?>" class="dropdown-toggle" data-toggle="dropdown">
										<?php if(!$megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
											if($menu['menuimage']){
												echo '<img src="'.$menu['menuimage'].'" alt="" width="15" height="15" /> ';
											}else{
												echo '<i class="fa '.$menu['menu_icon'].'"></i> ';
											}
										} ?>
										<?php echo $menu['name']; if(!$megamenu_setting_menuiconposition){ echo ' <i class="fa fa-angle-down"></i>'; };
										if($megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
											if($menu['menuimage']){
												echo ' <img src="'.$menu['menuimage'].'" alt="" width="15" height="15" />';
											}else{
												echo ' <i class="fa '.$menu['menu_icon'].'"></i>';
											}
										} ?>
									</a>
							<ul class="dropdown-menu fullwidth" <?php if($menu['bgimage']){ ?> style="background-image:url('<?php echo $menu['bgimage']; ?>');" <?php } ?>>
								<li class="<?php if(!$megamenu_setting_dropdown_content){echo 'mega-content';} ?>">
									<?php foreach (array_chunk($menu['children'], ceil(count($menu['children']) / $menu['column'])) as $children) { ?>
										<div class="col-sm-12">
											<?php $count = 0; foreach ($children as $child) {
											//if ($count%4 == 0){echo "<li class='clearfix'></li>";} ?>
											<div class="col-sm-3">
												<ul class="">
													<li class="li_header"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
													<?php foreach($child['children3_data'] as $level3){ ?>
													<li>
														<div class="row content">
														<?php if($menu['category_images']){ ?>
															<div class="col-md-4 col-sm-12 col-xs-12">
															<a href="<?php echo $level3['href']; ?>"><img src="<?php echo $level3['image']; ?>" alt="<?php echo $level3['name']; ?>" title="<?php echo $level3['name']; ?>" class="img-responsive" /></a>
															</div>
														<?php } ?>
															<div class="<?php echo ($menu['category_images'] ? 'col-md-8 col-sm-12 col-xs-12' :'col-sm-12' ) ?>">
																<a href="<?php echo $level3['href']; ?>"><?php echo $level3['name']; ?></a>
															</div>
														</div>
														<p></p>
													</li>
													<?php } ?>
												</ul>
											</div>								
											<?php $count++; } ?> </div> 
											<?php } ?>
											<div class="row view_more">
												<div class="col-sm-12">
													<a href="<?php echo $menu['href']; ?>"><?php echo $text_all; ?> <?php echo $menu['name']; ?></a>
												</div>
											</div>
								</li>
							</ul>
						</li>
					<?php } ?>
					<?php if($menu['multilevel'] == 4){ ?>
						<li class="dropdown mega-menu"><a href="<?php echo $menu['href']; ?>" class="dropdown-toggle" data-toggle="dropdown">
										<?php if(!$megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
											if($menu['menuimage']){
												echo '<img src="'.$menu['menuimage'].'" alt="" width="15" height="15" /> ';
											}else{
												echo '<i class="fa '.$menu['menu_icon'].'"></i> ';
											}
										} ?>
										<?php echo $menu['name']; if(!$megamenu_setting_menuiconposition){ echo ' <i class="fa fa-angle-down"></i>'; };
										if($megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
											if($menu['menuimage']){
												echo ' <img src="'.$menu['menuimage'].'" alt="" width="15" height="15" />';
											}else{
												echo ' <i class="fa '.$menu['menu_icon'].'"></i>';
											}
										} ?>
									</a>
							<ul class="dropdown-menu half" <?php if($menu['bgimage']){ ?> style="background-image:url('<?php echo $menu['bgimage']; ?>');" <?php } ?>>
								<li class="<?php if(!$megamenu_setting_dropdown_content){echo 'mega-content';} ?>">
									<?php foreach (array_chunk($menu['children'], ceil(count($menu['children']) / $menu['column'])) as $children) { ?>
										<div class="col-sm-12">
											<?php $count = 0; foreach ($children as $child) {
											//if ($count%4 == 0){echo "<li class='clearfix'></li>";} ?>
											<div class="col-sm-6">
												<ul class="">
													<li class="li_header"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
													<?php foreach($child['children3_data'] as $level3){ ?>
													<li>
														<div class="row">
														<?php if($menu['category_images']){ ?>
															<div class="col-md-4 col-sm-6 col-xs-6">
															<a href="<?php echo $level3['href']; ?>"><img src="<?php echo $level3['image']; ?>" alt="<?php echo $level3['name']; ?>" title="<?php echo $level3['name']; ?>" class="img-responsive" /></a>
															</div>
														<?php } ?>
															<div class="<?php echo ($menu['category_images'] ? 'col-md-8 margintb col-sm-6 col-xs-6' :'col-sm-12' ) ?>">
																<a href="<?php echo $level3['href']; ?>"><?php echo $level3['name']; ?></a>
															</div>
														</div>
														<p></p>
													</li>
													<?php } ?>
												</ul>
											</div>								
											<?php $count++; } ?> </div> 
											<?php } ?>
											<div class="row view_more">
												<div class="col-sm-12">
													<a href="<?php echo $menu['href']; ?>"><?php echo $text_all; ?> <?php echo $menu['name']; ?></a>
												</div>
											</div>
								</li>
							</ul>
						</li>
						<?php } ?>
					<?php } ?>
					<!-- Category END -->
					
						<!-- Products START -->
					<?php if($menu['type']=='products'){ ?>	
						<li class="dropdown mega-menu">
								<a href="<?php echo $menu['href']; ?>" class="dropdown-toggle" data-toggle="dropdown">
									<?php if(!$megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
										if($menu['menuimage']){
											echo '<img src="'.$menu['menuimage'].'" alt="" width="15" height="15" /> ';
										}else{
											echo '<i class="fa '.$menu['menu_icon'].'"></i> ';
										}
									} ?>
									<?php echo $menu['name']; if(!$megamenu_setting_menuiconposition){ echo ' <i class="fa fa-angle-down"></i>'; };
									if($megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
										if($menu['menuimage']){
											echo ' <img src="'.$menu['menuimage'].'" alt="" width="15" height="15" />';
										}else{
											echo ' <i class="fa '.$menu['menu_icon'].'"></i>';
										}
									} ?>
								</a>
								<ul class="dropdown-menu fullwidth" <?php if($menu['bgimage']){ ?> style="background-image:url('<?php echo $menu['bgimage']; ?>');" <?php } ?>>
									<li class="<?php if(!$megamenu_setting_dropdown_content){echo 'mega-content';} ?>">
										<?php foreach (array_chunk($menu['children'], ceil(count($menu['children']) / $menu['column'])) as $children){ ?>
										<?php foreach ($children as $product){ ?>
											<div class="col-sm-4">
												
													<div class="image">
															<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
														</div>
														<div class="product-content">
															
															<?php if($megamenu_setting_product_name){ ?>
															<strong><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></strong>
															<?php } ?><br>
															<?php if($megamenu_setting_product_description){ ?>
															<small>
															<?php echo $product['description']; ?></small>
															<?php } ?><br/>
															<?php if($megamenu_setting_product_price){ ?>
															<strong>Price <?php echo $product['price']; ?></strong>
															<?php } ?>
														</div>
													<div class="clearfix"></div>
													<hr>
											</div>
										<?php } ?>
										<?php } ?>
									</li>
								</ul>
							</li>	
							<?php } ?>
							
							<!-- Editor START -->
							<?php if($menu['type']=='editor'){ ?>
							<li class="dropdown mega-menu">			
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<?php if(!$megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
										if($menu['menuimage']){
											echo '<img src="'.$menu['menuimage'].'" alt="" width="15" height="15" /> ';
										}else{
											echo '<i class="fa '.$menu['menu_icon'].'"></i> ';
										}
									} ?>
									<?php echo $menu['name']; if(!$megamenu_setting_menuiconposition){ echo ' <i class="fa fa-angle-down"></i>'; };
									if($megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
										if($menu['menuimage']){
											echo ' <img src="'.$menu['menuimage'].'" alt="" width="15" height="15" />';
										}else{
											echo ' <i class="fa '.$menu['menu_icon'].'"></i>';
										}
									} ?>
								</a>
								<ul class="dropdown-menu row" <?php if($menu['bgimage']){ ?> style="background-image:url('<?php echo $menu['bgimage']; ?>');" <?php } ?>>
									<div class="<?php if(!$megamenu_setting_dropdown_content){echo 'mega-content';} ?>">
										<?php foreach($menu['children'] as $children){ 
											echo $children['description'];
										} ?>
									</div>
								</ul>
							</li>
							<?php } ?>
							<!-- Editor END -->
							<?php } else { ?>
							<!-- CUSTOM LINK START -->
							<li>
								<a href="<?php echo $menu['href']; ?>">
									<?php if(!$megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
										if($menu['menuimage']){
											echo '<img src="'.$menu['menuimage'].'" alt="" width="15" height="15" /> ';
										}else{
											echo '<i class="fa '.$menu['menu_icon'].'"></i> ';
										}
									} ?>
									<?php echo $menu['name'];
									if($megamenu_setting_menuiconposition & $megamenu_setting_menuicons){
										if($menu['menuimage']){
											echo ' <img src="'.$menu['menuimage'].'" alt="" width="15" height="15" />';
										}else{
											echo ' <i class="fa '.$menu['menu_icon'].'"></i>';
										}
									} ?>
								</a>
							</li>
							<!-- CUSTOM LINK END -->
					<?php } ?>
					<?php } ?>
				</ul>
			</div>
		</div>
	</nav>
</div>
<script src="catalog/view/javascript/jquery/bootstrap-hover-dropdown.js"></script>
<script>
	// Menu drop down effect
	$('.dropdown-toggle').dropdownHover().dropdown();
	$(document).on('click', '.mega .dropdown-menu', function(e) {
	  e.stopPropagation()
	});
</script>
<?php } ?>