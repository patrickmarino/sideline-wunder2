<?php 
	$objlang = $this->registry->get('language');
	$config = $this->registry->get('config');
	$id = rand(1,9)+rand();
	$span = 12/$cols;
?>
<?php if( !empty($blogs) ) { ?>
<div class="widget-blogs bg-carousel panel-default space-40">
	<?php if($heading_title) { ?>
		<div class="widget-heading panel-heading block-border"><h3 class="panel-title"><span><?php echo $heading_title?></span></h3></div>
	<?php } ?>
	<div id="blog-additional<?php echo $id;?>" class=" slide carousel <?php if ( isset($stylecls)&&$stylecls) { ?>box-<?php echo $stylecls; ?><?php } ?> <?php $addition_cls?>" >	
		<?php if( count($blogs) > $itemsperpage ) { ?>	
			<div class="carousel-controls">
				<a class="carousel-control left" href="#blog-additional<?php echo $id;?>"   data-slide="prev"><i class="fa fa-angle-left"></i></a>
				<a class="carousel-control right" href="#blog-additional<?php echo $id;?>"  data-slide="next"><i class="fa fa-angle-right"></i></a>
			</div>
		<?php } ?>
		<div class="carousel-inner widget-blogs-body" data-show="1" data-pagination="false" data-navigation="true">
			<?php $pages = array_chunk( $blogs, $itemsperpage); ?>

			<?php foreach( $pages as $i => $tpblogs ) {  $i=$i+1;?>
				<div class="item <?php if($i==0) {?>active<?php } ?> blog-item">
				<?php foreach( $tpblogs as $i => $blog ) {  $i=$i+1;?>
					<?php if( $i%$cols == 1 || $cols == 1 ) { ?>
					<div class="row">
					<?php } ?>
						<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-<?php  echo ($cols > 2 && $cols % 2 == 0) ? $span * 2 : $span; ?> col-xs-12 product-col">
							<div class="blogs-body">
								<div class="blogs-img-profile">
									<?php if( $blog['thumb']  )  { ?>
										<div class="blogs-image effect">
												<a href="<?php echo $blog['link'];?>" class="blog-article">
										<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>" class="img-responsive"/>
												</a>								
										</div>
									<?php } ?>							
								</div>
								<div class="blogs-meta media-body">
							  		<h5 class="blogs-title"><a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a></h5>
			                        <div class="blogs-profile">                       		 
											<span class="created"><?php echo date("d M, Y",strtotime($blog['created']));?></span>
											<span class="comment"><i class="fa fa-comments-o"></i> <?php echo $objlang->get("text_comment_count");?><?php echo $blog['comment_count'];?></span>																			
									</div>	
									<div class="posts-meta">												
									    <div class="description space-10">
											<?php $blog['description'] = strip_tags($blog['description']); ?>
											<?php echo utf8_substr( $blog['description'],0, 100 );?>...
										</div>
										<div class="btn-more-link hidden">
											<a href="<?php echo $blog['link'];?>" class="readmore btn-link"><?php echo $objlang->get('text_readmore');?><i class="space-padding-l5 fa fa-angle-right"></i></a>
										</div>
								  	</div>
								</div>
							</div>	
						</div>	
					<?php if( $i%$cols == 0 || $i==count($tpblogs) ) { ?>
					</div><?php //end box-product?>
					<?php } ?>
				<?php } //endforeach; ?>
				</div>	
			<?php } ?>
		</div>
	</div>
</div>
<?php } ?>

<script type="text/javascript">
    $('#blog-additional<?php echo $id;?> .item:first').addClass('active');
    $('#blog-additional<?php echo $id;?>').carousel({interval:false})
</script>