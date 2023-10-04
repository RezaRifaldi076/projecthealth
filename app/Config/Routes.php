<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */


//$routes->get('admin/', 'UserController::index', ['filter' => 'role:admin'])
//$routes->get('dokter/', 'UserController::index', ['filter' => 'role:dokter'])
//$routes->get('pasien/', 'UserController::index', ['filter' => 'role:pasien'])


$routes->get('/', 'Home::index'); 
//$routes->post('/', 'Home::index');
$routes->get('/editprofil', 'Home::edit');

//route admin
 
$routes->get('admin/', 'Admin::index', ['filter' => 'role:admin']);
$routes->get('admin/dokter', 'Admin::edok', ['filter' => 'role:admin']);
$routes->post('admin/dokter', 'Admin::edok', ['filter' => 'role:admin']);
$routes->get('admin/pasien', 'Admin::epas', ['filter' => 'role:admin']);
$routes->post('admin/pasien', 'Admin::epas', ['filter' => 'role:admin']);
$routes->get('admin/tambah', 'Admin::tambah', ['filter' => 'role:admin']);
$routes->post('admin/tambah', 'Admin::savetambah', ['filter' => 'role:admin']);
$routes->get('admin/ubah/(:num)', 'Admin::edit/$1', ['filter' => 'role:admin']);
$routes->post('admin/ubah/(:num)', 'Admin::saveedit/$1', ['filter' => 'role:admin']);
$routes->delete('admin/hapusp/(:num)', 'Admin::deletepas/$1', ['filter => role:admin']);
$routes->delete('admin/hapusd/(:num)', 'Admin::deletedok/$1', ['filter => role:admin']);

//route dokter
 
$routes->get('dokter/', 'Dokter::index', ['filter' => 'role:dokter']);
$routes->get('dokter/chat', 'Dokter::chat', ['filter' => 'role:dokter']);
$routes->get('dokter/jadwal', 'Dokter::jadwal', ['filter' => 'role:dokter']);
$routes->post('dokter/jadwal', 'Dokter::jadwal', ['filter' => 'role:dokter']);
$routes->delete('dokter/hapusj/(:num)', 'Dokter::delete/$1', ['filter' => 'role:dokter']);
$routes->post('dokter/tambahj/(:num)', 'Dokter::terima/$1', ['filter' => 'role:dokter']); 
$routes->get('dokter/pasien', 'Dokter::pasien', ['filter' => 'role:dokter']);
$routes->post('dokter/pasien', 'Dokter::pasien', ['filter' => 'role:dokter']);

//route pasien

$routes->get('pasien/', 'Pasien::index', ['filter' => 'role:pasien']);
$routes->get('pasien/chat', 'Pasien::chat', ['filter' => 'role:pasien']);
$routes->get('pasien/dokter', 'Pasien::dokter', ['filter' => 'role:pasien']);
$routes->post('pasien/dokter', 'Pasien::dokter', ['filter' => 'role:pasien']);
$routes->post('pasien/tambahj/(:any)', 'Pasien::tambahj/$1', ['filter' => 'role:pasien']);
$routes->get('pasien/jadwal', 'Pasien::jadwal', ['filter' => 'role:pasien']);
$routes->post('pasien/jadwal', 'Pasien::jadwal', ['filter' => 'role:pasien']);
$routes->get('pasien/riwayat', 'Pasien::riwayat', ['filter' => 'role:pasien']);
$routes->get('pasien/tes', 'Pasien::tes', ['filter' => 'role:pasien']);
