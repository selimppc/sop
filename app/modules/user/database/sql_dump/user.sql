
--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `auth_key`, `access_token`, `csrf_token`, `ip_address`, `role_id`, `department_id`, `last_visit`, `expire_date`, `remember_token`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$FOVyaVndWN.PPC1Hk4lfF.kmLLOFP4rZZsgEBwAJoqAs8KCsOW2MS', NULL, NULL, '0Zh91UIAxOclPWNxrHk7d3v5xbbGNC', '127.0.1.1', 1, 1, '2016-09-25 09:56:57', '2020-06-04 10:47:37', 'OKla1etcaurbLCGByUTjffcOlm2bq2jtMmGOCjy8bVsB3GasC1D5YjIlYPaa', 'active', 1, 1, '0000-00-00 00:00:00', '2016-09-25 03:52:49'),
(2, 'user', 'user@user.com', '$2y$10$9RGdZ5lu/pEyshuBzwMTjucC9u.n4EKnaq4Kwajta.tMlkRFLzptG', NULL, NULL, 'h7wuPsj1j8fYxWzaiJ6Y3RHlDHSLBt', '127.0.1.1', 2, 2, '2016-03-03 03:29:14', '2016-04-02 14:17:42', '7nDFH0uSQe5FSSJiuBsGFxilgeCHo0xVa1SH3VDp2f60ZieF3CBOL1vQ4NtP', 'active', 1, 2, '2016-03-03 02:18:05', '2016-03-03 04:08:23'),
(3, 'worker', 'worker@gmail.com', '$2y$10$TUNgqlPnlLhIVTSWNd8Bl.vG8gwHkUstXJIy1VJalud1q20IwqEJK', NULL, NULL, 'AGsHjfZ6NFlYkWvyxKSwkznLUW9sNF', '127.0.1.1', 3, 1, NULL, '2016-09-25 00:00:00', NULL, 'active', 1, 0, '2016-09-25 03:46:55', '2016-09-25 03:46:55'),
(4, 'supervisor', 'supervisor@gmail.com', '$2y$10$IaylcHN/pKNuHtOPWe4YROqwbUjP/2uKPp/ilBXZNm5jy404AyJma', NULL, NULL, 'MQbf5o4c2Kmno4rqRs7CKGK2kfhn1G', '127.0.1.1', 4, 1, NULL, '2018-09-25 00:00:00', NULL, 'active', 1, 0, '2016-09-25 03:47:40', '2016-09-25 03:47:40'),
(5, 'hr', 'hr@gmail.com', '$2y$10$WvGT6r/eTvcOZbmd7zrC2OGHNQdsT9PnCXuBx1nyg37zZB0vc0F.O', NULL, NULL, 'Hg3XCCt14D3lX1nEYrruvOIYGBAU2q', '127.0.1.1', 5, 1, NULL, '2018-09-25 00:00:00', NULL, 'active', 1, 0, '2016-09-25 03:48:17', '2016-09-25 03:48:17'),
(6, 'manager', 'manager@gmail.com', '$2y$10$3Mf9k3CBF0Hsd6PpKRegPucx2UHYT9gi5kt6ZknIBXJYnf/HDoJ8C', NULL, NULL, 'LZEvv7jLt2no6dTCLzQTDocPwbV4RR', '127.0.1.1', 6, 1, NULL, '2018-09-25 00:00:00', NULL, 'active', 1, 0, '2016-09-25 03:49:08', '2016-09-25 03:49:08');

