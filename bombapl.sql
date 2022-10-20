-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Paź 2022, 14:05
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `bombapl`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `answer` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `answer`
--

INSERT INTO `answer` (`id`, `answer`) VALUES
(1, 'tak'),
(2, 'nie'),
(3, 'pytasz dzika czy sra w lesie'),
(4, 'nikt nie wie'),
(5, 'bo oszalal'),
(6, 'szajbus malpiszon'),
(7, 'bo sa tam robale'),
(8, 'bo gra w to czarek i remek'),
(9, 'emoticon'),
(10, 'remek'),
(11, 'remigiusz pawlowski'),
(12, 'remyy'),
(13, 'pizza'),
(14, 'burger'),
(15, 'crazy hamburger'),
(16, 'oczywiscie'),
(17, 'glupek'),
(18, 'igor'),
(19, 'opel mazda'),
(20, 'zolty'),
(21, 'brazowy'),
(22, 'zolty matiz'),
(23, 'nie wiem'),
(24, 'playboy carti'),
(25, 'bedoes'),
(26, 'szpaku'),
(27, 'kaziplayames'),
(28, 'z kojotem'),
(29, 'z krzywym kregoslupem'),
(30, 'z serkiem'),
(31, 'z niczym'),
(32, 'nie je'),
(33, 'kakilon'),
(34, 'kibilec'),
(35, 'balbadesz'),
(36, 'osdgih'),
(37, 'fgghfghf');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `question` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `question`
--

INSERT INTO `question` (`id`, `question`) VALUES
(1, 'Czy Remigiusz jezdzi oplem?'),
(2, 'Czemu Czarek jest nie mi ły tego typu'),
(3, 'Czemu grounded jest dziwne?'),
(4, 'Fioletowy chłopak'),
(5, 'Freddy Fazbear'),
(6, 'chmielu mutant'),
(7, 'Jakiego koloru jest zolty matiz taty Norberta'),
(8, 'Najgorszy raper 2022'),
(9, 'Z czym Remek je bułke'),
(10, 'dgsdgs');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `question_has_answer`
--

CREATE TABLE `question_has_answer` (
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `correct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `question_has_answer`
--

INSERT INTO `question_has_answer` (`question_id`, `answer_id`, `correct`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 1),
(2, 4, 0),
(2, 5, 1),
(2, 6, 0),
(3, 7, 0),
(3, 8, 0),
(3, 9, 1),
(4, 10, 0),
(4, 11, 1),
(4, 12, 0),
(5, 13, 1),
(5, 14, 0),
(5, 15, 0),
(6, 16, 0),
(6, 17, 1),
(6, 18, 1),
(6, 19, 0),
(7, 20, 1),
(7, 21, 0),
(7, 22, 1),
(7, 23, 0),
(8, 24, 0),
(8, 25, 1),
(8, 26, 1),
(8, 27, 0),
(9, 28, 1),
(9, 29, 1),
(9, 30, 1),
(9, 31, 0),
(9, 32, 0),
(10, 33, 1),
(10, 34, 1),
(10, 35, 1),
(10, 36, 1),
(10, 37, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_has_answer`
--

CREATE TABLE `user_has_answer` (
  `user_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_has_question`
--

CREATE TABLE `user_has_question` (
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `question_has_answer`
--
ALTER TABLE `question_has_answer`
  ADD PRIMARY KEY (`question_id`,`answer_id`),
  ADD KEY `fk_question_has_answer_answer1_idx` (`answer_id`),
  ADD KEY `fk_question_has_answer_question1_idx` (`question_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user_has_answer`
--
ALTER TABLE `user_has_answer`
  ADD PRIMARY KEY (`user_id`,`answer_id`),
  ADD KEY `fk_user_has_answer_answer1_idx` (`answer_id`),
  ADD KEY `fk_user_has_answer_user1_idx` (`user_id`);

--
-- Indeksy dla tabeli `user_has_question`
--
ALTER TABLE `user_has_question`
  ADD PRIMARY KEY (`user_id`,`question_id`),
  ADD KEY `fk_user_has_question_question1_idx` (`question_id`),
  ADD KEY `fk_user_has_question_user_idx` (`user_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `question_has_answer`
--
ALTER TABLE `question_has_answer`
  ADD CONSTRAINT `fk_question_has_answer_answer1` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_question_has_answer_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `user_has_answer`
--
ALTER TABLE `user_has_answer`
  ADD CONSTRAINT `fk_user_has_answer_answer1` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_answer_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `user_has_question`
--
ALTER TABLE `user_has_question`
  ADD CONSTRAINT `fk_user_has_question_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_question_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
