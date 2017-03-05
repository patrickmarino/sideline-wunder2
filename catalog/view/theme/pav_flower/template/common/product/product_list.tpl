<?php 
  $objlang = $this->registry->get('language');
  $ourl = $this->registry->get('url');  
  $button_cart = $objlang->get("button_cart"); 
?>
<div class="product-block radius-1x">
    <?php if ($product['thumb']) {    ?>           
      <div class="image"> 
        <?php if( $product['special'] ) {   ?>
          <span class="product-label sale-exist"><span class="product-label-special"><?php echo $objlang->get('text_sale'); ?></span></span>
        <?php } ?>   
        <div class="product-img">
          <a class="img" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
            <img class="img-responsive" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
          </a>                
        </div>
      </div>
    <?php } ?>
  <div class="product-meta">    
  
    <h5 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h5>

    <div class="clearfix">
      <!-- rating -->
        <?php if ($product['rating']) { ?>
          <div class="rating space-20">
            <?php for ($is = 1; $is <= 5; $is++) { ?>
            <?php if ($product['rating'] < $is) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i>
            </span>
            <?php } ?>
            <?php } ?>
          </div>
        <?php } ?> 
    </div>

  </div>  
</div>





