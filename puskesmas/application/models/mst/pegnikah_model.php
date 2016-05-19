<?php
class Pegnikah_model extends CI_Model {

    var $tabel    = 'mst_peg_nikah';
	var $lang	  = '';

    function __construct() {
        parent::__construct();
		$this->lang	  = $this->config->item('language');
    }
    

    function get_data($start=0,$limit=999999,$options=array())
    {
		$this->db->order_by('kode','asc');
        $query = $this->db->get($this->tabel,$limit,$start);
        return $query->result();
    }

 	function get_data_row($kode){
		$data = array();
		$options = array('kode' => $kode);
		$query = $this->db->get_where($this->tabel,$options);
		if ($query->num_rows() > 0){
			$data = $query->row_array();
		}

		$query->free_result();    
		return $data;
	}

	public function getSelectedData($table,$data)
    {
        return $this->db->get_where($table, array('kode'=>$data));
    }

    function insert_entry()
    {
		$data['kode']=$this->input->post('kode');
		$data['value']=$this->input->post('value');

		if($this->getSelectedData($this->tabel,$data['kode'])->num_rows() > 0) {
			return 0;
		}else{
			if($this->db->insert($this->tabel, $data)){
			//$kode= mysql_insert_kode();
				return 1; 
			}else{
				return mysql_error();
			}
			
		}

    }

    function update_entry($kode)
    {
		$data['kode']=$this->input->post('kode');
		$data['value']=$this->input->post('value');

		if($this->db->update($this->tabel, $data, array("kode"=>$kode))){
			return true;
		}else{
			return mysql_error();
		}
    }

	function delete_entry($kode)
	{
		$this->db->where('kode',$kode);

		return $this->db->delete($this->tabel);
	}
}