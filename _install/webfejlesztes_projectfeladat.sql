-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Jan 03. 16:16
-- Kiszolgáló verziója: 10.4.25-MariaDB
-- PHP verzió: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `webfejlesztes_projectfeladat`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `blogs`
--

CREATE TABLE `blogs` (
  `id` int(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `blogs`
--

INSERT INTO `blogs` (`id`, `name`, `title`, `subtitle`, `description`, `content`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, '1. blog', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam amet asperiores aut dolores eligendi eos maiores nihil soluta ullam vero!', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi autem dignissimos distinctio ea, error ex facilis fugiat hic iure iusto labore maiores maxime, minima necessitatibus nesciunt numquam optio perspiciatis placeat provident quis repellendus repudiandae sapiente sit tempora temporibus! Consequatur cumque eius necessitatibus neque, odit officiis placeat praesentium quos ratione tenetur.', 1, '2022-12-29 14:40:22', '2022-12-29 15:10:14', NULL),
(8, '2.blog', 'Lorem ipsum.', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam amet asperiores aut dolores eligendi eos maiores nihil soluta ullam vero!', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi autem dignissimos distinctio ea, error ex facilis fugiat hic iure iusto labore maiores maxime, minima necessitatibus nesciunt numquam optio perspiciatis placeat provident quis repellendus repudiandae sapiente sit tempora temporibus! Consequatur cumque eius necessitatibus neque, odit officiis placeat praesentium quos ratione tenetur.', 1, '2022-12-29 15:10:56', '2022-12-29 15:10:56', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `company_data`
--

CREATE TABLE `company_data` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_zip_code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `company_data`
--

INSERT INTO `company_data` (`id`, `name`, `address`, `address_zip_code`, `address_city`, `phone_number`, `email`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(0, 'Didus HandMade', 'Horgoló u. 12', '121212', 'Lekváros', '+361-55555', 'didus@handmade.hu', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'App\\Models\\Product', 2, 'de2f0ff6-1b65-4e65-802b-3663f992bd77', 'image', '69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798', '69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798.jpeg', 'image/jpeg', 'public', 'public', 397719, '[]', '[]', '{\"thumb\":true,\"public\":true}', '{\"media_library_original\":{\"urls\":[\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_1536_2048.jpeg\",\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_1285_1713.jpeg\",\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_1075_1433.jpeg\",\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_899_1199.jpeg\",\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_752_1003.jpeg\",\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_629_839.jpeg\",\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_526_701.jpeg\",\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_440_587.jpeg\",\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_368_491.jpeg\",\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_308_411.jpeg\",\"69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798___media_library_original_258_344.jpeg\"],\"base64svg\":\"data:image\\/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHg9IjAiCiB5PSIwIiB2aWV3Qm94PSIwIDAgMTUzNiAyMDQ4Ij4KCTxpbWFnZSB3aWR0aD0iMTUzNiIgaGVpZ2h0PSIyMDQ4IiB4bGluazpocmVmPSJkYXRhOmltYWdlL2pwZWc7YmFzZTY0LC85ai80QUFRU2taSlJnQUJBUUVBWUFCZ0FBRC8vZ0E3UTFKRlFWUlBVam9nWjJRdGFuQmxaeUIyTVM0d0lDaDFjMmx1WnlCSlNrY2dTbEJGUnlCMk9EQXBMQ0J4ZFdGc2FYUjVJRDBnT1RBSy85c0FRd0FEQWdJREFnSURBd01EQkFNREJBVUlCUVVFQkFVS0J3Y0dDQXdLREF3TENnc0xEUTRTRUEwT0VRNExDeEFXRUJFVEZCVVZGUXdQRnhnV0ZCZ1NGQlVVLzlzQVF3RURCQVFGQkFVSkJRVUpGQTBMRFJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVUvOEFBRVFnQUt3QWdBd0VpQUFJUkFRTVJBZi9FQUI4QUFBRUZBUUVCQVFFQkFBQUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVRQUFJQkF3TUNCQU1GQlFRRUFBQUJmUUVDQXdBRUVRVVNJVEZCQmhOUllRY2ljUlF5Z1pHaENDTkNzY0VWVXRId0pETmljb0lKQ2hZWEdCa2FKU1luS0NrcU5EVTJOemc1T2tORVJVWkhTRWxLVTFSVlZsZFlXVnBqWkdWbVoyaHBhbk4wZFhaM2VIbDZnNFNGaG9lSWlZcVNrNVNWbHBlWW1acWlvNlNscHFlb3FhcXlzN1MxdHJlNHVickN3OFRGeHNmSXljclMwOVRWMXRmWTJkcmg0dVBrNWVibjZPbnE4Zkx6OVBYMjkvajUrdi9FQUI4QkFBTUJBUUVCQVFFQkFRRUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVSQUFJQkFnUUVBd1FIQlFRRUFBRUNkd0FCQWdNUkJBVWhNUVlTUVZFSFlYRVRJaktCQ0JSQ2thR3h3UWtqTTFMd0ZXSnkwUW9XSkRUaEpmRVhHQmthSmljb0tTbzFOamM0T1RwRFJFVkdSMGhKU2xOVVZWWlhXRmxhWTJSbFptZG9hV3B6ZEhWMmQzaDVlb0tEaElXR2g0aUppcEtUbEpXV2w1aVptcUtqcEtXbXA2aXBxckt6dExXMnQ3aTV1c0xEeE1YR3g4akp5dExUMU5YVzE5aloydUxqNU9YbTUranA2dkx6OVBYMjkvajUrdi9hQUF3REFRQUNFUU1SQUQ4QS9MTnptbzZrWVZ0K0V2Q0Y3NHQxS08xczRpN3NjY0NvYnRxeHBYTURGRmU0ZUp2MmJmRUhoelJQdHN0c1NtM2NjQ3ZGcnkxZTBuZU4xS3NweGcxRVpxZXhVb09PNXIzUGh1N1JpUkdjVjMvd1IxZTg4TitLTGRWZzNNekRxSzZPVFI5eWNxRFRmREZ0SnAzaU9DV0tMZXdiZ1lwU2QweW9xelI3L3dERnI0c3oyUGhtT0c0Z3dycGdnaXZpSHhqcU1lcDZ0TFBESHNWam5BRmZWWGpxMXVQR09qdWJpUFlZVis2QlhnMnBlRFl5eDJqa0d1YkR4U1Z6b3JOdlE5SGprSFExYTB1ZE5Pdmx1RlVNdzlhekNlQlVpTWVPYTNaSjJTK0wyRVZ3SFFNSlJqRmNKTzhVdHk1WmR1VG10TlRsZWF6TlRRQVp4elV4U1d3U2JlNS8vOWs9Ij4KCTwvaW1hZ2U+Cjwvc3ZnPg==\"}}', 1, '2022-12-22 08:48:37', '2022-12-22 08:48:47', NULL),
(4, 'App\\Models\\Product', 3, 'bdcdf00d-aeeb-4d64-abc9-fe22f4cecbdf', 'image', 'IMG_2288', 'IMG_2288.JPEG', 'image/jpeg', 'public', 'public', 860730, '[]', '[]', '{\"thumb\":true,\"public\":true}', '{\"media_library_original\":{\"urls\":[\"IMG_2288___media_library_original_1536_2048.JPEG\",\"IMG_2288___media_library_original_1285_1713.JPEG\",\"IMG_2288___media_library_original_1075_1433.JPEG\",\"IMG_2288___media_library_original_899_1199.JPEG\",\"IMG_2288___media_library_original_752_1003.JPEG\",\"IMG_2288___media_library_original_629_839.JPEG\",\"IMG_2288___media_library_original_526_701.JPEG\",\"IMG_2288___media_library_original_440_587.JPEG\",\"IMG_2288___media_library_original_368_491.JPEG\",\"IMG_2288___media_library_original_308_411.JPEG\",\"IMG_2288___media_library_original_258_344.JPEG\",\"IMG_2288___media_library_original_215_287.JPEG\",\"IMG_2288___media_library_original_180_240.JPEG\"],\"base64svg\":\"data:image\\/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHg9IjAiCiB5PSIwIiB2aWV3Qm94PSIwIDAgMTUzNiAyMDQ4Ij4KCTxpbWFnZSB3aWR0aD0iMTUzNiIgaGVpZ2h0PSIyMDQ4IiB4bGluazpocmVmPSJkYXRhOmltYWdlL2pwZWc7YmFzZTY0LC85ai80QUFRU2taSlJnQUJBUUVBWUFCZ0FBRC8vZ0E3UTFKRlFWUlBVam9nWjJRdGFuQmxaeUIyTVM0d0lDaDFjMmx1WnlCSlNrY2dTbEJGUnlCMk9EQXBMQ0J4ZFdGc2FYUjVJRDBnT1RBSy85c0FRd0FEQWdJREFnSURBd01EQkFNREJBVUlCUVVFQkFVS0J3Y0dDQXdLREF3TENnc0xEUTRTRUEwT0VRNExDeEFXRUJFVEZCVVZGUXdQRnhnV0ZCZ1NGQlVVLzlzQVF3RURCQVFGQkFVSkJRVUpGQTBMRFJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVUvOEFBRVFnQUt3QWdBd0VpQUFJUkFRTVJBZi9FQUI4QUFBRUZBUUVCQVFFQkFBQUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVRQUFJQkF3TUNCQU1GQlFRRUFBQUJmUUVDQXdBRUVRVVNJVEZCQmhOUllRY2ljUlF5Z1pHaENDTkNzY0VWVXRId0pETmljb0lKQ2hZWEdCa2FKU1luS0NrcU5EVTJOemc1T2tORVJVWkhTRWxLVTFSVlZsZFlXVnBqWkdWbVoyaHBhbk4wZFhaM2VIbDZnNFNGaG9lSWlZcVNrNVNWbHBlWW1acWlvNlNscHFlb3FhcXlzN1MxdHJlNHVickN3OFRGeHNmSXljclMwOVRWMXRmWTJkcmg0dVBrNWVibjZPbnE4Zkx6OVBYMjkvajUrdi9FQUI4QkFBTUJBUUVCQVFFQkFRRUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVSQUFJQkFnUUVBd1FIQlFRRUFBRUNkd0FCQWdNUkJBVWhNUVlTUVZFSFlYRVRJaktCQ0JSQ2thR3h3UWtqTTFMd0ZXSnkwUW9XSkRUaEpmRVhHQmthSmljb0tTbzFOamM0T1RwRFJFVkdSMGhKU2xOVVZWWlhXRmxhWTJSbFptZG9hV3B6ZEhWMmQzaDVlb0tEaElXR2g0aUppcEtUbEpXV2w1aVptcUtqcEtXbXA2aXBxckt6dExXMnQ3aTV1c0xEeE1YR3g4akp5dExUMU5YVzE5aloydUxqNU9YbTUranA2dkx6OVBYMjkvajUrdi9hQUF3REFRQUNFUU1SQUQ4QTVMd1Arejk0ZnZiWlRjb0V3TzlQMWY0RjZCRGNPc0xLb1U5elhWRFVwN1cxT3c3VkE2aXVDMXZVN3Rya3VKMklKN0d1SG1iT25sU0xPb2ZBUFNvTFJaNE1TWkdUaXVXOFlmRGJUckhSV08zRGdWMDYrUHI3U0VqZ25qSlZod1Qzcks4WDYxL2ErbU14WUtUMnFlZE5YUWN1dGp0ZkZIaUcyMEd3bFYxMzVGWi93LzBXejhhYU5lVGVhRWRTU200OUs1RzludXZHT3VwcFZ1Tnp5Y2M5cTFsOEY2cjhON29XNlhKZnplV2pRMTVyeGJiOWxzZW04TEZMbXVaL2lyd3BxVnRjcVpaUk5ieEhxdk9CWEhhL3FLQU1rUk9BTVY2VmUrTHJIU2RGdm9MdHkxMjZuQ3Yycnd5OTF5TzZTWGIxeWVhN3FmUEdITE5IbTFPV1ZYbXA5aXg4TFBpM0hENDVHb1hqaUpBTTgxMitrZkhLMjhWZkZsWW5rMzIrN0FMSGl2azY0a2FJZ294VStvcGZETjNOYmVJSTVZcEdTVFAzZ2VhY0tVR3IyMUxuVmtuYTU5T2ZIUFdyVzc4V1NSYWVBUmo1dHZTdUJzTk9rZFdBUWttcXVnVHlYMnJ6dmNPWlh4MWJtdlFmRGNLTXh5b05jbUlxeWcrVkJTaW5xZi9aIj4KCTwvaW1hZ2U+Cjwvc3ZnPg==\"}}', 1, '2022-12-22 09:10:49', '2022-12-22 09:10:58', NULL),
(5, 'App\\Models\\Product', 4, 'ddde2dd6-9022-4651-8824-0509a4f6e884', 'image', 'IMG_2290', 'IMG_2290.JPEG', 'image/jpeg', 'public', 'public', 926043, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2022-12-22 09:50:20', '2022-12-22 09:50:21', NULL),
(17, 'App\\Models\\Slider', 14, 'a7ddce07-13a6-440c-b7f4-1eacd8b67e23', 'image', 'karina-l-3QFVlumyukQ-unsplash', 'karina-l-3QFVlumyukQ-unsplash.jpg', 'image/jpeg', 'public', 'public', 2378813, '[]', '[]', '{\"thumb\":true,\"slide\":true}', '{\"media_library_original\":{\"urls\":[\"karina-l-3QFVlumyukQ-unsplash___media_library_original_3840_2160.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_3212_1807.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_2688_1512.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_2248_1265.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_1881_1058.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_1574_885.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_1317_741.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_1101_619.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_921_518.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_771_434.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_645_363.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_539_303.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_451_254.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_377_212.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_316_178.jpg\",\"karina-l-3QFVlumyukQ-unsplash___media_library_original_264_149.jpg\"],\"base64svg\":\"data:image\\/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHg9IjAiCiB5PSIwIiB2aWV3Qm94PSIwIDAgMzg0MCAyMTYwIj4KCTxpbWFnZSB3aWR0aD0iMzg0MCIgaGVpZ2h0PSIyMTYwIiB4bGluazpocmVmPSJkYXRhOmltYWdlL2pwZWc7YmFzZTY0LC85ai80QUFRU2taSlJnQUJBUUVBWUFCZ0FBRC8vZ0E3UTFKRlFWUlBVam9nWjJRdGFuQmxaeUIyTVM0d0lDaDFjMmx1WnlCSlNrY2dTbEJGUnlCMk9EQXBMQ0J4ZFdGc2FYUjVJRDBnT1RBSy85c0FRd0FEQWdJREFnSURBd01EQkFNREJBVUlCUVVFQkFVS0J3Y0dDQXdLREF3TENnc0xEUTRTRUEwT0VRNExDeEFXRUJFVEZCVVZGUXdQRnhnV0ZCZ1NGQlVVLzlzQVF3RURCQVFGQkFVSkJRVUpGQTBMRFJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVUvOEFBRVFnQUVnQWdBd0VpQUFJUkFRTVJBZi9FQUI4QUFBRUZBUUVCQVFFQkFBQUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVRQUFJQkF3TUNCQU1GQlFRRUFBQUJmUUVDQXdBRUVRVVNJVEZCQmhOUllRY2ljUlF5Z1pHaENDTkNzY0VWVXRId0pETmljb0lKQ2hZWEdCa2FKU1luS0NrcU5EVTJOemc1T2tORVJVWkhTRWxLVTFSVlZsZFlXVnBqWkdWbVoyaHBhbk4wZFhaM2VIbDZnNFNGaG9lSWlZcVNrNVNWbHBlWW1acWlvNlNscHFlb3FhcXlzN1MxdHJlNHVickN3OFRGeHNmSXljclMwOVRWMXRmWTJkcmg0dVBrNWVibjZPbnE4Zkx6OVBYMjkvajUrdi9FQUI4QkFBTUJBUUVCQVFFQkFRRUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVSQUFJQkFnUUVBd1FIQlFRRUFBRUNkd0FCQWdNUkJBVWhNUVlTUVZFSFlYRVRJaktCQ0JSQ2thR3h3UWtqTTFMd0ZXSnkwUW9XSkRUaEpmRVhHQmthSmljb0tTbzFOamM0T1RwRFJFVkdSMGhKU2xOVVZWWlhXRmxhWTJSbFptZG9hV3B6ZEhWMmQzaDVlb0tEaElXR2g0aUppcEtUbEpXV2w1aVptcUtqcEtXbXA2aXBxckt6dExXMnQ3aTV1c0xEeE1YR3g4akp5dExUMU5YVzE5aloydUxqNU9YbTUranA2dkx6OVBYMjkvajUrdi9hQUF3REFRQUNFUU1SQUQ4QW8zWUNnbW9kRTBRK0lycDRVUElGVGFpNEtFQ3BQaC9xVVdrNnk3enNGUnZXbkp0YkRpazl6bS9Fdnc1dWJLMHZKdC8zQVNLOFd0OVNsYTRsaWs2b3hGZlZmaTdYTEM3MHE5UkpWTHNEZ1Y4d05vL2szOXhJM1JtSnJtaktmTnFieVVGSFE5MnV1cHJEdUNSSWNIRkZGZHB5bVBmdTN6Zk1menJsTDc3N1VVVm5Jby8vMlE9PSI+Cgk8L2ltYWdlPgo8L3N2Zz4=\"}}', 1, '2022-12-26 08:40:40', '2022-12-26 08:41:05', NULL),
(18, 'App\\Models\\Slider', 16, 'a66053d5-612d-4497-8799-44ea839a7d9f', 'image', 'karina-l-BjGpLKlDKJA-unsplash', 'karina-l-BjGpLKlDKJA-unsplash.jpg', 'image/jpeg', 'public', 'public', 2738884, '[]', '[]', '{\"thumb\":true,\"slide\":true}', '{\"media_library_original\":{\"urls\":[\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_4875_2742.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_4078_2294.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_3412_1919.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_2855_1606.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_2388_1343.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_1998_1124.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_1672_940.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_1399_787.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_1170_658.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_979_551.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_819_461.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_685_385.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_573_322.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_479_269.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_401_226.jpg\",\"karina-l-BjGpLKlDKJA-unsplash___media_library_original_335_188.jpg\"],\"base64svg\":\"data:image\\/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHg9IjAiCiB5PSIwIiB2aWV3Qm94PSIwIDAgNDg3NSAyNzQyIj4KCTxpbWFnZSB3aWR0aD0iNDg3NSIgaGVpZ2h0PSIyNzQyIiB4bGluazpocmVmPSJkYXRhOmltYWdlL2pwZWc7YmFzZTY0LC85ai80QUFRU2taSlJnQUJBUUVBWUFCZ0FBRC8vZ0E3UTFKRlFWUlBVam9nWjJRdGFuQmxaeUIyTVM0d0lDaDFjMmx1WnlCSlNrY2dTbEJGUnlCMk9EQXBMQ0J4ZFdGc2FYUjVJRDBnT1RBSy85c0FRd0FEQWdJREFnSURBd01EQkFNREJBVUlCUVVFQkFVS0J3Y0dDQXdLREF3TENnc0xEUTRTRUEwT0VRNExDeEFXRUJFVEZCVVZGUXdQRnhnV0ZCZ1NGQlVVLzlzQVF3RURCQVFGQkFVSkJRVUpGQTBMRFJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVUvOEFBRVFnQUVnQWdBd0VpQUFJUkFRTVJBZi9FQUI4QUFBRUZBUUVCQVFFQkFBQUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVRQUFJQkF3TUNCQU1GQlFRRUFBQUJmUUVDQXdBRUVRVVNJVEZCQmhOUllRY2ljUlF5Z1pHaENDTkNzY0VWVXRId0pETmljb0lKQ2hZWEdCa2FKU1luS0NrcU5EVTJOemc1T2tORVJVWkhTRWxLVTFSVlZsZFlXVnBqWkdWbVoyaHBhbk4wZFhaM2VIbDZnNFNGaG9lSWlZcVNrNVNWbHBlWW1acWlvNlNscHFlb3FhcXlzN1MxdHJlNHVickN3OFRGeHNmSXljclMwOVRWMXRmWTJkcmg0dVBrNWVibjZPbnE4Zkx6OVBYMjkvajUrdi9FQUI4QkFBTUJBUUVCQVFFQkFRRUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVSQUFJQkFnUUVBd1FIQlFRRUFBRUNkd0FCQWdNUkJBVWhNUVlTUVZFSFlYRVRJaktCQ0JSQ2thR3h3UWtqTTFMd0ZXSnkwUW9XSkRUaEpmRVhHQmthSmljb0tTbzFOamM0T1RwRFJFVkdSMGhKU2xOVVZWWlhXRmxhWTJSbFptZG9hV3B6ZEhWMmQzaDVlb0tEaElXR2g0aUppcEtUbEpXV2w1aVptcUtqcEtXbXA2aXBxckt6dExXMnQ3aTV1c0xEeE1YR3g4akp5dExUMU5YVzE5aloydUxqNU9YbTUranA2dkx6OVBYMjkvajUrdi9hQUF3REFRQUNFUU1SQUQ4QWI0NzhiM09rNmo1TUNIQjcxcGVHdGVtMVN4RWtxN1dyWThRK0Y3VzhpTnhKR0hjQ3ZLOVQ4WFhPaDNUd0pBeXhxY0RBcmxuT2VIcU9VbTJtZlNVS05ETXNOR2xSU2pLTzdiM1BTbnQydkpzcU1rZGE1dlh0VWp0YjFiVXNDZTRyajlOK0x0NWFYTWlMQ1gzOGRPbFY3WkwzVTlWYTl1QWNPY2dHdEtkYXBXa21sWkhtNHJCVThIZU1wS1V2SStoYjNtM3J5dnh0REdkNTJMbjF4UlJYYlVQSncyN1BQcldOUHRnK1VkZlN1NnRWQXQ0K0JSUlJINFRTdjhhUC85az0iPgoJPC9pbWFnZT4KPC9zdmc+\"}}', 1, '2022-12-26 08:44:16', '2022-12-26 08:44:50', NULL),
(20, 'App\\Models\\Product', 9, 'c0113aa4-71db-4de2-bde3-4178c7678abc', 'image', 'BDD26C31-61FA-49D4-850A-2529F76BC859 (1)', 'BDD26C31-61FA-49D4-850A-2529F76BC859-(1).jpg', 'image/jpeg', 'public', 'public', 595178, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2022-12-26 09:22:23', '2022-12-26 09:22:23', NULL),
(21, 'App\\Models\\Product', 10, '070c1d98-6011-4740-9a67-6f3032e76b90', 'image', 'IMG_1122', 'IMG_1122.jpg', 'image/jpeg', 'public', 'public', 1590419, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2022-12-26 09:25:15', '2022-12-26 09:25:17', NULL),
(23, 'App\\Models\\Slider', 19, '1ab9c720-d653-4fa3-baa0-2e8d121defc5', 'image', 'annisa-ica-IB6q3nWCRYA-unsplash', 'annisa-ica-IB6q3nWCRYA-unsplash.jpg', 'image/jpeg', 'public', 'public', 1094169, '[]', '[]', '{\"thumb\":true,\"slide\":true}', '{\"media_library_original\":{\"urls\":[\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_3060_3056.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_2560_2557.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_2142_2139.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_1792_1790.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_1499_1497.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_1254_1252.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_1049_1048.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_878_877.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_734_733.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_614_613.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_514_513.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_430_429.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_360_360.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_301_301.jpg\"],\"base64svg\":\"data:image\\/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHg9IjAiCiB5PSIwIiB2aWV3Qm94PSIwIDAgMzA2MCAzMDU2Ij4KCTxpbWFnZSB3aWR0aD0iMzA2MCIgaGVpZ2h0PSIzMDU2IiB4bGluazpocmVmPSJkYXRhOmltYWdlL2pwZWc7YmFzZTY0LC85ai80QUFRU2taSlJnQUJBUUVBWUFCZ0FBRC8vZ0E3UTFKRlFWUlBVam9nWjJRdGFuQmxaeUIyTVM0d0lDaDFjMmx1WnlCSlNrY2dTbEJGUnlCMk9EQXBMQ0J4ZFdGc2FYUjVJRDBnT1RBSy85c0FRd0FEQWdJREFnSURBd01EQkFNREJBVUlCUVVFQkFVS0J3Y0dDQXdLREF3TENnc0xEUTRTRUEwT0VRNExDeEFXRUJFVEZCVVZGUXdQRnhnV0ZCZ1NGQlVVLzlzQVF3RURCQVFGQkFVSkJRVUpGQTBMRFJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVUvOEFBRVFnQUlBQWdBd0VpQUFJUkFRTVJBZi9FQUI4QUFBRUZBUUVCQVFFQkFBQUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVRQUFJQkF3TUNCQU1GQlFRRUFBQUJmUUVDQXdBRUVRVVNJVEZCQmhOUllRY2ljUlF5Z1pHaENDTkNzY0VWVXRId0pETmljb0lKQ2hZWEdCa2FKU1luS0NrcU5EVTJOemc1T2tORVJVWkhTRWxLVTFSVlZsZFlXVnBqWkdWbVoyaHBhbk4wZFhaM2VIbDZnNFNGaG9lSWlZcVNrNVNWbHBlWW1acWlvNlNscHFlb3FhcXlzN1MxdHJlNHVickN3OFRGeHNmSXljclMwOVRWMXRmWTJkcmg0dVBrNWVibjZPbnE4Zkx6OVBYMjkvajUrdi9FQUI4QkFBTUJBUUVCQVFFQkFRRUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVSQUFJQkFnUUVBd1FIQlFRRUFBRUNkd0FCQWdNUkJBVWhNUVlTUVZFSFlYRVRJaktCQ0JSQ2thR3h3UWtqTTFMd0ZXSnkwUW9XSkRUaEpmRVhHQmthSmljb0tTbzFOamM0T1RwRFJFVkdSMGhKU2xOVVZWWlhXRmxhWTJSbFptZG9hV3B6ZEhWMmQzaDVlb0tEaElXR2g0aUppcEtUbEpXV2w1aVptcUtqcEtXbXA2aXBxckt6dExXMnQ3aTV1c0xEeE1YR3g4akp5dExUMU5YVzE5aloydUxqNU9YbTUranA2dkx6OVBYMjkvajUrdi9hQUF3REFRQUNFUU1SQUQ4QStnWWRRTE9GWkNGOWEyYkswUzVtUlVQM3FwYTFieGFMQ1paV0cwRHZYSGFkOFNyYVBXVWppZlB6WUFGZUw3YVZPU1RkejJmWVFxeGNrckhzVUdrVytta2I1QXBQcWE2TFRVUjAvZHVHSHNhOFk4WTYvY2FqRDVzVXJKdFhzYXFmQ2J4ZnJLYXkxdmNPWnJZbmdrMTZTcTNQSmRQbGVwcmVPdEduMS9USklvV0ljMTUzcFB3emswK1dLWXFUTXB5U2E5UjB6VXhjRERuSnJUbENlVnU0R0s4ZU1lYVhNajM1eWNJOGpPUTByU1RjWGhodVI4ckRHSzdYUlBCZHA0ZGJ6b3prdHppb2JHTzNtSmxHQkluTmFPbTNzdXB5c29QeXFjVjN4bkdDUzdubFNweXFOeTdILzlrPSI+Cgk8L2ltYWdlPgo8L3N2Zz4=\"}}', 1, '2022-12-26 18:25:40', '2022-12-26 18:26:03', NULL),
(24, 'App\\Models\\Blog', 3, '5e1bec13-2c08-4fd0-8795-d86e39838c0c', 'image', 'IMG_3301', 'IMG_3301.JPEG', 'image/jpeg', 'public', 'public', 1568070, '[]', '[]', '{\"thumb\":true,\"blogs\":true,\"blog\":true}', '{\"blog\":{\"urls\":[\"IMG_3301___blog_1290_500.jpg\",\"IMG_3301___blog_1079_418.jpg\",\"IMG_3301___blog_903_350.jpg\",\"IMG_3301___blog_755_293.jpg\",\"IMG_3301___blog_632_245.jpg\",\"IMG_3301___blog_528_205.jpg\",\"IMG_3301___blog_442_171.jpg\",\"IMG_3301___blog_370_143.jpg\",\"IMG_3301___blog_309_120.jpg\"],\"base64svg\":\"data:image\\/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHg9IjAiCiB5PSIwIiB2aWV3Qm94PSIwIDAgMTI5MCA1MDAiPgoJPGltYWdlIHdpZHRoPSIxMjkwIiBoZWlnaHQ9IjUwMCIgeGxpbms6aHJlZj0iZGF0YTppbWFnZS9qcGVnO2Jhc2U2NCwvOWovNEFBUVNrWkpSZ0FCQVFFQVlBQmdBQUQvL2dBN1ExSkZRVlJQVWpvZ1oyUXRhbkJsWnlCMk1TNHdJQ2gxYzJsdVp5QkpTa2NnU2xCRlJ5QjJPREFwTENCeGRXRnNhWFI1SUQwZ09UQUsvOXNBUXdBREFnSURBZ0lEQXdNREJBTURCQVVJQlFVRUJBVUtCd2NHQ0F3S0RBd0xDZ3NMRFE0U0VBME9FUTRMQ3hBV0VCRVRGQlVWRlF3UEZ4Z1dGQmdTRkJVVS85c0FRd0VEQkFRRkJBVUpCUVVKRkEwTERSUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVLzhBQUVRZ0FEQUFnQXdFaUFBSVJBUU1SQWYvRUFCOEFBQUVGQVFFQkFRRUJBQUFBQUFBQUFBQUJBZ01FQlFZSENBa0tDLy9FQUxVUUFBSUJBd01DQkFNRkJRUUVBQUFCZlFFQ0F3QUVFUVVTSVRGQkJoTlJZUWNpY1JReWdaR2hDQ05Dc2NFVlV0SHdKRE5pY29JSkNoWVhHQmthSlNZbktDa3FORFUyTnpnNU9rTkVSVVpIU0VsS1UxUlZWbGRZV1ZwalpHVm1aMmhwYW5OMGRYWjNlSGw2ZzRTRmhvZUlpWXFTazVTVmxwZVltWnFpbzZTbHBxZW9xYXF5czdTMXRyZTR1YnJDdzhURnhzZkl5Y3JTMDlUVjF0ZlkyZHJoNHVQazVlYm42T25xOGZMejlQWDI5L2o1K3YvRUFCOEJBQU1CQVFFQkFRRUJBUUVBQUFBQUFBQUJBZ01FQlFZSENBa0tDLy9FQUxVUkFBSUJBZ1FFQXdRSEJRUUVBQUVDZHdBQkFnTVJCQVVoTVFZU1FWRUhZWEVUSWpLQkNCUkNrYUd4d1Frak0xTHdGV0p5MFFvV0pEVGhKZkVYR0JrYUppY29LU28xTmpjNE9UcERSRVZHUjBoSlNsTlVWVlpYV0ZsYVkyUmxabWRvYVdwemRIVjJkM2g1ZW9LRGhJV0doNGlKaXBLVGxKV1dsNWlabXFLanBLV21wNmlwcXJLenRMVzJ0N2k1dXNMRHhNWEd4OGpKeXRMVDFOWFcxOWpaMnVMajVPWG01K2pwNnZMejlQWDI5L2o1K3YvYUFBd0RBUUFDRVFNUkFEOEErYlBFNkxjQ040UG1iUFFWcCtFOUxYN1RBTDRiVmNpdWNnbGJldk9hNktHWjJNWkxISTZWeVF2ZmxSNkdtNTNXdDZIWldjOGEyYkNSU0IwcS9Zd1Bid0FRcmwvU3NQUm5hVXJ1T2ZyWGVhQkNuRFl5YTZaeHRHekpSLy9aIj4KCTwvaW1hZ2U+Cjwvc3ZnPg==\"}}', 1, '2022-12-29 10:44:48', '2023-01-02 15:14:33', NULL),
(25, 'App\\Models\\Blog', 4, 'e2cf56f7-2ab6-4d94-b773-afe02cddf6af', 'image', 'IMG_3301', 'IMG_3301.JPEG', 'image/jpeg', 'public', 'public', 1568070, '[]', '[]', '{\"thumb\":true,\"blogs\":true,\"blog\":true}', '{\"blog\":{\"urls\":[\"IMG_3301___blog_1290_500.jpg\",\"IMG_3301___blog_1079_418.jpg\",\"IMG_3301___blog_903_350.jpg\",\"IMG_3301___blog_755_293.jpg\",\"IMG_3301___blog_632_245.jpg\",\"IMG_3301___blog_528_205.jpg\",\"IMG_3301___blog_442_171.jpg\",\"IMG_3301___blog_370_143.jpg\",\"IMG_3301___blog_309_120.jpg\"],\"base64svg\":\"data:image\\/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHg9IjAiCiB5PSIwIiB2aWV3Qm94PSIwIDAgMTI5MCA1MDAiPgoJPGltYWdlIHdpZHRoPSIxMjkwIiBoZWlnaHQ9IjUwMCIgeGxpbms6aHJlZj0iZGF0YTppbWFnZS9qcGVnO2Jhc2U2NCwvOWovNEFBUVNrWkpSZ0FCQVFFQVlBQmdBQUQvL2dBN1ExSkZRVlJQVWpvZ1oyUXRhbkJsWnlCMk1TNHdJQ2gxYzJsdVp5QkpTa2NnU2xCRlJ5QjJPREFwTENCeGRXRnNhWFI1SUQwZ09UQUsvOXNBUXdBREFnSURBZ0lEQXdNREJBTURCQVVJQlFVRUJBVUtCd2NHQ0F3S0RBd0xDZ3NMRFE0U0VBME9FUTRMQ3hBV0VCRVRGQlVWRlF3UEZ4Z1dGQmdTRkJVVS85c0FRd0VEQkFRRkJBVUpCUVVKRkEwTERSUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVLzhBQUVRZ0FEQUFnQXdFaUFBSVJBUU1SQWYvRUFCOEFBQUVGQVFFQkFRRUJBQUFBQUFBQUFBQUJBZ01FQlFZSENBa0tDLy9FQUxVUUFBSUJBd01DQkFNRkJRUUVBQUFCZlFFQ0F3QUVFUVVTSVRGQkJoTlJZUWNpY1JReWdaR2hDQ05Dc2NFVlV0SHdKRE5pY29JSkNoWVhHQmthSlNZbktDa3FORFUyTnpnNU9rTkVSVVpIU0VsS1UxUlZWbGRZV1ZwalpHVm1aMmhwYW5OMGRYWjNlSGw2ZzRTRmhvZUlpWXFTazVTVmxwZVltWnFpbzZTbHBxZW9xYXF5czdTMXRyZTR1YnJDdzhURnhzZkl5Y3JTMDlUVjF0ZlkyZHJoNHVQazVlYm42T25xOGZMejlQWDI5L2o1K3YvRUFCOEJBQU1CQVFFQkFRRUJBUUVBQUFBQUFBQUJBZ01FQlFZSENBa0tDLy9FQUxVUkFBSUJBZ1FFQXdRSEJRUUVBQUVDZHdBQkFnTVJCQVVoTVFZU1FWRUhZWEVUSWpLQkNCUkNrYUd4d1Frak0xTHdGV0p5MFFvV0pEVGhKZkVYR0JrYUppY29LU28xTmpjNE9UcERSRVZHUjBoSlNsTlVWVlpYV0ZsYVkyUmxabWRvYVdwemRIVjJkM2g1ZW9LRGhJV0doNGlKaXBLVGxKV1dsNWlabXFLanBLV21wNmlwcXJLenRMVzJ0N2k1dXNMRHhNWEd4OGpKeXRMVDFOWFcxOWpaMnVMajVPWG01K2pwNnZMejlQWDI5L2o1K3YvYUFBd0RBUUFDRVFNUkFEOEErYlBFNkxjQ040UG1iUFFWcCtFOUxYN1RBTDRiVmNpdWNnbGJldk9hNktHWjJNWkxISTZWeVF2ZmxSNkdtNTNXdDZIWldjOGEyYkNSU0IwcS9Zd1Bid0FRcmwvU3NQUm5hVXJ1T2ZyWGVhQkNuRFl5YTZaeHRHekpSLy9aIj4KCTwvaW1hZ2U+Cjwvc3ZnPg==\"}}', 1, '2022-12-29 10:52:07', '2023-01-02 15:14:38', NULL),
(27, 'App\\Models\\Blog', 6, '7b4b0c4a-73bf-4ef8-8d4a-40aed12df242', 'image', 'IMG_3301', 'IMG_3301.JPEG', 'image/jpeg', 'public', 'public', 1568070, '[]', '[]', '{\"thumb\":true,\"blogs\":true,\"blog\":true}', '{\"blog\":{\"urls\":[\"IMG_3301___blog_1290_500.jpg\",\"IMG_3301___blog_1079_418.jpg\",\"IMG_3301___blog_903_350.jpg\",\"IMG_3301___blog_755_293.jpg\",\"IMG_3301___blog_632_245.jpg\",\"IMG_3301___blog_528_205.jpg\",\"IMG_3301___blog_442_171.jpg\",\"IMG_3301___blog_370_143.jpg\",\"IMG_3301___blog_309_120.jpg\"],\"base64svg\":\"data:image\\/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHg9IjAiCiB5PSIwIiB2aWV3Qm94PSIwIDAgMTI5MCA1MDAiPgoJPGltYWdlIHdpZHRoPSIxMjkwIiBoZWlnaHQ9IjUwMCIgeGxpbms6aHJlZj0iZGF0YTppbWFnZS9qcGVnO2Jhc2U2NCwvOWovNEFBUVNrWkpSZ0FCQVFFQVlBQmdBQUQvL2dBN1ExSkZRVlJQVWpvZ1oyUXRhbkJsWnlCMk1TNHdJQ2gxYzJsdVp5QkpTa2NnU2xCRlJ5QjJPREFwTENCeGRXRnNhWFI1SUQwZ09UQUsvOXNBUXdBREFnSURBZ0lEQXdNREJBTURCQVVJQlFVRUJBVUtCd2NHQ0F3S0RBd0xDZ3NMRFE0U0VBME9FUTRMQ3hBV0VCRVRGQlVWRlF3UEZ4Z1dGQmdTRkJVVS85c0FRd0VEQkFRRkJBVUpCUVVKRkEwTERSUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVLzhBQUVRZ0FEQUFnQXdFaUFBSVJBUU1SQWYvRUFCOEFBQUVGQVFFQkFRRUJBQUFBQUFBQUFBQUJBZ01FQlFZSENBa0tDLy9FQUxVUUFBSUJBd01DQkFNRkJRUUVBQUFCZlFFQ0F3QUVFUVVTSVRGQkJoTlJZUWNpY1JReWdaR2hDQ05Dc2NFVlV0SHdKRE5pY29JSkNoWVhHQmthSlNZbktDa3FORFUyTnpnNU9rTkVSVVpIU0VsS1UxUlZWbGRZV1ZwalpHVm1aMmhwYW5OMGRYWjNlSGw2ZzRTRmhvZUlpWXFTazVTVmxwZVltWnFpbzZTbHBxZW9xYXF5czdTMXRyZTR1YnJDdzhURnhzZkl5Y3JTMDlUVjF0ZlkyZHJoNHVQazVlYm42T25xOGZMejlQWDI5L2o1K3YvRUFCOEJBQU1CQVFFQkFRRUJBUUVBQUFBQUFBQUJBZ01FQlFZSENBa0tDLy9FQUxVUkFBSUJBZ1FFQXdRSEJRUUVBQUVDZHdBQkFnTVJCQVVoTVFZU1FWRUhZWEVUSWpLQkNCUkNrYUd4d1Frak0xTHdGV0p5MFFvV0pEVGhKZkVYR0JrYUppY29LU28xTmpjNE9UcERSRVZHUjBoSlNsTlVWVlpYV0ZsYVkyUmxabWRvYVdwemRIVjJkM2g1ZW9LRGhJV0doNGlKaXBLVGxKV1dsNWlabXFLanBLV21wNmlwcXJLenRMVzJ0N2k1dXNMRHhNWEd4OGpKeXRMVDFOWFcxOWpaMnVMajVPWG01K2pwNnZMejlQWDI5L2o1K3YvYUFBd0RBUUFDRVFNUkFEOEErYlBFNkxjQ040UG1iUFFWcCtFOUxYN1RBTDRiVmNpdWNnbGJldk9hNktHWjJNWkxISTZWeVF2ZmxSNkdtNTNXdDZIWldjOGEyYkNSU0IwcS9Zd1Bid0FRcmwvU3NQUm5hVXJ1T2ZyWGVhQkNuRFl5YTZaeHRHekpSLy9aIj4KCTwvaW1hZ2U+Cjwvc3ZnPg==\"}}', 1, '2022-12-29 14:40:22', '2023-01-02 15:14:43', NULL),
(28, 'App\\Models\\Blog', 8, '7a96b270-89d4-4ee5-9feb-2cf416001e1f', 'image', 'IMG_3301', 'IMG_3301.JPEG', 'image/jpeg', 'public', 'public', 1568070, '[]', '[]', '{\"thumb\":true,\"blogs\":true,\"blog\":true}', '{\"blog\":{\"urls\":[\"IMG_3301___blog_1290_500.jpg\",\"IMG_3301___blog_1079_418.jpg\",\"IMG_3301___blog_903_350.jpg\",\"IMG_3301___blog_755_293.jpg\",\"IMG_3301___blog_632_245.jpg\",\"IMG_3301___blog_528_205.jpg\",\"IMG_3301___blog_442_171.jpg\",\"IMG_3301___blog_370_143.jpg\",\"IMG_3301___blog_309_120.jpg\"],\"base64svg\":\"data:image\\/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHg9IjAiCiB5PSIwIiB2aWV3Qm94PSIwIDAgMTI5MCA1MDAiPgoJPGltYWdlIHdpZHRoPSIxMjkwIiBoZWlnaHQ9IjUwMCIgeGxpbms6aHJlZj0iZGF0YTppbWFnZS9qcGVnO2Jhc2U2NCwvOWovNEFBUVNrWkpSZ0FCQVFFQVlBQmdBQUQvL2dBN1ExSkZRVlJQVWpvZ1oyUXRhbkJsWnlCMk1TNHdJQ2gxYzJsdVp5QkpTa2NnU2xCRlJ5QjJPREFwTENCeGRXRnNhWFI1SUQwZ09UQUsvOXNBUXdBREFnSURBZ0lEQXdNREJBTURCQVVJQlFVRUJBVUtCd2NHQ0F3S0RBd0xDZ3NMRFE0U0VBME9FUTRMQ3hBV0VCRVRGQlVWRlF3UEZ4Z1dGQmdTRkJVVS85c0FRd0VEQkFRRkJBVUpCUVVKRkEwTERSUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVLzhBQUVRZ0FEQUFnQXdFaUFBSVJBUU1SQWYvRUFCOEFBQUVGQVFFQkFRRUJBQUFBQUFBQUFBQUJBZ01FQlFZSENBa0tDLy9FQUxVUUFBSUJBd01DQkFNRkJRUUVBQUFCZlFFQ0F3QUVFUVVTSVRGQkJoTlJZUWNpY1JReWdaR2hDQ05Dc2NFVlV0SHdKRE5pY29JSkNoWVhHQmthSlNZbktDa3FORFUyTnpnNU9rTkVSVVpIU0VsS1UxUlZWbGRZV1ZwalpHVm1aMmhwYW5OMGRYWjNlSGw2ZzRTRmhvZUlpWXFTazVTVmxwZVltWnFpbzZTbHBxZW9xYXF5czdTMXRyZTR1YnJDdzhURnhzZkl5Y3JTMDlUVjF0ZlkyZHJoNHVQazVlYm42T25xOGZMejlQWDI5L2o1K3YvRUFCOEJBQU1CQVFFQkFRRUJBUUVBQUFBQUFBQUJBZ01FQlFZSENBa0tDLy9FQUxVUkFBSUJBZ1FFQXdRSEJRUUVBQUVDZHdBQkFnTVJCQVVoTVFZU1FWRUhZWEVUSWpLQkNCUkNrYUd4d1Frak0xTHdGV0p5MFFvV0pEVGhKZkVYR0JrYUppY29LU28xTmpjNE9UcERSRVZHUjBoSlNsTlVWVlpYV0ZsYVkyUmxabWRvYVdwemRIVjJkM2g1ZW9LRGhJV0doNGlKaXBLVGxKV1dsNWlabXFLanBLV21wNmlwcXJLenRMVzJ0N2k1dXNMRHhNWEd4OGpKeXRMVDFOWFcxOWpaMnVMajVPWG01K2pwNnZMejlQWDI5L2o1K3YvYUFBd0RBUUFDRVFNUkFEOEErYlBFNkxjQ040UG1iUFFWcCtFOUxYN1RBTDRiVmNpdWNnbGJldk9hNktHWjJNWkxISTZWeVF2ZmxSNkdtNTNXdDZIWldjOGEyYkNSU0IwcS9Zd1Bid0FRcmwvU3NQUm5hVXJ1T2ZyWGVhQkNuRFl5YTZaeHRHekpSLy9aIj4KCTwvaW1hZ2U+Cjwvc3ZnPg==\"}}', 1, '2022-12-29 15:10:56', '2023-01-02 15:14:48', NULL),
(30, 'App\\Models\\Product', 12, '2c956f55-05b6-4ad8-b183-d15a89ae3fcc', 'image', 'IMG_0779', 'IMG_0779.JPEG', 'image/jpeg', 'public', 'public', 53200, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2023-01-02 15:05:49', '2023-01-02 15:05:50', NULL),
(31, 'App\\Models\\Product', 13, 'b6038918-3c19-4577-af36-7c6bedded79a', 'image', '69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798', '69170767535__BADD37DF-FD72-42D6-BA36-69EE42EFB798.jpeg', 'image/jpeg', 'public', 'public', 397719, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2023-01-02 17:22:08', '2023-01-02 17:22:09', NULL),
(32, 'App\\Models\\Product', 14, '4e393931-e365-4c8f-b14a-5ddc1109fc18', 'image', 'IMG_2288', 'IMG_2288.JPEG', 'image/jpeg', 'public', 'public', 860730, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2023-01-02 17:25:54', '2023-01-02 17:25:55', NULL),
(33, 'App\\Models\\Product', 15, '0ea0e9d2-bb4f-4780-a798-062c073d88fd', 'image', 'IMG_2290', 'IMG_2290.JPEG', 'image/jpeg', 'public', 'public', 926043, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2023-01-02 17:26:20', '2023-01-02 17:26:21', NULL),
(34, 'App\\Models\\Product', 16, '8b4127e1-9cad-4d15-ba51-f3a8a810b64a', 'image', 'BDD26C31-61FA-49D4-850A-2529F76BC859 (1)', 'BDD26C31-61FA-49D4-850A-2529F76BC859-(1).jpg', 'image/jpeg', 'public', 'public', 595178, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2023-01-02 17:26:51', '2023-01-02 17:26:51', NULL),
(35, 'App\\Models\\Product', 17, '19727e95-168e-4b30-8442-5df718ebee63', 'image', 'IMG_1122', 'IMG_1122.jpg', 'image/jpeg', 'public', 'public', 1590419, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2023-01-02 17:27:29', '2023-01-02 17:27:31', NULL),
(36, 'App\\Models\\Product', 18, '8b27c631-f8a6-497e-b21c-a6ba52ab52c1', 'image', 'IMG_2289', 'IMG_2289.JPEG', 'image/jpeg', 'public', 'public', 605697, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2023-01-02 17:28:22', '2023-01-02 17:28:23', NULL),
(37, 'App\\Models\\Slider', 20, 'dc22d177-188b-4575-a5bf-3a6f020ff4d8', 'image', 'annisa-ica-IB6q3nWCRYA-unsplash', 'annisa-ica-IB6q3nWCRYA-unsplash.jpg', 'image/jpeg', 'public', 'public', 1094169, '[]', '[]', '{\"thumb\":true,\"slide\":true}', '{\"media_library_original\":{\"urls\":[\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_3060_3056.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_2560_2557.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_2142_2139.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_1792_1790.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_1499_1497.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_1254_1252.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_1049_1048.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_878_877.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_734_733.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_614_613.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_514_513.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_430_429.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_360_360.jpg\",\"annisa-ica-IB6q3nWCRYA-unsplash___media_library_original_301_301.jpg\"],\"base64svg\":\"data:image\\/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHg9IjAiCiB5PSIwIiB2aWV3Qm94PSIwIDAgMzA2MCAzMDU2Ij4KCTxpbWFnZSB3aWR0aD0iMzA2MCIgaGVpZ2h0PSIzMDU2IiB4bGluazpocmVmPSJkYXRhOmltYWdlL2pwZWc7YmFzZTY0LC85ai80QUFRU2taSlJnQUJBUUVBWUFCZ0FBRC8vZ0E3UTFKRlFWUlBVam9nWjJRdGFuQmxaeUIyTVM0d0lDaDFjMmx1WnlCSlNrY2dTbEJGUnlCMk9EQXBMQ0J4ZFdGc2FYUjVJRDBnT1RBSy85c0FRd0FEQWdJREFnSURBd01EQkFNREJBVUlCUVVFQkFVS0J3Y0dDQXdLREF3TENnc0xEUTRTRUEwT0VRNExDeEFXRUJFVEZCVVZGUXdQRnhnV0ZCZ1NGQlVVLzlzQVF3RURCQVFGQkFVSkJRVUpGQTBMRFJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVUvOEFBRVFnQUlBQWdBd0VpQUFJUkFRTVJBZi9FQUI4QUFBRUZBUUVCQVFFQkFBQUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVRQUFJQkF3TUNCQU1GQlFRRUFBQUJmUUVDQXdBRUVRVVNJVEZCQmhOUllRY2ljUlF5Z1pHaENDTkNzY0VWVXRId0pETmljb0lKQ2hZWEdCa2FKU1luS0NrcU5EVTJOemc1T2tORVJVWkhTRWxLVTFSVlZsZFlXVnBqWkdWbVoyaHBhbk4wZFhaM2VIbDZnNFNGaG9lSWlZcVNrNVNWbHBlWW1acWlvNlNscHFlb3FhcXlzN1MxdHJlNHVickN3OFRGeHNmSXljclMwOVRWMXRmWTJkcmg0dVBrNWVibjZPbnE4Zkx6OVBYMjkvajUrdi9FQUI4QkFBTUJBUUVCQVFFQkFRRUFBQUFBQUFBQkFnTUVCUVlIQ0FrS0MvL0VBTFVSQUFJQkFnUUVBd1FIQlFRRUFBRUNkd0FCQWdNUkJBVWhNUVlTUVZFSFlYRVRJaktCQ0JSQ2thR3h3UWtqTTFMd0ZXSnkwUW9XSkRUaEpmRVhHQmthSmljb0tTbzFOamM0T1RwRFJFVkdSMGhKU2xOVVZWWlhXRmxhWTJSbFptZG9hV3B6ZEhWMmQzaDVlb0tEaElXR2g0aUppcEtUbEpXV2w1aVptcUtqcEtXbXA2aXBxckt6dExXMnQ3aTV1c0xEeE1YR3g4akp5dExUMU5YVzE5aloydUxqNU9YbTUranA2dkx6OVBYMjkvajUrdi9hQUF3REFRQUNFUU1SQUQ4QStnWWRRTE9GWkNGOWEyYkswUzVtUlVQM3FwYTFieGFMQ1paV0cwRHZYSGFkOFNyYVBXVWppZlB6WUFGZUw3YVZPU1RkejJmWVFxeGNrckhzVUdrVytta2I1QXBQcWE2TFRVUjAvZHVHSHNhOFk4WTYvY2FqRDVzVXJKdFhzYXFmQ2J4ZnJLYXkxdmNPWnJZbmdrMTZTcTNQSmRQbGVwcmVPdEduMS9USklvV0ljMTUzcFB3emswK1dLWXFUTXB5U2E5UjB6VXhjRERuSnJUbENlVnU0R0s4ZU1lYVhNajM1eWNJOGpPUTByU1RjWGhodVI4ckRHSzdYUlBCZHA0ZGJ6b3prdHppb2JHTzNtSmxHQkluTmFPbTNzdXB5c29QeXFjVjN4bkdDUzdubFNweXFOeTdILzlrPSI+Cgk8L2ltYWdlPgo8L3N2Zz4=\"}}', 1, '2023-01-03 07:56:17', '2023-01-03 07:56:41', NULL),
(38, 'App\\Models\\Product', 19, 'f6ea03d0-50ba-4b36-b99d-fa632c583c9f', 'image', 'Képernyőkép 2023-01-03 112902', 'Képernyőkép-2023-01-03-112902.png', 'image/png', 'public', 'public', 4364, '[]', '[]', '{\"thumb\":true,\"public\":true}', '[]', 1, '2023-01-03 10:00:05', '2023-01-03 10:00:06', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) DEFAULT NULL,
  `product_type_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `products`
--

INSERT INTO `products` (`id`, `name`, `size`, `product_type_id`, `quantity`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 'Gollum', 1, 2, 1, 'Gollam egy, a hobbitok népébe tartozó szereplő J. R. R. Tolkien Középfölde-univerzumában, kulcsfontosságú szereplő a Hobbitban és a Gyűrűk Urában. Peter Jackson filmjeiben Andy Serkis adta a hangját és a mozgását a számítógépes animációval létrehozott szereplőnek.', 1, '2023-01-02 17:22:08', '2023-01-02 17:22:08', NULL),
(14, 'Dani a Jack Russell', 1, 2, 1, 'A jackie intelligens, élettel teli kutya, aki tökéletesen lojális és hűséges a gazdájához. Tanulékony, nem ismeri a félelmet és kis termete ellenére sportos és kitartó. Mivel eredetileg vadászkutya, szívesen tölti idejét a természetben.', 1, '2023-01-02 17:25:54', '2023-01-02 17:25:54', NULL),
(15, 'Csápi a mérges polip', 1, 2, 1, 'Csápi, a kalandvágyó kis polip, Evó, a tudálékos horgászhal és Alíz, az izgága makréla, a három jóbarát az óceán legmélyén, egy varázslatos világot rejtő árokban él. Sok-sok évvel azután, hogy az óceánok szintje megemelkedett, és az emberiség elhagyta a Földet, a különleges vízi lények továbbra is gondtalanul lubickolnak az oltalmat adó végtelen mélységben.', 1, '2023-01-02 17:26:20', '2023-01-02 17:26:20', NULL),
(16, 'Bébi Yoda', 1, 2, 1, 'Grogu szereplő a kitalált Csillagok háborúja világban, azon belül a A Mandalóri című, 2019-ben indult élőszereplős televíziós sorozatban.', 1, '2023-01-02 17:26:51', '2023-01-02 17:26:51', NULL),
(17, 'Jax', 1, 2, 1, 'Jax egyből érezte, amikor hazajött hozzánk, hogy ez lesz a legjobb hely a világon neki. Azonnal bevette felségterületét, kiválasztotta a kedvenc alvó helyeit. Ő egy szuper túra kutya, bejárta már Visegrád, Eger, Óbánya és az alföld környékét, hol négy lábon, hol két keréken hátizsákban élvezve a szél simogatását. Az ünnepekkor csinosba öltözik a család többi tagjával együtt, a bulikban szívesen fitogtatja lufizási képességeit. A hétköznapokon a séták és játékos foglalkozások után boldogan bújik gazdáihoz, hogy együtt pihenjék ki a nap fáradalmait. Jax a legjobb partner, bármit is találunk ki, ő örömmel veszt részt a buliban.', 1, '2023-01-02 17:27:29', '2023-01-02 17:27:29', NULL),
(18, 'Nyúl péter', 1, 1, 1, 'Nyúl Péter nagy szájánál csak a füle nagyobb. Egyébként jó kedélyű, laza, és a kék dzsekijéről biztosan felismered. Meg arról, hogy nem hord nadrágot.\r\nSzerinte ő az ember legrégibb barátja, és ezért joga van néha megebédelni a kiskertben, megmelegedni a konyhában és bulit szervezni a haverjainak nappaliban.', 1, '2023-01-02 17:28:22', '2023-01-03 09:47:23', NULL),
(19, 'Teszt termék', 1, 4, 5, 'Teszt leírás', 0, '2023-01-03 10:00:05', '2023-01-03 10:00:05', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `product_types`
--

CREATE TABLE `product_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `product_types`
--

INSERT INTO `product_types` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Baba csörgő', 1, NULL, NULL, NULL),
(2, 'Figura', 1, NULL, NULL, NULL),
(3, 'Táska', 1, NULL, NULL, NULL),
(4, 'Egyéb', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `title` varchar(45) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `slider`
--

INSERT INTO `slider` (`id`, `name`, `description`, `title`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, '1. képváltó', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur deserunt, dolore eum in modi ratione sint totam. Accusantium facere, illo!', 'Használj terémszetes anyagokat!', 1, '2022-12-26 08:40:40', '2022-12-29 16:29:58', NULL),
(16, '2. képváltó', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur deserunt, dolore eum in modi ratione sint totam. Accusantium facere, illo!', 'Gyakorolj sokat!', 1, '2022-12-26 08:44:16', '2022-12-29 10:07:59', NULL),
(19, '4. képváltó', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur deserunt, dolore eum in modi ratione sint totam. Accusantium facere, illo!', 'Adj ajándékba!', 1, '2022-12-26 18:25:40', '2023-01-03 07:55:30', '2023-01-03 07:55:30'),
(20, '3.képváltó', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse ipsam maiores officia porro qui quis!', 'Adj ajándékba!', 1, '2023-01-03 07:56:17', '2023-01-03 07:56:17', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `employee_category_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
-- Minden user alapértelmezett jelszava 1234
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `user_role_id`, `employee_category_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 'Admin', 'Szuper', 'superadmin@teszt.hu', '$2y$10$w5/DkO8m7RjJFbqWdwh2W.nMY3gOYDPHQwwXMJzORq3u5F8nnSNzW', 1, 1, 1, '2022-12-21 14:56:05', '2022-12-21 14:56:05', NULL),
(14, 'Admin', 'Simple', 'admin@teszt.hu', '$2y$10$AwQBuFXBBu/bfSgZg1uaNOLLd7vGxZnt1tBSTKb.iVOCzXIFsM11C', 2, 1, 1, '2022-12-23 08:05:41', '2022-12-23 08:05:41', NULL),
(15, 'User', 'Simple', 'clerk@teszt.hu', '$2y$10$jJz.Hp1lonkmpdILTpeaUe4FWWzvnPdkfynxb6EPS8tCiVZ/7iVO.', 3, 3, 1, '2022-12-26 22:33:37', '2022-12-26 22:33:37', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin', 'Mindenhez van hozzáférése. Bármelyik felhasználónál tud jelszót változtatni, felhasználót tud törölni, módosítani.', 1, NULL, NULL, NULL),
(2, 'admin', 'Korlátozott hozzáférése van. Felhasználókat nem tud törölni, módósítani. Oldal kinézetét tudja változtatni.', 1, NULL, NULL, NULL),
(3, 'ügyintéző', 'Korlátozott hozzáférése van. Csak terméket és blog bejegyést vihet fel.', 1, NULL, NULL, NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `company_data`
--
ALTER TABLE `company_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_data_name_unique` (`name`);

--
-- A tábla indexei `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pCategoryFK_idx` (`product_type_id`);

--
-- A tábla indexei `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_types_name_unique` (`name`);

--
-- A tábla indexei `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `uRoleFK_idx` (`user_role_id`),
  ADD KEY `eCategoryFK_idx` (`employee_category_id`);

--
-- A tábla indexei `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_roles_name_unique` (`name`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT a táblához `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `pCategoryFK` FOREIGN KEY (`product_type_id`) REFERENCES `product_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `uRoleFK` FOREIGN KEY (`user_role_id`) REFERENCES `user_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
