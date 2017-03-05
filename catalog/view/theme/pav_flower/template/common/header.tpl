<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" class="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<?php  require( ThemeControlHelper::getLayoutPath( 'common/parts/head.tpl' ) );   ?>

<body class="<?php echo $class; ?> layout-<?php echo $template_layout; ?>">
  <div class="row-offcanvas row-offcanvas-left">
    <header id="header">
      <nav id="top">
        <div class="container">
          <?php echo $currency; ?>
          <?php echo $language; ?>
          <div id="top-links" class="nav pull-right">
            <ul class="list-inline">              
              <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs"><?php echo $text_account; ?></span> <span class="caret"></span></a>
                <ul class="dropdown-menu dropdown-menu-right">
                  <?php if ($logged) { ?>
                  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                  <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                  <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                  <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                  <?php } else { ?>
                  <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                  <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                  <?php } ?>
                </ul>
              </li>

              <li class="dropdown">
                <button type="button" class="btn-link dropdown-toggle setting" data-toggle="dropdown">
                  <span class="fa fa-cog"></span>
                  <span class="hidden-xs"><?php echo $objlang->get("text_setting");?></span>           
                  <i class="fa fa-caret-down"></i>  
                </button>
                <ul class="dropdown-menu dropdown-menu-right">
                  <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span></a></li>
                  <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span><?php echo $text_shopping_cart; ?></span></a></li>
                  <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span><?php echo $text_checkout; ?></span></a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <!-- Header Main -->
      <div id="header-main">
        <div class="container">
          <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 logo inner no-padding">
              <!-- LOGO -->
              <div class="logo text-center">
                <?php if( $logoType=='logo-theme'){ ?>
                <div id="logo-theme" class="logo-store">
                    <a href="<?php echo $home; ?>">
                        <span><?php echo $name; ?></span>
                    </a>
                </div>
                <?php } elseif ($logo) { ?>
                <div id="logo" class="logo-store pull-left"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" class="img-responsive" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
                <?php } ?>
              </div> 

              <!-- CART -->
              <div class="cart-top"><?php echo $cart; ?></div>   
            </div>
          </div>
        </div>
      </div>

      <!-- Mainmenu -->
      <div class="mainmenu navbar-mega-theme">
        <div class="container">
          <div class="row">
            <div class="inner">
            <?php  require( ThemeControlHelper::getLayoutPath( 'common/parts/mainmenu.tpl' ) );   ?>
            </div>
          </div>
        </div>
      </div>
</header><!-- /header -->

  <!-- sys-notification -->
  <div id="sys-notification">
    <div class="container">
      <div id="notification"></div>
    </div>
  </div>
  <!-- /sys-notification -->

  <?php
  /**
  * Showcase modules
  * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
  */
  //$modules = $helper->getCloneModulesInLayout( $blockid, $layoutID );
  $blockid = 'slideshow';
  $blockcls = "hidden-xs hidden-sm";
  $ospans = array(1=>12);
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
  ?>
  <?php
  /**
  * Showcase modules
  * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
  */
  $blockid = 'showcase';
  $blockcls = 'hidden-xs hidden-sm';
  $ospans = array(1=>12);
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
  ?>
  <?php
  /**
  * promotion modules
  * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
  */
  $blockid = 'promotion';
  $blockcls = "hidden-xs hidden-sm";
  $ospans = array(1=>12, 2=>12);
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
  ?>

<div class="maincols">