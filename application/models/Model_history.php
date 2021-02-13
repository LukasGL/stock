<?php 

class Model_history extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	/* get the brand data */
	public function getHistoryData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM history where id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM history ORDER BY date DESC";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

  public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('history', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('history', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('history');
			return ($delete == true) ? true : false;
		}
	}

	public function countTotalHistory()
	{
		$sql = "SELECT * FROM history";
		$query = $this->db->query($sql);
		return $query->num_rows();
	}

}