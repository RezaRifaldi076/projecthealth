<?= $this->extend('template/user'); ?>

<?= $this->section('page-content'); ?>
<div class="container-fluid">

<div class="row">
  <div class="col">
    <h4 class="">
  <strong class="text-primary mb-2">Daftar Pasien</strong>
    </h4>
    <form action="" method="post">
      <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="Masukkan Keyword" name="keyword">
      <button class="btn btn-outline-primary" type="submit" id="button-addon2" name="submit">Cari</button>
    </div>
    </form>
  </div>
</div>
<?php $i = 0 + (5 * ($current -1)); ?>
<!-- Tabel -->
<div class="table-responsive">
  <table class="table">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">Nama</th>
      <th scope="col">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    <?php foreach ($users as $p) : ?>
    <?php if ($p->user_groups == 'pasien') : ?>
    <?php $i++; ?>
      <th scope="row"><?= $i; ?></th>
      <td><?= $p->username; ?></td>
      <td>
        <a class="btn btn-success" href="<?= base_url('dokter/chat'); ?>">Chat</a>
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