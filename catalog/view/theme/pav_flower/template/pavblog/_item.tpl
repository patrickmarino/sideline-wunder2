<div class="blog-item border-bottom space-padding-tb-20">
	<div class="row">
		<?php if( $cat_show_title ) { ?>
		<div class="col-md-4 col-sm-5 col-xs-12">
			<div class="image">
			<?php if( $blog['thumb'] && $cat_show_image )  { ?>
			<a href="<?php echo $blog['link'];?>"><img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" class="img-responsive"/></a>
			<?php } ?>
			</div>
		</div>

		<div class="blog-meta col-lg-8 col-md-8 col-sm-7 col-xs-12">
			<ul class="list-inline">
			  	<li><?php if( $blog_show_author ) { ?>
				<span class="author"><b><?php echo $objlang->get("text_write_by");?></b> <?php echo $blog['author'];?></span>
				<?php } ?>
				</li>

				<li>
				<?php if( $blog_show_category ) { ?>
				<span class="publishin">
					<b><?php echo $objlang->get("text_published_in");?></b>
					<a class="color" href="<?php echo $blog['category_link'];?>" title="<?php echo $blog['category_title'];?>"><?php echo $blog['category_title'];?></a>
				</span>
				<?php } ?>	
				</li>

				<li>
				<?php if( $blog_show_created ) { ?>
				<span class="created"><b><?php echo $objlang->get("text_created_date");?></b> <?php echo $blog['created'];?></span>
				<?php } ?>
				</li>

				<li>
				<?php if( $blog_show_hits ) { ?>
				<span class="hits"><b><?php echo $objlang->get("text_hits");?></b> <?php echo $blog['hits'];?></span>
				<?php } ?>		
				</li>

				<li>
				<?php if( $blog_show_comment_counter ) { ?>
				<span class="comment_count"><b><?php echo $objlang->get("text_comment_count");?></b> <?php echo $blog['comment_count'];?></span>
				<?php } ?>	
				</li>
			</ul>	
			<div class="blog-body">
				<div class="blog-header">
					<h3 class="blog-title">	<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a></h3>
				<?php } ?>
				</div>
			<?php if( $cat_show_description ) {?>
				<div class="description">
					<?php echo utf8_substr( $blog['description'],0, 180 );?>...
				</div>
				<?php } ?>
			<?php if( $cat_show_readmore ) { ?>
					<a href="<?php echo $blog['link'];?>" class="btn btn-primary btn-arrow-right"><?php echo $objlang->get('text_readmore');?></a>
				<?php } ?>
			</div>		
		</div>		
	</div>
</div>

