<div class="<?php echo str_replace('_','-',$blockid); ?> <?php echo $blockcls;?>" id="pavo-<?php echo str_replace('_','-',$blockid); ?>">
  <div class="container">
    <div class="row">
        <div class="inner clearfix">
          <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
            <div class="about-us">
              <?php if( $content=$helper->getLangConfig('widget_about_us') ) {?>
              <?php echo $content; ?>            
              <?php } ?>
            </div>            
          </div>

          <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
            <h5><?php echo $text_account; ?></h5>
            <ul class="list-unstyled">
              <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
              <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
              <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
              <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
            </ul>
          </div>
          
          <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
            <h5><?php echo $text_extra; ?></h5>
            <ul class="list-unstyled">
              <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
              <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
              <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
              <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            </ul>
          </div>

          <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
            <h5><?php echo $text_service; ?></h5>
            <ul class="list-unstyled">
              <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
              <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
              <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
            </ul>
          </div>
          
          <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
            <div class="payment">
              <?php if( $content=$helper->getLangConfig('widget_papal') ) {?>
              <?php echo $content; ?>            
              <?php } ?>
            </div>
          </div>
        </div>
    </div>   
  </div>
</div>
