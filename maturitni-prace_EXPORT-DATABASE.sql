-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_czech_ci NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id_comment`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `comment` (`id_comment`, `content`, `task_id`, `user_id`, `created_at`) VALUES
(1,	'tragafg A TEATs',	3,	12,	'2021-04-15 13:16:35'),
(13,	' AGDASDGADGH',	3,	11,	'2021-04-15 13:30:39'),
(14,	' AGADGADG',	3,	11,	'2021-04-15 13:30:43'),
(15,	' AGADGADG',	3,	11,	'2021-04-15 13:30:57'),
(16,	' AGADGADG',	3,	11,	'2021-04-15 13:33:08'),
(17,	' AGADGADG',	3,	11,	'2021-04-15 13:33:21'),
(18,	' ADAADDA\r\nADAD\r\n\r\nAD\r\nA\r\nDA\r\nD\r\nAD',	3,	11,	'2021-04-15 13:50:18'),
(19,	' jo pisu kiment',	7,	12,	'2021-04-22 12:16:25'),
(20,	' komentar',	8,	19,	'2021-05-06 13:04:49'),
(21,	' To by jsem teda mněl.',	18,	11,	'2021-05-06 13:44:18');

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `sname` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `description` text COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `roles` (`id_role`, `name`, `sname`, `description`) VALUES
(1,	'NEVYPLNĚNO',	'null',	'-'),
(2,	'ZADAVATEL',	'submitter',	'Má přístup k:\r\nzobrazení seznamů úkolů,\r\nzobrazení konkrétního seznamu úkolů,\r\nzobrazení detailu úkolu,\r\npřidání úkolu do konkrétního seznamu úkolů,\r\nkomentování úkolu.\r\n'),
(3,	'REALIZÁTOR',	'implementer',	'má přístup k:\r\nzobrazení seznamů úkolů,\r\nzobrazení konkrétního seznamu úkolů,\r\nzobrazení detailu úkolu,\r\npřidání úkolu do konkrétního seznamu úkolů,\r\nkomentování úkolu.\r\n'),
(4,	'ADMINISTRÁTOR',	'admin',	'má:\r\npřístup všech předešlých rolí,\r\nnavíc může přidávat uživatele,\r\npřidělovat jim role, \r\nměnit hesla a jejich údaje. \r\n');

CREATE TABLE `tasklists` (
  `id_tasklist` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `description` text COLLATE utf8_czech_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id_tasklist`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `tasklists` (`id_tasklist`, `name`, `description`, `created_at`) VALUES
(1,	'NEVYPLĚNO',	'nevyplněný údaj o seznamu úkolů',	'0000-00-00 00:00:00'),
(8,	'Úkoly pro grafky',	'Seznam úkolů, které jsou určené pro pracovníky na pozici grafik a design.',	'2021-05-06 13:36:33'),
(7,	'Pracovní úkoly',	'Definice pojmů „plnění pracovních úkolů” a „přímá souvislost s plněním pracovních úkolů” jsou obsaženy v § 273 a 274 ZP.',	'2021-05-06 11:10:45'),
(9,	'Úkoly pro programátory',	'Úkoly určené pro pracovníky na pozici programátor.',	'2021-05-06 13:36:56'),
(10,	'Úklid pokoje',	'Musím si uklidit pokoj.',	'2021-05-06 13:37:53');

CREATE TABLE `tasks` (
  `id_task` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `description` text COLLATE utf8_czech_ci DEFAULT NULL,
  `datetime_from` datetime DEFAULT NULL,
  `datetime_to` datetime DEFAULT NULL,
  `id_tasklist` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `tasks` (`id_task`, `title`, `description`, `datetime_from`, `datetime_to`, `id_tasklist`) VALUES
(8,	'Pracovní cesta',	'Jestliže zaměstnanec vykonává činnost, která je předmětem pracovní cesty, jedná se rovněž o plnění pracovních úkolů. Podle § 42 ZP se pracovní cestou rozumí časově omezené vyslání zaměstnance zaměstnavatelem k výkonu práce mimo sjednané místo výkonu práce. ',	'2021-05-06 11:11:00',	'2021-05-06 12:30:00',	7),
(17,	'Vyluxovat pokoj',	'Pomocí luxu vysát pokojíček od špíny na zemi.',	'2021-05-16 13:39:00',	'2021-05-17 13:39:00',	10),
(16,	'Uklidit pracovní stůl',	'Poklidit si věci na stole a dát je do určitých šuplíků.',	'2021-06-03 13:38:00',	'2021-06-04 13:38:00',	10),
(9,	'Cesta do zaměstnání',	'Ve smyslu § 274a ZP se cestou do zaměstnání rozumí cesta z místa zaměstnancova bydliště (ubytování) do místa vstupu do objektu zaměstnavatele nebo na jiné místo určené k plnění pracovních úkolů a zpět; u zaměstnanců v lesnictví, zemědělství a stavebnictví také cesta na určené shromaždiště a zpět.',	'2021-05-11 13:00:00',	'2021-05-11 14:00:00',	7),
(10,	'Splnění pracovního úkolu',	'Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit cum illo quod quae odit sunt repellendus, autem minus eius incidunt totam obcaecati fugiat temporibus nobis et nemo ex, expedita ipsum!',	'2021-05-14 11:14:00',	'2021-05-21 14:14:00',	7),
(18,	'Utřít prach',	'setřít prach z ploch, kde je na ně vidět.',	'2021-05-14 13:42:00',	'2021-05-15 13:42:00',	10),
(11,	'etest',	'test',	'2021-05-06 13:00:00',	'2021-05-14 13:00:00',	7),
(19,	'Naprogramovat kalkulačku',	'Úkol, kde musí programátoři naprogramovat funkční kalkulačku se základními funkcemi (+, -, *, /)',	'2021-05-13 13:48:00',	'2021-06-13 13:48:00',	9),
(20,	'Vytvořit hru ',	'Naprogramovat strategickou hru, kde bude hráč schopen zničit jednotlivé herní kostky a jeho úkolem je porazit mýtického draka z jiné dimenze.',	'2002-01-31 13:51:00',	'2011-11-18 13:50:00',	9),
(21,	'Navrhnout web graficky',	'Grafici mají za úkol navrhnout grafický znázornění webu, kde mají být reklamy, kde záhlaví, zápatí. Text a ostatní příspěvky.',	'2021-05-01 13:52:00',	'2021-07-01 19:14:00',	8),
(22,	'Převléct povlečení',	'Převléknout postel, a veškeré polštáře.',	'2021-05-14 13:55:00',	'2021-05-14 16:00:00',	10),
(23,	'Vyprat prádlo',	'Sebrat všechno špinavé prádlo a naházet ho do pračky.',	'2021-05-08 13:55:00',	'2021-05-09 00:57:00',	10),
(24,	'Uklidit nádobí',	'posbírat všechno nádobí a odnést do kuchyně. To špinavé naskládat do myčky ',	'2021-05-07 14:00:00',	'2021-05-06 15:00:00',	10),
(25,	'Vytvořit portfolo',	'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio pariatur voluptates expedita consequuntur ullam, quis recusandae id itaque dolor odit sunt sed exercitationem aspernatur repudiandae sapiente, voluptas consectetur hic laboriosam.',	'2021-05-07 14:21:00',	'2021-06-07 18:21:00',	8);

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `phonenumber` int(11) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `address` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `id_role` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `users` (`id_user`, `firstname`, `lastname`, `email`, `password`, `phonenumber`, `birthdate`, `address`, `city`, `id_role`, `created_at`) VALUES
(12,	'Martin',	'David',	'martin.david@seznam.cz',	'$6$rounds=5000$usesomesillystri$PuxMz1.CfLquO1z8clZhM3jl4LXOU3xoahnPaKHywIzObFcQQCXlmAhRAioS1UXQ06MecWfw.b.CesHUd0aTU/',	735773577,	'2020-12-10',	'Roháčova 54',	'Kolín 280 02',	2,	'2020-12-09 12:01:51'),
(11,	'Peťan',	'Stanislav',	'petko.stan@seznam.cz',	'$6$rounds=5000$usesomesillystri$PuxMz1.CfLquO1z8clZhM3jl4LXOU3xoahnPaKHywIzObFcQQCXlmAhRAioS1UXQ06MecWfw.b.CesHUd0aTU/',	888555777,	'1999-06-09',	'Nerudova 18',	'Kolín 280 02',	4,	'2020-12-09 11:31:27'),
(17,	'Karel',	'Vaněk',	'karel.vanek@email.cz',	'$6$rounds=5000$usesomesillystri$PuxMz1.CfLquO1z8clZhM3jl4LXOU3xoahnPaKHywIzObFcQQCXlmAhRAioS1UXQ06MecWfw.b.CesHUd0aTU/',	478152698,	'1965-06-16',	'Pražská 2',	'Velim 281 01',	2,	'2021-05-04 15:06:53'),
(15,	'Jaromír',	'Jelen',	'jaromir.jelen@seznam.cz',	'$6$rounds=5000$usesomesillystri$PuxMz1.CfLquO1z8clZhM3jl4LXOU3xoahnPaKHywIzObFcQQCXlmAhRAioS1UXQ06MecWfw.b.CesHUd0aTU/',	754159874,	'1976-10-02',	'Gregrova 398',	'Pardubice 53002',	2,	'2021-05-04 15:01:30'),
(14,	'Květoslav',	'Chvatík',	'kvetoslav.chvatik@seznam.cz',	'$6$rounds=5000$usesomesillystri$PuxMz1.CfLquO1z8clZhM3jl4LXOU3xoahnPaKHywIzObFcQQCXlmAhRAioS1UXQ06MecWfw.b.CesHUd0aTU/',	774854126,	'1998-01-16',	'Horáčkova, 18',	'Hradec Králové 500 02',	2,	'2021-05-04 14:59:54'),
(16,	'Alžběta',	'Nováková',	'alzbeta.novakova@gmail.com',	'$6$rounds=5000$usesomesillystri$PuxMz1.CfLquO1z8clZhM3jl4LXOU3xoahnPaKHywIzObFcQQCXlmAhRAioS1UXQ06MecWfw.b.CesHUd0aTU/',	748512632,	'1987-05-12',	'Bezručova 75',	'Kolín 280 02',	4,	'2021-05-04 15:05:05'),
(18,	'Jan',	'Horáček',	'jan.horacek@seznam.cz',	'$6$rounds=5000$usesomesillystri$PuxMz1.CfLquO1z8clZhM3jl4LXOU3xoahnPaKHywIzObFcQQCXlmAhRAioS1UXQ06MecWfw.b.CesHUd0aTU/',	774854147,	'1987-09-25',	'Kostomlatská 60',	'Nymburk 288 02',	2,	'2021-05-04 15:08:19'),
(19,	'test',	'test',	'test@test.cz',	'$6$rounds=5000$usesomesillystri$PuxMz1.CfLquO1z8clZhM3jl4LXOU3xoahnPaKHywIzObFcQQCXlmAhRAioS1UXQ06MecWfw.b.CesHUd0aTU/',	789789789,	'2021-05-12',	'test',	'test',	2,	'2021-05-06 13:04:29');

-- 2021-05-06 13:42:21
