<?php  

namespace App\Controllers;
use Myth\Auth\Entities\User;
use CodeIgniter\Controller;
use CodeIgniter\Session\Session;
use Myth\Auth\Config\Auth as AuthConfig;
use Myth\Auth\Models\UserModel;

class Admin extends BaseController
{
    protected $auth;
    protected $config;
    protected $session;
    protected $db, $user;
    public function __construct() {
        $this->db = \Config\Database::connect();
        $this->user = $this->db->table('users');
        $this->session = service('session');
        $this->config = config('Auth');
        $this->auth   = service('authentication');
    }
    public function index(): string
    {
        $this->user->select('users.id as uid, username, email, user_groups');
        $query = $this->user->get();
        $data['users'] = $query->getResult(); 
        return view('admin/beranda', $data);
    }
    public function edok(): string
    {
        $model = new \Myth\Auth\Models\UserModel();
        $keyword = $this->request->getVar('keyword');
        if ($keyword){
            $search = $model->search($keyword);
        } else {
            $search = $model;
        }
        $current = $this->request->getVar('page_users') ? $this->request->getVar('page_users') : 1;
        
        $data = [
            'users' => $search->where(['user_groups' => 'dokter'])->paginate(5, 'users'),
            'pager' => $model->pager,
            'current' => $current,
        ];

        return view('admin/editdokter', $data);
    }
    public function epas(): string
    {
        $model = new \Myth\Auth\Models\UserModel();
        $keyword = $this->request->getVar('keyword');
        if ($keyword){
            $search = $model->search($keyword);
        } else {
            $search = $model;
        }
        $current = $this->request->getVar('page_users') ? $this->request->getVar('page_users') : 1;
        
        $data = [
            'users' => $search->where(['user_groups' => 'pasien'])->paginate(5, 'users'),
            'pager' => $model->pager,
            'current' => $current,
        ]; 

        return view('admin/editpasien', $data);
    }

    public function tambah()
    {
        return view('admin/tambah');
    }

    public function savetambah() {
    // Check if registration is allowed
        if (! $this->config->allowRegistration) {
            return redirect()->back()->withInput()->with('error', lang('Auth.registerDisabled'));
        }

        $users = model(UserModel::class);

        // Validate basics first since some password rules rely on these fields
        $rules = config('Validation')->registrationRules ?? [
            'username' => 'required|alpha_numeric_space|min_length[3]|max_length[30]|is_unique[users.username]',
            'email'    => 'required|valid_email|is_unique[users.email]',
        ];

        if (! $this->validate($rules)) {
            return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
        }

        // Validate passwords since they can only be validated properly here
        $rules = [
            'password'     => 'required|strong_password',
        ];

        if (! $this->validate($rules)) {
            return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
        }
 
        // Save the user
        $allowedPostFields = array_merge(['password'], $this->config->validFields, $this->config->personalFields);
        $user              = new User($this->request->getPost($allowedPostFields));

        $this->config->requireActivation === null ? $user->activate() : $user->generateActivateHash();

        // Ensure users group
        $u_group = $this->request->getVar('user_groups');
        $users = $users->withGroup($u_group);

        if (! $users->save($user)) {
            return redirect()->back()->withInput()->with('errors', $users->errors());
        }

        if ($this->config->requireActivation !== null) {
            $activator = service('activator');
            $sent      = $activator->send($user);

            if (! $sent) {
                return redirect()->back()->withInput()->with('error', $activator->error() ?? lang('Auth.unknownError'));
            }

            // Success!
            return redirect()->route('login')->with('message', lang('Auth.activationSuccess'));
        }

        // Success!
        session()->setFlashdata('pesan', 'user berhasil ditambahkan');
        return redirect()->to('admin/');
    }

    public function edit($idu) {

        $model = new \Myth\Auth\Models\UserModel();
        $data = [
            'users' => $model->where('id',$idu)->findAll()
        ];
        return view('admin/ubah', $data);
    }

    public function saveedit($idu) {
        $model = new \Myth\Auth\Models\UserModel();
        $data = [
        'username' => $this->request->getVar('username'),
        'email' => $this->request->getVar('email'),
        'user_groups' => $this->request->getVar('user_groups'),
        ];
        $model->update($idu, $data);
        session()->setFlashdata('pesan', 'user berhasil diubah');
        return redirect()->to('admin/');
    }

    public function deletepas($id){ 
        $model = new \Myth\Auth\Models\UserModel();
        $jadwal = new \App\Models\JadwalModel();
        $user = $model->find($id);
        $pasien = $user->username;
        $num = $jadwal->where(['pasien' => $pasien])->findAll();
        foreach ($num as $n) {
        $data[] = $n['id'];
        if ($data != null) {
        $jadwal->where('id',$data[$n])->delete();
        }}
        $model->delete($id);
        session()->setFlashdata('pesan', 'user telah dihapus');
        return redirect()->to('admin/pasien');
    }

    public function deletedok($id){
        $model = new \Myth\Auth\Models\UserModel();
        $jadwal = new \App\Models\JadwalModel();
        $user = $model->find($id);
        $dokter = $user->username;
        $num = $jadwal->where(['dokter' => $dokter])->findAll();
        foreach ($num as $n) {
        $data[] = $n['id'];
        if ($data != null) {
        $jadwal->where('id',$data[$n])->delete();
        }}
        $model->delete($id);
        session()->setFlashdata('pesan', 'user telah dihapus');
        return redirect()->to('admin/dokter');
    }
}
