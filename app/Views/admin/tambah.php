<?= $this->extend('template/admin'); ?>

<?= $this->section('page-content'); ?> 
 <div class="container-fluid">
 
    <h5 class="text-center">
  <strong class="text-primary mb-2">Tambah Data User</strong>
</h5>
    <?= view('Myth\Auth\Views\_message_block') ?>
    <form action="<?= base_url('/admin/tambah'); ?>" method="post" class="mb-4">
    <?= csrf_field(); ?>
  <div class="form-group row">
    <label for="username" class="col-sm-2 col-form-label">Username</label>
    <div class="col-sm-10">
      <input type="text" class="form-control <?php if (session('errors.username')) : ?>is-invalid<?php endif ?>" id="username" name="username" placeholder="masukkan username">
    </div>
  </div>
  <div class="form-group row">
    <label for="email" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="text" class="form-control <?php if (session('errors.email')) : ?>is-invalid<?php endif ?>" id="email" name="email" placeholder="masukkan email">
    </div>
  </div>
  <div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control <?php if (session('errors.password')) : ?>is-invalid<?php endif ?>" id="password" name="password" placeholder="masukkan password">
    </div>
  </div>
  <div class="form-group row">
    <label for="user_groups" class="col-sm-2 col-form-label">Role</label>
    <div class="col-sm-10 mb-2">
    <select class="form-select form-select-sm" aria-label="role" id="user_groups" name="user_groups">
    <option selected></option>
    <option value="dokter">dokter</option>
    <option value="pasien">pasien</option>
    </select>
  </div>
  </div>
  <div class="form-group row">
    <button type="submit" class="btn btn-success">Simpan</button>
  </div>
</form>

<?= $this->endSection(); ?>