<?= $this->extend('template/user'); ?>

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
      <th scope="col">Nama</th>
      <th scope="col">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    <?php foreach ($users as $d) : ?>
    <?php if ($d->user_groups == 'dokter') : ?>
    <?php $i++; ?>
      <th scope="row"><?= $i; ?></th>
      <td><?= $d->username; ?></td>
      <td>
        <a class="btn btn-success" href="<?= base_url('pasien/chat'); ?>">Chat</a> 
        <form action="tambahj/<?= $d->username; ?>" method="post" class="d-inline">
          <?= csrf_field(); ?>
          <button class="btn btn-success" type="submit">Kirim Permintaan Pertemuan</button>
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