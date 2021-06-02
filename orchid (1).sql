-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 31 2021 г., 20:40
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `orchid`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL COMMENT 'id категории',
  `name` varchar(50) NOT NULL COMMENT 'Название на английском',
  `name_rus` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'название категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_rus`) VALUES
(1, 'televisions', 'Телевизоры'),
(2, 'phones', 'Телефоны'),
(3, 'vacuum_cleaners', 'Пылесосы');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int NOT NULL COMMENT 'id товара',
  `category` int NOT NULL COMMENT 'id категории',
  `title` varchar(50) NOT NULL COMMENT 'название товара',
  `image` varchar(50) NOT NULL COMMENT 'имя файла изображения с расширением в папке img',
  `price` int NOT NULL COMMENT 'цена',
  `options` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'описание в виде {"название характеристики": "описание характеристики", "название": "описание"}',
  `rating` float DEFAULT NULL COMMENT 'рейтинг товара'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `category`, `title`, `image`, `price`, `options`, `rating`) VALUES
(1, 3, 'SC52, пылесос с мешком, 410 Вт', 'sc52red.jpg', 4490, '{\"Цвет\": \"Красный\", \"Способ сбора пыли\": \"мешок\", \"Макс. Потребляемая мощность (ВТ)\": \"1800\", \"Мощность всасывания\": \"410\"}', 4.9),
(2, 3, 'SC52, пылесос с мешком', 'sc52blue.jpg', 4490, '{\"Цвет\": \"Синий\", \"Способ сбора пыли\": \"мешок\", \"Макс. Потребляемая мощность (ВТ)\": \"1800\", \"Мощность всасывания\": \"410\"}', 4.5),
(3, 1, 'ТЕЛЕВИЗОР SAMSUNG ЖК UE-70TU7090U (4K) SMART', 'tv-samsung-ue-70tu7090u.jpg', 22199, '{\"Модель\": \"Samsung UE70TU7090\", \"Диагональ экрана\": \"70″\", \"Разрешение экрана\": \"4K UltraHD, 3840×2160\", \"Формат экрана\": \"16:9\"}', 4.7);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`name`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id категории', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id товара', AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
