<?php
 
  $megamenu = $helper->renderModule('pavmegamenu');
  if( isset($_COOKIE[$themeName .'_skin']) && $_COOKIE[$themeName .'_skin'] ){
    $skin = trim($_COOKIE[$themeName .'_skin']);
  }
?>

<div class="col-lg-12 col-md-10">
  <div id="pav-mainnav" class="pav-mainnav"><div class="pav-megamenu">        
  <button data-toggle="offcanvas" class="btn btn-primary canvas-menu hidden-lg hidden-md" type="button"><span class="fa fa-bars"></span> Menu</button>
    <?php
    /**
    * Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
    */
    if (count($megamenu) && !empty($megamenu)) { echo $megamenu;?>
    <?php } elseif ($categories) { ?>
    <nav id="menu" class="navbar">
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">
          <?php foreach ($categories as $category) { ?>
          <?php if ($category['children']) { ?>
          <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
          </li>
          <?php } else { ?>
          <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
      </div>
    </nav>
    <?php } ?>
  </div></div>
</div>
  
  