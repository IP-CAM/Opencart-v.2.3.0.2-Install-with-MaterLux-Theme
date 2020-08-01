<?php echo $header; ?>
	<!--CONTENT-->
	<div class="content">
		<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_homslide'])) { ?>
		    	<?php echo implode('', $vie_module_groups['vie_homslide']); ?>
		    <?php } ?>
		<?php echo $content_top; ?>

		<div class="advantages">
			<div class="content_box">
				<ul class="list_advantages">
					<li>
						<div class="advantages_one">
							<span class="icon"><i class="icon-track"></i></span>
							Доставка на следующий день
						</div>
					</li>
					<li>
						<div class="advantages_one">
							<span class="icon"><i class="icon-mattress"></i></span>
							Нестандартные размеры без доплат
						</div>
					</li>
					<li>
						<div class="advantages_one">
							<span class="icon"><i class="icon-circle-check"></i></span>
							Возможность проверки состава матраса
						</div>
					</li>
					<li>
						<div class="advantages_one">
							<span class="icon"><i class="icon-garanty"></i></span>
							100% гарантия производителя
						</div>
					</li>
					<li>
						<div class="advantages_one">
							<span class="icon"><i class="icon-return"></i></span>
							Недовольны покупкой? <br> Заменим матрас или вернем вам деньги
						</div>
					</li>
				</ul>
			</div>
		</div>

		<?php echo $column_left; ?>
		


		<section class="section_popular">
			<div class="content_box">
				<div class="title">
					<?php echo $column_right; ?>
				</div>
				<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_hmenu'])) { ?>
		        	<?php echo implode('', $vie_module_groups['vie_hmenu']); ?>
		        <?php } ?>
					
			</div>
			<div class="TabBox">
				<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_hfea'])) { ?>
		        	<?php echo implode('', $vie_module_groups['vie_hfea']); ?>
		        <?php } ?>
			</div>
		</section>



		<section class="fortune">
			<div class="fortune_box">
				<div class="hidden" id="fortune1"><?php echo $fartun1; ?></div>
				<div class="hidden" id="fortune2"><?php echo $fartun2; ?></div>
				<div class="hidden" id="fortune3"><?php echo $fartun3; ?></div>
				<div class="hidden" id="fortune4"><?php echo $fartun4; ?></div>
				<div class="hidden" id="fortune5"><?php echo $fartun5; ?></div>
				<div class="hidden" id="fortune6"><?php echo $fartun6; ?></div>
				<div class="hidden" id="fortune7"><?php echo $fartun7; ?></div>
				<div class="hidden" id="fortune8"><?php echo $fartun8; ?></div>
				<div class="fortune_rullet">
					<button>ЖМИ</button>
					<span class="icon"></span>
					<canvas id="FortuneTrack" width="500" height="500" data-responsiveMinWidth="180" data-responsiveScaleHeight="true" data-responsiveMargin="50">
				</div>
				<div class="fortune_cont">
					<h2>Испытайте свою удачу!</h2>
					<p>Вращайте бесплатно рулетку и получайте промокод на подарки, которые можно ввести в корзине при покупке!</p>
					<div class="fortune_code">
						<div id="code">ХХХХХХХХ</div>
						<span class="sub">Введите промокод в корзине и получайте свой приз вместе с заказом</span>
					</div>
				</div>
				
			</div>
		</section>



		<section class="section_why_we">
			<div class="content_box">
				<div class="title">
					<h2>Почему выбирают именно наши матрасы?</h2>
				</div>
				<ul class="list_why_we">
					<li>
						<div class="why_we">
							<span class="number">1</span>
							<span class="name">Итальянская технология</span>
							<p>Итальянские технологии и инновации в области сна </p>
						</div>
					</li>
					<li>
						<div class="why_we">
							<span class="number">2</span>
							<span class="name">Идеально подобранные комплектующие</span>
							<p>Используем только европейские комплектующие для достижения лучшего качества</p>
						</div>
					</li>
					<li>
						<div class="why_we">
							<span class="number">3</span>
							<span class="name">Нам можно доверять</span>
							<p>Мы не прячем, а наоборот показываем то, из чего сделан наш матрас и гордимся этим</p>
						</div>
					</li>
				</ul>
			</div>
		</section>

		
		<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_proweek'])) { ?>
        	<?php echo implode('', $vie_module_groups['vie_proweek']); ?>
        <?php } ?>
		
		
		<section class="about">
			<div class="about_cont">
				<div class="about_text home_about">
					<?php echo $content_bottom; ?>
				</div>
				<div class="about_right">
					<div class="slider_about">
						<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_hslides'])) { ?>
			        		<?php echo implode('', $vie_module_groups['vie_hslides']); ?>
			        	<?php } ?>
						
						<div class="SliderAboutNav">
							<span class="name">Знакомство с фабрикой матрасов Materlux</span>
						</div>
					</div>
					<div class="about_info">
						<span class="sub">Поможем вам выбрать тот матрас который удовлетворит все ваши пожелания</span>
						<a href="#" class="btn_about open_popup" data-id-popup="p_call">Перезвоните мне</a>
					</div>
				</div>
			</div>
		</section>


		<section class="section">
			<div class="content_box">
				<div class="main_text">
					<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_htext'])) { ?>
		        		<?php echo implode('', $vie_module_groups['vie_htext']); ?>
		        	<?php } ?>
				</div>
				<div class="main_event">
					<div class="main_event_box">
						<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_arthome'])) { ?>
			        		<?php echo implode('', $vie_module_groups['vie_arthome']); ?>
			        	<?php } ?>
					</div>
					<div class="main_event_box">
						<div class="add">
							<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_banhome'])) { ?>
				        		<?php echo implode('', $vie_module_groups['vie_banhome']); ?>
				        	<?php } ?>
						</div>
					</div>
					<div class="main_event_box">
						<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_presshome'])) { ?>
			        		<?php echo implode('', $vie_module_groups['vie_presshome']); ?>
			        	<?php } ?>
					</div>
				</div>
			</div>
		</section>
	</div>
<?php echo $footer; ?>