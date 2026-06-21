-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 21, 2026 lúc 04:07 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `chaynhaut`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id_chi_tiet` int(11) NOT NULL,
  `id_don_hang` int(11) NOT NULL,
  `ten_mon_an` varchar(255) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `gia_mot_phien` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_don_hang`
--

INSERT INTO `chi_tiet_don_hang` (`id_chi_tiet`, `id_don_hang`, `ten_mon_an`, `so_luong`, `gia_mot_phien`) VALUES
(11, 9, 'Bún Huế Chay', 4, '45.000đ'),
(12, 9, 'Chè', 1, '35.000đ'),
(13, 10, 'Cơm chiên', 1, '35.000đ'),
(14, 10, 'Bún Huế Chay', 4, '45.000đ'),
(15, 10, 'Chè', 1, '35.000đ'),
(16, 11, 'Bún Huế Chay', 1, '45.000đ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id` int(11) NOT NULL,
  `ten_khach_hang` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(20) NOT NULL,
  `dia_chi` text NOT NULL,
  `phuong_thuc_thanh_toan` varchar(100) NOT NULL,
  `tong_tien` decimal(10,2) NOT NULL,
  `trang_thai` varchar(50) DEFAULT 'cho-xu-ly',
  `ngay_dat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`id`, `ten_khach_hang`, `so_dien_thoai`, `dia_chi`, `phuong_thuc_thanh_toan`, `tong_tien`, `trang_thai`, `ngay_dat`) VALUES
(9, 'MyHuyen Vo', '0328970986', '99999999', 'Tiền mặt', 215000.00, 'cho-xu-ly', '2026-06-17 14:29:43'),
(10, 'MyHuyen Vo', '0328970986', '44444444', 'Tiền mặt', 250000.00, 'hoan-thanh', '2026-06-17 14:59:34'),
(11, 'aaaaaaa', '33333333', 'aaaa', 'Chuyển khoản', 45000.00, 'cho-xu-ly', '2026-06-20 13:37:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `mon_an_id` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL DEFAULT 1,
  `thoi_gian_them` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `gio_hang`
--

INSERT INTO `gio_hang` (`id`, `session_id`, `mon_an_id`, `so_luong`, `thoi_gian_them`) VALUES
(19, '8', 7, 3, '2026-06-07 03:26:51'),
(20, '8', 6, 5, '2026-06-07 03:26:57'),
(21, '8', 9, 4, '2026-06-07 03:27:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(11) NOT NULL,
  `model_type` varchar(50) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'User', 7),
(3, 'User', 9),
(2, 'User', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon_an`
--

CREATE TABLE `mon_an` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `gia` int(11) NOT NULL,
  `loai` varchar(50) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `nguyen_lieu` text DEFAULT NULL,
  `hinh_anh` varchar(500) DEFAULT 'https://via.placeholder.com/150',
  `ngay_tao` datetime DEFAULT current_timestamp(),
  `ngay_sua` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mon_an`
--

INSERT INTO `mon_an` (`id`, `ten`, `gia`, `loai`, `mo_ta`, `nguyen_lieu`, `hinh_anh`, `ngay_tao`, `ngay_sua`) VALUES
(6, 'Chè', 35000, 'khac', 'Ngon ngọt tươi mát', 'Đậu, bột, ...', 'a36b2312c36a4ef522a866bd54d51fca.jpg', '2026-05-24 15:12:57', '2026-05-24 19:37:52'),
(7, 'Bún Huế Chay', 45000, 'bun', 'nước dùng thanh ngọt tự nhiên được ninh hoàn toàn từ củ quả tươi, kết hợp cùng chút cay nồng của sả bằm, ớt sa tế nhà làm và hương thơm đặc trưng không thể trộn lẫn.', 'Bún chay, Nấm, Rau, Tàu hủ, Chả đòn, Chả lụa,..', '6caf09b1fc2021dd567ca6af4c6b9c37.jpg', '2026-05-24 17:14:31', '2026-05-24 19:24:37'),
(8, 'Phở Chay', 45000, 'pho', 'Nước súp thơm ngon, đậm vị hương nhà làm.', 'Phở chay, Nấm, Tàu hủ, Chả,...', '8a61a395fbbbd18e05d2edaac28acafe.jpg', '2026-05-24 19:22:55', '2026-05-24 19:23:05'),
(9, 'Cơm chiên', 35000, 'com', 'Cơm thơm ngon đậm vị, được chế biến hoàn toàn từ các nguyên liệu thực vật.', 'Cơm, dầu olive, Cà rốt, Tỏi, Hành ,..', 'd08c22d2acb40219cc0e180e3964515c.jpg', '2026-06-05 04:50:05', '2026-06-05 04:50:05'),
(10, 'Gỏi chay', 45000, 'mon-cuon', 'Gỏi cuốn thanh khiết được chế biến từ các nguyên liệu tự nhiên', 'Ngó sen, Măng, Hoa Thiên Lý', '1b540cf87f79e8a7a19d6fdff23e64d9.jpg', '2026-06-20 15:31:44', '2026-06-20 15:31:44'),
(11, 'Mì chay', 45000, 'khac', 'Mì trộn đậu phụ, hương vị thanh nhã, nhẹ nhàng', 'Mì, Tàu hủ, Đậu Hà Lan ,...', '11c8f83111598210c4303bfe2e800d2d.jpg', '2026-06-20 15:33:05', '2026-06-20 15:33:05'),
(12, 'Nước Rau Má', 20000, 'nuoc', 'Nước uống giải khát', 'Rau má', 'a0227bb93137dadf64dd2bed1d9c690d.jpg', '2026-06-20 15:34:00', '2026-06-20 15:34:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`) VALUES
(1, 'access_dashboard', 'Truy cập trang quản trị'),
(2, 'view_mon_an', 'Xem danh sách món ăn'),
(3, 'create_mon_an', 'Thêm món ăn'),
(4, 'edit_mon_an', 'Sửa món ăn'),
(5, 'delete_mon_an', 'Xóa món ăn'),
(6, 'view_don_hang', 'Xem đơn hàng của mình'),
(7, 'view_all_don_hang', 'Xem tất cả đơn hàng'),
(8, 'update_trang_thai_don_hang', 'Cập nhật trạng thái đơn hàng'),
(9, 'manage_users', 'Quản lý tài khoản người dùng'),
(10, 'access_admin', 'Truy cập trang quản trị'),
(11, 'manage_mon_an', 'Quản lý món ăn (thêm/sửa/xóa)'),
(12, 'update_don_hang', 'Cập nhật trạng thái đơn hàng'),
(13, 'view_reports', 'Xem báo cáo');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Quản trị viên - Toàn quyền'),
(2, 'staff', 'Nhân viên - Quản lý đơn hàng'),
(3, 'user', 'Khách hàng thông thường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(2, 1),
(2, 2),
(2, 6),
(2, 7),
(2, 8),
(3, 2),
(3, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(100) NOT NULL COMMENT 'Họ và tên',
  `phone` varchar(20) NOT NULL COMMENT 'Số điện thoại',
  `email` varchar(150) NOT NULL COMMENT 'Email',
  `password` varchar(255) NOT NULL COMMENT 'Mật khẩu đã hash',
  `status` enum('active','inactive','banned') NOT NULL DEFAULT 'active' COMMENT 'Trạng thái tài khoản',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone`, `email`, `password`, `status`, `created_at`) VALUES
(7, 'admin', '0868602781', 'myhuyenmh71@gmail.com', '$2y$10$U2S1lyGaOa1TEAUPUzVMDuhvYUDCWR7789mtRD.ommAlDQ6aPmXuq', 'active', '2026-05-30 02:59:36'),
(9, 'MyHuyen Vo', '0328970986', 'myhuyenmh710@gmail.com', '$2y$10$z.OTgoTLJps0K3697rmzeuisw4FnRu1ju0JjwCxWOIyv7EU6tXMh6', 'active', '2026-06-21 13:58:46');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id_chi_tiet`),
  ADD KEY `id_don_hang` (`id_don_hang`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cart` (`session_id`,`mon_an_id`),
  ADD KEY `fk_gio_hang_mon_an` (`mon_an_id`);

--
-- Chỉ mục cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD KEY `fk_model_role` (`role_id`),
  ADD KEY `fk_model_user` (`model_id`);

--
-- Chỉ mục cho bảng `mon_an`
--
ALTER TABLE `mon_an`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `fk_role_permission_permission` (`permission_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_phone` (`phone`),
  ADD KEY `idx_fullname` (`fullname`),
  ADD KEY `idx_status` (`status`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id_chi_tiet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `mon_an`
--
ALTER TABLE `mon_an`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `chi_tiet_don_hang_ibfk_1` FOREIGN KEY (`id_don_hang`) REFERENCES `don_hang` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD CONSTRAINT `fk_gio_hang_mon_an` FOREIGN KEY (`mon_an_id`) REFERENCES `mon_an` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `fk_model_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_model_user` FOREIGN KEY (`model_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `fk_role_permission_permission` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_role_permission_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
