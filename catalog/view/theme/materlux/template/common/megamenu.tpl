<ul class="head_nav menu">
<li class="hidden_mobile">
							<a href="/index.php?route=information/information&amp;information_id=19">Контакты</a>
						</li>
						<li class="hidden_mobile">
							<a href="/index.php?route=information/information&amp;information_id=6">Доставка по Москве и России</a>
						</li>
						<li class="hidden_mobile">
							<a href="/index.php?route=information/information&amp;information_id=8">Оплатить онлайн</a>
						</li>
						<li class="menu_three hidden_mobile HasDrop">
							<a href="/index.php?route=information/information&amp;information_id=9">Для партнеров <i class="icon-arrow"></i></a>
							 <div class="menu_drop">
							     <div class="menu_drop_box">
								 <?php if ($logged) { ?> 
    <?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['via_partners'])) { ?>
								    	<?php echo implode('', $vie_module_groups['via_partners']); ?>
								    <?php } ?> 
	<?php } else { ?> 
	<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['via_partnersno'])) { ?>
								    	<?php echo implode('', $vie_module_groups['via_partnersno']); ?>
								    <?php } ?>
  <?php } ?>
  
									
								</div> 
							</div>
						</li>
						
</ul>


