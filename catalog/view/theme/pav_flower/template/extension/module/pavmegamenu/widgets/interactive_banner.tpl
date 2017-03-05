<div class="space-40 interactive-banner interactive-banner-<?php echo $banner_type;?>  <?php echo $position;?>">
    <div class="interactive-banner-body">
        <?php if($thumbnailurl){?><img alt="" src="<?php echo $thumbnailurl;?>" class="img-responsive"><?php }?>
        <div class="interactive-banner-profile">
            <div class="banner-title">
                <?php if($sub_title){?><small><?php echo $sub_title;?></small><?php }?>
                <?php if( $show_title ) { ?>
                    <div class="widget-heading"><h4 class="panel-title"><?php echo $heading_title?></h4></div>
                <?php } ?>
            </div>
            
            <?php if($htmlcontent){echo $htmlcontent; }?>
        </div>
        <?php if($mask_link){?>
            <a class="mask-link" href="<?php echo $mask_link;?>"></a>
        <?php } ?>
    </div>
</div>

