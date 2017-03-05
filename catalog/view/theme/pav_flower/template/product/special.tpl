<?php  echo $header; ?> <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>
<div class="img-banner container space-padding-tb-20 text-center">
  <img src="image/catalog/demo/banners/img-offer.jpg" alt="banner offer">
</div>
<div class="main-columns container space-30">
    <div class="container-inside">  
      <div class="row"><?php if( $SPAN[0] ): ?>
  			<aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>">
  				<?php echo $column_left; ?>
  			</aside>	
    		<?php endif; ?> 
      
       <div id="sidebar-main" class="col-md-<?php echo $SPAN[1];?>"><div id="content"><?php echo $content_top; ?>
          <h2><?php echo $heading_title; ?></h2>
          <?php if ($products) { ?>
          <?php require( ThemeControlHelper::getLayoutPath( 'common/offer_collection.tpl' ) );  ?> 

          <?php } else { ?>
          <p><?php echo $text_empty; ?></p>
          <div class="buttons">
            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
          </div>
          <?php } ?>
          <?php echo $content_bottom; ?></div>
       </div> 

      <?php if( $SPAN[2] ): ?>
      	<aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>">	
      		<?php echo $column_right; ?>
      	</aside>
      <?php endif; ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>