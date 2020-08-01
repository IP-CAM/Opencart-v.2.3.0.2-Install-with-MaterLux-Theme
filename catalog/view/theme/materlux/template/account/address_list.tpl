<?php echo $header; ?>
<div class="content">
    <div class="content_box">
      <ul class="breacrumb">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
          <?php if($i+1<count($breadcrumbs)) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } else { ?>
            <li><?php echo $breadcrumb['text']; ?></li>
          <?php } ?>
        <?php } ?>
      </ul> 

      <div class="catalog">
        <!--LEFT COLUMN-->
        
        <?php echo $column_right; ?>

        <!--RIGHT COLUMN-->
        <div class="catalog_cont">
          <?php if ($addresses) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <?php foreach ($addresses as $result) { ?>
          <tr>
            <td class="text-left"><?php echo $result['address']; ?></td>
            <td class="text-right"><a href="<?php echo $result['update']; ?>">Редактировать</a> &nbsp; <a href="<?php echo $result['delete']; ?>">Удалить</a></td>
          </tr>
          <?php } ?>
        </table>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
        <div class="pull-right"><a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a></div>
      </div>
        </div>
      </div>
    </div>
  </div>
<?php echo $footer; ?>