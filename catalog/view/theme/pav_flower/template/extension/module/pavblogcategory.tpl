<div class="space-40 panel-default category">
	<div class="widget-heading panel-heading block-border"><h3 class="panel-title"><span><?php echo $heading_title?></span></h3></div>
	<div class="panel-body" id="pav-categorymenu">
		<?php echo $tree;?>
	</div>
 </div>
<style type="text/css">
	.head{
		display: none;
	}
</style>
<script>
$(document).ready(function(){
	// applying the settings
	// $("#pav-categorymenu li.active span.head").addClass("selected");
	// 	$('#pav-categorymenu ul').Accordion({
	// 		active: 'span.selected',
	// 		header: 'span.head',
	// 		alwaysOpen: false,
	// 		animated: true,
	// 		showSpeed: 400,
	// 		hideSpeed: 800,
	// 		event: 'click'
	// 	});

	// $("#pav-categorymenu ul.pav-category").addClass('list-group');
	// $("#pav-categorymenu ul.pav-category > li").addClass('list-group-item');
		
	});

</script>