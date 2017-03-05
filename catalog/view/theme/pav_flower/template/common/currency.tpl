<?php if (!count($currencies) > 1) { ?>
<div class="pull-right">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
        <div class="box-currency">
            <div class="btn-group">  
                <button class="btn-link dropdown-toggle" data-toggle="dropdown">
                    <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
                    <strong><?php echo $currency['symbol_left']; ?></strong>
                    <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
                    <strong><?php echo $currency['symbol_right']; ?></strong>
                    <?php } ?>
                    <?php } ?>
                    <span class="hidden-xs"><?php echo $text_currency; ?></span> <i class="fa fa-caret-down"></i>
                </button>

                <ul class="dropdown-menu dropdown-menu-right">
                    <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['symbol_left']) { ?>
                    <li><button class="currency-select" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></button></li>
                    <?php } else { ?>
                    <li><button class="currency-select" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></button></li>
                    <?php } ?>
                    <?php } ?>
                </ul>
            </div>
           
            <input type="hidden" name="code" value="" />
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        </div>
    </form>
</div>
<?php } ?>