<?php

namespace App\Controllers;
 
class Pasien extends BaseController
{
    protected $chat,$jadwal,$tes,$riwayat,$dokter,$db;
    public function __construct() {
        $this->db = \Config\Database::connect();
        $this->chat = $this->db->table('chatbox');
        $this->jadwal = $this->db->table('jadwal');
        $this->tes = $this->db->table('tes');
        $this->riwayat = $this->db->table('riwayat');
        $this->dokter = $this->db->table('users');
    }
    public function index(): string
    {
        return view('pasien/beranda');
    }
    public function chat(): string
    {
        $this->chat->select('chatbox.id as cboxid, chat.id as cid, chatbox,  chat, dokter, pasien');
        $this->chat->join('chat' , 'chat.chatbox = chatbox.id');
        $query = $this->chat->get();
        $data['chats'] = $query->getResult();
        return view('pasien/chat', $data);
    }
    public function dokter(): string
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
            'users' => $search->where(['user_groups' => 'dokter'])->paginate(5, 'users'),
            'pager' => $model->pager,
            'current' => $current,
        ];
        return view('pasien/dokter', $data);
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
        $data = [
            'jadwal' => $search->where(['status' => 2])->paginate(5, 'jadwal'),
            'pager' => $model->pager,
            'current' => $current,
        ];
        return view('pasien/jadwal',$data);
    }
    public function riwayat(): string
    {
        $this->riwayat->select('*');
        $query = $this->riwayat->get();
        $data['riwayats'] = $query->getResult();
        return view('pasien/riwayat', $data);
    }
    public function tes(): string
    {
        $this->tes->select('tes.id as tid, pertanyaan, skor, jawaban, benar');
        $this->tes->join('jawaban','jawaban.id_pertanyaan = tes.id');
        $query = $this->tes->get();
        $data['tests'] = $query->getResult();
        return view('pasien/tes', $data);
    }
    public function tambahj($dokter)
    {
         $jadwal = new \App\Models\JadwalModel();
         $pasien = user()->username;
         $tanggal = date('Y-m-d');
         $jadwal->save([
        'dokter' => $dokter,
        'pasien' => $pasien,
        'tanggal' => $tanggal,
        'status' => 1 
        ]);
        session()->setFlashdata('pesan', 'permintaan telah terkirim');
        return redirect()->to('pasien/dokter');
    }
   
}
