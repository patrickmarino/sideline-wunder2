<?php if (!count($languages) > 1) { ?>
<div class="pull-right">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
    <div class="box-language btn-group">
      <button class="btn-link dropdown-toggle" data-toggle="dropdown">
        <?php foreach ($languages as $language) { ?>
        <?php if ($language['code'] == $code) { ?>
        <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
        <?php } ?>
        <?php } ?>
        <span class="hidden-xs"><?php echo $text_language; ?></span> <i class="fa fa-caret-down"></i>
      </button>

      <?php foreach ($languages as $language) { ?>
        <?php if ($language['code'] == $code) { ?>
        <img class="hidden" src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
        <?php } ?>
      <?php } ?>
      <ul class="list-unstyled dropdown-menu dropdown-menu-right">
        <?php foreach ($languages as $language) { ?>
        
        <li><button class="language-select" type="button" name="<?php echo $language['code']; ?>"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></button></li>
        
        <?php } ?>
      </ul>
      <input type="hidden" name="code" value="" />
      <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </div>
  </form>
</div>
<?php } ?>
