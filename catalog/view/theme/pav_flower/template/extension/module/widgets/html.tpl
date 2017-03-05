
<div class="widget-image box <?php echo $addition_cls ?>  <?php if( isset($stylecls)&&$stylecls ) { ?>box-<?php echo $stylecls;?><?php } ?>">

	<div class="interactive-banner">	
		<?php if( $show_title ) { ?>
		<div class="banner-heading"><?php echo $heading_title?></div>
		<?php } ?>
		 <?php echo htmlspecialchars_decode( $html ); ?>
	</div>	 
</div>
