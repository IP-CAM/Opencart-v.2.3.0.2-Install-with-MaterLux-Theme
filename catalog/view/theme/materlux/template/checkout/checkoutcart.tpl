
<div class="order">
    <div class="order_data">
        <?php foreach ($products as $product) { ?>
            <div class="item_order">
                <div class="col1">
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                </div>
                <div class="col2">
                    <span class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
                </div>
                <div class="col3">
                    <?php if ($product['option']) { ?>
                        <?php foreach ($product['option'] as $option) { ?>
                            <?php if($option['option_id'] == '5') { ?>
                                <div class="order_size"><?php echo $option['value']; ?></div>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>
                </div>
                <div class="col4">
                    <span class="price"><?php echo $product['price']; ?></span>
                </div>
            </div> 
        <?php } ?>

    </div>

    <div class="order_present">
        <div class="present">
            <?php echo $voucher; ?>

            <?php foreach ($totals as $total) { ?>
                <?php if($total['code'] == 'voucher') { ?>
                    <p><?php echo $total['title']; ?>: <?php echo $total['text']; ?></p>
                <?php } ?>
            <?php } ?>

            <?php foreach ($totals as $total) { ?>
                <?php if($total['code'] == 'total') { ?>
                    <p>Сумма заказа: <?php echo $total['text']; ?></p>
                <?php } ?>
            <?php } ?>
            <a href="<?php echo $cartbtn; ?>" class="back">Вернуться в корзину</a>
        </div>
    </div>
</div> 