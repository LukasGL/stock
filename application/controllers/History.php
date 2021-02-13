<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class History extends Admin_Controller 
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Historial';

		$this->load->model('model_products');
    $this->load->model('model_history');
		$this->load->model('model_brands');
		$this->load->model('model_category');
		$this->load->model('model_stores');
		$this->load->model('model_attributes');
	}

    /* 
    * It only redirects to the manage product page
    */
	public function index()
	{
        if(!in_array('viewProduct', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

		$this->render_template('history/index', $this->data);	
	}

    /*
    * It Fetches the history data from the product table 
    * this function is called from the datatable ajax function
    */
	public function fetchHistoryData()
	{
		$result = array('data' => array());

		$data = $this->model_history->getHistoryData();

		foreach ($data as $key => $value) {

			// button
            $buttons = '';
            if(in_array('updateProduct', $this->permission)) { 
    			$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].','. $value['id_product'].','.$value['qtybefore'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
            }
			
            $numtotal = (int) $value['qtyafter'] - (int) $value['qtybefore'];
			
            if ($numtotal>0){
              $numtotal = '<span class="label label-success">+'.$numtotal.'</span>';
            } else if ($numtotal<0){
              $numtotal = '<span class="label label-danger">'.$numtotal.'</span>';
            }
            

            //$qty_status = '';
            //if($value['qty'] <= 10) {
              //  $qty_status = '<span class="label label-warning">Low !</span>';
            //} else if($value['qty'] <= 0) {
              //  $qty_status = '<span class="label label-danger">Out of stock !</span>';
            //}


			$result['data'][$key] = array(
        $value['id'],
				$value['sku'],
				$value['name'],
                $value['qtybefore'] ,
                $value['qtyafter'] ,
                $numtotal ,
				$value["date"],
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}	

    /*
    * If the validation is not valid, then it redirects to the edit product page 
    * If the validation is successfully then it updates the data into the database 
    * and it stores the operation message into the session flashdata and display on the manage product page
    */
	public function undo()
	{      
        if(!in_array('updateProduct', $this->permission)) {
            redirect('dashboard', 'refresh');
        }
        
        if (TRUE) {
            // true case
            $product_id = $this->input->post('product_id');
            $history_id = $this->input->post('history_id');
            $newqty = $this->input->post('qtybefore');
            $data = array(
              'qty' => $newqty,
            );

            
            $update = $this->model_products->update($data, $product_id);
            $this->remove($history_id);
            if($update == true) {
                $this->session->set_flashdata('success', 'Successfully updated');
                redirect('history/', 'refresh');
            }
            else {
                $this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('history/', 'refresh');
            }
        }
        else {
          $this->session->set_flashdata('errors', 'Error occurred!!');
          redirect('history/', 'refresh'); 
        }   
	}

    

    /*
    * It removes the data from the database
    * and it returns the response into the json format
    */
	public function remove($history_id)
	{
        if(!in_array('updateProduct', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

        $response = array();
        if($history_id) {
            $delete = $this->model_history->remove($history_id);
            if($delete == true) {
                $response['success'] = true;
                $response['messages'] = "Successfully removed"; 
            }
            else {
                $response['success'] = false;
                $response['messages'] = "Error in the database while removing the product information";
            }
        }
        else {
            $response['success'] = false;
            $response['messages'] = "Refersh the page again!!";
        }

        echo json_encode($response);
	}

}