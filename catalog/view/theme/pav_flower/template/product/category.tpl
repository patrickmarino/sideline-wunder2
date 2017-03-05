
<?php echo $header; ?>
<div class="container">
  <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>
  
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-md-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      
      <?php if ($thumb || $description) { ?>
      <div class="row">
        <?php if ($thumb) { ?>
        <div class="col-sm-12"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-responsive" /></div>
        <?php } ?>
        <div class="col-sm-12"><h1><?php echo $heading_title; ?></h1></div>
        <?php if ($description) { ?>
        <div class="col-sm-12"><?php echo $description; ?></div>
        <?php } ?>
      </div>
      
      <?php } ?>

      <!-- =========Refine Search========== -->
      <?php if ($categories) { ?>
      <div class="refine-search">
        <h3><?php echo $text_refine; ?></h3>

        <?php if (count($categories) <= 5) { ?>
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <ul class="list-inline">
              <?php foreach ($categories as $category) { ?>
              <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
            </ul>
          </div>
        </div>
        <?php } else { ?>
        <div class="row">
          <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
          <ul class="list-inline">
            <?php foreach ($categories as $category) { ?>
            <li class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
          <?php } ?>
        </div>
        <?php } ?>
      </div>   
      
      <?php } ?>
      <!-- =================== -->

      <?php if ($products) { ?>
        <?php   require( ThemeControlHelper::getLayoutPath( 'product/product_filter.tpl' ) );   ?>
        <br />      
        <?php require( ThemeControlHelper::getLayoutPath( 'common/product_collection.tpl' ) );  ?> 
      <?php } ?>

      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
