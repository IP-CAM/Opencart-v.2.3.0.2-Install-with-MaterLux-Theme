<?php echo $checkoutcart; ?>
<div class="form_order">
    <?php if ($error_warning) { ?>
        <div class="alert alert-warning"><?php echo $error_warning; ?></div>
    <?php } ?>

    <?php if ($payment_methods) { ?>
        <span class="form_name"><?php echo $text_payment_method; ?></span>
        <ul class="list_pay">
            <?php $i = 0; foreach ($payment_methods as $payment_method) { $payinfo = 'via_payinfo'.$i; ?>
                <li>
                    <div class="check">
                        <label>
                            <?php if ($payment_method['code'] == $code || !$code) { ?>
                            <?php $code = $payment_method['code']; ?>
                                <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
                            <?php } else { ?>
                                <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
                            <?php } ?>
                            <i></i>
                            <span class="sub"> <?php echo $payment_method['title']; ?>
                            <?php if ($payment_method['terms']) { ?>
                            (<?php echo $payment_method['terms']; ?>)
                            <?php } ?></span>
                        </label>
                    </div>
					<div class="informat">
                    <?php global $vieModules; $vie_module_groups = $vieModules; if (!empty($vie_module_groups[$payinfo])) { ?>
								    	<?php echo implode('', $vie_module_groups[$payinfo]); ?>
								    <?php } ?>
                    </div>
                </li>
            <?php $i++; } ?>
        </ul>
    <?php } ?>
    <div class="displaynone">
        <p><strong><?php echo $text_comments; ?></strong></p>
        <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
    </div>

    <?php if ($text_agree) { ?>
    <div class="form_order_bot">
        <?php echo $text_agree; ?>
        <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
        <?php } ?>
        &nbsp;
        <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
    </div>
    <?php } else { ?>
    <div class="form_order_bot">
        <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
    </div>
    <?php } ?>
</div>
