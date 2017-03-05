
<div class="banner-paralax space-70 parallax <?php echo $addition_cls ?> background-img-<?php echo $image_parallax;?> radius-1x">
	<?php if( $show_title ) { ?>
	<div class="widget-heading panel-heading block-border"><h3 class="panel-title"><span><?php echo $heading_title?></span></h3></div>
	<?php } ?>
	<div class="widget-inner img-adv box-content clearfix">
		<div class="image-item">
			<?php if ( $show_img )  { ?>
		 		<img class="img-responsive" alt=" " src="<?php echo $thumbnailurl; ?>"/>
		 	<?php } ?>
		    <?php if($show_des) { ?>
		 	<div class="description">
		 		<?php echo $htmlcontent; ?> 
		 	</div>
		    <?php } ?>
		</div>
	</div>
</div>
