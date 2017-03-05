<?php
	$config = $sconfig;
	$theme  = $themename;
	$themeConfig = (array)$config->get('themecontrol');
	$listingConfig = array(
		'category_pzoom'        => 1,
		'quickview'             => 0,
		'show_swap_image'       => 0,
		'product_layout'		=> 'product_list',
		'enable_paneltool'	    => 0
	);
	$listingConfig = array_merge($listingConfig, $themeConfig );
	$categoryPzoom = $listingConfig['category_pzoom'];
	$quickview     = $listingConfig['quickview'];
	$swapimg       = $listingConfig['show_swap_image'];
	$categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0; 


	$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
	if( !is_file($productLayout) ){
		$listingConfig['product_layout'] = 'product_list';
	}
	$productLayout = DIR_TEMPLATE.$theme.'/template/common/product/'.$listingConfig['product_layout'].'.tpl';
	$button_cart = $this->language->get('button_cart');
	$id = rand(1,9)+rand();

	$columns_count  = 1;
?>
<div class="bg-carousel panel-default productcarousel space-10">
	<?php if( $show_title ) { ?>
	<div class="widget-heading panel-heading block-border"><h3 class="panel-title"><span><?php echo $heading_title?></span></h3></div>
	<?php } ?>
	
	<?php if ( isset($imagefile) && $imagefile )  { ?>
	 <div class="image-item effect-adv pull-left hidden-xs hidden-sm">
		<img class="img-responsive" alt=" " src="<?php echo $thumbnailurl; ?>"/>						
	 </div>
	<?php } ?>
		
	<div class="list box-products listcarousel<?php echo $id; ?> slide carousel" id="product_list<?php echo $id;?>">
			
			<?php if($products){ ?>

			<?php if( count($products) > $itemsperpage ) { ?>
			<div class="carousel-controls">
				<a class="carousel-control left" href="#product_list<?php echo $id;?>"   data-slide="prev"><i class="fa fa-long-arrow-left"></i></a>
				<a class="carousel-control right" href="#product_list<?php echo $id;?>"  data-slide="next"><i class="fa fa-long-arrow-right"></i></a>
			</div>
			<?php } ?>
			<div class="carousel-inner product-grid">

				<?php $pages = array_chunk( $products, $itemsperpage); ?>
					<?php foreach ($pages as  $k => $tproducts ) {   ?>
					<div class="item <?php if($k==0) {?>active<?php } ?> products-block">
						<?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
							<?php if( $i%$cols == 1 || $cols == 1) { ?>
							<div class="row products-row <?php ;if($i == count($tproducts) - $cols +1) { echo "last";} ?>"><?php //start box-product?>
							<?php } ?>

							<?php
								if ((12 % $cols) == 0) {
									$span = 12 / $cols;
								} else {
									$span = intval(100 / $cols);					
								}
							?>	
								<div class="col-sm-4 col-xs-12 col-lg-<?php echo $span;?> col-md-<?php echo $span;?> <?php if($i%$cols == 0) { echo "last";} ?> product-col">
									<?php require( $productLayout );  ?>
								</div>

							<?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
							</div><?php //end box-product?>
							<?php } ?>
						<?php } //endforeach; ?>
					</div>
			  <?php } ?>
			</div>	

			<?php } ?>
	</div>	
	<div class="clearfix"></div>
</div>

<!-- javascript -->
<script type="text/javascript">
$(function () {
$('#product_list<?php echo $id;?> a:first').tab('show');
})
$('.listcarousel<?php echo $id;?>').carousel({interval:false,auto:false,pause:'hover'});
</script>