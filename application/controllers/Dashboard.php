<?php 

class Dashboard extends Admin_Controller 
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Dashboard';
		
		$this->load->model('model_products');
		$this->load->model('model_orders');
		$this->load->model('model_users');
        $this->load->model('model_stores');
		$this->load->model('model_attributes');
	}

	/* 
	* It only redirects to the manage category page
	* It passes the total product, total paid orders, total users, and total stores information
	into the frontend.
	*/
	public function index()
	{
		$this->data['total_products'] = $this->model_products->countTotalProducts();
		$this->data['total_paid_orders'] = $this->model_orders->countTotalPaidOrders();
		$this->data['total_users'] = $this->model_users->countTotalUsers();
		$this->data['total_stores'] = $this->model_stores->countTotalStores();

		$user_id = $this->session->userdata('id');
        $is_admin = ($user_id == 1) ? true :false;
        
        $this->data['products'] = $this->model_products->getActiveProductData();      	
        $this->data['is_admin'] = $is_admin;
		$this->render_template('dashboard', $this->data);
    }
    
    public function getbysku()
    {
        $result = array('data' => array());
        $product_sku = $this->input->post('skucreate');
        $data = $this->model_products->getProductBySku($product_sku);

        echo json_encode($data);
    }

	public function updatebysku()
	{      

        if(!in_array('updateProduct', $this->permission)) {
            redirect('dashboard', 'refresh');
        }
        
        $this->form_validation->set_rules('skucreate', 'SKU', 'trim|required');
        $this->form_validation->set_rules('qtycreate', 'Qty', 'trim|required');
        
        if ($this->form_validation->run() == TRUE) {
            // true case
            $product_sku = $this->input->post('skucreate');
            $numrows = $this->model_products->getQtyProductBySku($product_sku);
            if ($numrows==1){
                $databysku = $this->model_products->getProductBySku($product_sku);
                foreach ($databysku as $key => $value) {
                    $newqty = (string)(((int)$this->input->post('qtycreate')) + ((int) $value['qty']));
                    $data = array(
                        'qty' => $newqty,
                    );
                    
                    $update = $this->model_products->updatebysku($data, $product_sku);
                    if($update == true) {
                        $this->session->set_flashdata('successsku', 'Successfully updated');
                        redirect('dashboard/', 'refresh');
                    }
                    else {
                        $this->session->set_flashdata('successsku', FALSE);
                        $this->session->set_flashdata('errorsku', 'Ha ocurrido un error inesperado');
                        redirect('products/' , 'refresh');
                    }
                }
            } else {
                $this->session->set_flashdata('successsku', FALSE);
                $this->session->set_flashdata('errorsku', 'El producto no coincide con ninguno guardado!');
                redirect('dashboard/' , 'refresh');
            }
            
        }
        else {
            $this->session->set_flashdata('successsku', FALSE);
            $this->session->set_flashdata('errorsku', 'Los valores ingresados están mal escritos');
            redirect('dashboard/' , 'refresh');
        }   
    }

    /*
	* It gets the all the active product inforamtion from the product table 
	* This function is used in the order page, for the product selection in the table
	* The response is return on the json format.
	*/
	public function getTableProductRow()
	{
		$products = $this->model_products->getActiveProductData();
		echo json_encode($products);
	}
    
    public function substractbysku($id, $qty)
	{      

        if(!in_array('updateProduct', $this->permission)) {
            redirect('dashboard', 'refresh');
        }
        
          
    }
    
    public function multsubstract()
    {
        $count_product = count($this->input->post('namedelete')) -1 ;
    	for($x = 0; $x < $count_product; $x++) {
            $id = $this->input->post('namedelete')[$x];
            $qty = $this->input->post('qtydelete')[$x];
            if ($id!="") {
                // true case
                $product_id = $id;
                $numrows = $this->model_products->getQtyProductById($product_id);
                if ($numrows==1){
                    $databysku = $this->model_products->getProductData($product_id);
                    foreach ($databysku as $key => $value) {
                        if ((((int) $value['qty']) - ((int)$qty)) < 0) {
                            $this->session->set_flashdata('successsku2', FALSE);
                            $this->session->set_flashdata('errorsku2', 'No hay stock suficiente!');
                            redirect('dashboard/' , 'refresh');
                        } else {
                            $newqty = (string)(((int) $value['qty']) - ((int)$qty));
                            $data = array(
                                'qty' => $newqty,
                            );
                            
                            $update = $this->model_products->updatebysku($data, $product_sku);
                            if($update == true) {
                                $this->session->set_flashdata('successsku2', 'Successfully updated');
                            }
                            else {
                                $this->session->set_flashdata('successsku2', FALSE);
                                $this->session->set_flashdata('errorsku2', 'Ha ocurrido un error inesperado');
                                redirect('dashboard/' , 'refresh');
                            }
                        }
                    }
                } else {
                    $this->session->set_flashdata('successsku2', FALSE);
                    $this->session->set_flashdata('errorsku2', 'Un producto no coincide con ninguno guardado!');
                    redirect('dashboard/' , 'refresh');
                }
                
            }
            else {
                $this->session->set_flashdata('successsku2', FALSE);
                $this->session->set_flashdata('errorsku2', 'Los valores ingresados están mal escritos');
                redirect('dashboard/' , 'refresh');
            } 
        }
    }
}