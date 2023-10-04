<!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="index.html" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
            <h2 class="m-0"><i class="fa fa-notes-medical text-primary me-2"></i>Sistem Kesehatan</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarCollapse">

            <?php if (in_groups('dokter')) : ?>
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="<?= base_url('dokter/'); ?>" class="nav-item nav-link ">Beranda</a>
                <a href="<?= base_url('dokter/pasien'); ?>" class="nav-item nav-link ">Pasien</a>
                <a href="<?= base_url('dokter/jadwal'); ?>" class="nav-item nav-link ">Jadwal</a>
                <a href="<?= base_url('dokter/chat'); ?>" class="nav-item nav-link ">Chat</a>
            </div>
            <?php endif; ?>

            <?php if (in_groups('pasien')) : ?>
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="<?= base_url('pasien/'); ?>" class="nav-item nav-link">Beranda</a>
                <a href="<?= base_url('pasien/dokter'); ?>" class="nav-item nav-link">Dokter</a>
                <a href="<?= base_url('pasien/jadwal'); ?>" class="nav-item nav-link">Jadwal</a>
                <a href="<?= base_url('pasien/chat'); ?>" class="nav-item nav-link">Chat</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Tes Mental</a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="<?= base_url('pasien/tes'); ?>" class="dropdown-item">Mulai Tes</a>
                        <a href="<?= base_url('pasien/riwayat'); ?>" class="dropdown-item">Riwayat Tes</a>
                    </div>
                </div>
            </div>
            <?php endif; ?>
<?php 
/*
 <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="<?= base_url(); ?>/#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?= user()->username; ?></span>
                                <img class="img-profile rounded-circle"
                                    src="<?= base_url(); ?>/img/<?= user()->user_image; ?>">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="<?= base_url('/editprofil'); ?>/">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Edit profil
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="<?= base_url('/logout'); ?>" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li> 
*/
 ?>
            <a href="<?= base_url('/logout'); ?>" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block" data-toggle="modal" data-target="#logoutModal">Logout<i class="fa fa-arrow-right ms-3"></i></a>                   
        </div>
    </nav>
    <!-- Navbar End -->