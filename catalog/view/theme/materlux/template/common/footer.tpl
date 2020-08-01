	<footer id="footer">
		<div class="footer_top">
			<div class="foot_row">
				<div class="foot_col">
					<div class="foot_data">
						<span class="name">Реквизиты фабрики</span>
						<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_fcb'])) { ?>
				        	<?php echo implode('', $vie_module_groups['vie_fcb']); ?>
				        <?php } ?>
					</div>
				</div>
				<div class="foot_col">
					<div class="foot_data">
						<span class="name">Бесплатно по РФ</span>
						<span class="foot_phone">
							<span><?php echo $telephone; ?></span>
							<a href="tel:<?php echo str_replace([' ', '(', ')', '-'],"", $telephone); ?>"></a>
						</span>
					</div>
				</div>
				<div class="foot_col_2">
					<div class="foot_data">
						<span class="name">Наш адрес</span>
						<p> <?php echo $address; ?></p>
					</div>
				</div>
				<div class="foot_col">
					<div class="foot_data">
						<span class="name">Электронная почта</span>
						<p><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></p>
					</div>
				</div>
				<div class="foot_col_3">
					<div class="foot_data">
						<span class="name">Мы в соцсетях</span>
						<ul class="socils">
							<?php if($vk) { ?>
								<li><a href="<?php echo $vk; ?>" target="_blank" class="icon-vk"></a></li>
							<?php } ?>

							<?php if($fb) { ?>
								<li><a href="<?php echo $fb; ?>" target="_blank" class="icon-fb"></a></li>
							<?php } ?>
							
							<?php if($insta) { ?>
								<li><a href="<?php echo $insta; ?>" target="_blank" class="icon-inst"></a></li>
							<?php } ?>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="footer_middle">
			<div class="footer_middle_box">
				<div class="foot_row">
					<div class="foot_col">
						<ul class="foot_menu">
							<?php foreach ($categories as $category) { ?>
								<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
							<?php } ?>
							<li><a href="<?php echo $special; ?>">Акции</a></li>
						</ul>
					</div>
					<div class="foot_col footnav">
						<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_ft'])) { ?>
				        	<?php echo implode('', $vie_module_groups['vie_ft']); ?>
				        <?php } ?>
					</div>
					<div class="foot_col_2 footnav">
						<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_fct'])) { ?>
				        	<?php echo implode('', $vie_module_groups['vie_fct']); ?>
				        <?php } ?>
					</div>
					<?php echo $newsletters; ?>
				</div>
				<span class="copy">ООО “Искусство сна”. Все права защищены.</span>
				<span class="foot_link"><a href="/index.php?route=information/information&information_id=3">Политика конфиденциальности</a></span>
			</div>
		</div>
		<div class="foot_info">
			<div class="foot_info_box">
				<p>Этот сайт использует куки-файлы и другие технологии, чтобы помочь вам в навигации, а также предоставить лучший пользовательский опыт, анализировать использование наших продуктов и услуг, повысить качество рекламных и маркетинговых активностей.</p>
				<a href="javascript:void(0);" class="btn_data">Принять</a>
			</div>
		</div>
	</footer>
</div>

 

<div class="button_fixed"> 
	<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_ffixmenu'])) { ?>
    	<?php echo implode('', $vie_module_groups['vie_ffixmenu']); ?>
    <?php } ?>
</div>


<div class="popup" id="p_call">
	<div class="popup_box form_footer">
		<a href="#" class="close_popup"></a>
		<div class="popup_title">Заказать звонок</div>
		
		<form id="formcallme" name="formcallme" method="post">
			<input type="hidden" name="subject" value="Обратная связь">
			<input type="hidden" name="title" value="Обратная связь">
			<div class="form_popup">
				<div class="in_box">
					<input type="text" class="tx" required name="name" placeholder="Ваше имя">
				</div>
				<div class="in_box">
					<input type="text" class="tx in_phone" required name="phone" placeholder="+7 ____ - ___ - ___">
				</div>
				<div class="btn_center">
					<button class="btn" type="submit">Перезвоните мне</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="popup" id="p_calc">
	<div class="popup_box form_footer">
		<a href="#" class="close_popup"></a>
		<div class="popup_title">Расчет нестандартного размера</div>
		<form id="firmcalc" name="firmcalc" method="post">
			<input type="hidden" name="subject" value="Расчет нестандартного размера">
			<input type="hidden" name="title" value="Расчет нестандартного размера">
			<div class="form_popup">
				<div class="in_box">
					<input type="text" class="tx" required name="width" placeholder="Ширина (см)">
				</div>
				<div class="in_box">
					<input type="text" class="tx" required name="height" placeholder="Длина (см)">
				</div>
				<div class="in_box">
					<input type="text" class="tx in_phone" required name="phone" placeholder="+7 ____ - ___ - ___">
				</div>
				<div class="in_box">
					<textarea class="tx" placeholder="Комментарий" required name="message"></textarea>
				</div>
				<div class="btn_center">
					<button class="btn" type="submit">Рассчитать стоимость</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="popup" id="p_cart">
	<div class="popup_box">
		<a href="#" class="close_popup"></a>
		<div class="popup_title">Товар успешно добавлен в корзину</div>
		<div class="form_popup">
			<div class="btn_center">
				<button class="btn" type="button" onclick="location.href='<?php echo $checkout; ?>'">Оформить</button>
			</div>
		</div>
		
	</div>
</div>

<div class="popup" id="p_success">
	<div class="popup_box">
		<a href="#" class="close_popup"></a>
		<div class="popup_title">Спасибо за заявку</div>
		<p>Свяжемся с Вами в течении нескольких минут</p>

		<div class="form_popup">
			<div class="btn_center">
				<button class="btn" type="button" onclick="location.href='/'">На главную</button>
			</div>
		</div>
	</div>
</div>

<div class="popup" id="form_call">
	<div class="popup_box quests_popup">
		<a href="#" class="close_popup"></a>
		<?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups['vie_popupf'])) { ?>
			<?php echo implode('', $vie_module_groups['vie_popupf']); ?>
		<?php } ?>
	</div>
</div>
<?php if($country_id == '176') { ?>
	<div class="popup" id="p_city">
		<div class="popup_box">
			<a href="#" class="close_popup close_deliver"></a>			
			<div class="popup_title">Доставка до вашего города (<span class="prmn-cmngr" data-confirm="true"></span>) будет стоить <span class="prmn-cmngr-message" data-key="deliver"></span></div>
			<div class="form_popup"></div>
		</div>
	</div>
<?php } ?>

	<!--[if lt IE 9]>
	  <script src="catalog/view/theme/materlux/js/html5.js"></script>
	<![endif]-->
	
	<script src="catalog/view/theme/materlux/js/plagins.js"></script>
	<script src="catalog/view/theme/materlux/js_win/Winwheel.js"></script>
	<script src="catalog/view/theme/materlux/js_win/TweenMax.js"></script>
	<script src="catalog/view/theme/materlux/js/scripts.js"></script>
	<script src="catalog/view/theme/materlux/js/commony.js"></script>
	
	
	<script>
	// Call me
	$(".quests_popup form").submit(function () {
        var formID = $(this).attr('id');
        var formNm = $('#' + formID);
        $.ajax({
            type: "POST",
            url: 'catalog/view/theme/materlux/php/mail1.php',
            data: formNm.serialize(),
            success: function (data) {
                $('.popup').removeClass('active');
                $('#p_success').addClass('active');

                //document.forms['formMain'].reset();
				
				
            },
            error: function (jqXHR, text, error) {
                
                $(formNm).html(error);         
            }
        });
        return false;
    });
	
	
	jQuery(document).ready(function() {
	   jQuery(".forms_start").show();
	   var steps_adult = jQuery("#formquest").children(".forms_d");
	   var steps_child = jQuery("#formquest").children(".forms_item");
	   jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 13%,#ffffff 13%,#ffffff 100%)");
	   jQuery("input[name='form0_who']").click(function () {
	     if(jQuery('input[name=form0_who]:checked').val() == 0){
		     jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 26%,#ffffff 26%,#ffffff 100%)");
		     setTimeout(function() {
                jQuery(steps_adult[0]).show();
			    jQuery(".forms_start").hide();
			    jQuery("#title_info").text('Укажите вес человека?');
			    jQuery(".count_form").text('2)');
            }, 1000);
		 } 
		 else{
		    jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 32%,#ffffff 32%,#ffffff 100%)");
		    setTimeout(function() {
		     jQuery(steps_child[0]).show();
			 jQuery(".forms_start").hide();
			 jQuery("#title_info").text('Укажите возраст ребенка?');
			 jQuery(".count_form").text('2)');
			}, 1000); 
		 }
       });
	   /* для ребенка */
	   jQuery('input[name=form1_year]').change(function() {
	       jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 48%,#ffffff 48%,#ffffff 100%)");
	   setTimeout(function() {
	         jQuery(steps_child[0]).hide();
             jQuery(steps_child[1]).show();
			 jQuery("#title_info").text('Какая глубина боковины детской кровати?');
			 jQuery(".count_form").text('3)');
			 }, 1000); 
       });
	   jQuery('input[name=form2_height]').change(function() {
	        jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 64%,#ffffff 64%,#ffffff 100%)");
	   setTimeout(function() {
	         jQuery(steps_child[1]).hide();
             jQuery(steps_child[2]).show();
			 jQuery("#title_info").text('Есть ли аллергия у ребенка?');
			 jQuery(".count_form").text('4)');
			 }, 1000); 
       });
	   jQuery('input[name=form3_allerg]').change(function() {
	        jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 80%,#ffffff 80%,#ffffff 100%)");
	   setTimeout(function() {
	         jQuery(steps_child[2]).hide();
             jQuery(steps_child[3]).show();
			 jQuery("#title_info").text('Какой по жесткости матрас предпочитаете?');
			 jQuery(".count_form").text('5)');
			 }, 1000); 
       });  
       /* для взрослого */
       jQuery('input[name=form1_d_ves]').change(function() {
	       jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 39%,#ffffff 39%,#ffffff 100%)");
	   setTimeout(function() {
	         jQuery(steps_adult[0]).hide();
             jQuery(steps_adult[1]).show();
			 jQuery("#title_info").text('Вам подобрать матрас для пар?');
			 jQuery(".count_form").text('3)');
			 }, 1000); 
       });
       jQuery('input[name=form2_d_razves]').change(function() {
	        jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 52%,#ffffff 52%,#ffffff 100%)");
	   setTimeout(function() {
	         jQuery(steps_adult[1]).hide();
             jQuery(steps_adult[2]).show();
			 jQuery("#title_info").text('Какого ценового сегмента?');
			 jQuery(".count_form").text('4)');
			 }, 1000); 
       });
       jQuery('input[name=form3_d_price]').change(function() {
	       jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 65%,#ffffff 65%,#ffffff 100%)");
	   setTimeout(function() {
	         jQuery(steps_adult[2]).hide();
             jQuery(steps_adult[3]).show();
			 jQuery("#title_info").text('Какие пожелания по матрасу?');
			 jQuery(".count_form").text('5)');
			 }, 1000); 
       });
        jQuery('input[name=form4_d_why]').change(function() {
		    jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 78%,#ffffff 78%,#ffffff 100%)");
		setTimeout(function() {
	         jQuery(steps_adult[3]).hide();
             jQuery(steps_adult[4]).show();
			 jQuery("#title_info").text('Какие ощущения вам близки?');
			 jQuery(".count_form").text('6)');
			 }, 1000); 
       });
       jQuery('input[name=form5_d_eff]').change(function() {
	        jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 91%,#ffffff 91%,#ffffff 100%)");
	   setTimeout(function() {
	         jQuery(steps_adult[4]).hide();
             jQuery(steps_adult[5]).show();
			 jQuery("#title_info").text('Какую жесткость предпочитаете?');
			 jQuery(".count_form").text('7)');
			 }, 1000); 
       });

       /* результат */
        jQuery('input[name=form4_zhest]').change(function() {
		    jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 100%,#ffffff 100%,#ffffff 100%)");
		setTimeout(function() {
	         jQuery(steps_child[3]).hide();
             jQuery("#form_result").show();
			 jQuery("#title_info").text('Заполните данные и мы пришлем подборку матрасов на почту');
			 jQuery(".count_form").text('6)');
			 }, 1000);
       });  
        jQuery('input[name=form6_d_zhest]').change(function() {
		    jQuery("#progress").css("background", "linear-gradient(90deg, #3f3a65 0%, #3f3a65 100%,#ffffff 100%,#ffffff 100%)");
		setTimeout(function() {
	         jQuery(steps_adult[5]).hide();
             jQuery("#form_result").show();
			 jQuery("#title_info").text('Заполните данные и мы пришлем подборку матрасов на почту');
			 jQuery(".count_form").text('8)');
			 }, 1000);
       }); 	   
	   
	   
	   var current_step = 0; // задаем текущий шаг
	   jQuery("button.next").click(function(){	// Событие клика на ссылку "Следующий шаг"
			if (current_step == steps.length-2) { // проверяем, будет ли следующий шаг последним
				jQuery(this).hide(); // скрываем ссылку "Следующий шаг"
			}
			jQuery("button.back").show(); // показываем ссылку "Назад"
			current_step++; // увеличиваем счетчик текущего слайда
			changeStep(current_step); // меняем шаг
	    });
		jQuery("button.back").click(function(){	// Событие клика на маленькое изображение
		    if (current_step == 1) { // проверяем, будет ли предыдущий шаг первым
			   jQuery(this).hide(); // скрываем ссылку "Назад"
		    }
		    jQuery("button.next").show(); // показываем ссылку "Следующий шаг"
		    current_step--; // уменьшаем счетчик текущего слайда
		    changeStep(current_step);// меняем шаг
	    });
		function changeStep(i) { // функция смены шага
		   jQuery(steps).hide(); // скрываем все шаги
		   jQuery(steps[i]).show(); // показываем текущий
	    }

});
	</script>

</body>
</html>
