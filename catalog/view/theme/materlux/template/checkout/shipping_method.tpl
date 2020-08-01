<?php echo $checkoutcart; ?>
<div class="form_order">
    <?php if ($error_warning) { ?>
        <div class="alert alert-warning"><?php echo $error_warning; ?></div>
    <?php } ?>

    <?php if ($shipping_methods) { ?>
        <span class="form_name"><?php echo $text_shipping_method; ?></span>
        <ul class="list_pay">
            <?php foreach ($shipping_methods as $shipping_method) { ?>
                <?php if (!$shipping_method['error']) { ?>
                    <?php foreach ($shipping_method['quote'] as $quote) { ?>
                        <li>
                            <div class="check">
                                <label>
                                    <?php if ($quote['code'] == $code || !$code) { ?>
                                        <?php $code = $quote['code']; ?>
                                        <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" />
                                    <?php } else { ?>
                                        <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" />
                                    <?php } ?>
                                    <i></i>
                                    <span class="sub"><?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></span>
                                </label>
                            </div>
                        </li>
                    <?php } ?>
                <?php } else { ?>
                <div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
                <?php } ?>
            <?php } ?>
        </ul>
    <?php } ?>

    <div class="displaynone">
        <p><strong><?php echo $text_comments; ?></strong></p>
        <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
    </div>

    <div class="form_order_bot">
        <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" data-loading-text="<?php echo $text_loading; ?>" class="btn" />
    </div>
</div>

