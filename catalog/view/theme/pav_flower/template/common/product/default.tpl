<div class="product-block radius-1x clearfix">
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
          <div class="rating">
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

      <!-- price -->
      <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) {  ?>
            <span class="price-new"><?php echo $product['price']; ?></span>
            <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?> 
            <?php } ?>
          <?php } else { ?>
            <span class="price-new"><?php echo $product['special']; ?></span>
            <span class="price-old"><?php echo $product['price']; ?></span> 
            <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?> 
            <?php } ?>

          <?php } ?>
        </div>
        <?php } ?> 
    </div>

    <?php if( isset($product['description']) ){ ?> 
    <p class="description"><?php echo utf8_substr( strip_tags($product['description']),0,200);?>...</p>
    <?php } ?>

    <div class="action add-links clearfix">
      <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
      <div class="cart">            
        <button data-loading-text="Loading..." class="btn-action radius-5" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
          <span><?php echo $button_cart; ?></span>
          <i class="fa fa-shopping-cart"></i>
        </button>
      </div>
      <?php } ?> 

      <div class="button">         
        <!-- wishlist -->
        <div class="wishlist">
          <button class="btn btn-default" type="button" data-placement="top" title="<?php echo $objlang->get("button_wishlist"); ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button> 
        </div>
        <!-- compare -->
        <div class="compare">     
          <button class="btn btn-default" type="button" data-placement="top" title="<?php echo $objlang->get("button_compare"); ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> 
        </div> 
        <!-- quickview -->
        <?php if ( isset($quickview) && $quickview ) { ?>
        <div class="quickview hidden-xs hidden-sm">
          <a class="iframe-link btn btn-default" data-placement="top" href="<?php echo $ourl->link('themecontrol/product','product_id='.$product['product_id']);?>"  title="<?php echo $objlang->get('quick_view'); ?>" ><i class="fa fa-eye"></i></a>
        </div>
        <?php } ?>
        <!-- zoom -->
        <div class="zoom hidden-xs hidden-sm">
            <?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
              <a data-placement="top" href="<?php echo $zimage;?>" class="product-zoom btn btn-default info-view colorbox cboxElement" title="<?php echo $product['name']; ?>"><i class="fa fa-search-plus"></i></a>
            <?php } ?>
        </div>            
      </div>  
    </div> 

  </div>  
</div>





