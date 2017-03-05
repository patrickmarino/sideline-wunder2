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

        <!-- count downt  -->
        <div class="footer-deals">      
          <div id="item_countdown_<?php echo $product['product_id']; ?>" class="item-countdown clearfix"></div>
        </div>
      </div>
    <?php } ?>
  <div class="product-meta">    
  
    <h5 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h5>

    <div class="clearfix">
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

  </div>  
</div>

<!-- javascript -->
<script type="text/javascript">
  jQuery(document).ready(function($){
    $("#item_countdown_<?php echo $product['product_id']; ?>").lofCountDown({
      formatStyle:2,
      TargetDate:"<?php echo date('m/d/Y G:i:s', strtotime($product['date_end_string'])); ?>",
      DisplayFormat:"<ul class='list-inline'><li class='days'> %%D%% </li>:<li class='hours'> %%H%% </li>:<li class='minutes'> %%M%% </li>:<li class='seconds'> %%S%% </li></ul>",
      FinishMessage: "<?php echo $objlang->get('text_finish');?>"
    });
  });
</script>
