<?= $this->extend('template/admin'); ?>

<?= $this->section('page-content'); ?>
 <div class="container-fluid">
<div class="row">
  <div class="col"> 
    <h4 class="">
  <strong class="text-primary mb-2">Daftar Dokter</strong>
    </h4>
    <form action="" method="post">
      <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="Masukkan Keyword" name="keyword">
      <button class="btn btn-outline-primary" type="submit" id="button-addon2" name="submit">Cari</button>
    </div>
    </form>
  </div>
</div>

<?php if (session()->getFlashdata('pesan')) : ?>
<div class="alert alert-success" role="alert">
  <?= session()->getFlashdata('pesan'); ?>
</div> 
<?php endif; ?>

<?php $i = 0 + (5 * ($current -1)); ?>
<!-- Tabel -->
<div class="table-responsive">
  <table class="table">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">Username</th>
      <th scope="col">Email</th>
      <th scope="col">Role</th>
      <th scope="col">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    <?php foreach ($users as $u) : ?>
    <?php if ($u->user_groups == 'dokter') : ?>
    <?php $i++; ?>
      <th scope="row"><?= $i; ?></th>
      <td><?= $u->username; ?></td>
      <td><?= $u->email; ?></td>
      <td><?= $u->user_groups; ?></td>
      <td>
        <form action="hapusd/<?= $u->id; ?>" method="post" class="d-inline">
          <?= csrf_field(); ?>
          <input type="hidden" name="_method" value="DELETE">
          <button class="btn btn-danger" type="submit" onclick="confirm('apakah anda yakin ingin menghapus?')">Hapus</button>
        </form>
      </td>
    </tr>
    <?php endif; ?>
    <?php endforeach; ?>
  </tbody>
</table>       
</div>
<?= $pager->links('users','pageview') ?>
</div>

<?= $this->endSection(); ?>