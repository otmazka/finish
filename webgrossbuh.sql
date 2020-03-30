-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 30 2020 г., 19:30
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.3

--
-- 30.03.2020
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `webgrossbuh`
--

-- --------------------------------------------------------

--
-- Структура таблицы `account`
--
-- Создание: Мар 30 2020 г., 10:14
-- Последнее обновление: Мар 30 2020 г., 15:52
--

CREATE TABLE `account` (
  `ID` bigint(20) NOT NULL,
  `AUTHOR` varchar(255) DEFAULT NULL,
  `MONTH` varchar(255) DEFAULT NULL,
  `NUMBER` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `YEAR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ССЫЛКИ ТАБЛИЦЫ `account`:
--

--
-- Дамп данных таблицы `account`
--

INSERT INTO `account` (`ID`, `AUTHOR`, `MONTH`, `NUMBER`, `TITLE`, `TOTAL`, `YEAR`) VALUES
(1, 'PerfectPluss', '3', 30032020, 'KU Vostochnoi', 1450, 2020),
(2, 'PerfectPluss', '3', 27032020, 'BuhUslugi', 700, 2020),
(3, 'PerfectPluss', '3', 27032020, 'BuhUslugi', 2450, 2020),
(4, 'PerfectPluss', '3', 27032020, 'BuhUslugi', 235, 2020);

-- --------------------------------------------------------

--
-- Структура таблицы `company`
--
-- Создание: Мар 30 2020 г., 10:14
-- Последнее обновление: Мар 30 2020 г., 14:17
--

CREATE TABLE `company` (
  `ID` bigint(20) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FORM` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ССЫЛКИ ТАБЛИЦЫ `company`:
--

--
-- Дамп данных таблицы `company`
--

INSERT INTO `company` (`ID`, `ADDRESS`, `EMAIL`, `FORM`, `NAME`) VALUES
(1, 'Viiru 23-13, 40232 Sillamae', 'info@vostochnoi.ee', 'KU', 'Vostochnoi'),
(2, 'Narva, Tallinna mnt 45', 'info@perfectpluss.eu', 'FIE', 'PerfectPluss');

-- --------------------------------------------------------

--
-- Структура таблицы `history`
--
-- Создание: Мар 30 2020 г., 10:14
-- Последнее обновление: Мар 30 2020 г., 15:52
--

CREATE TABLE `history` (
  `ID` bigint(20) NOT NULL,
  `PAYMENTDATE` datetime DEFAULT NULL,
  `TAKEON` datetime DEFAULT NULL,
  `ACCOUNT_ID` bigint(20) DEFAULT NULL,
  `COMPANY_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ССЫЛКИ ТАБЛИЦЫ `history`:
--   `ACCOUNT_ID`
--       `account` -> `ID`
--   `COMPANY_ID`
--       `company` -> `ID`
--

--
-- Дамп данных таблицы `history`
--

INSERT INTO `history` (`ID`, `PAYMENTDATE`, `TAKEON`, `ACCOUNT_ID`, `COMPANY_ID`) VALUES
(1, NULL, '2020-03-30 17:19:25', 1, 1),
(2, '2020-03-30 17:27:43', NULL, 1, 1),
(3, NULL, '2020-03-30 17:53:32', 2, NULL),
(4, NULL, '2020-03-30 18:29:20', 3, NULL),
(5, NULL, '2020-03-30 18:52:33', 4, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--
-- Создание: Мар 30 2020 г., 10:14
-- Последнее обновление: Мар 30 2020 г., 14:17
--

CREATE TABLE `user` (
  `ID` bigint(20) NOT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `SALTS` varchar(255) DEFAULT NULL,
  `COMPANY_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ССЫЛКИ ТАБЛИЦЫ `user`:
--   `COMPANY_ID`
--       `company` -> `ID`
--

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`ID`, `LOGIN`, `PASSWORD`, `SALTS`, `COMPANY_ID`) VALUES
(1, 'vostochnoi', 'd6bb2bafe6da334984d352ec3086975758d63f3fa71fdca20843d03a817a22f0', '21e248c262c5f485a0c0b817739e2312', 1),
(2, 'admin', 'a024a1f4679560ef970b82a18fddc930a2e50b3e733616566ae7d83227aa344f', '3243fa6b2cc3856edf41f15b4f76d323', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ADDRESS` (`ADDRESS`);

--
-- Индексы таблицы `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_HISTORY_COMPANY_ID` (`COMPANY_ID`),
  ADD KEY `FK_HISTORY_ACCOUNT_ID` (`ACCOUNT_ID`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_USER_COMPANY_ID` (`COMPANY_ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `account`
--
ALTER TABLE `account`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `company`
--
ALTER TABLE `company`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `history`
--
ALTER TABLE `history`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_HISTORY_ACCOUNT_ID` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `FK_HISTORY_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_USER_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
