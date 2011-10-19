/*
Navicat MySQL Data Transfer

Source Server         : Default
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : cfwheels-np

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-10-19 08:33:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', 'Mohamad');
INSERT INTO `customers` VALUES ('3', 'Joe');
INSERT INTO `customers` VALUES ('10', 'Homer');
INSERT INTO `customers` VALUES ('11', 'Bart');

-- ----------------------------
-- Table structure for `publications`
-- ----------------------------
DROP TABLE IF EXISTS `publications`;
CREATE TABLE `publications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publications
-- ----------------------------
INSERT INTO `publications` VALUES ('2', 'Top Gear');
INSERT INTO `publications` VALUES ('3', 'BBC History Magazine');

-- ----------------------------
-- Table structure for `subscriptions`
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions` (
  `customerid` int(11) NOT NULL,
  `publicationid` int(11) NOT NULL,
  `expiration` datetime DEFAULT NULL,
  PRIMARY KEY (`customerid`,`publicationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscriptions
-- ----------------------------
INSERT INTO `subscriptions` VALUES ('1', '2', null);
INSERT INTO `subscriptions` VALUES ('10', '2', null);
INSERT INTO `subscriptions` VALUES ('10', '3', null);
INSERT INTO `subscriptions` VALUES ('11', '2', null);
