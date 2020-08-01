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
					<div class="catalog_title">
						<h1><?php echo $heading_title; ?></h1>
						
					</div>
					
					<?php if ($orders) { ?>
						<div class="table-responsive">
							<table class="table_responsive">
							<thead>
								<tr>
									<th class="text-right"><?php echo $column_order_id; ?></th>
									<th class="text-left"><?php echo $column_customer; ?></th>
									<th class="text-right"><?php echo $column_product; ?></th>
									<th class="text-left"><?php echo $column_status; ?></th>
									<th class="text-right"><?php echo $column_total; ?></th>
									<th class="text-left"><?php echo $column_date_added; ?></th>
									<th></td>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($orders as $order) { ?>
									<tr>
										<td class="text-right">#<?php echo $order['order_id']; ?></td>
										<td class="text-left"><?php echo $order['name']; ?></td>
										<td class="text-right"><?php echo $order['products']; ?></td>
										<td class="text-left"><?php echo $order['status']; ?></td>
										<td class="text-right"><?php echo $order['total']; ?></td>
										<td class="text-left"><?php echo $order['date_added']; ?></td>
										<td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>">Подробнее</a></td>
									</tr>
								<?php } ?>
							</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
						</div>
					<?php } else { ?>
					<p><?php echo $text_empty; ?></p>
					<?php } ?>


				</div>
			</div>
		</div>
	</div>
<?php echo $footer; ?>