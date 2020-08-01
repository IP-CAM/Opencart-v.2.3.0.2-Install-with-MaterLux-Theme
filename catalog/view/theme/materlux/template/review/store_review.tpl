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
			<form class="form-horizontal" id="form-review">
                    <?php if ($review_status) { ?>
                        <div id="review"></div>
                        <?php if ($review_guest) { ?>
                            <h2><?php echo $text_write; ?></h2>
							<div class="form_login_box">
                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <input type="text" name="name" placeholder="<?php echo $entry_name; ?>"  value="<?php echo $customer_name; ?>" id="input-name"
                                           class="tx"/>
                                </div>
                            </div>

                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <textarea name="text" rows="5" id="input-review" placeholder="<?php echo $entry_review; ?>" class="tx"></textarea>
                                </div>
                            </div>
                            <?php if (isset($site_key) && $site_key) { ?>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                                    </div>
                                </div>
                            <?php } elseif (isset($captcha) && $captcha) { ?>
                                <?php echo $captcha; ?>
                            <?php } ?>
                            <div class="buttons clearfix">
                                <div class="pull-right">
                                    <button type="button" id="button-review"
                                            data-loading-text="<?php echo $text_loading; ?>"
                                            class="btn btn-primary"><?php echo $button_continue; ?></button>
                                </div>
                            </div>
							</div>
                        <?php } else { ?>
                            <?php echo $text_login; ?>
                        <?php } ?>
                    <?php } ?>
                </form>
		</div>
		<script type="text/javascript">
           jQuery(document).ready(function($){

               $('.rating-block .star-item').on({mousemove: function () {
                   var parent = $(this).closest('.rating-block');
                   var num = $(this).index()+1;
                   if(num>parent.data('clicked')) {
                       parent.removeClass('sel-0 sel-1 sel-2 sel-3 sel-4 sel-5');
                       parent.addClass('sel-' + num);
                   }


               }, mouseleave: function () {
                   var parent = $(this).closest('.rating-block');
                   var num = $(this).index()+1;
                   if(num>parent.data('clicked')) {

                       parent.removeClass('sel-0 sel-1 sel-2 sel-3 sel-4 sel-5');
                       parent.addClass('sel-' + parent.data('clicked'));

                   }

               }, click: function () {
                   var parent = $(this).closest('.rating-block');
                   var num = $(this).index()+1;
                   parent.removeClass('sel-0 sel-1 sel-2 sel-3 sel-4 sel-5 ');
                   parent.addClass('sel-'+num);
                   parent.data('clicked',num);
                   $('#rait-input').prop('value',num);

               }

               });
            });
            $('#review').delegate('.pagination a', 'click', function (e) {
                e.preventDefault();
                $('#review').load(this.href);
            });
            $('#review').load('index.php?route=review/store_review/review');


            $('#button-review').on('click', function () {
                $.ajax({
                    url: 'index.php?route=review/store_review/write',
                    type: 'post',
                    dataType: 'json',
                    data: $("#form-review").serialize(),
                    beforeSend: function () {
                        if ($("textarea").is("#g-recaptcha-response")) {
                            grecaptcha.reset();
                        }
                        //$('#button-review').button('loading');
                    },
                    complete: function () {
                        $('#button-review').button('reset');
                    },
                    success: function (json) {
                        $('.alert-success, .alert-danger').remove();
                        if (json['error']) {
                            $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                        }
                        if (json['success']) {
                            $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                            $('input[name=\'name\']').val('');
                            $('textarea[name=\'text\']').val('');
                            $('input[name=\'rating\']:checked').prop('checked', false);
                        }
                    }
                });
            });

          </script>
	</div>
<?php echo $footer; ?>