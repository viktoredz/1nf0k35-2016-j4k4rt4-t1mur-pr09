-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16 Feb 2016 pada 08.31
-- Versi Server: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epus_prog_3205`
--

-- --------------------------------------------------------

--
-- Struktur untuk view `get_inventaris_laporan`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get_inventaris_laporan` AS (select `inv_inventaris_distribusi`.`id_ruangan` AS `id_ruangan`,`inv_inventaris_distribusi`.`id_cl_phc` AS `id_cl_phc`,`inv_inventaris_distribusi`.`register` AS `register`,`cl_phc`.`value` AS `puskesmas`,`mst_inv_ruangan`.`nama_ruangan` AS `nama_ruangan`,`mst_inv_pilihan`.`value` AS `value`,`inv_inventaris_barang`.`id_inventaris_barang` AS `id_inventaris_barang`,`inv_inventaris_barang`.`id_mst_inv_barang` AS `id_mst_inv_barang`,`inv_inventaris_barang`.`id_pengadaan` AS `id_pengadaan`,`inv_inventaris_barang`.`pilihan_keadaan_barang` AS `pilihan_keadaan_barang`,`inv_inventaris_barang`.`nama_barang` AS `nama_barang`,`inv_inventaris_barang`.`pilihan_komponen` AS `pilihan_komponen`,`inv_inventaris_barang`.`harga` AS `harga`,`inv_inventaris_barang`.`keterangan_pengadaan` AS `keterangan_pengadaan`,`inv_inventaris_barang`.`pilihan_status_invetaris` AS `pilihan_status_invetaris`,`inv_inventaris_barang`.`tanggal_pembelian` AS `tanggal_pembelian`,`inv_inventaris_barang`.`foto_barang` AS `foto_barang`,`inv_inventaris_barang`.`barang_kembar_proc` AS `barang_kembar_proc`,`inv_inventaris_barang`.`keterangan_inventory` AS `keterangan_inventory`,`inv_inventaris_barang`.`tanggal_pengadaan` AS `tanggal_pengadaan`,`inv_inventaris_barang`.`tanggal_diterima` AS `tanggal_diterima`,`inv_inventaris_barang`.`tanggal_dihapus` AS `tanggal_dihapus`,`inv_inventaris_barang`.`alasan_penghapusan` AS `alasan_penghapusan`,`inv_inventaris_barang`.`pilihan_asal` AS `pilihan_asal`,`inv_inventaris_barang`.`waktu_dibuat` AS `waktu_dibuat`,`inv_inventaris_barang_a`.`status_sertifikat_nomor` AS `status_sertifikat_nomor_a`,`inv_inventaris_barang_a`.`luas` AS `luas_a`,`inv_inventaris_barang_a`.`pilihan_satuan_barang` AS `pilihan_satuan_barang_a`,`inv_inventaris_barang_b`.`merek_type` AS `merek_type_b`,`inv_inventaris_barang_b`.`nomor_bpkb` AS `nomor_bpkb_b`,`inv_inventaris_barang_b`.`pilihan_bahan` AS `pilihan_bahan_b`,`inv_inventaris_barang_b`.`ukuran_barang` AS `ukuran_barang_b`,`inv_inventaris_barang_b`.`pilihan_satuan` AS `pilihan_satuan_b`,`inv_inventaris_barang_c`.`dokumen_nomor` AS `dokumen_nomor_c`,`inv_inventaris_barang_c`.`pilihan_kons_beton` AS `pilihan_kons_beton_c`,`inv_inventaris_barang_c`.`luas_lantai` AS `luas_lantai_c`,`inv_inventaris_barang_d`.`dokumen_nomor` AS `dokumen_nomor_d`,`inv_inventaris_barang_d`.`panjang` AS `panjang_d`,`inv_inventaris_barang_d`.`lebar` AS `lebar_d`,`inv_inventaris_barang_d`.`luas` AS `luas_d`,`inv_inventaris_barang_e`.`pilihan_budaya_bahan` AS `pilihan_budaya_bahan_e`,`inv_inventaris_barang_e`.`flora_fauna_ukuran` AS `flora_fauna_ukuran_e`,`inv_inventaris_barang_e`.`pilihan_satuan` AS `pilihan_satuan_e`,`inv_inventaris_barang_f`.`dokumen_nomor` AS `dokumen_nomor_f`,`inv_inventaris_barang_f`.`pilihan_konstruksi_beton` AS `pilihan_konstruksi_beton_f`,`inv_inventaris_barang_f`.`luas` AS `luas_f`,`inv_inventaris_barang`.`terakhir_diubah` AS `terakhir_diubah`,count(`inv_inventaris_barang`.`id_inventaris_barang`) AS `jumlah`,sum(`inv_inventaris_barang`.`harga`) AS `totalharga` from ((((((((((`inv_inventaris_barang` join `mst_inv_pilihan` on(((convert(`inv_inventaris_barang`.`pilihan_status_invetaris` using utf8) = `mst_inv_pilihan`.`code`) and (`mst_inv_pilihan`.`tipe` = 'status_inventaris')))) left join `inv_inventaris_distribusi` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_distribusi`.`id_inventaris_barang`))) left join `cl_phc` on((`cl_phc`.`code` = convert(`inv_inventaris_distribusi`.`id_cl_phc` using utf8)))) left join `mst_inv_ruangan` on(((`mst_inv_ruangan`.`code_cl_phc` = convert(`inv_inventaris_distribusi`.`id_cl_phc` using utf8)) and (`mst_inv_ruangan`.`id_mst_inv_ruangan` = `inv_inventaris_distribusi`.`id_ruangan`)))) left join `inv_inventaris_barang_a` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_a`.`id_inventaris_barang`))) left join `inv_inventaris_barang_b` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_b`.`id_inventaris_barang`))) left join `inv_inventaris_barang_c` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_c`.`id_inventaris_barang`))) left join `inv_inventaris_barang_d` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_d`.`id_inventaris_barang`))) left join `inv_inventaris_barang_e` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_e`.`id_inventaris_barang`))) left join `inv_inventaris_barang_f` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_f`.`id_inventaris_barang`))) where (`inv_inventaris_barang`.`id_pengadaan` = 0) group by `inv_inventaris_barang`.`barang_kembar_proc`,`inv_inventaris_barang`.`id_inventaris_barang`) union (select `inv_inventaris_distribusi`.`id_ruangan` AS `id_ruangan`,`inv_inventaris_distribusi`.`id_cl_phc` AS `id_cl_phc`,`inv_inventaris_distribusi`.`register` AS `register`,`cl_phc`.`value` AS `puskesmas`,`mst_inv_ruangan`.`nama_ruangan` AS `nama_ruangan`,`mst_inv_pilihan`.`value` AS `value`,`inv_inventaris_barang`.`id_inventaris_barang` AS `id_inventaris_barang`,`inv_inventaris_barang`.`id_mst_inv_barang` AS `id_mst_inv_barang`,`inv_inventaris_barang`.`id_pengadaan` AS `id_pengadaan`,`inv_inventaris_barang`.`pilihan_keadaan_barang` AS `pilihan_keadaan_barang`,`inv_inventaris_barang`.`nama_barang` AS `nama_barang`,`inv_inventaris_barang`.`pilihan_komponen` AS `pilihan_komponen`,`inv_inventaris_barang`.`harga` AS `harga`,`inv_inventaris_barang`.`keterangan_pengadaan` AS `keterangan_pengadaan`,`inv_inventaris_barang`.`pilihan_status_invetaris` AS `pilihan_status_invetaris`,`inv_inventaris_barang`.`tanggal_pembelian` AS `tanggal_pembelian`,`inv_inventaris_barang`.`foto_barang` AS `foto_barang`,`inv_inventaris_barang`.`barang_kembar_proc` AS `barang_kembar_proc`,`inv_inventaris_barang`.`keterangan_inventory` AS `keterangan_inventory`,`inv_inventaris_barang`.`tanggal_pengadaan` AS `tanggal_pengadaan`,`inv_inventaris_barang`.`tanggal_diterima` AS `tanggal_diterima`,`inv_inventaris_barang`.`tanggal_dihapus` AS `tanggal_dihapus`,`inv_inventaris_barang`.`alasan_penghapusan` AS `alasan_penghapusan`,`inv_inventaris_barang`.`pilihan_asal` AS `pilihan_asal`,`inv_inventaris_barang`.`waktu_dibuat` AS `waktu_dibuat`,`inv_inventaris_barang_a`.`status_sertifikat_nomor` AS `status_sertifikat_nomor_a`,`inv_inventaris_barang_a`.`luas` AS `luas_a`,`inv_inventaris_barang_a`.`pilihan_satuan_barang` AS `pilihan_satuan_barang_a`,`inv_inventaris_barang_b`.`merek_type` AS `merek_type_b`,`inv_inventaris_barang_b`.`nomor_bpkb` AS `nomor_bpkb_b`,`inv_inventaris_barang_b`.`pilihan_bahan` AS `pilihan_bahan_b`,`inv_inventaris_barang_b`.`ukuran_barang` AS `ukuran_barang_b`,`inv_inventaris_barang_b`.`pilihan_satuan` AS `pilihan_satuan_b`,`inv_inventaris_barang_c`.`dokumen_nomor` AS `dokumen_nomor_c`,`inv_inventaris_barang_c`.`pilihan_kons_beton` AS `pilihan_kons_beton_c`,`inv_inventaris_barang_c`.`luas_lantai` AS `luas_lantai_c`,`inv_inventaris_barang_d`.`dokumen_nomor` AS `dokumen_nomor_d`,`inv_inventaris_barang_d`.`panjang` AS `panjang_d`,`inv_inventaris_barang_d`.`lebar` AS `lebar_d`,`inv_inventaris_barang_d`.`luas` AS `luas_d`,`inv_inventaris_barang_e`.`pilihan_budaya_bahan` AS `pilihan_budaya_bahan_e`,`inv_inventaris_barang_e`.`flora_fauna_ukuran` AS `flora_fauna_ukuran_e`,`inv_inventaris_barang_e`.`pilihan_satuan` AS `pilihan_satuan_e`,`inv_inventaris_barang_f`.`dokumen_nomor` AS `dokumen_nomor_f`,`inv_inventaris_barang_f`.`pilihan_konstruksi_beton` AS `pilihan_konstruksi_beton_f`,`inv_inventaris_barang_f`.`luas` AS `luas_f`,`inv_inventaris_barang`.`terakhir_diubah` AS `terakhir_diubah`,count(`inv_inventaris_barang`.`id_inventaris_barang`) AS `jumlah`,sum(`inv_inventaris_barang`.`harga`) AS `totalharga` from (((((((((((`inv_inventaris_barang` join `inv_pengadaan` on(((`inv_pengadaan`.`id_pengadaan` = `inv_inventaris_barang`.`id_pengadaan`) and (`inv_pengadaan`.`pilihan_status_pengadaan` = 4)))) join `mst_inv_pilihan` on(((convert(`inv_inventaris_barang`.`pilihan_status_invetaris` using utf8) = `mst_inv_pilihan`.`code`) and (`mst_inv_pilihan`.`tipe` = 'status_inventaris')))) left join `inv_inventaris_distribusi` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_distribusi`.`id_inventaris_barang`))) left join `cl_phc` on((`cl_phc`.`code` = convert(`inv_inventaris_distribusi`.`id_cl_phc` using utf8)))) left join `mst_inv_ruangan` on(((`mst_inv_ruangan`.`code_cl_phc` = convert(`inv_inventaris_distribusi`.`id_cl_phc` using utf8)) and (`mst_inv_ruangan`.`id_mst_inv_ruangan` = `inv_inventaris_distribusi`.`id_ruangan`)))) left join `inv_inventaris_barang_a` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_a`.`id_inventaris_barang`))) left join `inv_inventaris_barang_b` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_b`.`id_inventaris_barang`))) left join `inv_inventaris_barang_c` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_c`.`id_inventaris_barang`))) left join `inv_inventaris_barang_d` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_d`.`id_inventaris_barang`))) left join `inv_inventaris_barang_e` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_e`.`id_inventaris_barang`))) left join `inv_inventaris_barang_f` on((`inv_inventaris_barang`.`id_inventaris_barang` = `inv_inventaris_barang_f`.`id_inventaris_barang`))) group by `inv_inventaris_barang`.`barang_kembar_proc`,`inv_inventaris_barang`.`id_inventaris_barang`);

--
-- VIEW  `get_inventaris_laporan`
-- Data: Tidak ada
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;