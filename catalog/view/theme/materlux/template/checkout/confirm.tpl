<?php echo $checkoutcart; ?>
<div class="form_order"> 
    <span class="form_name">Подтверждение заказа</span>
    <?php if (!isset($redirect)) { ?>
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <tbody>
                
                <?php foreach ($vouchers as $voucher) { ?>
                    <tr>
                        <td class="text-left"><?php echo $voucher['description']; ?></td>
                        <td class="text-left"></td>
                        <td class="text-right">1</td>
                        <td class="text-right"><?php echo $voucher['amount']; ?></td>
                        <td class="text-right"><?php echo $voucher['amount']; ?></td>
                    </tr>
                <?php } ?>
            </tbody>
            <tfoot>
                <?php foreach ($totals as $total) { ?>
                    <tr>
                        <td colspan="4" class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                        <td class="text-right"><?php echo $total['text']; ?></td>
                    </tr>
                <?php } ?>
            </tfoot>
        </table>
    </div>
    <?php echo $payment; ?>
    <?php } else { ?>
    <script type="text/javascript"><!--
    location = '<?php echo $redirect; ?>';
    //--></script>
    <?php } ?>
</div>
