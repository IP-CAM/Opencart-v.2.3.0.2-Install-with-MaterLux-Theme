<div class="checkout">
    <div class="checkout_box">
        <div class="form_login">
            <div class="form_login_box">
                <span class="form_name">Постоянный клиент</span>
                <div class="in_box">
                    <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="tx" />
                </div>
                <div class="in_box">
                    <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="tx" />
                </div>
                <div class="form_login_bot">
                    <div class="check">
                        <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
                    </div>
                    <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn" />
                </div>
            </div>
        </div>
    </div>

    <div class="checkout_box">
        <div class="form_checkout">
            <span class="form_name">Новый покупатель</span>
            <div class="check">
                <label>
                    <?php if ($account == 'register') { ?>
                        <input type="radio" name="account" value="register" />
                    <?php } else { ?>
                        <input type="radio" name="account" value="register" />
                    <?php } ?>
                    <i></i>
                    <span class="sub"><?php echo $text_register; ?></span>
                    Создайте учетную запись и используйте её для оформления заказа
                </label>
            </div> 
            <?php if ($checkout_guest) { ?>
                <div class="check">
                    <label>
                        <?php if ($account == 'guest') { ?>
                            <input type="radio" name="account" value="guest" checked="checked" />
                        <?php } else { ?>
                            <input type="radio" name="account" value="guest" checked="checked"/>
                        <?php } ?>
                        <i></i>
                        <span class="sub"><?php echo $text_guest; ?></span>
                        Быстрое оформление заказа без создания учетной записи
                    </label>
                </div>
            <?php } ?>
            <input type="button" value="<?php echo $button_continue; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="btn btn_color" />
        </div>
    </div>
    
</div>
