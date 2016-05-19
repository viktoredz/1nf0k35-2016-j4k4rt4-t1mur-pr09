-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2016 at 12:05 PM
-- Server version: 5.6.26
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
-- Structure for view `bhp_kondisi_opname2`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bhp_kondisi_opname2` AS select ifnull((ifnull((select `j`.`jml_akhir` from (`inv_inventaris_habispakai_opname_item` `j` join `inv_inventaris_habispakai_opname` `k` on((`j`.`id_inv_inventaris_habispakai_opname` = `k`.`id_inv_inventaris_habispakai_opname`))) where ((`j`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`) and (`j`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`)) order by `k`.`tgl_opname` desc limit 1),0) + ifnull((select sum(`inv_inventaris_habispakai_distribusi_item`.`jml`) from (`inv_inventaris_habispakai_distribusi_item` join `inv_inventaris_habispakai_distribusi` on((`inv_inventaris_habispakai_distribusi`.`id_inv_inventaris_habispakai_distribusi` = `inv_inventaris_habispakai_distribusi_item`.`id_inv_inventaris_habispakai_distribusi`))) where ((`inv_inventaris_habispakai_distribusi_item`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`) and (`inv_inventaris_habispakai_distribusi_item`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`) and (`inv_inventaris_habispakai_distribusi`.`tgl_distribusi` > ifnull((select `k`.`tgl_opname` from (`inv_inventaris_habispakai_opname_item` `j` join `inv_inventaris_habispakai_opname` `k` on((`j`.`id_inv_inventaris_habispakai_opname` = `k`.`id_inv_inventaris_habispakai_opname`))) where ((`j`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`) and (`j`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`)) order by `k`.`tgl_opname` desc limit 1),0)))),0)),0) AS `jml_awalopname`,((select `a`.`jml_rusak` from `inv_inventaris_habispakai_kondisi` `a` where ((`a`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`) and (`a`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`)) order by `a`.`tgl_update` desc limit 1) + (select `a`.`jml_tdkdipakai` from `inv_inventaris_habispakai_kondisi` `a` where ((`a`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`) and (`a`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`)) order by `a`.`tgl_update` desc limit 1)) AS `jumlahtidakdipakai`,(ifnull(((select `a`.`jml_rusak` from `inv_inventaris_habispakai_kondisi` `a` where ((`a`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`) and (`a`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`)) order by `a`.`tgl_update` desc limit 1) + (select `a`.`jml_tdkdipakai` from `inv_inventaris_habispakai_kondisi` `a` where ((`a`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`) and (`a`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`)) order by `a`.`tgl_update` desc limit 1)),0) - ifnull((select sum((`r`.`jml_awal` - `r`.`jml_akhir`)) from (`inv_inventaris_habispakai_opname_item` `r` join `inv_inventaris_habispakai_opname` `s` on((`r`.`id_inv_inventaris_habispakai_opname` = `s`.`id_inv_inventaris_habispakai_opname`))) where ((`r`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`) and (`r`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`) and (`s`.`tipe` = 'tidakdipakai') and (`s`.`tgl_opname` < `tglkondisi`()))),0)) AS `jumlahtidakdipakaiterakhir`,(select `a`.`tgl_update` from `inv_inventaris_habispakai_kondisi` `a` where ((`a`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`) and (`a`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`)) order by `a`.`tgl_update` desc limit 1) AS `tgl_updateterakhir`,`inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai` AS `id_mst_inv_barang_habispakai`,`inv_inventaris_habispakai_kondisi`.`batch` AS `batch`,`inv_inventaris_habispakai_kondisi`.`code_cl_phc` AS `code_cl_phc`,`inv_inventaris_habispakai_kondisi`.`tgl_update` AS `tgl_update`,`inv_inventaris_habispakai_kondisi`.`jml_rusak` AS `jml_rusak`,`inv_inventaris_habispakai_kondisi`.`jml_tdkdipakai` AS `jml_tdkdipakai`,`inv_inventaris_habispakai_kondisi`.`id_inv_inventaris_habispakai_opname` AS `id_inv_inventaris_habispakai_opname`,`mst_inv_barang_habispakai`.`uraian` AS `uraian`,`mst_inv_barang_habispakai`.`merek_tipe` AS `merek_tipe`,`mst_inv_barang_habispakai`.`id_mst_inv_barang_habispakai_jenis` AS `id_mst_inv_barang_habispakai_jenis`,if((ifnull((select `inv_inventaris_habispakai_opname`.`tgl_opname` from (`inv_inventaris_habispakai_opname` left join `inv_inventaris_habispakai_opname_item` on((`inv_inventaris_habispakai_opname`.`id_inv_inventaris_habispakai_opname` = `inv_inventaris_habispakai_opname_item`.`id_inv_inventaris_habispakai_opname`))) where ((`inv_inventaris_habispakai_opname_item`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`) and (`inv_inventaris_habispakai_opname_item`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`)) order by `inv_inventaris_habispakai_opname`.`tgl_opname` desc limit 1),(curdate() + interval 1 day)) < curdate()),ifnull((select `inv_inventaris_habispakai_opname_item`.`harga` from (`inv_inventaris_habispakai_opname` left join `inv_inventaris_habispakai_opname_item` on((`inv_inventaris_habispakai_opname`.`id_inv_inventaris_habispakai_opname` = `inv_inventaris_habispakai_opname_item`.`id_inv_inventaris_habispakai_opname`))) where ((`inv_inventaris_habispakai_opname_item`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`) and (`inv_inventaris_habispakai_opname_item`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`)) order by `inv_inventaris_habispakai_opname`.`tgl_opname` desc limit 1),0),ifnull((select `i`.`harga` from (`inv_inventaris_habispakai_pembelian` `h` left join `inv_inventaris_habispakai_pembelian_item` `i` on((`h`.`id_inv_hasbispakai_pembelian` = `i`.`id_inv_hasbispakai_pembelian`))) where ((`i`.`batch` = `inv_inventaris_habispakai_kondisi`.`batch`) and (`i`.`id_mst_inv_barang_habispakai` = `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`)) order by `i`.`tgl_update` desc limit 1),0)) AS `hargaterakhir` from (`inv_inventaris_habispakai_kondisi` join `mst_inv_barang_habispakai` on((`inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai` = `mst_inv_barang_habispakai`.`id_mst_inv_barang_habispakai`))) group by `inv_inventaris_habispakai_kondisi`.`id_mst_inv_barang_habispakai`,`inv_inventaris_habispakai_kondisi`.`batch`,`inv_inventaris_habispakai_kondisi`.`code_cl_phc` having ((`jumlahtidakdipakaiterakhir` > 0) and (`jml_awalopname` > 0));

--
-- VIEW  `bhp_kondisi_opname2`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
