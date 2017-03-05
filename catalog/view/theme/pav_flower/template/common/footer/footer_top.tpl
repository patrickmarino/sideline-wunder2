<div class="<?php echo str_replace('_','-',$blockid); ?> <?php echo $blockcls;?>" id="pavo-<?php echo str_replace('_','-',$blockid); ?>">
  <div class="container no-space-row">
    <div class="row">
      <div class="inner clearfix">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 shadow-left">
          <div class="about-us">
            <?php if( $content=$helper->getLangConfig('widget_social') ) {?>
            <?php echo $content; ?>            
            <?php } ?>
          </div>            
        </div>

        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 shadow-right">
          <?php
            echo $helper->renderModule('pavnewsletter');
          ?>
        </div>
      </div>
    </div>   
  </div>
</div>