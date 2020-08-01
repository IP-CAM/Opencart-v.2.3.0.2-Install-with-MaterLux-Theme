<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $title; ?></title>
<style>
.mail-Message-Body {
    position: relative;
    z-index: 1;
    overflow: auto;
    padding: 0 32px 10px 37px;
    font-size: 15px;
}

.mail-Message_page .mail-Message-Body {
    padding: 20px 32px 10px 32px;
}
.mail-Message-Body-Content {
    word-wrap: break-word;
}

</style>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<div class="ns-view-message-body ns-view-id-389 mail-Message-Body js-message-body" data-key="view=message-body&amp;ids=169166461003134002&amp;is_spam=false&amp;raw=false&amp;frequency=0&amp;draft=false">
<div class="mail-Message-Body-Content">
<p><?php echo $text_greeting; ?>
</p><br><br>
<?php if ($customer_id) { ?>
  <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_link; ?></p>
  <p style="margin-top: 0px; margin-bottom: 20px;"><a href="<?php echo $link; ?>"><?php echo $link; ?></a></p>
  <?php } ?>
  <?php if ($download) { ?>
  <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_download; ?></p>
  <p style="margin-top: 0px; margin-bottom: 20px;"><a href="<?php echo $download; ?>"><?php echo $download; ?></a></p>
  <?php } ?>
<b>Счет:</b><br>
<table border="0" cellpadding="0" cellspacing="0" class="bf6b46c8de0858023009b8eaed763c3amain-table" width="100%" style="background-color:#f4f6f8;direction:ltr;font-family:'arial';font-size:12px;height:100%"><tbody><tr><td align="center" style="height:100%;width:100%">
    <table border="0" cellpadding="0" cellspacing="0" style="direction:ltr;margin-bottom:24px;margin-left:0;margin-right:0;margin-top:24px;table-layout:fixed;width:602px">
	<tbody><tr><td style="background-color:#ffffff;border-bottom-color:#e6e6e6;border-bottom-style:solid;border-bottom-width:1px;border-left-color:#e6e6e6;border-left-style:solid;border-left-width:1px;border-right-color:#e6e6e6;border-right-style:solid;border-right-width:1px;border-top-color:#e6e6e6;border-top-style:solid;border-top-width:1px;margin-bottom:0px;margin-left:auto;margin-right:auto;margin-top:0px;padding-bottom:0px;padding-left:46px;padding-right:44px;padding-top:0px;text-align:left">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-bottom-color:#868686;border-bottom-style:solid;border-bottom-width:1px;direction:ltr;
			margin-bottom:8px;padding-bottom:0px;padding-left:0px;padding-right:0px;padding-top:27px">
			<tbody><tr><td align="left" valign="middle" style="padding-bottom:3px">
			<a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>">
			    <img border="0" height="50" width="100" src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;" /></a>
			</td><td width="100%">&nbsp;</td><td valign="bottom" style="font-family:'arial';font-size:26px;font-style:normal;font-variant:normal;font-weight:bold;line-height:normal;margin-bottom:0px;margin-left:0px;margin-right:0px;margin-top:0px;text-align:right;text-transform:uppercase">Счет</td></tr></tbody></table>

            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="direction:ltr">
			<tbody>
			<tr valign="top">
			<?php if ($comment) { ?>
			    <td style="font-family:'arial';font-size:12px;padding-bottom:0px;padding-left:2px;padding-right:0px;padding-top:14px;width:50%">
                    <?php echo $comment; ?>
                </td>
			<?php } ?>
			<td style="padding-top:14px">
                    <h2 style="font-family:'tahoma';font-size:17px;font-style:normal;font-variant:normal;font-weight:bold;line-height:normal;margin-bottom:0px;margin-left:0px;margin-right:0px;margin-top:0px">Заказ&nbsp;#<?php echo $order_id; ?></h2>
                    <table border="0" cellpadding="0" cellspacing="0" style="direction:ltr"><tbody><tr valign="top"><td style="color:#000000;font-family:'verdana' , 'helvetica' , 'arial' , sans-serif;font-size:12px;padding-right:10px;text-transform:uppercase;white-space:nowrap">Статус:</td><td width="100%" style="font-family:'arial';font-size:12px"><?php echo $order_status; ?></td></tr>
					<tr valign="top"><td style="color:#000000;font-family:'verdana' , 'helvetica' , 'arial' , sans-serif;font-size:12px;padding-right:10px;text-transform:uppercase;white-space:nowrap">Дата:</td><td style="font-family:'arial';font-size:12px"><?php echo $date_added; ?></td></tr>
					<tr valign="top"><td style="color:#000000;font-family:'verdana' , 'helvetica' , 'arial' , sans-serif;font-size:12px;padding-right:10px;text-transform:uppercase;white-space:nowrap">Способ оплаты:</td><td style="font-family:'arial';font-size:12px"><?php echo $payment_method; ?></td></tr>
					<?php if ($shipping_method) { ?>
					<tr valign="top"><td style="color:#000000;font-family:'verdana' , 'helvetica' , 'arial' , sans-serif;font-size:12px;padding-right:10px;text-transform:uppercase;white-space:nowrap">Способ доставки:</td><td style="font-family:'arial';font-size:12px"><?php echo $shipping_method; ?></td></tr>
					<?php } ?>
					</tbody></table>
            </td>
			</tr>
			</tbody>
			</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%" style="direction:ltr;padding-bottom:24px;padding-left:0px;padding-right:0px;padding-top:32px"><tbody><tr valign="top"><td width="34%" style="font-family:'arial';font-size:12px;padding-right:10px">
                    <h3 style="font-family:'tahoma';font-size:17px;font-style:normal;font-variant:normal;font-weight:bold;line-height:normal;margin-bottom:0px;margin-left:0px;margin-right:0px;margin-top:0px;padding-bottom:3px;padding-left:1px;padding-right:0px;padding-top:0px">Плательщик:</h3>
                        <?php echo $payment_address; ?><br>
				        <?php echo $telephone; ?>
                                        
                </td>
				<?php if ($shipping_address) { ?>
				<td width="33%" style="font-family:'arial';font-size:12px">
                    <h3 style="font-family:'tahoma';font-size:17px;font-style:normal;font-variant:normal;font-weight:bold;line-height:normal;margin-bottom:0px;margin-left:0px;margin-right:0px;margin-top:0px;padding-bottom:3px;padding-left:1px;padding-right:0px;padding-top:0px">Доставить в:</h3>
                        <?php echo $shipping_address; ?><br>
                <?php echo $telephone; ?>   
                </td>
				<?php } ?>
				</tr></tbody></table>            
            <table cellpadding="0" cellspacing="1" width="100%" style="background-color:#dddddd;direction:ltr">
			<tbody>
			<tr>
			<th width="70%" style="background-color:#eeeeee;font-family:'arial';font-size:12px;padding-bottom:6px;padding-left:10px;padding-right:10px;padding-top:6px;white-space:nowrap">Товар</th><th style="background-color:#eeeeee;font-family:'arial';font-size:12px;padding-bottom:6px;padding-left:10px;padding-right:10px;padding-top:6px;white-space:nowrap">Кол-во</th><th style="background-color:#eeeeee;font-family:'arial';font-size:12px;padding-bottom:6px;padding-left:10px;padding-right:10px;padding-top:6px;white-space:nowrap">Цена за ед.</th><th style="background-color:#eeeeee;font-family:'arial';font-size:12px;padding-bottom:6px;padding-left:10px;padding-right:10px;padding-top:6px;white-space:nowrap">Сумма</th>
			</tr>
			<?php foreach ($products as $product) { ?>
			<tr><td style="background-color:#ffffff;font-family:'arial';font-size:12px;padding-bottom:5px;padding-left:10px;padding-right:10px;padding-top:5px">
             <?php echo $product['name']; ?>
            <br>                                    
            <strong>Опции:</strong>
			<?php foreach ($product['option'] as $option) { ?>
			    <?php echo $option['name']; ?>:&nbsp;<?php echo $option['value']; ?>,&nbsp;
          <?php } ?>       
            </td>
			<td style="background-color:#ffffff;font-family:'arial';font-size:12px;padding-bottom:5px;padding-left:10px;padding-right:10px;padding-top:5px;
			text-align:center"><?php echo $product['quantity']; ?></td>
			<td style="background-color:#ffffff;font-family:'arial';font-size:12px;padding-bottom:5px;padding-left:10px;
			padding-right:10px;padding-top:5px;text-align:right"><?php echo $product['price']; ?></td>
			<td style="background-color:#ffffff;font-family:'arial';font-size:12px;padding-bottom:5px;padding-left:10px;
			padding-right:10px;padding-top:5px;text-align:right;white-space:nowrap"><b><?php echo $product['total']; ?></b>&nbsp;
			</td>												
			</tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $voucher['description']; ?></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;">1</td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
	  </tbody>
	  </table>
      <table border="0" cellpadding="0" cellspacing="0" width="100%" style="direction:ltr"><tbody>
	  <tr><td align="right">
        <table border="0" style="direction:ltr;padding-bottom:12px;padding-left:0px;padding-right:0px;padding-top:3px"><tbody>
		<?php foreach ($totals as $total) { ?>
      <tr>
	  <td style="font-family:'arial';font-size:12px;text-align:right;white-space:nowrap"><b><?php echo $total['title']; ?>:</b>&nbsp;</td>
      <td style="font-family:'arial';font-size:12px;text-align:right;white-space:nowrap"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
      </tbody></table>
       </td>
		</tr>
		</tbody>
		</table>
        </td>
		</tr></tbody></table>
    </td></tr></tbody></table>
<p>
    <?php echo $text_footer; ?>
</p>
</div>
</div>
</body>
</html>
