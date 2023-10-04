<?php 
 
namespace App\Controllers;

class Dokter extends BaseController
{
    protected $chat,$jadwal,$pasien,$db;
    public function __construct() {
        $this->db = \Config\Database::connect();
        $this->chat = $this->db->table('chatbox');
        $this->jadwal = $this->db->table('jadwal');
        $this->pasien = $this->db->table('users');
    }
    public function index(): string
    { 
        return view('dokter/beranda');
    }
    public function chat(): string
    {
        $this->chat->select('chatbox.id as cboxid, chat.id as cid, chatbox,  chat, dokter, pasien');
        $this->chat->join('chat' , 'chat.chatbox = chatbox.id');
        $query = $this->chat->get();
        $data['chats'] = $query->getResult();
        return view('dokter/chat', $data);
    } 
    public function jadwal(): string
    {
        $model = new \App\Models\JadwalModel();
        $keyword = $this->request->getVar('keyword');
        if ($keyword){
            $search = $model->searchjadwal($keyword);
        } else {
            $search = $model;
        }
        $current = $this->request->getVar('page_users') ? $this->request->getVar('page_users') : 1;
        $user = user()->username;
        $data = [
            'jadwal' => $search->where(['dokter' => $user])->paginate(5, 'jadwal'),
            'pager' => $model->pager,
            'current' => $current, 
        ];
        return view('dokter/jadwal', $data);
    }
    public function pasien(): string
    {
        $model = new \Myth\Auth\Models\UserModel();
        $keyword = $this->request->getVar('keyword');
        if ($keyword){
            $search = $model->searchuser($keyword);
        } else {
            $search = $model;
        }
        $current = $this->request->getVar('page_users') ? $this->request->getVar('page_users') : 1;
        $data = [
            'users' => $search->where(['user_groups' => 'pasien'])->paginate(5, 'users'),
            'pager' => $model->pager,
            'current' => $current,
        ];
        return view('dokter/pasien', $data);
    }
    public function delete($idj){
        $jadwal = new \App\Models\JadwalModel();
        $jadwal->delete($idj);
        session()->setFlashdata('pesan', 'data telah dihapus');
        return redirect()->to('dokter/jadwal');
    }
    public function terima($idj)
    {
        $jadwal = new \App\Models\JadwalModel();
        $data = [
        'status' => 2
         ];
        $jadwal->update($idj, $data);
        session()->setFlashdata('pesan', 'permintaan telah diterima');
        return redirect()->to('dokter/jadwal'); 
    }
}
