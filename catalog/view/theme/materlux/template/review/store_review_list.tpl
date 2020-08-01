<?php if ($reviews) { ?>
  <div class="reviews_block">
  <?php foreach ($reviews as $review) { ?>
    <div class="col-md-12 review-item">
        <div class="author_item">
            <h5><?php echo $review['author']; ?></h5>
			<span class="date_item"><?php echo $review['date_added']; ?></span>
        </div>
		<div class="review_item">
		    <?php echo $review['text']; ?>
		</div>

      <div class=" col-xs-12">
        
        <?php
        if(isset($review['admin_answer'])&& !empty($review['admin_answer'])){ ?>
          <div class="admin-answer">
            <p><strong>Administrator</strong></p>
            <?php echo $review['admin_answer']; ?>
          </div>
        <?php }?>


      </div>




    </div>

  <?php } ?>


    </div>


<div class="row">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
