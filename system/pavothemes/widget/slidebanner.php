<?php 
/******************************************************
 *  Leo Opencart Theme Framework for Opencart 1.5.x
 *
 * @package   leotempcp
 * @version   3.0
 * @author    http://www.leotheme.com
 * @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>
 *               <info@leotheme.com>.All rights reserved.
 * @license   GNU General Public License version 2
 * ******************************************************/

class PtsWidgetSlidebanner extends PtsWidgetPageBuilder {

		public $name = 'slidebanner';

		public  static function getWidgetInfo(){
			return array( 'label' => 'Banner Slide', 'explain' => 'Banner Slide', 'group' => 'others'  );
		}

		public static function renderButton(){

		}

		public function renderForm( $args, $data ){

			$helper = $this->getFormHelper();

			$this->fields_form[1]['form'] = array(
	            'legend' => array(
	                'title' => $this->l('Widget Form.'),
	            ),
	            'input' => array(
	            	array(
	                    'type'  => 'text',
	                    'label' => $this->l('Image Width'),
	                    'name'  => 'image_width',
	                    'default'=> '',
	                    'desc'	=> $this->l('')
	                ),

	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Image Height'),
	                    'name'  => 'image_height',
	                    'default'=> '',
	                    'desc'	=> $this->l('')
	                ),

	                 array(
	                    'type'  => 'text',
	                    'label' => $this->l('Item /  Page'),
	                    'name'  => 'item',
	                    'default'=> '',
	                    'desc'	=> $this->l('')
	                ),

	                array(
	                    'type'  => 'banner_image',
	                    'label' => $this->l(''),
	                    'name'  => 'banner_image',
	                    'default'=> '',
	                    'desc'	=> $this->l('')
	                )
	            ),

	            'banner_image' => true,

	      		'submit' => array(
	                'title' => $this->l('Save'),
	                'class' => 'button'
           		)
	        );
		 	$default_lang = (int)$this->config->get('config_language_id');

			$helper->tpl_vars = array(
	                'fields_value' => $this->getConfigFieldsValues( $data  ),
	                'id_language' => $default_lang
        	);  
			return  $helper->generateFormLink( $this->fields_form );

		}

		public function renderContent( $args, $setting ){
			$t  = array(
				'name'=> '',
				'show_title'=> '',
				'addition_cls'=> '',
				'item' => 4,
				'image_width' => 100,
				'image_height' => 100
			);

			$setting = array_merge( $t, $setting );
			$languageID = $this->config->get('config_language_id');
			$setting['heading_title'] = isset($setting['widget_title_'.$languageID])?$setting['widget_title_'.$languageID]:'';

	 		$setting['id'] = rand();
	 	 	$setting['banner_images'] = array();

	 	 	$banner_images = $setting['banner_image'];

	 	 	usort($banner_images, function($a, $b) { return $a['sort_order'] - $b['sort_order']; });

	 	 	foreach ($banner_images as $banner_image) {
	 	 		try {
	 	 			$_title = explode("|", $banner_image['banner_image_description'][$languageID]['title']);
	 	 			$name_button = isset($_title[0]) ? $_title[0] : "";
	 	 			$name_info = isset($_title[1]) ? $_title[1] : "";
	 	 		} catch (Exception $e) {
	 	 			die("Error widget banner slider.");
	 	 		}

	 	 		$setting['banner_images'][] = array(
	 	 			'name_button' => $name_button,
	 	 			'name_info' => $name_info,
	 	 			'link' 	=> $banner_image['link'],
	 	 			'image' => $this->model_tool_image->resize($banner_image['image'], $setting['image_width'], $setting['image_height'])
	 	 		);

	 	 	}

			$output = array('type'=>'slidebanner','data' => $setting );
	  		return $output;

		}
 
	}
?>