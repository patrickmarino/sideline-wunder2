<div class="filter clearfix products-filter-panel">
  <div class="order-sort clearfix pull-left">
    <div class="group-text pull-left">
      <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
    </div>
    <div class="select-wrap pull-left">
      <select id="input-sort" class="form-control input-sm" onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
    </select>
    </div>
  </div>
  <div class="limt-items clearfix pull-left">
    <div class="pull-left">
      <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
    </div>
    <div class="select-wrap pull-left">
      <select id="input-limit" class="form-control input-sm pull-left" onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  <div class="compare pull-left">
    <a href="<?php echo $compare; ?>" id="compare-total" class="btn-link"><?php echo $text_compare; ?></a>
  </div>
  <div class="btn-group display pull-right group-switch hidden-xs">
      <button type="button" id="grid-view" class="btn btn-switch active" data-toggle="tooltip" title="<?php echo $button_grid; ?>">
          <i class="fa fa-th"></i>
        </button>
        <button type="button" id="list-view" class="btn btn-switch" data-toggle="tooltip" title="<?php echo $button_list; ?>">
          <i class="fa fa-list"></i>
        </button>
  </div>
</div>
