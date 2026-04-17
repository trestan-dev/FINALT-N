-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2026 at 06:52 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tn_registration_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `app_code` varchar(20) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `position` varchar(150) NOT NULL,
  `department` varchar(100) NOT NULL,
  `resume_path` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('pending','review','approved','rejected') NOT NULL DEFAULT 'pending',
  `reviewed_by` int(11) DEFAULT NULL,
  `review_notes` text DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `app_code`, `applicant_id`, `position`, `department`, `resume_path`, `notes`, `status`, `reviewed_by`, `review_notes`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(1, 'APP-220-001', 1, 'Software Engineer', 'Information Technology', NULL, NULL, 'rejected', 2, 'Qualified applicant. Approved for onboarding.', '2026-04-09 01:07:53', '2025-02-15 00:30:00', '2026-04-09 07:07:53'),
(2, 'APP-220-002', 1, 'Teacher', 'Education', NULL, NULL, 'pending', 2, '', '2026-04-09 01:08:00', '2025-03-02 02:00:00', '2026-04-09 07:08:00'),
(3, 'APP-220-003', 1, 'Data Analyst', 'Information Technology', NULL, NULL, 'approved', 2, 'Documents under verification.', '2026-04-08 18:49:26', '2025-03-10 03:00:00', '2026-04-09 00:49:26'),
(8, 'APP-280-004', 7, 'TantanTest', 'Human Resources', '37872d3134725393f94edce66b1a87c5.pdf', '123', 'review', 2, 'note 123', '2026-04-16 22:13:31', '2026-04-17 04:12:36', '2026-04-17 04:13:31'),
(9, 'APP-288-005', 7, 'QA TESTER', 'Information Technology', '664c6da2e722fc572573f12189fd1693.pdf', 'fsdf', 'pending', NULL, NULL, NULL, '2026-04-17 04:36:28', '2026-04-17 04:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `description`, `ip_address`, `user_agent`, `created_at`) VALUES
(101, 2, 'logout', 'Maria Santos logged out.', '::1', NULL, '2026-04-16 17:30:38'),
(102, 3, 'login', 'Administrator System (admin) logged in.', '::1', NULL, '2026-04-16 17:30:49'),
(103, 3, 'page_view', 'Admin viewed dashboard.', '::1', NULL, '2026-04-16 17:30:50'),
(104, 3, 'logout', 'Administrator System logged out.', '::1', NULL, '2026-04-16 17:33:47'),
(105, 3, 'login', 'Administrator System (admin) logged in.', '::1', NULL, '2026-04-16 17:35:55'),
(106, 3, 'page_view', 'Admin viewed dashboard.', '::1', NULL, '2026-04-16 17:35:56'),
(107, 3, 'page_view', 'Admin viewed dashboard.', '::1', NULL, '2026-04-16 17:39:56'),
(108, 3, 'logout', 'Administrator System logged out.', '::1', NULL, '2026-04-16 17:47:16'),
(109, 2, 'login', 'Maria Santos (hr) logged in.', '::1', NULL, '2026-04-16 17:47:24'),
(110, 2, 'page_view', 'HR viewed dashboard.', '::1', NULL, '2026-04-16 17:47:25'),
(111, 2, 'logout', 'Maria Santos logged out.', '::1', NULL, '2026-04-16 17:47:27'),
(112, 3, 'login', 'Administrator System (admin) logged in.', '::1', NULL, '2026-04-16 17:47:39'),
(113, 3, 'page_view', 'Admin viewed dashboard.', '::1', NULL, '2026-04-16 17:47:40'),
(114, 3, 'logout', 'Administrator System logged out.', '::1', NULL, '2026-04-16 18:34:49'),
(115, 3, 'login', 'Administrator System (admin) logged in.', '::1', NULL, '2026-04-16 19:52:53'),
(116, 3, 'page_view', 'Admin viewed dashboard.', '::1', NULL, '2026-04-16 19:52:54'),
(117, 6, 'account_created', 'New applicant: Miss A A (missa@gmail.com)', '::1', NULL, '2026-04-17 04:02:02'),
(118, 6, 'login', 'Miss A A (applicant) logged in.', '::1', NULL, '2026-04-17 04:02:14'),
(119, 6, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:02:15'),
(120, 6, 'logout', 'Miss A A logged out.', '::1', NULL, '2026-04-17 04:02:29'),
(121, 6, 'login', 'Miss A A (applicant) logged in.', '::1', NULL, '2026-04-17 04:03:05'),
(122, 6, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:03:06'),
(123, 6, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:03:08'),
(124, 6, 'logout', 'Miss A A logged out.', '::1', NULL, '2026-04-17 04:03:10'),
(125, 7, 'account_created', 'New applicant: Miss A Almeda (missa@gmail.com)', '::1', NULL, '2026-04-17 04:11:52'),
(126, 7, 'login', 'Miss A Almeda (applicant) logged in.', '::1', NULL, '2026-04-17 04:11:57'),
(127, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:11:58'),
(128, 7, 'application_create', 'Application APP-280-004 submitted for TantanTest.', '::1', NULL, '2026-04-17 04:12:36'),
(129, 7, 'logout', 'Miss A Almeda logged out.', '::1', NULL, '2026-04-17 04:13:03'),
(130, 2, 'login', 'Maria Santos (hr) logged in.', '::1', NULL, '2026-04-17 04:13:17'),
(131, 2, 'page_view', 'HR viewed dashboard.', '::1', NULL, '2026-04-17 04:13:18'),
(132, 2, 'status_update', 'App APP-280-004 changed from pending to review by Maria Santos.', '::1', NULL, '2026-04-17 04:13:31'),
(133, 2, 'job_post', 'New job \"tester\" posted by Maria Santos.', '::1', NULL, '2026-04-17 04:14:03'),
(134, 2, 'logout', 'Maria Santos logged out.', '::1', NULL, '2026-04-17 04:14:18'),
(135, 7, 'login', 'Miss A Almeda (applicant) logged in.', '::1', NULL, '2026-04-17 04:14:20'),
(136, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:14:21'),
(137, 7, 'logout', 'Miss A Almeda logged out.', '::1', NULL, '2026-04-17 04:14:27'),
(138, 3, 'login', 'Administrator System (admin) logged in.', '::1', NULL, '2026-04-17 04:14:43'),
(139, 3, 'page_view', 'Admin viewed dashboard.', '::1', NULL, '2026-04-17 04:14:44'),
(140, 3, 'account_created', 'Admin created HR account: Miss Almeda (missalmeda@hr.com)', '::1', NULL, '2026-04-17 04:15:44'),
(141, 3, 'job_post', 'New job \"QA TESTER\" posted by admin.', '::1', NULL, '2026-04-17 04:16:15'),
(142, 3, 'logout', 'Administrator System logged out.', '::1', NULL, '2026-04-17 04:16:45'),
(143, 7, 'login', 'Miss A Almeda (applicant) logged in.', '::1', NULL, '2026-04-17 04:16:47'),
(144, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:16:48'),
(145, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:17:18'),
(146, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:17:22'),
(147, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:20:05'),
(148, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:20:05'),
(149, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:21:10'),
(150, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:22:15'),
(151, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:24:56'),
(152, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:27:59'),
(153, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:27:59'),
(154, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:28:58'),
(155, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:33:59'),
(156, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:34:07'),
(157, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:34:17'),
(158, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:34:19'),
(159, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:36:13'),
(160, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:36:13'),
(161, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:36:13'),
(162, 7, 'application_create', 'Application APP-288-005 submitted for QA TESTER.', '::1', NULL, '2026-04-17 04:36:28'),
(163, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:36:55'),
(164, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:37:04'),
(165, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:37:46'),
(166, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:37:56'),
(167, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:37:57'),
(168, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:38:10'),
(169, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:38:15'),
(170, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:38:15'),
(171, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:38:29'),
(172, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:38:46'),
(173, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:38:58'),
(174, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:39:04'),
(175, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:39:04'),
(176, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:39:10'),
(177, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:39:11'),
(178, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:39:27'),
(179, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:39:27'),
(180, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:39:39'),
(181, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:39:42'),
(182, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:40:13'),
(183, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:41:35'),
(184, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:41:57'),
(185, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:41:57'),
(186, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:42:08'),
(187, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:42:08'),
(188, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:42:17'),
(189, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:42:17'),
(190, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:42:20'),
(191, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:42:20'),
(192, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:44:46'),
(193, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:44:49'),
(194, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:45:05'),
(195, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:45:10'),
(196, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:46:05'),
(197, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:46:08'),
(198, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:48:06'),
(199, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:49:10'),
(200, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:49:13'),
(201, 7, 'profile_update', 'Profile updated.', '::1', NULL, '2026-04-17 04:49:45'),
(202, 7, 'page_view', 'Applicant viewed dashboard.', '::1', NULL, '2026-04-17 04:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `code`, `description`, `is_active`) VALUES
(1, 'Information Technology', 'IT', 'Software, systems, and infrastructure', 1),
(2, 'Human Resources', 'HR', 'Recruitment, benefits, and employee relations', 1),
(3, 'Finance', 'FIN', 'Accounting, payroll, and budgeting', 1),
(4, 'Education', 'EDU', 'Training, development, and instruction', 1),
(5, 'Operations', 'OPS', 'Day-to-day operations and logistics', 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_positions`
--

CREATE TABLE `job_positions` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `department_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `status` enum('open','closed','on_hold') NOT NULL DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_positions`
--

INSERT INTO `job_positions` (`id`, `title`, `department_id`, `description`, `requirements`, `status`, `created_at`) VALUES
(1, 'Software Engineer', 1, 'Design and develop software applications.', 'BS Computer Science or IT; 1+ year experience', 'open', '2026-04-07 07:32:13'),
(2, 'Data Analyst', 1, 'Analyze data and generate business insights.', 'BS Information Technology; Excel, SQL skills', 'open', '2026-04-07 07:32:13'),
(3, 'HR Officer', 2, 'Handle recruitment and employee records.', 'BS Psychology or Management; good communication', 'open', '2026-04-07 07:32:13'),
(4, 'Accountant', 3, 'Manage financial records and reports.', 'BS Accountancy; CPA preferred', 'open', '2026-04-07 07:32:13'),
(5, 'Training Specialist', 4, 'Design and deliver employee training programs.', 'BS Education or HR Management', 'open', '2026-04-07 07:32:13'),
(6, 'Operations Manager', 5, 'Oversee daily operations and process improvement.', '5+ years management experience', 'open', '2026-04-07 07:32:13'),
(7, 'TantanTest', 2, 'for testing', 'testing lang', 'open', '2026-04-09 00:51:12'),
(8, 'tester', 1, 'tester', 'tester', 'open', '2026-04-17 04:14:03'),
(9, 'QA TESTER', 1, 'QA', 'QA', 'open', '2026-04-17 04:16:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('applicant','hr','admin') NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `qualifications` text DEFAULT NULL,
  `education` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `status` enum('active','inactive','suspended') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `first_name`, `last_name`, `phone`, `address`, `qualifications`, `education`, `dob`, `gender`, `status`, `created_at`, `updated_at`) VALUES
(1, 'applicant@test.com', 'test123', 'applicant', 'John', 'Doe', '09123456789', '', NULL, NULL, NULL, NULL, 'active', '2026-04-07 07:32:13', '2026-04-09 08:42:18'),
(2, 'hr@test.com', 'test123', 'hr', 'Maria', 'Santos', NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2026-04-07 07:32:13', '2026-04-09 09:02:13'),
(3, 'admin@test.com', 'admin123', 'admin', 'Administrator', 'System', NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2026-04-07 07:32:13', '2026-04-07 07:32:13'),
(4, 'menard@test.com', 'test123', 'applicant', 'Menard', 'Famini', '09987654321', '#123 Pasig', NULL, NULL, '2005-01-09', 'male', 'active', '2026-04-09 08:45:03', '2026-04-09 08:45:03'),
(5, 'juandelacruz@gmail.com', '1234567', 'applicant', 'Juan', 'Dela Cruz', '09123456789', '1234', NULL, NULL, '2026-04-16', 'male', 'active', '2026-04-15 17:34:17', '2026-04-15 17:34:17'),
(7, 'missa@gmail.com', 'miss123', 'applicant', 'Miss Almeda', 'Asuncion', 'xyz', 'tata', 'malupet sa lahat', 'harvard graduate ng computer science and engineering', '2026-04-01', 'female', 'active', '2026-04-17 04:11:52', '2026-04-17 04:49:45'),
(8, 'missalmeda@hr.com', 'miss123', 'hr', 'Miss', 'Almeda', NULL, 'Human Resources', NULL, NULL, NULL, NULL, 'active', '2026-04-17 04:15:44', '2026-04-17 04:15:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_applications_app_code` (`app_code`),
  ADD KEY `fk_applications_applicant` (`applicant_id`),
  ADD KEY `fk_applications_reviewer` (`reviewed_by`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audit_logs_user` (`user_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_departments_code` (`code`);

--
-- Indexes for table `job_positions`
--
ALTER TABLE `job_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_job_positions_department` (`department_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_positions`
--
ALTER TABLE `job_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `fk_applications_applicant` FOREIGN KEY (`applicant_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_applications_reviewer` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `fk_audit_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `job_positions`
--
ALTER TABLE `job_positions`
  ADD CONSTRAINT `fk_job_positions_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
