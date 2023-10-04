<?= $this->extend('template/admin'); ?>

<?= $this->section('page-content'); ?>
 <div class="container-fluid">
 
    <h5 class="text-center">
  <strong class="text-primary mb-2">Edit Data User</strong>
</h5>
  <?php foreach ($users as $u) : ?>
    <form action="/admin/ubah/<?= $u->id; ?>" method="post" class="mb-4">
    <?= csrf_field(); ?>
  <div class="form-group row">
    <label for="username" class="col-sm-2 col-form-label">Username</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="username" name="username" placeholder="masukkan username" value="<?= $u->username; ?>">
    </div>
  </div>
  <div class="form-group row">
    <label for="email" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="email" name="email" placeholder="masukkan email" value="<?= $u->email; ?>">
    </div>
  </div>
  <div class="form-group row">
    <label for="user_groups" class="col-sm-2 col-form-label">Role</label>
    <div class="col-sm-10 mb-2">
    <select class="form-select form-select-sm" aria-label="user_groups" id="user_groups" name="user_groups">
    <option selected><?= $u->user_groups; ?></option>
    <option value="dokter">dokter</option>
    <option value="pasien">pasien</option>
    </select>
  </div>
  </div>
  <div class="form-group row">
    <a href="<?= base_url('admin/'); ?>" class="btn btn-danger mr-3">Batal</a>
    <button type="submit" class="btn btn-success">Simpan</button>
  </div>
</form>
<?php endforeach; ?>

<?= $this->endSection(); ?>