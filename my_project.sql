-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2021 at 08:36 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-03-18 08:10:41', '2021-03-18 08:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(89, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(90, 14, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(91, 14, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(92, 14, 'types', 'text', 'Types', 0, 1, 1, 1, 1, 1, '{}', 4),
(93, 14, 'symptoms', 'text', 'Symptoms', 0, 1, 1, 1, 1, 1, '{}', 5),
(94, 14, 'causes', 'text', 'Causes', 0, 1, 1, 1, 1, 1, '{}', 6),
(95, 14, 'treatments', 'text', 'Treatments', 0, 1, 1, 1, 1, 1, '{}', 7),
(96, 14, 'advice', 'text', 'Advice', 0, 1, 1, 1, 1, 1, '{}', 8),
(97, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(98, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(14, 'diagnosis', 'diagnosis', 'Diagnosis', 'Diagnoses', NULL, 'App\\Diagnosi', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-04-03 20:11:59', '2021-04-03 20:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `types` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symptoms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `treatments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advice` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`id`, `name`, `description`, `types`, `symptoms`, `causes`, `treatments`, `advice`, `created_at`, `updated_at`) VALUES
(1, 'ADHD', 'Attention-Deficit / Hyperactivity Disorder (ADHD) is one of the most common neurodevelopmental disorders of childhood. It is usually first diagnosed in childhood and often lasts into adulthood. Children with ADHD may have trouble paying attention, controlling impulsive behaviors (may act without thinking about what the result will be), or be overly active. ADHD can last into adulthood. Some adults have ADHD but have never been diagnosed. The symptoms can cause difficulty at work, at home, or with relationships. Symptoms may look different at older ages, for example, hyperactivity may appear as extreme restlessness. Symptoms can become more severe when the demands of adulthood increase.', 'Predominantly Inattentive Presentation, Predominantly Hyperactive-Impulsive Presentation, Combined Presentation', 'daydream a lot, forget or lose things a lot, squirm or fidget, talk too much, make careless mistakes or take unnecessary risks, have a hard time resisting temptation, have trouble taking turns, have difficulty getting along with others', 'Scientists are studying cause(s) and risk factors in an effort to find better ways to manage and reduce the chances of a person having ADHD. The cause(s) and risk factors for ADHD are unknown, but current research shows that genetics plays an important role. Recent studies of twins link genes with ADHD.1  In addition to genetics, scientists are studying other possible causes and risk factors including: Brain injury, Exposure to environmental (e.g., lead) during pregnancy or at a young age,  Alcohol and tobacco use during pregnancy, Premature delivery, Low birth weight.', 'In most cases, ADHD is best treated with a combination of behavior therapy and medication. For preschool-aged children (4-5 years of age) with ADHD, behavior therapy, particularly training for parents, is recommended as the first line of treatment before medication is tried. What works best can depend on the child and family. Good treatment plans will include close monitoring, follow-ups, and making changes, if needed, along the way.', 'Here are some healthy behaviors that may help: Developing healthy eating habits such as eating plenty of fruits, vegetables, and whole grains and choosing lean protein sources, Participating in daily physical activity based on age, Limiting the amount of daily screen time from TVs, computers, phones, and other electronics, Getting the recommended amount of sleep each night based on age.', '2021-04-03 20:34:59', '2021-04-03 20:34:59'),
(2, 'COVID 19', 'Coronaviruses are a family of viruses that can cause illnesses such as the common cold, severe acute respiratory syndrome (SARS) and Middle East respiratory syndrome (MERS). In 2019, a new coronavirus was identified as the cause of a disease outbreak that originated in China. The virus is now known as the severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2). The disease it causes is called coronavirus disease 2019 (COVID-19)', NULL, 'Signs and symptoms of coronavirus disease 2019 (COVID-19) may appear two to 14 days after exposure. This time after exposure and before having symptoms is called the incubation period. Common signs and symptoms can include:  Fever, Cough, Tiredness. Early symptoms of COVID-19 may include a loss of taste or smell.  Other symptoms can include:  Shortness of breath or difficulty breathing, Muscle aches Chills, Sore throat, Runny nose, Headache, Chest pain, Pink eye (conjunctivitis), Nausea, Vomiting, Diarrhea, Rash. This list is not all inclusive. Children have similar symptoms to adults and generally have mild illness.', 'Infection with the new coronavirus (severe acute respiratory syndrome coronavirus 2, or SARS-CoV-2) causes coronavirus disease 2019 (COVID-19).', 'Currently, only one medication has been approved to treat COVID-19. No cure is available for COVID-19. Antibiotics aren\'t effective against viral infections such as COVID-19. Researchers are testing a variety of possible treatments.', 'If you develop symptoms of coronavirus disease 2019 (COVID-19) or you\'ve been exposed to the COVID-19 virus, contact your doctor. Also let your doctor know if you\'ve had close contact with anyone who has been diagnosed with COVID-19.', '2021-04-03 20:48:42', '2021-04-03 20:48:42'),
(3, 'Diabetes', 'Diabetes mellitus, commonly known as diabetes, is a metabolic disease that causes high blood sugar. The hormone insulin moves sugar from the blood into your cells to be stored or used for energy. With diabetes, your body either doesn’t make enough insulin or can’t effectively use the insulin it does make.', 'Type 1, Type 2, Prediabetes, Gestational diabetes', 'The general symptoms of diabetes include: increased hunger, increased thirst, weight loss, frequent urination, blurry vision, extreme fatigue, sores that don’t heal. Symptoms in men: In addition to the general symptoms of diabetes, men with diabetes may have a decreased sex drive, erectile dysfunction (ED), and poor muscle strength. Symptoms in women: Women with diabetes can also have symptoms such as urinary tract infections, yeast infections, and dry, itchy skin. Symptoms of type 1 diabetes can include:  extreme hunger, increased thirst, unintentional weight loss, frequent urination, blurry vision, tiredness. Symptoms of type 2 diabetes can include:  increased hunger, increased thirst, increased urination, blurry vision, tiredness, sores that are slow to heal. Gestational diabetes: Most women with gestational diabetes don’t have any symptoms. The condition is often detected during a routine blood sugar test or oral glucose tolerance test that is usually performed between the 24th and 28th weeks of gestation.  In rare cases, a woman with gestational diabetes will also experience increased thirst or urination.', 'Type 1 diabetes: Doctors don’t know exactly what causes type 1 diabetes. For some reason, the immune system mistakenly attacks and destroys insulin-producing beta cells in the pancreas.  Genes may play a role in some people. It’s also possible that a virus sets off the immune system attack. Type 2 diabetes: Type 2 diabetes stems from a combination of genetics and lifestyle factors. Being overweight or obese increases your risk too. Carrying extra weight, especially in your belly, makes your cells more resistant to the effects of insulin on your blood sugar.  This condition runs in families. Family members share genes that make them more likely to get type 2 diabetes and to be overweight. Gestational diabetes: Gestational diabetes is the result of hormonal changes during pregnancy. The placenta produces hormones that make a pregnant woman’s cells less sensitive to the effects of insulin. This can cause high blood sugar during pregnancy.  Women who are overweight when they get pregnant or who gain too much weight during their pregnancy are more likely to get gestational diabetes.', 'Doctors treat diabetes with a few different medications. Some of these drugs are taken by mouth, while others are available as injections.  Type 1 diabetes: Insulin is the main treatment for type 1 diabetes. It replaces the hormone your body isn’t able to produce.  There are four types of insulin that are most commonly used. They’re differentiated by how quickly they start to work, and how long their effects last:  Rapid-acting insulin starts to work within 15 minutes and its effects last for 3 to 4 hours. Short-acting insulin starts to work within 30 minutes and lasts 6 to 8 hours. Intermediate-acting insulin starts to work within 1 to 2 hours and lasts 12 to 18 hours. Long-acting insulin starts to work a few hours after injection and lasts 24 hours or longer. Type 2 diabetes: Diet and exercise can help some people manage type 2 diabetes. If lifestyle changes aren’t enough to lower your blood sugar, you’ll need to take medication.  These drugs lower your blood sugar in a variety of ways:  You may need to take more than one of these drugs. Some people with type 2 diabetes also take insulin.  Gestational diabetes: You’ll need to monitor your blood sugar level several times a day during pregnancy. If it’s high, dietary changes and exercise may or may not be enough to bring it down.', 'Healthy eating is a central part of managing diabetes. In some cases, changing your diet may be enough to control the disease.', '2021-04-03 21:18:26', '2021-04-03 21:18:26');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-03-18 08:10:05', '2021-03-18 08:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-03-18 08:10:05', '2021-03-18 08:10:05', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-03-18 08:10:05', '2021-03-18 08:10:05', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-03-18 08:10:05', '2021-03-18 08:10:05', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-03-18 08:10:05', '2021-03-18 08:10:05', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-03-18 08:10:05', '2021-03-18 08:10:05', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-03-18 08:10:05', '2021-03-18 08:10:05', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-03-18 08:10:05', '2021-03-18 08:10:05', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-03-18 08:10:05', '2021-03-18 08:10:05', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-03-18 08:10:05', '2021-03-18 08:10:05', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-03-18 08:10:05', '2021-03-18 08:10:05', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-03-18 08:10:05', '2021-03-18 08:10:05', 'voyager.hooks', NULL),
(12, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-03-18 08:10:41', '2021-03-18 08:10:41', 'voyager.categories.index', NULL),
(13, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-03-18 08:10:41', '2021-03-18 08:10:41', 'voyager.posts.index', NULL),
(14, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-03-18 08:10:42', '2021-03-18 08:10:42', 'voyager.pages.index', NULL),
(19, 1, 'Diagnoses', '', '_self', NULL, NULL, NULL, 15, '2021-04-03 20:11:59', '2021-04-03 20:11:59', 'voyager.diagnosis.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_03_18_025948_create_sessions_table', 1),
(7, '2016_01_01_000000_add_voyager_user_fields', 2),
(8, '2016_01_01_000000_create_data_types_table', 2),
(9, '2016_05_19_173453_create_menu_table', 2),
(10, '2016_10_21_190000_create_roles_table', 2),
(11, '2016_10_21_190000_create_settings_table', 2),
(12, '2016_11_30_135954_create_permission_table', 2),
(13, '2016_11_30_141208_create_permission_role_table', 2),
(14, '2016_12_26_201236_data_types__add__server_side', 2),
(15, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(16, '2017_01_14_005015_create_translations_table', 2),
(17, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(18, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(21, '2017_08_05_000000_add_group_to_settings_table', 2),
(22, '2017_11_26_013050_add_user_role_relationship', 2),
(23, '2017_11_26_015000_create_user_roles_table', 2),
(24, '2018_03_11_000000_add_user_settings', 2),
(25, '2018_03_14_000000_add_details_to_data_types_table', 2),
(26, '2018_03_16_000000_make_settings_value_nullable', 2),
(27, '2016_01_01_000000_create_pages_table', 3),
(28, '2016_01_01_000000_create_posts_table', 3),
(29, '2016_02_15_204651_create_categories_table', 3),
(30, '2017_04_11_000000_alter_post_nullable_fields_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-03-18 08:10:42', '2021-03-18 08:10:42');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(2, 'browse_bread', NULL, '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(3, 'browse_database', NULL, '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(4, 'browse_media', NULL, '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(5, 'browse_compass', NULL, '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(6, 'browse_menus', 'menus', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(7, 'read_menus', 'menus', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(8, 'edit_menus', 'menus', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(9, 'add_menus', 'menus', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(10, 'delete_menus', 'menus', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(11, 'browse_roles', 'roles', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(12, 'read_roles', 'roles', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(13, 'edit_roles', 'roles', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(14, 'add_roles', 'roles', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(15, 'delete_roles', 'roles', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(16, 'browse_users', 'users', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(17, 'read_users', 'users', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(18, 'edit_users', 'users', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(19, 'add_users', 'users', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(20, 'delete_users', 'users', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(21, 'browse_settings', 'settings', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(22, 'read_settings', 'settings', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(23, 'edit_settings', 'settings', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(24, 'add_settings', 'settings', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(25, 'delete_settings', 'settings', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(26, 'browse_hooks', NULL, '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(27, 'browse_categories', 'categories', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(28, 'read_categories', 'categories', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(29, 'edit_categories', 'categories', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(30, 'add_categories', 'categories', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(31, 'delete_categories', 'categories', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(32, 'browse_posts', 'posts', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(33, 'read_posts', 'posts', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(34, 'edit_posts', 'posts', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(35, 'add_posts', 'posts', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(36, 'delete_posts', 'posts', '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(37, 'browse_pages', 'pages', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(38, 'read_pages', 'pages', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(39, 'edit_pages', 'pages', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(40, 'add_pages', 'pages', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(41, 'delete_pages', 'pages', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(62, 'browse_diagnosis', 'diagnosis', '2021-04-03 20:11:59', '2021-04-03 20:11:59'),
(63, 'read_diagnosis', 'diagnosis', '2021-04-03 20:11:59', '2021-04-03 20:11:59'),
(64, 'edit_diagnosis', 'diagnosis', '2021-04-03 20:11:59', '2021-04-03 20:11:59'),
(65, 'add_diagnosis', 'diagnosis', '2021-04-03 20:11:59', '2021-04-03 20:11:59'),
(66, 'delete_diagnosis', 'diagnosis', '2021-04-03 20:11:59', '2021-04-03 20:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-18 08:10:41', '2021-03-18 08:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-03-18 08:10:05', '2021-03-18 08:10:05'),
(2, 'user', 'Normal User', '2021-03-18 08:10:05', '2021-03-18 08:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('jydDMLPP8lE5LEZmgVUC8mXSLj7d46sktKFKDaEc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkI5UmJnSGtYcURKZzd1WURySU40dXNHNkNWUGdQZmt0R1ZzbkNmdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hYm91dCI7fX0=', 1617474834),
('SWLB7uYiJdqNLR9qfIeaEJAmPPX7kyYX6FgrkDus', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnhFclBYSjJlUkVZY3Jta3dSMThsZ2lCOHM4eWdxWGdZSmRkU2ZscCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi92b3lhZ2VyLWFzc2V0cz9wYXRoPWZvbnRzJTJGdm95YWdlci53b2ZmIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1617459737),
('vD621iaglLx5g2iCdRqzsmSDKK0j05snxUYOaLtU', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUDZUZVFLeW9ieDZubWRLSm94dFpJcm00dW1VbjdVY0k0SXJrSUVEayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9kaWFnbm9zaXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG4vekZCR2p3T3Z5RnhSTURHVWhiS3VZNmJRa1EvT3ZBOG05VFpLRUgyOFZXWmtaYS9TU0lTIjt9', 1617466707);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'E-Medic', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Medical diagnosis web application', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\March2021\\N0OuItwB7D0SdSOaAkjQ.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\March2021\\77YSRbgqTY1qETTfMfrm.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'E-Medic', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to E-Medic Admin Panel.', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\March2021\\LqCgrIuXwdQVkkD23x0j.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(22, 'menu_items', 'title', 13, 'pt', 'Publicações', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(24, 'menu_items', 'title', 12, 'pt', 'Categorias', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(25, 'menu_items', 'title', 14, 'pt', 'Páginas', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-03-18 08:10:42', '2021-03-18 08:10:42'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-03-18 08:10:42', '2021-03-18 08:10:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `settings`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$n/zFBGjwOvyFxRMDGUhbKuY6bQkQ/OvA8m9TZKEH28VWZkZa/SSIS', NULL, NULL, 'DZdDbUuIoQwSlxmfoEhfmIFrY72rLdeEzASwffEqm4JzZyAUdPbmZwC30XYB', NULL, NULL, NULL, '2021-03-18 08:10:41', '2021-03-18 08:10:41'),
(2, 2, 'User', 'user@user.com', 'users\\March2021\\GXsOvxoULZ6jHc1aqxrB.png', NULL, '$2y$10$hWT27oxyapAIPU.fsFLC6eEt2aJ/LNnWdpddOFTD5p5zso9LEE93W', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 08:14:58', '2021-03-18 09:21:40'),
(3, 2, 'Ryder Dawson', 'hybasu@mailinator.com', 'users\\March2021\\WDdnBf6DK0iDlIeY4UwO.png', NULL, '$2y$10$O5I7OwtBq8S.51IXWvSYMedkc4vrWJoPY1BE7Zlwy3Vvo5TJXfExa', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 08:30:01', '2021-03-18 09:20:52'),
(4, 2, 'Lillith Britt', 'kocypom@mailinator.com', 'users\\March2021\\9J9l0FfNysHte9xhBgXR.png', NULL, '$2y$10$uMf4.T09UkNcaKd9wqfDPOsv/0F/4qFC39BBUfRnVxHFTZDcTGHwa', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 08:30:24', '2021-03-18 09:20:17'),
(5, 2, 'Rachel Swanson', 'qokap@mailinator.com', 'users\\March2021\\QrO2eHV4mRhyuSehfJWG.jpg', NULL, '$2y$10$xiiM79sGRWAHJG/8DyDna.1ikpzU6YCit4FjoQOY57Ttb1D1YYjCK', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 08:30:52', '2021-03-18 09:19:35'),
(6, 2, 'Candace Mcleod', 'puxa@mailinator.com', 'users\\March2021\\znPdRYI7WFVlIEwgKHhe.png', NULL, '$2y$10$spPIGTQzI7bM.ilqi2bCp.9axV5wYOslqk3.SCeSYIhduKfhFaWWC', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 08:31:11', '2021-03-18 09:19:10'),
(7, 2, 'Nayda Rivera', 'lypyv@mailinator.com', 'users\\March2021\\1fbD8cJ4DM5BNOQ4wjly.png', NULL, '$2y$10$sDNx7.ArvPhHggQerDo0VO3q2JczPEQ0B9D.utleX/2f/MHJb1LW.', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 08:31:40', '2021-03-18 09:11:50'),
(8, 2, 'Ashely Watson', 'cilefej@mailinator.com', 'users\\March2021\\mq2yLFYVJpubc31g5D6U.png', NULL, '$2y$10$EzDtnrnHymTAd/McyYFnPeMWf.nfz47a9bn/LQw3/V.OugUQlcvta', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 08:32:05', '2021-03-18 09:11:18'),
(9, 2, 'Adena Ewing', 'byhojen@mailinator.com', 'users\\March2021\\tsTvZeL273fJ7ztf0uB5.jpg', NULL, '$2y$10$8kskIlTbLRC1nYLRy1VMeOU0Lgr0NIhiOf9Ybqk0qsm8ahLqQBZFu', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 08:32:30', '2021-03-18 08:37:38'),
(10, 2, 'Fitzgerald Norris', 'zohus@mailinator.com', 'users\\March2021\\qdQsKqayXQRTdxqTmnWQ.png', NULL, '$2y$10$LJhNQgtUXJ.VbkUkp0733.TkHjHPLDsPvSmgInBzcqiseuS05FuUm', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 08:32:52', '2021-03-18 09:10:29'),
(12, 2, 'Cain Ramirez', 'zyjasox@mailinator.com', 'users\\March2021\\L9Wr723KckO2Z2DWCq6H.png', NULL, '$2y$10$YjoSu5JEkSLRvvcErvV3X./qBsGcVOIV280rFJkDSH0WIhLNvZPcu', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 08:33:33', '2021-03-18 09:18:23'),
(13, 2, 'Rudyard Campbell', 'gikiw@mailinator.com', 'users\\March2021\\TaKaOeVo17XZNapqTGRV.png', NULL, '$2y$10$JS1BKS6p/JMYqCR4dgL4PODWNm9RVDHPiKWntfimx9azMJW0uDgYK', NULL, NULL, NULL, '{\"locale\":\"en\"}', NULL, NULL, '2021-03-18 09:08:37', '2021-03-18 09:12:50'),
(14, 2, 'Talon Harmon', 'syqygyg@mailinator.com', 'users/default.png', NULL, '$2y$10$jqFSWZdYB4DadSoRHYJjIeCo5jcEGRLIRqbHvIBmlxG4hcureZO06', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 04:07:28', '2021-03-21 04:07:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(12, 2),
(13, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
