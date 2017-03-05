<?php 
	$id = rand(1,10);
	$cols = 3;
	$span =  12/$cols;
?>

<div id="image-additional<?php echo $id;?>" class="slide-banner slide carousel hidden-xs hidden-sm">
	<?php if( count( $banner_images ) > $item) { ?>
	<div class=""> 
	    <a class="carousel-control left" href="#image-additional<?php echo $id;?>" data-slide="next"><i class="fa fa-angle-left"></i></a>
	    <a class="carousel-control right" href="#image-additional<?php echo $id;?>" data-slide="prev"><i class="fa fa-angle-right"></i></a>
	</div> 
	<?php } ?> 

	<div class="carousel-inner banner-content">
		<?php 
		$pages = array_chunk( $banner_images, $item );?>

		<?php foreach ($pages as $k => $tbanners) { ?>
		<div class="item <?php if($k==0) {?>active<?php } ?> no-margin">
			<?php foreach( $tbanners as $i => $banner ) {  $i=$i+1;?>
				<?php if( $i%$cols == 1 ) { ?>
				<div class="row">
				<?php } ?>
					<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-<?php echo $span;?> col-xs-12">
						<div class="interactive-banner-body">
				        	<div class="img-banner img-responsive effect-v8">			        		
					        	<img src="<?php echo $banner['image'] ?>" alt="<?php echo $banner['name_button'] ?>">
				        	</div>
					        <div class="interactive-banner-profile text-center">
					        	<div class="banner-title">
					            	<h4><?php echo $banner['name_button'] ?></h4>
					        	</div>
					        </div>
				        </div>
					</div>
				<?php if( $i%$cols == 0 || $i==count($tbanners) ) { ?>
				</div>
				<?php } ?>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
</div>

 <script type="text/javascript">
    $('#image-additional<?php echo $id;?> .item:first').addClass('active');
    $('#image-additional<?php echo $id;?>').carousel({interval:false})
</script>