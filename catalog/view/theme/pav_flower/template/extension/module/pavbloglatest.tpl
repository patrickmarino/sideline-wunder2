<div class="space-30 panel-default <?php echo $prefixclass;?> pavblog-latest">
	<div class="widget-heading panel-heading block-border"><h3 class="panel-title"><span><?php echo $heading_title?></span></h3></div>
	<div class="">
		<?php if( !empty($blogs) ) { ?>
		<div class="row">
			<?php foreach( $blogs as $key => $blog ) { $key = $key + 1;?>
			<?php $style = ( $key > $cols )?"left":"right";  ?>
			<div class="col-lg-<?php echo floor(12/$cols);?> col-md-<?php echo floor(12/$cols);?> col-sm-12 col-xs-12 <?php echo $style; ?>">	
				<div class="latest-posts-body">
					<div class="latest-posts-image pull-left">
					  	<a class="" href="#">
						    <?php if( $blog['thumb']  )  { ?>
								<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>" class="img-responsive"/>
							<?php } ?>
					  	</a>
					</div>
				  	<div class="latest-posts-meta media-body">
				  		<h5 class="latest-posts-title"><a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a></h5>
                        <div class="latest-posts-profile">                       		 
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
				</div> <!-- end latest-posts-body -->
			</div>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
</div>
