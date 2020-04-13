/*
SQLyog - Free MySQL GUI v5.13
Host - 6.0.7-alpha-community : Database - banking_app
*********************************************************************
Server version : 6.0.7-alpha-community
*/


SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `banking_app`;

USE `banking_app`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `accounts` */

/*Table structure for table `locations` */

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` bigint(20) NOT NULL,
  `location_code` int(11) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `locations` */

insert into `locations` (`id`,`location_code`,`location_name`) values (1,1001,'Head office-Mumbai');
insert into `locations` (`id`,`location_code`,`location_name`) values (2,1002,'Andheri');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `effective_end_date` date NOT NULL,
  `effective_start_date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert into `products` (`id`,`effective_end_date`,`effective_start_date`,`name`,`product_code`,`status`) values (1,'2012-10-25','2012-10-25','Vehical Loan','1011','Active');
insert into `products` (`id`,`effective_end_date`,`effective_start_date`,`name`,`product_code`,`status`) values (2,'2019-01-25','2020-01-25','Personal Loan','1012','Active');
insert into `products` (`id`,`effective_end_date`,`effective_start_date`,`name`,`product_code`,`status`) values (3,'2020-01-25','2010-03-25','Plot Loan','1013','Active');

/*Table structure for table `t_customers` */

DROP TABLE IF EXISTS `t_customers`;

CREATE TABLE `t_customers` (
  `id` bigint(20) NOT NULL,
  `customer_age` varchar(255) NOT NULL,
  `customer_code` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `place_of_birth` varchar(255) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK21m4b3e897838pc0ljes6oxsf` (`location_id`),
  CONSTRAINT `FK21m4b3e897838pc0ljes6oxsf` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_customers` */

insert into `t_customers` (`id`,`customer_age`,`customer_code`,`date_of_birth`,`email_id`,`first_name`,`gender`,`last_name`,`marital_status`,`middle_name`,`place_of_birth`,`location_id`) values (1,'40','1234','2000-01-01','rpatil@gmail.com','rahul','Male','Patil','Single','Ahi','sangali',1);
insert into `t_customers` (`id`,`customer_age`,`customer_code`,`date_of_birth`,`email_id`,`first_name`,`gender`,`last_name`,`marital_status`,`middle_name`,`place_of_birth`,`location_id`) values (2,'40','3333','2000-02-02','nishantmane@gmail.com','Nishant','Male','Mane','Single','Tanaji','Vashi',1);
insert into `t_customers` (`id`,`customer_age`,`customer_code`,`date_of_birth`,`email_id`,`first_name`,`gender`,`last_name`,`marital_status`,`middle_name`,`place_of_birth`,`location_id`) values (3,'35','9876','2000-05-02','dadapawar@gmail.com','Dadasaheb','Male','Pawar','Married','Yashwantrao','Baramati',1);
insert into `t_customers` (`id`,`customer_age`,`customer_code`,`date_of_birth`,`email_id`,`first_name`,`gender`,`last_name`,`marital_status`,`middle_name`,`place_of_birth`,`location_id`) values (4,'27','1357','2000-04-01','sanjayd@gmail.com','Sanjay','Male','Desmukh','Single','Dina','Bhandup',1);
insert into `t_customers` (`id`,`customer_age`,`customer_code`,`date_of_birth`,`email_id`,`first_name`,`gender`,`last_name`,`marital_status`,`middle_name`,`place_of_birth`,`location_id`) values (5,'51','9615','2000-03-02','savita@gmail.com','Savita','Male','More','Married','Shankar','Thane',1);
insert into `t_customers` (`id`,`customer_age`,`customer_code`,`date_of_birth`,`email_id`,`first_name`,`gender`,`last_name`,`marital_status`,`middle_name`,`place_of_birth`,`location_id`) values (6,'39','6789','2000-07-02','Anand@gmail.com','Anand','Male','Joshi','Married','Avinash','Pune',1);



DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` bigint(20) NOT NULL,
  `account_close_date` date NOT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_open_date` date NOT NULL,
  `account_status` int(11) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `loan_balance` decimal(19,2) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK68au6dg7r3j31oh9qncaahy75` (`customer_id`),
  KEY `FK4dmgcni7d05i3ka4ynr2uqahx` (`product_id`),
  KEY `FK94amax8h2y5dryuto8qht2tu6` (`location_id`),
  CONSTRAINT `FK94amax8h2y5dryuto8qht2tu6` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `FK4dmgcni7d05i3ka4ynr2uqahx` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK68au6dg7r3j31oh9qncaahy75` FOREIGN KEY (`customer_id`) REFERENCES `t_customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `accounts` */

insert into `accounts` (`id`,`account_close_date`,`account_holder_name`,`account_number`,`account_open_date`,`account_status`,`customer_id`,`product_id`,`loan_balance`,`location_id`) values (1,'2022-01-02','Rahul Patil','54321','2020-01-02',1,1,1,'61037.00',1);
insert into `accounts` (`id`,`account_close_date`,`account_holder_name`,`account_number`,`account_open_date`,`account_status`,`customer_id`,`product_id`,`loan_balance`,`location_id`) values (2,'2022-01-02','Nishant Mane','54322','2020-01-02',1,2,2,'81581.00',1);
insert into `accounts` (`id`,`account_close_date`,`account_holder_name`,`account_number`,`account_open_date`,`account_status`,`customer_id`,`product_id`,`loan_balance`,`location_id`) values (3,'2022-01-02','Dada Pawar','54323','2020-01-02',1,3,3,'88508.00',1);
insert into `accounts` (`id`,`account_close_date`,`account_holder_name`,`account_number`,`account_open_date`,`account_status`,`customer_id`,`product_id`,`loan_balance`,`location_id`) values (4,'2022-01-02','Sanjay Deshmukh','54324','2020-01-02',1,4,1,'122372.00',1);
insert into `accounts` (`id`,`account_close_date`,`account_holder_name`,`account_number`,`account_open_date`,`account_status`,`customer_id`,`product_id`,`loan_balance`,`location_id`) values (5,'2022-01-02','Savita More','54325','2020-01-02',1,5,2,'102487.00',1);
insert into `accounts` (`id`,`account_close_date`,`account_holder_name`,`account_number`,`account_open_date`,`account_status`,`customer_id`,`product_id`,`loan_balance`,`location_id`) values (6,'2022-01-02','Anand Joshi','54326','2020-01-02',1,6,3,'67984.00',1);

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hibernate_sequence` */

insert into `hibernate_sequence` (`next_val`) values (1);
insert into `hibernate_sequence` (`next_val`) values (1);

/*Table structure for table `loan_aplications` */

DROP TABLE IF EXISTS `loan_aplications`;

CREATE TABLE `loan_aplications` (
  `id` bigint(20) NOT NULL,
  `loan_application_number` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `disbursed_flag` varchar(255) DEFAULT NULL,
  `effective_loan_amount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7eeq7eo9741b6yegwvpe3ivn6` (`customer_id`),
  KEY `FKkkcckluv54wo56mbvc87uo78` (`product_id`),
  KEY `FKtbaj2ph6qdugsmeq37c9olf55` (`location_id`),
  CONSTRAINT `FK7eeq7eo9741b6yegwvpe3ivn6` FOREIGN KEY (`customer_id`) REFERENCES `t_customers` (`id`),
  CONSTRAINT `FKkkcckluv54wo56mbvc87uo78` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKtbaj2ph6qdugsmeq37c9olf55` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `loan_aplications` */

insert into `loan_aplications` (`id`,`loan_application_number`,`customer_id`,`product_id`,`location_id`,`disbursed_flag`,`effective_loan_amount`) values (1,'10001',1,1,1,'Y','100000.00');
insert into `loan_aplications` (`id`,`loan_application_number`,`customer_id`,`product_id`,`location_id`,`disbursed_flag`,`effective_loan_amount`) values (2,'10002',2,2,1,'Y','120000.00');
insert into `loan_aplications` (`id`,`loan_application_number`,`customer_id`,`product_id`,`location_id`,`disbursed_flag`,`effective_loan_amount`) values (3,'10003',3,3,1,'Y','150000.00');
insert into `loan_aplications` (`id`,`loan_application_number`,`customer_id`,`product_id`,`location_id`,`disbursed_flag`,`effective_loan_amount`) values (4,'10004',4,1,1,'Y','180000.00');
insert into `loan_aplications` (`id`,`loan_application_number`,`customer_id`,`product_id`,`location_id`,`disbursed_flag`,`effective_loan_amount`) values (5,'10005',5,2,1,'Y','200000.00');
insert into `loan_aplications` (`id`,`loan_application_number`,`customer_id`,`product_id`,`location_id`,`disbursed_flag`,`effective_loan_amount`) values (6,'10006',6,3,1,'Y','100000.00');

/*Table structure for table `loan_contracts` */

DROP TABLE IF EXISTS `loan_contracts`;

CREATE TABLE `loan_contracts` (
  `id` bigint(20) NOT NULL,
  `effective_date` date NOT NULL,
  `effective_loan_amount` decimal(19,2) DEFAULT NULL,
  `installment_amount` decimal(19,2) DEFAULT NULL,
  `interest_rate` decimal(19,2) DEFAULT NULL,
  `loan_application_no` varchar(255) DEFAULT NULL,
  `loan_approved_date` date NOT NULL,
  `loan_contract_code` varchar(255) DEFAULT NULL,
  `loan_end_date` date NOT NULL,
  `number_of_installments` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqweupqsinmwsxm5jhvrlsdtwn` (`account_id`),
  KEY `FKekdq0418a9prh3doawobnvba4` (`customer_id`),
  CONSTRAINT `FKekdq0418a9prh3doawobnvba4` FOREIGN KEY (`customer_id`) REFERENCES `t_customers` (`id`),
  CONSTRAINT `FKqweupqsinmwsxm5jhvrlsdtwn` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `loan_contracts` */

insert into `loan_contracts` (`id`,`effective_date`,`effective_loan_amount`,`installment_amount`,`interest_rate`,`loan_application_no`,`loan_approved_date`,`loan_contract_code`,`loan_end_date`,`number_of_installments`,`status`,`account_id`,`customer_id`) values (1,'2019-01-01','100000.00','10370.00','8.00','10001','2018-01-01','1001','2019-01-01',10,'Active',1,1);
insert into `loan_contracts` (`id`,`effective_date`,`effective_loan_amount`,`installment_amount`,`interest_rate`,`loan_application_no`,`loan_approved_date`,`loan_contract_code`,`loan_end_date`,`number_of_installments`,`status`,`account_id`,`customer_id`) values (2,'2019-01-01','120000.00','10662.00','12.00','10002','2018-10-01','1002','2022-01-01',10,'Active',2,2);
insert into `loan_contracts` (`id`,`effective_date`,`effective_loan_amount`,`installment_amount`,`interest_rate`,`loan_application_no`,`loan_approved_date`,`loan_contract_code`,`loan_end_date`,`number_of_installments`,`status`,`account_id`,`customer_id`) values (3,'2019-01-01','150000.00','15696.00','10.00','10003','2018-01-01','1003','2019-01-01',10,'Active',3,3);
insert into `loan_contracts` (`id`,`effective_date`,`effective_loan_amount`,`installment_amount`,`interest_rate`,`loan_application_no`,`loan_approved_date`,`loan_contract_code`,`loan_end_date`,`number_of_installments`,`status`,`account_id`,`customer_id`) values (4,'2019-01-01','180000.00','15993.00','12.00','10004','2018-01-01','1004','2019-01-01',10,'Active',4,4);
insert into `loan_contracts` (`id`,`effective_date`,`effective_loan_amount`,`installment_amount`,`interest_rate`,`loan_application_no`,`loan_approved_date`,`loan_contract_code`,`loan_end_date`,`number_of_installments`,`status`,`account_id`,`customer_id`) values (5,'2019-01-01','200000.00','21116.00','12.00','10005','2018-10-01','1005','2022-01-01',10,'Active',5,5);
insert into `loan_contracts` (`id`,`effective_date`,`effective_loan_amount`,`installment_amount`,`interest_rate`,`loan_application_no`,`loan_approved_date`,`loan_contract_code`,`loan_end_date`,`number_of_installments`,`status`,`account_id`,`customer_id`) values (6,'2019-01-01','100000.00','8885.00','12.00','10006','2018-01-01','1006','2019-01-01',10,'Active',6,6);

/*Table structure for table `loan_scheduler` */

DROP TABLE IF EXISTS `loan_scheduler`;

CREATE TABLE `loan_scheduler` (
  `id` bigint(20) NOT NULL,
  `loan_effective_date` date NOT NULL,
  `installment_amount` decimal(19,2) DEFAULT NULL,
  `interest_amount` decimal(19,2) DEFAULT NULL,
  `principal_amount` decimal(19,2) DEFAULT NULL,
  `repayment_date` date NOT NULL,
  `repayment_day` int(11) DEFAULT NULL,
  `loan_contract_id` bigint(20) DEFAULT NULL,
  `loan_balance` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhokk2t5humt0bxl8i77hj132b` (`loan_contract_id`),
  CONSTRAINT `FKhokk2t5humt0bxl8i77hj132b` FOREIGN KEY (`loan_contract_id`) REFERENCES `loan_contracts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `loan_scheduler` */

insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (1,'2019-11-01','10464.00','833.00','9631.00','2019-12-01',1,1,'89622.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (2,'2019-11-01','10464.00','753.00','9711.00','2020-01-01',2,1,'80658.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (3,'2019-11-01','10464.00','672.00','9792.00','2020-02-01',3,1,'70866.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (4,'2019-11-01','10464.00','591.00','9873.00','2020-03-01',4,1,'60993.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (5,'2019-11-01','10464.00','508.00','9956.00','2020-04-01',5,1,'51037.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (6,'2019-11-01','10464.00','425.00','10039.00','2020-05-01',6,1,'40998.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (7,'2019-11-01','10464.00','342.00','10122.00','2020-06-01',1,1,'30876.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (8,'2019-11-01','10464.00','257.00','10207.00','2020-07-01',2,1,'20669.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (9,'2019-11-01','10464.00','172.00','10292.00','2020-08-01',3,1,'10378.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (10,'2019-11-01','10464.00','86.00','10378.00','2020-09-01',4,1,'0.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (11,'2019-11-02','10662.00','1200.00','9462.00','2019-12-01',1,2,'110538.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (12,'2019-11-02','10662.00','1150.00','9556.00','2020-01-01',2,2,'100982.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (13,'2019-11-02','10662.00','1010.00','9652.00','2020-02-01',3,2,'91330.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (14,'2019-11-02','10662.00','913.00','9749.00','2020-03-01',4,2,'81581.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (15,'2019-11-02','10662.00','816.00','9846.00','2020-04-02',5,2,'71735.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (16,'2019-11-02','10662.00','717.00','9945.00','2020-05-02',6,2,'61791.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (17,'2019-11-02','10662.00','618.00','10044.00','2020-06-02',1,2,'51747.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (18,'2019-11-02','10662.00','517.00','10144.00','2020-07-02',2,2,'41602.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (19,'2019-11-02','10662.00','416.00','10246.00','2020-08-02',3,2,'31356.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (20,'2019-11-02','10662.00','314.00','10348.00','2020-09-02',4,2,'21008.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (21,'2019-11-02','10662.00','210.00','10452.00','2020-10-02',5,2,'10556.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (22,'2019-11-02','10662.00','106.00','10556.00','2020-11-02',6,2,'0.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (23,'2019-11-01','15696.00','1250.00','14446.00','2019-12-01',1,3,'135554.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (24,'2019-11-01','15696.00','1130.00','14556.00','2020-01-01',2,3,'120988.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (25,'2019-11-01','15696.00','1008.00','14668.00','2020-02-01',3,3,'106300.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (26,'2019-11-01','15696.00','886.00','14810.00','2020-03-01',4,3,'91489.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (27,'2019-11-01','15696.00','762.00','14934.00','2020-04-01',5,3,'76556.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (28,'2019-11-01','15696.00','638.00','15038.00','2020-05-01',6,3,'61498.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (29,'2019-11-01','15696.00','512.00','15184.00','2020-06-01',1,3,'46314.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (30,'2019-11-01','15696.00','386.00','15310.00','2020-07-01',2,3,'31004.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (31,'2019-11-01','15696.00','258.00','15438.00','2020-08-01',3,3,'15566.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (32,'2019-11-01','15696.00','130.00','15566.00','2020-09-01',4,3,'0.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (33,'2019-11-02','15993.00','1800.00','14193.00','2019-12-01',1,4,'165807.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (34,'2019-11-02','15993.00','1658.00','14355.00','2020-01-01',2,4,'151473.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (35,'2019-11-02','15993.00','1515.00','14478.00','2020-02-01',3,4,'136994.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (36,'2019-11-02','15993.00','1370.00','14623.00','2020-03-01',4,4,'122372.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (37,'2019-11-02','15993.00','1224.00','14769.00','2020-04-02',5,4,'107603.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (38,'2019-11-02','15993.00','1076.00','14917.00','2020-05-02',6,4,'92686.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (39,'2019-11-02','15993.00','927.00','15066.00','2020-06-02',1,4,'77620.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (40,'2019-11-02','15993.00','776.00','15217.00','2020-07-02',2,4,'62403.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (41,'2019-11-02','15993.00','624.00','15369.00','2020-08-02',3,4,'47035.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (42,'2019-11-02','15993.00','470.00','15522.00','2020-09-02',4,4,'31512.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (43,'2019-11-02','15993.00','315.00','15678.00','2020-10-02',5,4,'15834.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (44,'2019-11-02','15993.00','158.00','15834.00','2020-11-02',6,4,'0.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (45,'2019-11-01','21116.00','2000.00','19116.00','2019-12-01',1,5,'180884.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (46,'2019-11-01','21116.00','1809.00','19308.00','2020-01-01',2,5,'161576.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (47,'2019-11-01','21116.00','1616.00','19501.00','2020-02-01',3,5,'142075.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (48,'2019-11-01','21116.00','1421.00','19696.00','2020-03-01',4,5,'122380.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (49,'2019-11-01','21116.00','1224.00','19893.00','2020-04-01',5,5,'102487.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (50,'2019-11-01','21116.00','1025.00','20092.00','2020-05-01',6,5,'82396.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (51,'2019-11-01','21116.00','824.00','20292.00','2020-06-01',1,5,'62103.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (52,'2019-11-01','21116.00','621.00','20495.00','2020-07-01',2,5,'41608.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (53,'2019-11-01','21116.00','416.00','20700.00','2020-08-01',3,5,'20907.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (54,'2019-11-01','21116.00','209.00','20907.00','2020-09-01',4,5,'0.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (55,'2019-11-02','8885.00','1000.00','7885.00','2019-12-01',1,6,'92115.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (56,'2019-11-02','8885.00','921.00','7964.00','2020-01-01',2,6,'84151.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (57,'2019-11-02','8885.00','842.00','8043.00','2020-02-01',3,6,'76108.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (58,'2019-11-02','8885.00','761.00','8124.00','2020-03-01',4,6,'67984.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (59,'2019-11-02','8885.00','680.00','8205.00','2020-04-02',5,6,'59779.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (60,'2019-11-02','8885.00','598.00','8287.00','2020-05-02',6,6,'51492.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (61,'2019-11-02','8885.00','515.00','8370.00','2020-06-02',1,6,'43122.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (62,'2019-11-02','8885.00','431.00','8454.00','2020-07-02',2,6,'34668.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (63,'2019-11-02','8885.00','347.00','8538.00','2020-08-02',3,6,'26130.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (64,'2019-11-02','8885.00','261.00','8624.00','2020-09-02',4,6,'17507.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (65,'2019-11-02','8885.00','175.00','8710.00','2020-10-02',5,6,'8797.00');
insert into `loan_scheduler` (`id`,`loan_effective_date`,`installment_amount`,`interest_amount`,`principal_amount`,`repayment_date`,`repayment_day`,`loan_contract_id`,`loan_balance`) values (66,'2019-11-02','8885.00','88.00','8797.00','2020-11-02',6,6,'0.00');


/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` bigint(20) NOT NULL,
  `transaction_action` int(11) DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `transaction_number` varchar(255) DEFAULT NULL,
  `transaction_type` int(11) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs9u3i6al14jdrpqf1fth2fpao` (`location_id`),
  CONSTRAINT `FKs9u3i6al14jdrpqf1fth2fpao` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transactions` */

insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (1,1,'2020-01-12','100982323',1,1);
insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (2,1,'2020-01-12','200093333',1,1);
insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (3,1,'2020-01-12','232323232',1,1);
insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (4,1,'2020-01-12','232323323',1,1);
insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (5,1,'2020-01-12','212121212',1,1);
insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (6,1,'2020-01-12','212121545',1,1);
insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (7,1,'2020-01-12','100982323',2,1);
insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (8,1,'2020-01-12','200093333',2,1);
insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (9,1,'2020-01-12','232323232',2,1);
insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (10,1,'2020-01-12','232323323',2,1);
insert into `transactions` (`id`,`transaction_action`,`transaction_date`,`transaction_number`,`transaction_type`,`location_id`) values (11,1,'2020-01-12','212121212',2,1);

/*Table structure for table `transactions_detail` */

DROP TABLE IF EXISTS `transactions_detail`;

CREATE TABLE `transactions_detail` (
  `id` bigint(20) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `debit_or_credit` varchar(255) DEFAULT NULL,
  `transaction_amount` decimal(19,2) DEFAULT NULL,
  `transaction_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transactions_detail` */

insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (1,'2039484','DR','10000.00','2012-10-23');
insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (2,'21212','DR','23400.00','2020-01-23');
insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (3,'34343','CR','32990.00','2020-01-12');
insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (4,'2039484','DR','10000.00','2012-10-23');
insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (5,'21212','DR','23400.00','2020-01-23');
insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (6,'34343','CR','32990.00','2020-01-12');
insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (7,'2039484','DR','10000.00','2012-10-23');
insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (8,'21212','DR','23400.00','2020-01-23');
insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (9,'34343','CR','32990.00','2020-01-12');
insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (10,'2039484','DR','10000.00','2012-10-23');
insert into `transactions_detail` (`id`,`account_number`,`debit_or_credit`,`transaction_amount`,`transaction_date`) values (11,'21212','DR','23400.00','2020-01-23');

/*Table structure for table `transactions_transaction_details` */

DROP TABLE IF EXISTS `transactions_transaction_details`;

CREATE TABLE `transactions_transaction_details` (
  `transactions_id` bigint(20) NOT NULL,
  `transaction_details_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_2p2tf40s4f3eomhvt1k0nh6pb` (`transaction_details_id`),
  KEY `FKatasxo2bx6d61c0lqffuc5pql` (`transactions_id`),
  CONSTRAINT `FKatasxo2bx6d61c0lqffuc5pql` FOREIGN KEY (`transactions_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `FKj5ngedch1irlvnv4kruxm68gq` FOREIGN KEY (`transaction_details_id`) REFERENCES `transactions_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transactions_transaction_details` */

insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (1,1);
insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (2,2);
insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (3,3);
insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (4,4);
insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (5,5);
insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (6,6);
insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (7,7);
insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (8,8);
insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (9,9);
insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (10,10);
insert into `transactions_transaction_details` (`transactions_id`,`transaction_details_id`) values (11,11);

SET SQL_MODE=@OLD_SQL_MODE;