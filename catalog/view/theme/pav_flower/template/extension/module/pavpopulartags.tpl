<?php
/******************************************************
 * @package  : Pav Popular tags module for Opencart 1.5.x
 * @version  : 1.0
 * @author   : http://www.pavothemes.com
 * @copyright: Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license  : GNU General Public License version 1
*******************************************************/
?>

<div class="box pavpopulartag panel-default <?php echo $prefix; ?> space-40">
	<div class="widget-heading panel-heading block-border"><h3 class="panel-title"><span><?php echo $heading_title?></span></h3></div>
	<div class="box-content">
		<?php if($data) { ?>
			<?php echo $data; ?>
		<?php } else { ?>
			<?php echo $text_notags; ?>
		<?php } ?>
	</div>
</div>
