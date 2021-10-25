/*
 Navicat Premium Data Transfer

 Source Server         : Heroku
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : us-cdbr-iron-east-02.cleardb.net:3306
 Source Schema         : heroku_29fdc3ecbc4ef36

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 25/10/2021 14:05:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna`  (
  `id_p` int(11) NOT NULL,
  `id_pengguna` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_p` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES (1, '0x40x360x380xB20x210x250x80', 'Muhammad Nur Ikhsan');
INSERT INTO `pengguna` VALUES (2, '0x40x5E0x910xE20x9E0x4F0x80', 'Alit Fajar Kurniawan');
INSERT INTO `pengguna` VALUES (3, '0x50x8A0x990x1E0x590x310x0 ', 'Maulyanda');
INSERT INTO `pengguna` VALUES (4, '0x40x1E0x600x6A0xC60x610x80', 'Syafrial Fachri Pane');
INSERT INTO `pengguna` VALUES (5, '0x40x1C0x2E0xA0x420x2A0x80', 'Rolly Maulana Awangga');
INSERT INTO `pengguna` VALUES (6, '0x40x310x570x5A0x7D0x5B0x80', 'Cahya Kurniawan');
INSERT INTO `pengguna` VALUES (7, '0x40x600x590xCA0x5B0x2A0x80', 'Aditya Pratama Dharma');
INSERT INTO `pengguna` VALUES (8, '0x40x230x240xFA0x800x5B0x80', 'M Raziq Hakim Siregar');
INSERT INTO `pengguna` VALUES (9, '0x40x840x7A0x5A0x810x2A0x80', 'R Rifa Fauzi Komara');
INSERT INTO `pengguna` VALUES (10, '0x40x8A0x610xBA0x410x2A0x80', 'Faisal Syariffudin');

-- ----------------------------
-- Table structure for tap
-- ----------------------------
DROP TABLE IF EXISTS `tap`;
CREATE TABLE `tap`  (
  `id_tap` int(11) NOT NULL,
  `id_pengguna` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tanggal` datetime(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tap
-- ----------------------------
INSERT INTO `tap` VALUES (1, '0x40x360x380xB20x210x250x80', '2019-07-19 10:02:12');
INSERT INTO `tap` VALUES (2, '0x50x8A0x990x1E0x590x310x0', '2019-07-19 10:02:12');
INSERT INTO `tap` VALUES (0, '0x40x8A0x610xBA0x410x2A0x80', '2019-08-21 14:15:57');
INSERT INTO `tap` VALUES (0, '0x40x840x7A0x5A0x810x2A0x80', '2019-08-21 14:15:57');
INSERT INTO `tap` VALUES (0, '0x40x310x570x5A0x7D0x5B0x80', '2019-08-21 14:15:57');
INSERT INTO `tap` VALUES (0, '0x40x600x590xCA0x5B0x2A0x80', '2019-08-21 14:20:41');
INSERT INTO `tap` VALUES (0, '0x40x5E0x910xE20x9E0x4F0x80', '2019-08-21 14:20:41');
INSERT INTO `tap` VALUES (0, '0x40x840x7A0x5A0x810x2A0x80', '2019-08-21 14:24:00');
INSERT INTO `tap` VALUES (0, '0x40x230x240xFA0x800x5B0x80', '2019-08-21 16:40:27');
INSERT INTO `tap` VALUES (0, '0x40x360x380xB20x210x250x80', '2019-08-27 07:53:28');
INSERT INTO `tap` VALUES (0, '0x40x360x380xB20x210x250x80', '2019-08-27 07:53:28');

-- ----------------------------
-- View structure for kunciku
-- ----------------------------
DROP VIEW IF EXISTS `kunciku`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `kunciku` AS select `pengguna`.`id_pengguna` AS `id_pengguna`,`pengguna`.`nama_p` AS `nama_p`,`tap`.`tanggal` AS `tanggal` from (`pengguna` join `tap`) where (convert(`pengguna`.`id_pengguna` using utf8) = `tap`.`id_pengguna`);

SET FOREIGN_KEY_CHECKS = 1;
