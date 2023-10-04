<?= $this->extend('template/user'); ?>

<?= $this->section('page-content'); ?>
<div class="container-fluid">

<?php $i = 0; ?>
<!-- Tabel -->
<table class="table">
  <thead>
    <tr>
      <th scope="col">No</th>
	  <th scope="col">Tanggal</th>
      <th scope="col">Skor</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    <?php foreach ($riwayats as $r) : ?>
    <?php if ($r->pasien == user()->username) : ?>
    <?php $i++; ?>
      <th scope="row"><?= $i; ?></th>
      <td><?= $r->tanggal; ?></td>
      <td><?= $r->skor; ?></td>
    </tr>
    <?php endif; ?>
    <?php endforeach; ?>
  </tbody>
</table> 

                    
</div>
<?= $this->endSection(); ?>