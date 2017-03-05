<?php echo $header; ?>
<div class="container">
  <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>

  <div class="row">
    <?php if( $SPAN[0] ): ?>
      <aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>">
        <?php echo $column_left; ?>
      </aside>  
    <?php endif; ?> 
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
    <?php if( $SPAN[2] ): ?>
      <aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>">  
        <?php echo $column_right; ?>
      </aside>
    <?php endif; ?>
  </div>
</div>
<?php echo $footer; ?>