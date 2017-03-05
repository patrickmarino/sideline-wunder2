<!-- ACCORDION INFOR -->
<div class="accordion collapse-right space-margin-tb-60">
        <div id="accordion-v5">
                
                <div class="panel panel-default first">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion-v5" href="#collapse-v5-description">
                                <?php echo $tab_description; ?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse-v5-description" class="panel-collapse collapse active in">
                        <div class="panel-body">
                            <?php echo $description; ?>
                        </div>    
                    </div>        
                </div>
                <?php if ($attribute_groups) { ?>
                <div class="panel">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" class="collapsed" data-parent="#accordion-v5" href="#collapse-v5-attribute_groups">
                                <?php echo $tab_attribute; ?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse-v5-attribute_groups" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table table-bordered">
                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                    <thead>
                                        <tr>
                                            <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                            <tr>
                                                <td><?php echo $attribute['name']; ?></td>
                                                <td><?php echo $attribute['text']; ?></td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                <?php } ?>
                            </table>
                        </div>    
                    </div>        
                </div>
                <?php } ?>
                 <?php if ($review_status) { ?>
                 <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion-v5" class="collapsed" href="#collapse-v5-tab_review">
                                <?php echo $tab_review; ?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse-v5-tab_review" class="panel-collapse collapse">
                        <div class="panel-body">
                             <div id="review"></div>
                                <p> <a href="#review-form"  class="popup-with-form btn btn-primary" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;" ><?php echo $text_write; ?></a></p>

                               <div class="hide"> <div id="review-form" class="panel review-form-width"><div class="panel-body">
                                <form class="form-horizontal ">
                                 
                                    <h2><?php echo $text_write; ?></h2>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                            <input type="text" name="name" value="" id="input-name" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                            <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                            <div class="help-block"><?php echo $text_note; ?></div>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <label class="control-label"><?php echo $entry_rating; ?></label>
                                            &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                            <input type="radio" name="rating" value="1" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="2" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="3" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="4" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="5" />
                                            &nbsp;<?php echo $entry_good; ?></div>
                                    </div>
                                    <?php echo $captcha; ?>
                                    <div class="buttons">
                                        <div class="pull-right">
                                            <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                                        </div>
                                    </div>
                                </form></div></div></div>
                        </div>    
                    </div>        
                </div>
                 <?php  } ?>
                  <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <?php if( $productConfig['enable_product_customtab'] && isset($productConfig['product_customtab_name'][$languageID]) ) { ?>
                            <a data-toggle="collapse" data-parent="#accordion-v5" class="collapsed" href="#collapse-v5-customtab">
                                <?php echo $productConfig['product_customtab_name'][$languageID]; ?>
                            </a>
                            <?php } ?>
                        </h4>
                    </div>
                    <div id="collapse-v5-customtab" class="panel-collapse collapse">
                    
                        <div class="panel-body">
                            <?php if( $productConfig['enable_product_customtab'] && isset($productConfig['product_customtab_content'][$languageID]) ) { ?>
                            <?php echo html_entity_decode( $productConfig['product_customtab_content'][$languageID], ENT_QUOTES, 'UTF-8'); ?>
                            <?php } ?> 
                        </div>    
                    </div>        
                </div>

        </div>
</div>


<!-- ACCORDION INFOR -->