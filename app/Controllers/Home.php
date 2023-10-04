<?php

namespace App\Controllers;
use Myth\Auth\Config\Auth as AuthConfig;

class Home extends BaseController
{
    protected $db, $user;
    public function __construct() {
        $this->db = \Config\Database::connect();
        $this->user = $this->db->table('users');
    }
    public function index(): string
    {
            if (in_groups('admin')) {
            $this->user->select('users.id as uid, username, email, user_groups');            
            $query = $this->user->get();
            $data['users'] = $query->getResult();
            return view('admin/beranda', $data);

        } else if (in_groups('dokter')) {

            return view('dokter/beranda');

        } else if (in_groups('pasien')) {

            return view('pasien/beranda');

        }    
    else{
            $config = config('Auth');
            return view('auth/login', ['config' => $config]);
        }
        
    }

    public function edit(): string{
        return view('edit');
    }
}
