<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="catalog/view/theme/materlux/img/favicon.ico" type="image/x-icon">
	<title><?php echo $title; ?></title>
	<base href="<?php echo $base; ?>" />
	<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
		<meta name="keywords" content= "<?php echo $keywords; ?>" />
	<?php } ?>

	<link href="catalog/view/theme/materlux/css/plagins.css" rel="stylesheet">
	<link href="catalog/view/theme/materlux/css/icons.css" rel="stylesheet">
	<link href="catalog/view/theme/materlux/css/stylen.css" rel="stylesheet">
	<link href="catalog/view/theme/materlux/css/style750.css" rel="stylesheet">
	<link href="catalog/view/theme/materlux/css/style320.css" rel="stylesheet">
	<link href="catalog/view/theme/materlux/css/common.css" rel="stylesheet">
	
	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>

	<script src="catalog/view/javascript/brainyfilter.js" type="text/javascript"></script>

	<script src="catalog/view/javascript/progroman/jquery.progroman.autocomplete.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/progroman/jquery.progroman.city-manager.js" type="text/javascript"></script>
	<link href="catalog/view/theme/materlux/stylesheet/isearch.css" rel="stylesheet" media="screen">
<script src="catalog/view/javascript/isearch.js"></script>


</head>
<body>




<div id="main">
	<header id="header" <?php if($ishome) { ?> class="header_index" <?php } ?>>
		<div class="header_box">
			<div class="header_top">
				<div class="logo">
					<a href="/">
						<?php if($ishome) { ?> 
							<img src="catalog/view/theme/materlux/img/logo_white.svg" alt="<?php echo $title; ?>">
						<?php } else { ?>
							<img src="catalog/view/theme/materlux/img/logo.svg" alt="<?php echo $title; ?>">
						<?php } ?>
					</a>
				</div>
				<div class="head_phone">
					<span><i class="icon-phone"></i> <?php echo $telephone; ?></span>
					<a href="tel:<?php echo str_replace([' ', '(', ')', '-'],"", $telephone); ?>"><i class="icon-phone"></i></a>
				</div>
				<div class="head_link"><a href="#" class="open_popup" data-id-popup="p_call">Перезвоните мне</a></div>
				<a href="#" class="open_search"><i class="icon-search"></i></a>
				<?php echo $search; ?>
				<?php echo $cart; ?>
				<div class="link_personal">
					<?php if ($logged) { ?>
						<a href="<?php echo $order; ?>"><span>Личный кабинет</span> <i class="icon-user"></i></a>
					<?php } else { ?>
						<a href="<?php echo $login; ?>"><span>Войти</span> <i class="icon-user"></i></a>
					<?php } ?>
				</div>
				<a href="#" class="open_menu"></a>
			</div> 
			
			<div class="header_bottom">
				<a href="#" class="close_menu"></a>
				<div class="menu_box">
					<ul class="menu">
						<li class="HasDrop">
							<a href="/matrasy/"><i class="icon-matrasse"></i> Матрасы</a>

							<div class="menu_drop">
								<div class="menu_drop_box">
									<div class="menu_drop_row">
									    <div class="menu_drop_col">
											<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_jestok'])) { ?>
										    	<?php echo implode('', $vie_module_groups['vie_jestok']); ?>
										    <?php } ?>
										</div>
										<div class="menu_drop_col">
											<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_menutype'])) { ?>
										    	<?php echo implode('', $vie_module_groups['vie_menutype']); ?>
										    <?php } ?>
										</div>
																			
										<div class="menu_drop_col">
											<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_svois'])) { ?>
										    	<?php echo implode('', $vie_module_groups['vie_svois']); ?>
										    <?php } ?>
										</div>
										<div class="menu_drop_col">
											<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_vus'])) { ?>
										    	<?php echo implode('', $vie_module_groups['vie_vus']); ?>
										    <?php } ?>
										</div>	
										<div class="menu_drop_col">
											<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_maters'])) { ?>
										    	<?php echo implode('', $vie_module_groups['vie_maters']); ?>
										    <?php } ?>
										</div>
									</div>
									

								    <?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_kalek'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_kalek']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>

						<li class="HasDrop hidden_destop">
							<a href="javascript:void(0);">
								<i class="icon-podushki"></i>
								Аксессуары
							</a>
							<div class="menu_drop">
								<div class="menu_drop_box">
									<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_akses'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_akses']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>
						<li class="hidden_destop">
							<a href="#" class="open_popup" data-id-popup="p_calc">
								<i class="icon-mattress"></i>
								Изготовление  нестандартных размеров и форм
							</a>
						</li>
						<li class="HasDrop hidden_mobile">
							<a href="/podushki-odeyala-and-somery-reshetki">
								<i class="icon-podushki"></i> Подушки и одеяла<br>сомьеры и решетки
							</a>
							<div class="menu_drop">
								<div class="menu_drop_box">
									<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_podush'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_podush']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>
						<li class="HasDrop hidden_mobile">
							<a href="/index.php?route=product/category&path=25">
								<i class="icon-namatras"></i> Наматрасники (топеры)
							</a>
							<div class="menu_drop">
								<div class="menu_drop_box">
									<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_namatr'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_namatr']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>
						<li class="HasDrop hidden_destop">
							<a href="javascript:void(0);">
								<i class="icon-namatras"></i>
								Наматрасники (топеры)
							</a>
							<div class="menu_drop">
								<div class="menu_drop_box">
									<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_namatr'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_namatr']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>
						
						<li class="menu_one hidden_mobile HasDrop">
							<a href="/specials/"><i class="icon-procent"></i> Акции</a>
							<div class="menu_drop">
								<div class="menu_drop_box">
									<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_akcii'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_akcii']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>

						<li class="menu_two hidden_mobile HasDrop">
							<a href="/nashi-preimushestva">Наши преимущества</a>
							<div class="menu_drop">
								<div class="menu_drop_box">
									<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_preim'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_preim']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>

						<li class="menu_three hidden_mobile HasDrop">
							<a href="/o-fabrike">О фабрике <i class="icon-arrow"></i></a>

							<div class="menu_drop">
								<div class="menu_drop_box">
									<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_headabout'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_headabout']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>

						<li class="hidden_destop HasDrop">
							<a href="javascript:void(0);">
								<i class="icon-discount"></i>
								Акции
							</a>
							<div class="menu_drop">
								<div class="menu_drop_box">
									<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_akcii'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_akcii']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>

						<li class="hidden_destop HasDrop">
							<a href="javascript:void(0);">
								<i class="icon-like"></i>
								Наши преимущества
							</a>
							<div class="menu_drop">
								<div class="menu_drop_box">
									<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_advan'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_advan']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>

						<li class="hidden_destop HasDrop">
							<a href="javascript:void(0);">
								<i class="icon-box"></i>
								Доставка
							</a>
							<div class="menu_drop">
								<div class="menu_drop_box">
									<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_deliver'])) { ?>
								    	<?php echo implode('', $vie_module_groups['vie_deliver']); ?>
								    <?php } ?>
								</div>
							</div>
						</li>
					</ul>
					<?php
						if($megamenu_setting_status){
							echo $megamenu; 
							$categories=array();
						}
					?>
				</div>
			</div>
		</div>
	</header>