<?php 

class Model_products extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	/* get the brand data */
	public function getProductData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM products where id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM products ORDER BY id DESC";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function getProductDataByCategory($id = null)
	{
		if($id) {
			$id = '%"'.$id.'"%';
			$sql = "SELECT * FROM products WHERE category_id LIKE ?";
			$query = $this->db->query($sql, array($id));
			return $query->result_array();
		}

		$sql = "SELECT * FROM products ORDER BY id DESC";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function getActiveProductData()
	{
		$sql = "SELECT * FROM products WHERE availability = ? ORDER BY id DESC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	public function getQtyProductBySku($sku)
	{
		if ($sku){
			$sql = "SELECT * FROM products WHERE sku = ? ORDER BY id DESC";
			$query = $this->db->query($sql, array($sku));
			return $query->num_rows();
		}
	}

	public function getQtyProductById($id)
	{
		if ($id){
			$sql = "SELECT * FROM products where id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->num_rows();
		}
	}

	public function getProductBySku($sku)
	{
		if ($sku){
			$sql = "SELECT * FROM products WHERE sku = ? ORDER BY id DESC";
			$query = $this->db->query($sql, array($sku));
			return $query->row_array();
		}

		return null;
	}

	public function getProductById($id)
	{
		if ($id){
			$sql = "SELECT * FROM products WHERE id = ? ";
			$query = $this->db->query($sql, array($id));
			return $query->result_array();
		}

		return null;
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('products', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('products', $data);
			return ($update == true) ? true : false;
		}
	}

	public function updatebysku($data, $sku)
	{
		if($data && $sku) {
			$this->db->where('sku', $sku);
			$update = $this->db->update('products', $data);
			return ($update == true) ? true : false;
		}
	}

	public function updatebyid($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('products', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('products');
			return ($delete == true) ? true : false;
		}
	}

	public function countTotalProducts()
	{
		$sql = "SELECT * FROM products";
		$query = $this->db->query($sql);
		return $query->num_rows();
	}

}