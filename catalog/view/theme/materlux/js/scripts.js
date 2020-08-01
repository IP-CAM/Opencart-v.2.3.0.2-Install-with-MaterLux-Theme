$(document).ready(function(){ 
	

	$('.table_responsive').wrap("<div class='responsive'></div>");

	$('.open_menu').on( 'click', function() {
		$('.header_bottom').addClass('active');
		$('.button_fixed').addClass('hidden');
		return false;
	});

	$('.close_menu').on( 'click', function() {
		$('.header_bottom').removeClass('active');
		$('.button_fixed').removeClass('hidden');
		return false;
	});

	$('.menu li.HasDrop').on( 'click', function() {
		$(this).addClass('mHover');
	});

	$('.menu_drop_box .name_drop').on( 'click', function() {
		$(this).next('.menu_drop_sub').toggleClass('active');
		return false;
	});


	$('.open_search').on( 'click', function() {
		$('.head_search').addClass('active');
		$('body').on( 'click', function() {
			$(".head_search").removeClass('active')
		});
		$('.head_search').on( 'click', function(e){e.stopPropagation();});
		return false;
	});


	$('.close_search').on( 'click', function() {
		$('.head_search').removeClass('active');
		return false;
	});
	






	$('.Slider').slick({
		fade : true,
		swipe : false,
		dots: true,
		draggable: false,
		appendArrows : $('.SliderNav'),
		appendDots: $('.SliderNav'),
		customPaging: function (slider, i) {
			return '<span>' + (i + 1) + '</span>' + '/' +  + slider.slideCount  ;
		},
		responsive: [
			{
			  breakpoint: 1024,
			  settings: {
			    swipe : true,
			    fade : false,
			  }
			}
		]
	});


	$('.SliderIndex').slick({
		arrows : true,
		dots: true,
		autoplay: true,
		autoplaySpeed: 2000,
		draggable: false

	});



	$('.SliderCard').slick({
		arrows : true,
		dots: true,
		autoplay: true,
		autoplaySpeed: 2000,
		draggable: false,
		responsive: [
			{
			  breakpoint: 1024,
			  settings: {
			  	arrows : true,
			  }
			}
		]
	});












	$('.carusel').slick({
		slidesToShow: 6,
		slidesToScroll: 1,
		adaptiveHeight: true,
		draggable: false,
		responsive: [
			{
			  breakpoint: 1700,
			  settings: {
			    slidesToShow: 5,
			    slidesToScroll: 1,
			  }
			},
			{
			  breakpoint: 1500,
			  settings: {
			    slidesToShow: 4,
			    slidesToScroll: 1,
			  }
			},
			{
			  breakpoint: 1025,
			  settings: {
			    slidesToShow: 3,
			    slidesToScroll: 3,
			    arrows :true,
			    dots : true
			  }
			},
			{
			  breakpoint: 768,
			  settings: {
			    slidesToShow: 2,
			    slidesToScroll: 2,
			    arrows :true,
			    dots : true
			  }
			},
			{
			  breakpoint: 479,
			  settings: {
			    slidesToShow: 1,
			    slidesToScroll: 1,
			    arrows :true,
			    dots : true
			  }
			}
		]
	});


	$(".change_size").each(function(i, elem) {
		var Element = $(elem),
			FirstEl = Element.find('li').eq(0).html();
		Element.find('.sell_text').html(FirstEl);
		Element.find('li').eq(0).addClass('active');
		
	});


	$(".change_size").find('.sell').on( 'click', function() {
		var Element = $(this).closest('.change_size');
		if (Element.hasClass('open')){
			$(".change_size").removeClass('open');
		}
		else {
			$(".change_size").removeClass('open');
			Element.addClass('open');
		}
		Element.find('li').on( 'click', function() {
			var Text = $(this).html();
			Element.find('li').removeClass('active');
			$(this).addClass('active');
			Element.find('.sell_text').html(Text);
			Element.removeClass('open');
			return false;
		});
		$('body').on( 'click', function() {
			$(".change_size").removeClass('open')
		});
		$('.change_size_drop').on( 'click', function(e){e.stopPropagation();});
		return false;
	});
	

	


	$('.carusel').on('breakpoint', function(event, slick, breakpoint) {
		$(".change_size").find('.sell').on( 'click', function() {
			var Element = $(this).closest('.change_size');
			if (Element.hasClass('open')){
				$(".change_size").removeClass('open');
			}
			else {
				$(".change_size").removeClass('open');
				Element.addClass('open');
			}
			Element.find('li').on( 'click', function() {
				var Text = $(this).html();
				Element.find('li').removeClass('active');
				$(this).addClass('active');
				Element.find('.sell_text').html(Text);
				Element.removeClass('open');
				return false;
			});
			$('body').on( 'click', function() {
				$(".change_size").removeClass('open')
			});
			$('.change_size_drop').on( 'click', function(e){e.stopPropagation();});
			return false;
		});
	});

	


	$('.SliderAbout').slick({
		appendArrows : $('.SliderAboutNav'),
		draggable: false
	});


	//стилизация селекта
	setTimeout(function() {
		$('select').styler();
	}, 100);



	//табы
	$('.TabNav li a').eq(0).addClass('active');
	$('.TabBox .TabCont').eq(0).addClass ('active');
	$(".TabNav li a").on( 'click', function() {
		Index= 0;
		$(".TabBox .TabCont").removeClass ("active");
		$(".TabNav li a").removeClass ("active");
		Index = $(".TabNav li a").index($(this))
		$(this).addClass ("active");
		$(".TabBox .TabCont:eq("+Index+")").addClass ("active");
		return false;
	});


	//табы
	$('.CardTabNav li a').eq(0).addClass('active');
	$('.CardTab .CardTabBox').eq(0).addClass ('active');
	$(".CardTabNav li a").on( 'click', function() {
		Index= 0;
		$(".CardTab .CardTabBox").removeClass ("active");
		$(".CardTabNav li a").removeClass ("active");
		Index = $(".CardTabNav li a").index($(this))
		$(this).addClass ("active");
		$(".CardTab .CardTabBox:eq("+Index+")").addClass ("active");
		return false;
	});




	(function(){
		if ($('#SliderPrice').length) {
			var tooltipSlider = document.getElementById('SliderPrice');
			noUiSlider.create(tooltipSlider, {
				start: [160, 182325],
				connect: true,
				step: 1,
				range: {
					'min': 1,
					'max': 182325,
					
				},
				format: wNumb({
					decimals: 0,
					thousand: ' '
				})
			});
			var valueFirst = document.getElementById('valueFirst'),
				valueLast = document.getElementById('valueLast');
			// When the slider value changes, update the input and span
			tooltipSlider.noUiSlider.on('update', function( values, handle ) {
				var value = values[handle];
				if ( handle ) {
					valueLast.value = value;
				} else {
					valueFirst.value = value;
				}
			});
			valueFirst.addEventListener('change', function(){
				tooltipSlider.noUiSlider.set([this.value, null]);
			});
			
			valueLast.addEventListener('change', function(){
				tooltipSlider.noUiSlider.set([null, this.value]);
			});
		}
	})();




	$('.link_filter').on( 'click', function() {
		var PosTop = $('.catalog').offset().top - 20;

		$('.filter').toggleClass('active');
		$('body,html').animate({
			scrollTop: PosTop
		}, 400);
		return false;
	});




	// картики в фон
	$(".imgBox img").each(function(i, elem) {
		var img = $(elem);
		var div = $(this).closest('.imgBox').css({
		background: "url(" + img.attr("src") + ") no-repeat 50% 0"
		}).addClass('active');
	});



	//маска для телефона
	$(".in_phone").mask("+7 (999) 999-99-99");

	
	



	$(".minus").click(function(){
		var $input = $(this).parent().find("input"),
			InpMin = $input.val();
		if(InpMin > 1) {
			$input .val(parseInt(InpMin) - 1);
			$input .change();
		}
	});
	
	$(".plus").click(function(){
		var $input = $(this).parent().find("input"),
			InpMax = $input.val();
		$input.val(parseInt(InpMax) + 1);
		$input .change();
	});


	/*только цифры и точка*/
	$('.much input').bind("change keyup input click",function(){
		if(this.value.match(/[^0-9]/g)){
			this.value=this.value.replace(/[^0-9]/g,'');
		}
	});



	 $('.SliderInner').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		draggable: false,
		asNavFor: '.SliderInnerNav'
	});
	$('.SliderInnerNav').slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		asNavFor: '.SliderInner',
		draggable: false,
		focusOnSelect: true,
		responsive: [
			{
			  breakpoint: 1024,
			  settings: {
			  	arrows : false,
			  	swipe : false
			  }
			},
			{
			  breakpoint: 480,
			  settings: {
			  	arrows : false,
			  	slidesToShow: 3,
			  	swipe : false
			  }
			}
		]
	});





	// попап
	$('.open_popup').on( 'click', function() {
		var src = $(this).attr('data-id-popup'),
			ScrollWidht = getScrollbarWidth();
		if (document.getElementById(src)) {
			$('#' + src).addClass('active');
			$('body').addClass('hidden').css({
				marginRight: ScrollWidht
			});
		}
		return false;
	});

	/*width scroll*/
	function getScrollbarWidth() {
		var outer = document.createElement("div");
		outer.style.visibility = "hidden";
		outer.style.width = "100px";
		document.body.appendChild(outer);
		var widthNoScroll = outer.offsetWidth;
		// force scrollbars
		outer.style.overflow = "scroll";
		// add innerdiv
		var inner = document.createElement("div");
		inner.style.width = "100%";
		outer.appendChild(inner);        
		var widthWithScroll = inner.offsetWidth;
		// remove divs
		outer.parentNode.removeChild(outer);
		return widthNoScroll - widthWithScroll;
	}

	$('.close_popup, .popup').on( 'click', function() {
		$('.popup').removeClass('active');
		setTimeout(function() {
			$('body').removeClass('hidden').removeAttr("style");
		}, 400);
		return false;
	});
	$('.popup_box').on( 'click', function(e){e.stopPropagation();});
	// конец попап

	
});