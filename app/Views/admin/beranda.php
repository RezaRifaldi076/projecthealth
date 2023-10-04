<?= $this->extend('template/admin'); ?>

<?= $this->section('page-content'); ?>
<div class="container-fluid">
<?php 
$ac = 0;
$dc = 0;
$fc = 0;
foreach ($users as $u) { 
   if ($u->user_groups == 'admin') {
      $ac++;
   } else if ($u->user_groups == 'dokter') {
      $dc++;
   } else if ($u->user_groups == 'pasien') {
      $fc++;
   }
}
?>

<?php if (session()->getFlashdata('pesan')) : ?>
<div class="alert alert-success" role="alert">
  <?= session()->getFlashdata('pesan'); ?>
</div> 
<?php endif; ?>

   <!-- Page Heading -->
   <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">Daftar User</h1>
   </div>

   <!-- cards -->
   <div class="row">

                        <!-- Admin Card  -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Admin</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $ac; ?></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-user text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Dokter Card  -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Dokter</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $dc; ?></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-user text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pasien Card -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Pasien
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $fc; ?></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-user text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
   </div>
                    
</div>
<?= $this->endSection(); ?>