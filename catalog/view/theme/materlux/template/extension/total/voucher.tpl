<div id="collapse-voucher" class="present_box">
    <input type="text" name="voucher" value="<?php echo $voucher; ?>" placeholder="<?php echo $entry_voucher; ?>" id="input-voucher" class="tx" />
    <input type="submit" value="ОК" id="button-voucher" class="btn" /> 
</div>

<script type="text/javascript"><!--
$('#button-voucher').on('click', function() {
    $.ajax({
        url: 'index.php?route=extension/total/voucher/voucher',
        type: 'post',
        data: 'voucher=' + encodeURIComponent($('input[name=\'voucher\']').val()),
        dataType: 'json',
        success: function(json) {
            $('.alert').remove();

            if (json['error']) {
            $('.breacrumb').after('<div class="alert alert-danger">' + json['error'] + '</div>');

            $('html, body').animate({ scrollTop: 0 }, 'slow');
            }

            if (json['redirect']) {
            location = json['redirect'];
            }
        }
    });
});
//--></script>
