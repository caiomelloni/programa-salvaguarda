CREATE SCHEMA IF NOT EXISTS `dart` DEFAULT CHARACTER SET utf8;
USE `dart`;

CREATE TABLE IF NOT EXISTS `dart`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `cellphone` VARCHAR(255) NOT NULL,
  `role` VARCHAR(255) NOT NULL,
  `university` VARCHAR(255) NOT NULL,
  `course` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `hours_worked` INT NULL DEFAULT 0,
  `is_active` TINYINT NULL DEFAULT 1,
  `is_banned` TINYINT NULL DEFAULT 0,
  `dt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dart`.`admins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `cellphone` VARCHAR(255) NOT NULL,
  `role` VARCHAR(255) NULL DEFAULT 'admin',
  `password` VARCHAR(255) NOT NULL,
  `dt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `dart`.`workload` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hours_worked` INT NOT NULL,
  `description` LONGTEXT NOT NULL,
  `feedback` LONGTEXT NOT NULL,
  `dt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `year` INT NOT NULL,
  `month` INT NOT NULL,
  `id_user` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `dart`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `dart`.`pendencies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `year` INT NOT NULL,
  `month` INT NOT NULL,
  `pending` TINYINT NULL DEFAULT 1,
  `dt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pendencies_id_user` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `pendencies_id_user`
    FOREIGN KEY (`pendencies_id_user`)
    REFERENCES `dart`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;