<?= $this->extend('template/user'); ?>

<?= $this->section('page-content'); ?>
<div class="container-fluid">

<div class="row">
  <div class="col">
    <h4 class="">
  <strong class="text-primary mb-2">Daftar Jadwal</strong>
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
      <th scope="col">Tanggal</th>
      <th scope="col">Dokter</th>
      <th scope="col">Pasien</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    <?php foreach ($jadwal as $j) : ?>
    <?php $i++; ?>
      <th scope="row"><?= $i; ?></th>
      <td><?= $j['tanggal']; ?></td>
      <td><?= $j['dokter']; ?></td>
      <td><?= $j['pasien']; ?></td>
    </tr>
    <?php endforeach; ?>
  </tbody>
</table>       
</div>
<?= $pager->links('jadwal','pageview') ?>
                    
</div>
<?= $this->endSection(); ?>