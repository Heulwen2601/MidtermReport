-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 26, 2024 lúc 08:02 PM
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
-- Cơ sở dữ liệu: `tracnghiemonline1`
--

DELIMITER $$
--
-- Các hàm
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fnStripTags` (`Dirty` VARCHAR(4000) CHARSET utf8) RETURNS VARCHAR(4000) CHARSET utf8 COLLATE utf8_general_ci DETERMINISTIC BEGIN
  DECLARE iStart, iEnd, iLength int;
    WHILE Locate( '<', Dirty ) > 0 And Locate( '>', Dirty, Locate( '<', Dirty )) > 0 DO
      BEGIN
        SET iStart = Locate( '<', Dirty ), iEnd = Locate( '>', Dirty, Locate('<', Dirty ));
        SET iLength = ( iEnd - iStart) + 1;
        IF iLength > 0 THEN
          BEGIN
            SET Dirty = Insert( Dirty, iStart, iLength, '');
          END;
        END IF;
      END;
    END WHILE;
    RETURN Dirty;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cauhoi`
--

CREATE TABLE `cauhoi` (
  `macauhoi` int(11) NOT NULL,
  `noidung` varchar(500) NOT NULL,
  `dokho` int(11) NOT NULL,
  `mamonhoc` int(11) NOT NULL,
  `machuong` int(11) NOT NULL,
  `nguoitao` varchar(50) DEFAULT NULL,
  `trangthai` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cauhoi`
--

INSERT INTO `cauhoi` (`macauhoi`, `noidung`, `dokho`, `mamonhoc`, `machuong`, `nguoitao`, `trangthai`) VALUES
(1, 'ADT là gì?', 1, 504008, 1, '52200028', 1),
(2, 'Định nghĩa ADT.', 1, 504008, 1, '52200028', 1),
(3, 'Ví dụ về ADT.', 1, 504008, 1, '52200028', 1),
(4, 'Tại sao ADT quan trọng?', 2, 504008, 1, '52200028', 1),
(5, 'Ưu điểm của ADT.', 2, 504008, 1, '52200028', 1),
(6, 'Nhược điểm của ADT.', 2, 504008, 1, '52200028', 1),
(7, 'Đưa ra một ADT và cách sử dụng nó.', 3, 504008, 1, '52200028', 1),
(8, 'So sánh ADT với các cấu trúc dữ liệu khác.', 3, 504008, 1, '52200028', 1),
(9, 'Phân tích ưu nhược điểm của ADT.', 3, 504008, 1, '52200028', 1),
(10, 'Danh sách liên kết là gì?', 1, 504008, 2, '52200028', 1),
(11, 'Định nghĩa danh sách liên kết.', 1, 504008, 2, '52200028', 1),
(12, 'Ví dụ về danh sách liên kết.', 1, 504008, 2, '52200028', 1),
(13, 'Cách chèn phần tử vào danh sách liên kết.', 2, 504008, 2, '52200028', 1),
(14, 'Cách xoá phần tử khỏi danh sách liên kết.', 2, 504008, 2, '52200028', 1),
(15, 'Ưu điểm của danh sách liên kết.', 2, 504008, 2, '52200028', 1),
(16, 'So sánh danh sách liên kết đơn và kép.', 3, 504008, 2, '52200028', 1),
(17, 'Phân tích hiệu suất của danh sách liên kết.', 3, 504008, 2, '52200028', 1),
(18, 'Nhược điểm của danh sách liên kết.', 3, 504008, 2, '52200028', 1),
(19, 'Ngăn xếp là gì?', 1, 504008, 3, '52200028', 1),
(20, 'Định nghĩa ngăn xếp.', 1, 504008, 3, '52200028', 1),
(21, 'Ví dụ về ngăn xếp.', 1, 504008, 3, '52200028', 1),
(22, 'Hàng đợi là gì?', 2, 504008, 3, '52200028', 1),
(23, 'Định nghĩa hàng đợi.', 2, 504008, 3, '52200028', 1),
(24, 'Ví dụ về hàng đợi.', 2, 504008, 3, '52200028', 1),
(25, 'So sánh ngăn xếp và hàng đợi.', 3, 504008, 3, '52200028', 1),
(26, 'Ứng dụng của ngăn xếp và hàng đợi.', 3, 504008, 3, '52200028', 1),
(27, 'Phân tích ngăn xếp và hàng đợi.', 3, 504008, 3, '52200028', 1),
(28, 'Đệ quy là gì?', 1, 504008, 4, '52200028', 1),
(29, 'Định nghĩa đệ quy.', 1, 504008, 4, '52200028', 1),
(30, 'Ví dụ về đệ quy.', 1, 504008, 4, '52200028', 1),
(31, 'Ưu điểm của đệ quy.', 2, 504008, 4, '52200028', 1),
(32, 'Nhược điểm của đệ quy.', 2, 504008, 4, '52200028', 1),
(33, 'Khi nào nên sử dụng đệ quy.', 2, 504008, 4, '52200028', 1),
(34, 'Phân tích độ phức tạp của đệ quy.', 3, 504008, 4, '52200028', 1),
(35, 'Đưa ra một bài toán giải bằng đệ quy.', 3, 504008, 4, '52200028', 1),
(36, 'So sánh đệ quy và vòng lặp.', 3, 504008, 4, '52200028', 1),
(37, 'Phân tích thuật toán là gì?', 1, 504008, 5, '52200028', 1),
(38, 'Định nghĩa phân tích thuật toán.', 1, 504008, 5, '52200028', 1),
(39, 'Ví dụ về phân tích thuật toán.', 1, 504008, 5, '52200028', 1),
(40, 'Tại sao phân tích thuật toán quan trọng?', 2, 504008, 5, '52200028', 1),
(41, 'Các chỉ số đo lường hiệu suất thuật toán.', 2, 504008, 5, '52200028', 1),
(42, 'Ưu điểm của phân tích thuật toán.', 2, 504008, 5, '52200028', 1),
(43, 'Phân tích độ phức tạp thời gian.', 3, 504008, 5, '52200028', 1),
(44, 'Phân tích độ phức tạp không gian.', 3, 504008, 5, '52200028', 1),
(45, 'So sánh các thuật toán thông qua phân tích.', 3, 504008, 5, '52200028', 1),
(46, 'Thuật toán sắp xếp là gì?', 1, 504008, 6, '52200028', 1),
(47, 'Định nghĩa thuật toán sắp xếp.', 1, 504008, 6, '52200028', 1),
(48, 'Ví dụ về thuật toán sắp xếp.', 1, 504008, 6, '52200028', 1),
(49, 'Thuật toán sắp xếp chèn là gì?', 2, 504008, 6, '52200028', 1),
(50, 'Ưu điểm của thuật toán sắp xếp chèn.', 2, 504008, 6, '52200028', 1),
(51, 'Nhược điểm của thuật toán sắp xếp chèn.', 2, 504008, 6, '52200028', 1),
(52, 'Phân tích hiệu suất của thuật toán sắp xếp.', 3, 504008, 6, '52200028', 1),
(53, 'So sánh các thuật toán sắp xếp khác nhau.', 3, 504008, 6, '52200028', 1),
(54, 'Khi nào nên sử dụng thuật toán sắp xếp chèn.', 3, 504008, 6, '52200028', 1),
(55, 'Bảng băm là gì?', 1, 504008, 7, '52200028', 1),
(56, 'Định nghĩa bảng băm.', 1, 504008, 7, '52200028', 1),
(57, 'Ví dụ về bảng băm.', 1, 504008, 7, '52200028', 1),
(58, 'Làm thế nào để xử lý xung đột trong bảng băm?', 2, 504008, 7, '52200028', 1),
(59, 'Ưu điểm của bảng băm.', 2, 504008, 7, '52200028', 1),
(60, 'Nhược điểm của bảng băm.', 2, 504008, 7, '52200028', 1),
(61, 'Phân tích hiệu suất của bảng băm.', 3, 504008, 7, '52200028', 1),
(62, 'So sánh bảng băm với các cấu trúc dữ liệu khác.', 3, 504008, 7, '52200028', 1),
(63, 'Khi nào nên sử dụng bảng băm.', 3, 504008, 7, '52200028', 1),
(64, 'Cây nhị phân tìm kiếm là gì?', 1, 504008, 8, '52200028', 1),
(65, 'Định nghĩa cây nhị phân tìm kiếm.', 1, 504008, 8, '52200028', 1),
(66, 'Ví dụ về cây nhị phân tìm kiếm.', 1, 504008, 8, '52200028', 1),
(67, 'Làm thế nào để tìm kiếm trong cây nhị phân?', 2, 504008, 8, '52200028', 1),
(68, 'Ưu điểm của cây nhị phân tìm kiếm.', 2, 504008, 8, '52200028', 1),
(69, 'Nhược điểm của cây nhị phân tìm kiếm.', 2, 504008, 8, '52200028', 1),
(70, 'Phân tích hiệu suất của cây nhị phân.', 3, 504008, 8, '52200028', 1),
(71, 'So sánh cây nhị phân và bảng băm.', 3, 504008, 8, '52200028', 1),
(72, 'Khi nào nên sử dụng cây nhị phân tìm kiếm.', 3, 504008, 8, '52200028', 1),
(73, 'Cây AVL là gì?', 1, 504008, 9, '52200028', 1),
(74, 'Định nghĩa cây AVL.', 1, 504008, 9, '52200028', 1),
(75, 'Ví dụ về cây AVL.', 1, 504008, 9, '52200028', 1),
(76, 'Làm thế nào để duy trì cân bằng cây AVL?', 2, 504008, 9, '52200028', 1),
(77, 'Ưu điểm của cây AVL.', 2, 504008, 9, '52200028', 1),
(78, 'Nhược điểm của cây AVL.', 2, 504008, 9, '52200028', 1),
(79, 'Phân tích hiệu suất của cây AVL.', 3, 504008, 9, '52200028', 1),
(80, 'So sánh cây AVL và cây nhị phân tìm kiếm.', 3, 504008, 9, '52200028', 1),
(81, 'Khi nào nên sử dụng cây AVL.', 3, 504008, 9, '52200028', 1),
(82, 'Hàng đợi ưu tiên là gì?', 1, 504008, 10, '52200028', 1),
(83, 'Định nghĩa hàng đợi ưu tiên.', 1, 504008, 10, '52200028', 1),
(84, 'Ví dụ về hàng đợi ưu tiên.', 1, 504008, 10, '52200028', 1),
(85, 'Heap nhị phân là gì?', 2, 504008, 10, '52200028', 1),
(86, 'Ưu điểm của heap nhị phân.', 2, 504008, 10, '52200028', 1),
(87, 'Nhược điểm của heap nhị phân.', 2, 504008, 10, '52200028', 1),
(88, 'Phân tích hiệu suất của heap nhị phân.', 3, 504008, 10, '52200028', 1),
(89, 'So sánh heap nhị phân và hàng đợi ưu tiên.', 3, 504008, 10, '52200028', 1),
(90, 'Khi nào nên sử dụng heap nhị phân.', 3, 504008, 10, '52200028', 1),
(91, 'Khái niệm cơ bản về đồ thị là gì?', 1, 504008, 11, '52200028', 1),
(92, 'Định nghĩa đồ thị.', 1, 504008, 11, '52200028', 1),
(93, 'Ví dụ về đồ thị.', 1, 504008, 11, '52200028', 1),
(94, 'Phân loại đồ thị.', 2, 504008, 11, '52200028', 1),
(95, 'Đặc điểm của đồ thị có hướng.', 2, 504008, 11, '52200028', 1),
(96, 'Đặc điểm của đồ thị vô hướng.', 2, 504008, 11, '52200028', 1),
(97, 'So sánh đồ thị có hướng và vô hướng.', 3, 504008, 11, '52200028', 1),
(98, 'Phân tích các ứng dụng của đồ thị.', 3, 504008, 11, '52200028', 1),
(99, 'Nhược điểm của đồ thị.', 3, 504008, 11, '52200028', 1),
(100, 'Thuật toán BFS là gì?', 1, 504008, 12, '52200028', 1),
(101, 'Định nghĩa thuật toán BFS.', 1, 504008, 12, '52200028', 1),
(102, 'Ví dụ về thuật toán BFS.', 1, 504008, 12, '52200028', 1),
(103, 'Thuật toán DFS là gì?', 2, 504008, 12, '52200028', 1),
(104, 'Định nghĩa thuật toán DFS.', 2, 504008, 12, '52200028', 1),
(105, 'Ví dụ về thuật toán DFS.', 2, 504008, 12, '52200028', 1),
(106, 'So sánh BFS và DFS.', 3, 504008, 12, '52200028', 1),
(107, 'Ứng dụng của thuật toán BFS và DFS.', 3, 504008, 12, '52200028', 1),
(108, 'Phân tích độ phức tạp của BFS và DFS.', 3, 504008, 12, '52200028', 1),
(109, 'Thuật toán tìm cây khung nhỏ nhất là gì?', 1, 504008, 13, '52200028', 1),
(110, 'Định nghĩa cây khung nhỏ nhất.', 1, 504008, 13, '52200028', 1),
(111, 'Ví dụ về cây khung nhỏ nhất.', 1, 504008, 13, '52200028', 1),
(112, 'Các thuật toán tìm cây khung nhỏ nhất phổ biến.', 2, 504008, 13, '52200028', 1),
(113, 'Ưu điểm của thuật toán cây khung nhỏ nhất.', 2, 504008, 13, '52200028', 1),
(114, 'Nhược điểm của thuật toán cây khung nhỏ nhất.', 2, 504008, 13, '52200028', 1),
(115, 'So sánh các thuật toán cây khung nhỏ nhất.', 3, 504008, 13, '52200028', 1),
(116, 'Phân tích độ phức tạp của thuật toán cây khung nhỏ nhất.', 3, 504008, 13, '52200028', 1),
(117, 'Ứng dụng của cây khung nhỏ nhất.', 3, 504008, 13, '52200028', 1),
(118, 'Thuật toán Bellman-Ford là gì?', 1, 504008, 14, '52200028', 1),
(119, 'Định nghĩa thuật toán Bellman-Ford.', 1, 504008, 14, '52200028', 1),
(120, 'Ví dụ về thuật toán Bellman-Ford.', 1, 504008, 14, '52200028', 1),
(121, 'Ưu điểm của thuật toán Bellman-Ford.', 2, 504008, 14, '52200028', 1),
(122, 'Nhược điểm của thuật toán Bellman-Ford.', 2, 504008, 14, '52200028', 1),
(123, 'Ứng dụng của thuật toán Bellman-Ford.', 2, 504008, 14, '52200028', 1),
(124, 'So sánh Bellman-Ford và Dijkstra.', 3, 504008, 14, '52200028', 1),
(125, 'Phân tích độ phức tạp của Bellman-Ford.', 3, 504008, 14, '52200028', 1),
(126, 'Khi nào nên sử dụng Bellman-Ford.', 3, 504008, 14, '52200028', 1),
(127, 'Thuật toán Dijkstra là gì?', 1, 504008, 15, '52200028', 1),
(128, 'Định nghĩa thuật toán Dijkstra.', 1, 504008, 15, '52200028', 1),
(129, 'Ví dụ về thuật toán Dijkstra.', 1, 504008, 15, '52200028', 1),
(130, 'Ưu điểm của thuật toán Dijkstra.', 2, 504008, 15, '52200028', 1),
(131, 'Nhược điểm của thuật toán Dijkstra.', 2, 504008, 15, '52200028', 1),
(132, 'Ứng dụng của thuật toán Dijkstra.', 2, 504008, 15, '52200028', 1),
(133, 'So sánh Dijkstra và Bellman-Ford.', 3, 504008, 15, '52200028', 1),
(134, 'Phân tích độ phức tạp của Dijkstra.', 3, 504008, 15, '52200028', 1),
(135, 'Khi nào nên sử dụng Dijkstra.', 3, 504008, 15, '52200028', 1),
(136, 'Quản lý tiến trình là gì?', 1, 502047, 16, '52200028', 1),
(137, 'Định nghĩa quản lý tiến trình.', 1, 502047, 16, '52200028', 1),
(138, 'Ví dụ về quản lý tiến trình.', 1, 502047, 16, '52200028', 1),
(139, 'Các trạng thái của tiến trình.', 2, 502047, 16, '52200028', 1),
(140, 'Đặc điểm của tiến trình.', 2, 502047, 16, '52200028', 1),
(141, 'Làm thế nào để quản lý tiến trình.', 2, 502047, 16, '52200028', 1),
(142, 'So sánh quản lý tiến trình trong các hệ điều hành khác nhau.', 3, 502047, 16, '52200028', 1),
(143, 'Phân tích hiệu suất quản lý tiến trình.', 3, 502047, 16, '52200028', 1),
(144, 'Nhược điểm của quản lý tiến trình.', 3, 502047, 16, '52200028', 1),
(145, 'Luồng và đồng bộ là gì?', 1, 502047, 17, '52200028', 1),
(146, 'Định nghĩa luồng.', 1, 502047, 17, '52200028', 1),
(147, 'Ví dụ về luồng.', 1, 502047, 17, '52200028', 1),
(148, 'Ưu điểm của luồng.', 2, 502047, 17, '52200028', 1),
(149, 'Nhược điểm của luồng.', 2, 502047, 17, '52200028', 1),
(150, 'Cách sử dụng đồng bộ.', 2, 502047, 17, '52200028', 1),
(151, 'Phân tích hiệu suất của luồng.', 3, 502047, 17, '52200028', 1),
(152, 'Ứng dụng của luồng và đồng bộ.', 3, 502047, 17, '52200028', 1),
(153, 'So sánh luồng và tiến trình.', 3, 502047, 17, '52200028', 1),
(154, 'Khái niệm cơ bản về lập trình PHP là gì?', 1, 503073, 18, '52200028', 1),
(155, 'Đặc điểm chính của ngôn ngữ lập trình PHP.', 1, 503073, 18, '52200028', 1),
(156, 'Ví dụ về ngôn ngữ lập trình PHP.', 1, 503073, 18, '52200028', 1),
(157, 'Cú pháp cơ bản của PHP.', 2, 503073, 18, '52200028', 1),
(158, 'Biến cục bộ và biến toàn cục trong PHP khác nhau như thế nào?', 2, 503073, 18, '52200028', 1),
(159, 'Hàm là gì trong PHP?', 2, 503073, 18, '52200028', 1),
(160, 'Lợi ích của việc sử dụng PHP.', 3, 503073, 18, '52200028', 1),
(161, 'PHP hoạt động như thế nào trong môi trường web?', 3, 503073, 18, '52200028', 1),
(162, 'Ưu điểm và nhược điểm của PHP.', 3, 503073, 18, '52200028', 1),
(163, 'Khái niệm cơ bản về ngôn ngữ lập trình Java là gì?', 1, 503073, 19, '52200028', 1),
(164, 'Đặc điểm chính của Java.', 1, 503073, 19, '52200028', 1),
(165, 'Ví dụ về ngôn ngữ lập trình Java.', 1, 503073, 19, '52200028', 1),
(166, 'Lịch sử phát triển của Java.', 2, 503073, 19, '52200028', 1),
(167, 'Kiểu dữ liệu cơ bản trong Java.', 2, 503073, 19, '52200028', 1),
(168, 'Phân biệt giữa Java và C++.', 2, 503073, 19, '52200028', 1),
(169, 'Java Virtual Machine (JVM) là gì và vai trò của nó.', 3, 503073, 19, '52200028', 1),
(170, 'Java được sử dụng trong các lĩnh vực nào?', 3, 503073, 19, '52200028', 1),
(171, 'Ưu điểm và nhược điểm của Java.', 3, 503073, 19, '52200028', 1),
(172, 'Khái niệm cơ bản về hệ điều hành là gì?', 1, 502047, 20, '52200028', 1),
(173, 'Vai trò của hệ điều hành.', 1, 502047, 20, '52200028', 1),
(174, 'Các thành phần cơ bản của hệ điều hành.', 1, 502047, 20, '52200028', 1),
(175, 'Kiến trúc của hệ điều hành.', 2, 502047, 20, '52200028', 1),
(176, 'Hệ điều hành được chia làm bao nhiêu loại?', 2, 502047, 20, '52200028', 1),
(177, 'Sự khác biệt giữa hệ điều hành 32-bit và 64-bit.', 2, 502047, 20, '52200028', 1),
(178, 'Các dạng bảo mật trong hệ điều hành.', 3, 502047, 20, '52200028', 1),
(179, 'Cơ chế kiểm soát truy cập tập tin trong hệ điều hành.', 3, 502047, 20, '52200028', 1),
(180, 'Phân biệt giữa hệ điều hành đơn người dùng và đa người dùng.', 3, 502047, 20, '52200028', 1),
(181, 'Khái niệm cơ bản về cơ sở dữ liệu là gì?', 1, 502047, 21, '52200028', 1),
(182, 'Mục đích và vai trò của cơ sở dữ liệu.', 1, 502047, 21, '52200028', 1),
(183, 'Cấu trúc cơ bản của một hệ quản trị cơ sở dữ liệu (DBMS).', 1, 502047, 21, '52200028', 1),
(184, 'Khái niệm về quan hệ (Relation) trong cơ sở dữ liệu.', 2, 502047, 21, '52200028', 1),
(185, 'Các khóa chính (Primary Key) và khóa ngoại (Foreign Key)trong quan hệ trong cơ sở dữ liệu.', 2, 502047, 21, '52200028', 1),
(186, 'Các phép toán cơ bản trên quan hệ trong cơ sở dữ liệu.', 2, 502047, 21, '52200028', 1),
(187, 'Ưu điểm của việc sử dụng cơ sở dữ liệu.', 3, 502047, 21, '52200028', 1),
(188, 'Nhược điểm của việc sử dụng cơ sở dữ liệu.', 3, 502047, 21, '52200028', 1),
(189, 'Các loại hệ quản trị cơ sở dữ liệu (DBMS) phổ biến.', 3, 502047, 21, '52200028', 1),
(190, 'Khái niệm cơ bản về mạng máy tính là gì?', 1, 502047, 22, '52200028', 1),
(191, 'Các thành phần cơ bản của một mạng máy tính.', 1, 502047, 22, '52200028', 1),
(192, 'Các giao thức mạng phổ biến.', 1, 502047, 22, '52200028', 1),
(193, 'Cấu trúc của một gói tin mạng.', 2, 502047, 22, '52200028', 1),
(194, 'Các loại mạng máy tính.', 2, 502047, 22, '52200028', 1),
(195, 'Phân biệt giữa mạng LAN, mạng WAN và mạng MAN.', 2, 502047, 22, '52200028', 1),
(196, 'Ưu và nhược điểm của mạng máy tính.', 3, 502047, 22, '52200028', 1),
(197, 'Vai trò của mạng máy tính trong doanh nghiệp và cuộc sống hàng ngày.', 3, 502047, 22, '52200028', 1),
(198, 'Các vấn đề bảo mật và an ninh trong mạng máy tính.', 3, 502047, 22, '52200028', 1),
(199, 'Khái niệm cơ bản về cấu trúc dữ liệu là gì?', 1, 504008, 23, '52200028', 1),
(200, 'Vai trò của cấu trúc dữ liệu trong lập trình.', 1, 504008, 23, '52200028', 1),
(201, 'Các loại cấu trúc dữ liệu phổ biến.', 1, 504008, 23, '52200028', 1),
(202, 'Khái niệm về mảng trong cấu trúc dữ liệu.', 2, 504008, 23, '52200028', 1),
(203, 'Cách thức hoạt động và ứng dụng của hàng đợi.', 2, 504008, 23, '52200028', 1),
(204, 'Định nghĩa về cấu trúc dữ liệu danh sách liên kết.', 2, 504008, 23, '52200028', 1),
(205, 'Các phép toán cơ bản trên cấu trúc dữ liệu cây.', 3, 504008, 23, '52200028', 1),
(206, 'Ưu và nhược điểm của mỗi loại cấu trúc dữ liệu.', 3, 504008, 23, '52200028', 1),
(207, 'Các thuật toán phổ biến liên quan đến cấu trúc dữ liệu.', 3, 504008, 23, '52200028', 1),
(208, 'Khái niệm cơ bản về hệ thống thông tin là gì?', 1, 841048, 24, '52200028', 1),
(209, 'Các thành phần cơ bản của hệ thống thông tin.', 1, 841048, 24, '52200028', 1),
(210, 'Vai trò của hệ thống thông tin trong tổ chức.', 1, 841048, 24, '52200028', 1),
(211, 'Mô hình hệ thống thông tin phổ biến.', 2, 841048, 24, '52200028', 1),
(212, 'Các vấn đề về bảo mật thông tin trong hệ thống thông tin.', 2, 841048, 24, '52200028', 1),
(213, 'Công nghệ thông tin và hệ thống thông tin khác nhau như thế nào?', 2, 841048, 24, '52200028', 1),
(214, 'Ưu và nhược điểm của việc triển khai hệ thống thông tin.', 3, 841048, 24, '52200028', 1),
(215, 'Các vấn đề liên quan đến quản lý dữ liệu trong hệ thống thông tin.', 3, 841048, 24, '52200028', 1),
(216, 'Tầm quan trọng của hệ thống thông tin trong kinh doanh và quản lý.', 3, 841048, 24, '52200028', 1),
(217, 'PHP là ngôn ngữ lập trình nào sau đây?', 1, 503073, 25, '52200028', 1),
(218, 'Đâu là cách khai báo một biến trong PHP?', 1, 503073, 25, '52200028', 1),
(219, 'Cú pháp nào dưới đây đúng để khai báo một hằng số trong PHP?', 1, 503073, 25, '52200028', 1),
(220, 'Đâu là phiên bản PHP đầu tiên hỗ trợ lập trình hướng đối tượng (OOP)?', 2, 503073, 25, '52200028', 1),
(221, 'Hàm nào sau đây không phải là một hàm có sẵn trong PHP?', 2, 503073, 25, '52200028', 1),
(222, 'Đâu là cách thức đúng để nhúng mã PHP vào trong một tệp HTML?', 2, 503073, 25, '52200028', 1),
(223, 'Đâu là cách đúng để nhận giá trị của một tham số truyền qua phương thức GET trong PHP?', 2, 503073, 25, '52200028', 1),
(224, 'Hàm nào sau đây không phải là một hàm có sẵn trong PHP để kiểm tra kiểu dữ liệu của một biến?', 3, 503073, 25, '52200028', 1),
(225, 'Đâu là phiên bản PHP được phát hành năm 2004?', 3, 503073, 25, '52200028', 1),
(226, 'Trong PHP, hàm &quot;die()&quot; có chức năng gì?', 3, 503073, 25, '52200028', 1),
(227, 'Trong PHP, ký tự nào dùng để bắt đầu tên của một biến?', 1, 503073, 26, '52200028', 1),
(228, 'Trong PHP, biến có phân biệt chữ hoa chữ thường không?', 1, 503073, 26, '52200028', 1),
(229, 'Trong PHP, toán tử nào sau đây dùng để gán giá trị cho một biến?', 1, 503073, 26, '52200028', 1),
(230, 'Đâu là cách đúng để khai báo một biến kiểu số nguyên trong PHP?', 2, 503073, 26, '52200028', 1),
(231, 'Đâu là cách đúng để khai báo một biến kiểu chuỗi trong PHP?', 2, 503073, 26, '52200028', 1),
(232, 'Đâu là cách đúng để khai báo một biến kiểu mảng trong PHP?', 2, 503073, 26, '52200028', 1),
(233, 'Đâu là cách đúng để khai báo một biến kiểu đối tượng trong PHP?', 3, 503073, 26, '52200028', 1),
(234, 'Đâu là cách đúng để khai báo một biến kiểu null trong PHP?', 3, 503073, 26, '52200028', 1),
(235, 'Đâu là cách đúng để ép kiểu một biến sang kiểu số nguyên trong PHP?', 3, 503073, 26, '52200028', 1),
(236, 'Trong PHP, từ khóa nào dùng để bắt đầu một cấu trúc if?', 1, 503073, 27, '52200028', 1),
(237, 'Trong PHP, từ khóa nào dùng để bắt đầu một cấu trúc switch?', 1, 503073, 27, '52200028', 1),
(238, 'Trong PHP, từ khóa nào dùng để bắt đầu một vòng lặp while?', 1, 503073, 27, '52200028', 1),
(239, 'Trong PHP, từ khóa nào dùng để bắt đầu một vòng lặp do-while?', 2, 503073, 27, '52200028', 1),
(240, 'Trong PHP, từ khóa nào dùng để bắt đầu một vòng lặp for?', 2, 503073, 27, '52200028', 1),
(241, 'Trong PHP, từ khóa nào dùng để bắt đầu một vòng lặp foreach?', 2, 503073, 27, '52200028', 1),
(242, 'Trong PHP, từ khóa nào dùng để ngắt một vòng lặp?', 3, 503073, 27, '52200028', 1),
(243, 'Trong PHP, từ khóa nào dùng để bỏ qua một lần lặp và tiếp tục vòng lặp tiếp theo?', 3, 503073, 27, '52200028', 1),
(244, 'Trong PHP, từ khóa nào dùng để đảo ngược kết quả của một điều kiện?', 3, 503073, 27, '52200028', 1),
(245, 'Trong PHP, vòng lặp nào sẽ tiếp tục chạy cho đến khi điều kiện không còn đúng nữa?', 1, 503073, 28, '52200028', 1),
(246, 'Trong PHP, vòng lặp nào sẽ chạy ít nhất một lần, sau đó kiểm tra điều kiện để tiếp tục lặp lại?', 1, 503073, 28, '52200028', 1),
(247, 'Trong PHP, vòng lặp nào thường dùng để lặp một số lần xác định trước?', 1, 503073, 28, '52200028', 1),
(248, 'Trong PHP, vòng lặp nào dùng để lặp qua các phần tử của một mảng?', 2, 503073, 28, '52200028', 1),
(249, 'Trong PHP, từ khóa nào dùng để chỉ ra giá trị của mỗi phần tử trong mảng khi sử dụng vòng lặp foreach?', 2, 503073, 28, '52200028', 1),
(250, 'Trong PHP, hàm nào dùng để đếm số phần tử trong mảng, thường dùng để định nghĩa điều kiện trong vòng lặp for?', 2, 503073, 28, '52200028', 1),
(251, 'Trong PHP, làm thế nào để lặp qua mảng kết hợp (associative array) bằng vòng lặp foreach?', 3, 503073, 28, '52200028', 1),
(252, 'Trong PHP, làm thế nào để lặp qua một mảng nhiều chiều (multidimensional array) bằng vòng lặp foreach?', 3, 503073, 28, '52200028', 1),
(253, 'Trong PHP, làm thế nào để lặp qua một mảng có số lượng phần tử không xác định trước bằng vòng lặp for?', 3, 503073, 28, '52200028', 1),
(254, 'Trong PHP, mảng nào sau đây là mảng số (indexed array)?', 1, 503073, 29, '52200028', 1),
(255, 'Trong PHP, mảng nào sau đây là mảng kết hợp (associative array)?', 2, 503073, 29, '52200028', 1),
(256, 'Trong PHP, làm thế nào để tạo một mảng hai chiều (2D array)?', 3, 503073, 29, '52200028', 1),
(257, 'Trong PHP, hàm nào dùng để đếm số lượng phần tử trong mảng?', 1, 503073, 29, '52200028', 1),
(258, 'Trong PHP, hàm nào dùng để kiểm tra một biến có phải là mảng hay không?', 2, 503073, 29, '52200028', 1),
(259, 'Trong PHP, hàm nào dùng để kiểm tra một mảng có phải là mảng số (indexed array) hay không?', 3, 503073, 29, '52200028', 1),
(260, 'Trong PHP, hàm nào dùng để thêm một phần tử vào cuối mảng?', 1, 503073, 29, '52200028', 1),
(261, 'Trong PHP, hàm nào dùng để thêm một phần tử vào đầu mảng?', 2, 503073, 29, '52200028', 1),
(262, 'Trong PHP, hàm nào dùng để loại bỏ phần tử đầu tiên của mảng và trả về giá trị của phần tử đó?', 3, 503073, 29, '52200028', 1),
(263, 'Hàm trong PHP là gì?', 1, 503073, 30, '52200028', 1),
(264, 'Cách khai báo hàm trong PHP là gì?', 1, 503073, 30, '52200028', 1),
(265, 'Hàm trong PHP có thể nhận bao nhiêu đối số?', 1, 503073, 30, '52200028', 1),
(266, 'Trong PHP, cách trả về giá trị từ một hàm là gì?', 2, 503073, 30, '52200028', 1),
(267, 'Trong PHP, cách gọi một hàm là gì?', 2, 503073, 30, '52200028', 1),
(268, 'Trong PHP, cách kiểm tra xem một hàm có tồn tại hay không là gì?', 2, 503073, 30, '52200028', 1),
(269, 'Trong PHP, cách kiểm tra xem một hàm có được định nghĩa hay không là gì?', 3, 503073, 30, '52200028', 1),
(270, 'Trong PHP, cách định nghĩa các tham số mặc định cho một hàm là gì?', 3, 503073, 30, '52200028', 1),
(271, 'Trong PHP, cách sử dụng hàm có tham số biến là gì?', 3, 503073, 30, '52200028', 1),
(272, 'Trong PHP, hàm nào được sử dụng để thực hiện việc đảo ngược một chuỗi ký tự?', 1, 503073, 31, '52200028', 1),
(273, 'Trong PHP, hàm nào được sử dụng để lấy một phần của chuỗi bắt đầu từ một vị trí cụ thể và có độ dài chỉ định?', 1, 503073, 31, '52200028', 1),
(274, 'Trong PHP, hàm nào được sử dụng để lấy một phần của chuỗi bắt đầu từ vị trí cuối cùng của chuỗi và có độ dài chỉ định?', 1, 503073, 31, '52200028', 1),
(275, 'Trong PHP, hàm nào được sử dụng để nối các chuỗi lại với nhau?', 2, 503073, 31, '52200028', 1),
(276, 'Trong PHP, hàm nào được sử dụng để lấy một chuỗi con từ một chuỗi ban đầu?', 2, 503073, 31, '52200028', 1),
(277, 'Trong PHP, hàm nào được sử dụng để loại bỏ khoảng trắng và ký tự xuống dòng ở đầu và cuối chuỗi?', 2, 503073, 31, '52200028', 1),
(278, 'Trong PHP, hàm nào được sử dụng để chuyển đổi một chuỗi thành chuỗi URL hợp lệ?', 3, 503073, 31, '52200028', 1),
(279, 'Trong PHP, hàm nào được sử dụng để chuyển đổi một chuỗi URL hợp lệ thành chuỗi thường?', 3, 503073, 31, '52200028', 1),
(280, 'Trong PHP, hàm nào được sử dụng để mã hóa một chuỗi bằng thuật toán MD5?', 3, 503073, 31, '52200028', 1),
(281, 'Trong PHP, hàm nào được sử dụng để hiển thị ngày và giờ hiện tại?', 1, 503073, 32, '52200028', 1),
(282, 'Trong PHP, hàm nào được sử dụng để lấy giá trị timestamp hiện tại?', 1, 503073, 32, '52200028', 1),
(283, 'Trong PHP, hàm nào được sử dụng để chuyển đổi giá trị timestamp thành ngày và giờ trong định dạng chuẩn?', 1, 503073, 32, '52200028', 1),
(284, 'Trong PHP, hàm nào được sử dụng để lấy số giờ giữa hai thời điểm?', 2, 503073, 32, '52200028', 1),
(285, 'Trong PHP, hàm nào được sử dụng để lấy số phút giữa hai thời điểm?', 2, 503073, 32, '52200028', 1),
(286, 'Trong PHP, hàm nào được sử dụng để lấy số giây giữa hai thời điểm?', 2, 503073, 32, '52200028', 1),
(287, 'Trong PHP, hàm nào được sử dụng để lấy số ngày giữa hai thời điểm?', 3, 503073, 32, '52200028', 1),
(288, 'Trong PHP, hàm nào được sử dụng để lấy số tuần giữa hai thời điểm?', 3, 503073, 32, '52200028', 1),
(289, 'Trong PHP, hàm nào được sử dụng để lấy số tháng giữa hai thời điểm?', 3, 503073, 32, '52200028', 1),
(290, 'Trong PHP, hàm nào được sử dụng để kiểm tra xem một file có phải là một symbolic link hay không?', 1, 503073, 33, '52200028', 1),
(291, 'Trong PHP, hàm nào được sử dụng để lấy định dạng phần mở rộng của một file?', 2, 503073, 33, '52200028', 1),
(292, 'Trong PHP, hàm nào được sử dụng để kiểm tra xem một file có phải là một FIFO pipe hay không?', 3, 503073, 33, '52200028', 1),
(293, 'Trong PHP, hàm nào được sử dụng để kiểm tra xem một file có phải là một character device hay không?', 1, 503073, 33, '52200028', 1),
(294, 'Trong PHP, hàm nào được sử dụng để lấy đường dẫn thư mục cha của một đường dẫn?', 2, 503073, 33, '52200028', 1),
(295, 'Trong PHP, hàm nào được sử dụng để xóa một thư mục?', 3, 503073, 33, '52200028', 1),
(296, 'Trong PHP, hàm nào được sử dụng để kiểm tra xem một file có phải là một socket hay không?', 1, 503073, 33, '52200028', 1),
(297, 'Trong PHP, hàm nào được sử dụng để lấy định dạng thời gian của một file?', 2, 503073, 33, '52200028', 1),
(298, 'Trong PHP, hàm nào được sử dụng để kiểm tra xem một file có phải là một file ASCII hay không?', 3, 503073, 33, '52200028', 1),
(299, 'Trong OOP PHP, từ khóa nào được sử dụng để tạo một đối tượng (object)?', 1, 503073, 34, '52200028', 1),
(300, 'Trong OOP PHP, từ khóa nào được sử dụng để kế thừa một lớp (class)?', 2, 503073, 34, '52200028', 1),
(301, 'Trong OOP PHP, từ khóa nào được sử dụng để gọi phương thức của một đối tượng?', 3, 503073, 34, '52200028', 1),
(302, 'Trong OOP PHP, hàm khởi tạo (constructor) của một lớp có tên là gì?', 1, 503073, 34, '52200028', 1),
(303, 'Trong OOP PHP, hàm huỷ (destructor) của một lớp có tên là gì?', 2, 503073, 34, '52200028', 1),
(304, 'Trong OOP PHP, từ khóa nào được sử dụng để truy cập đến thuộc tính hoặc phương thức của một lớp mà không cần tạo đối tượng (object)?', 3, 503073, 34, '52200028', 1),
(305, 'Trong OOP PHP, phương thức nào được sử dụng để thiết lập giá trị cho một thuộc tính của đối tượng?', 1, 503073, 34, '52200028', 1),
(306, 'Trong OOP PHP, phương thức nào được sử dụng để lấy giá trị của một thuộc tính của đối tượng?', 2, 503073, 34, '52200028', 1),
(307, 'Trong OOP PHP, từ khóa nào được sử dụng để bảo vệ một thuộc tính hoặc phương thức của lớp chỉ được truy cập bởi lớp con (subclass)?', 3, 503073, 34, '52200028', 1),
(308, 'Khái niệm cơ bản về trí tuệ nhân tạo (AI) là gì?', 1, 501042, 35, '52200028', 1),
(309, 'Lịch sử phát triển của trí tuệ nhân tạo.', 1, 501042, 35, '52200028', 1),
(310, 'Ứng dụng của trí tuệ nhân tạo trong cuộc sống hàng ngày.', 1, 501042, 35, '52200028', 1),
(311, 'Các phương pháp học của máy trong trí tuệ nhân tạo.', 2, 501042, 35, '52200028', 1),
(312, 'Hệ thống học có giám sát và không giám sát khác nhau như thế nào?', 2, 501042, 35, '52200028', 1),
(313, 'Khái niệm về mạng nơ-ron nhân tạo (ANN).', 2, 501042, 35, '52200028', 1),
(314, 'Ưu điểm và nhược điểm của trí tuệ nhân tạo.', 3, 501042, 35, '52200028', 1),
(315, 'Tầm quan trọng của trí tuệ nhân tạo trong thời đại công nghệ cao.', 3, 501042, 35, '52200028', 1),
(316, 'Các thách thức và đối thủ của trí tuệ nhân tạo.', 3, 501042, 35, '52200028', 1),
(317, 'Khái niệm cơ bản về học máy là gì?', 1, 501042, 36, '52200028', 1),
(318, 'Các loại học máy phổ biến.', 1, 501042, 36, '52200028', 1),
(319, 'Quá trình huấn luyện một mô hình học máy.', 1, 501042, 36, '52200028', 1),
(320, 'Học máy có giám sát và không giám sát khác nhau như thế nào?', 2, 501042, 36, '52200028', 1),
(321, 'Biểu diễn dữ liệu trong học máy.', 2, 501042, 36, '52200028', 1),
(322, 'Phân biệt giữa học máy và khai phá dữ liệu.', 2, 501042, 36, '52200028', 1),
(323, 'Ứng dụng của học máy trong thực tế.', 3, 501042, 36, '52200028', 1),
(324, 'Tầm quan trọng của học máy trong nghiên cứu và công nghệ.', 3, 501042, 36, '52200028', 1),
(325, 'Thách thức và cơ hội trong lĩnh vực học máy.', 3, 501042, 36, '52200028', 1),
(326, 'Khái niệm cơ bản về mạng nơ-ron nhân tạo (ANN) là gì?', 1, 501042, 37, '52200028', 1),
(327, 'Cấu trúc cơ bản của một mạng nơ-ron nhân tạo.', 1, 501042, 37, '52200028', 1),
(328, 'Hàm kích hoạt trong mạng nơ-ron nhân tạo có vai trò gì?', 1, 501042, 37, '52200028', 1),
(329, 'Các loại mạng nơ-ron nhân tạo phổ biến.', 2, 501042, 37, '52200028', 1),
(330, 'Quá trình huấn luyện một mạng nơ-ron nhân tạo.', 2, 501042, 37, '52200028', 1),
(331, 'Ứng dụng của mạng nơ-ron nhân tạo trong thực tế.', 2, 501042, 37, '52200028', 1),
(332, 'Ưu điểm và nhược điểm của mạng nơ-ron nhân tạo.', 3, 501042, 37, '52200028', 1),
(333, 'Tầm quan trọng của mạng nơ-ron nhân tạo trong công nghệ hiện đại.', 3, 501042, 37, '52200028', 1),
(334, 'Thách thức và cơ hội trong việc phát triển mạng nơ-ron nhân tạo.', 3, 501042, 37, '52200028', 1),
(335, 'Khái niệm cơ bản về xử lý ngôn ngữ tự nhiên (NLP) là gì?', 1, 501042, 38, '52200028', 1),
(336, 'Lĩnh vực ứng dụng của xử lý ngôn ngữ tự nhiên.', 1, 501042, 38, '52200028', 1),
(337, 'Quá trình xử lý ngôn ngữ tự nhiên bao gồm những gì?', 1, 501042, 38, '52200028', 1),
(338, 'Các phương pháp chính trong xử lý ngôn ngữ tự nhiên.', 2, 501042, 38, '52200028', 1),
(339, 'Ứng dụng của xử lý ngôn ngữ tự nhiên trong hệ thống thông tin.', 2, 501042, 38, '52200028', 1),
(340, 'Thách thức chính trong xử lý ngôn ngữ tự nhiên.', 2, 501042, 38, '52200028', 1),
(341, 'Ưu và nhược điểm của các phương pháp xử lý ngôn ngữ tự nhiên.', 3, 501042, 38, '52200028', 1),
(342, 'Tầm quan trọng của xử lý ngôn ngữ tự nhiên trong ứng dụng thực tiễn.', 3, 501042, 38, '52200028', 1),
(343, 'Cơ hội và thách thức trong phát triển xử lý ngôn ngữ tự nhiên.', 3, 501042, 38, '52200028', 1),
(344, 'Khái niệm cơ bản về thị giác máy (Computer Vision) là gì?', 1, 501042, 39, '52200028', 1),
(345, 'Ứng dụng của thị giác máy trong cuộc sống hàng ngày.', 1, 501042, 39, '52200028', 1),
(346, 'Các bước cơ bản trong quá trình xử lý hình ảnh trong thị giác máy.', 1, 501042, 39, '52200028', 1),
(347, 'Các phương pháp phổ biến trong thị giác máy.', 2, 501042, 39, '52200028', 1),
(348, 'Ứng dụng của thị giác máy trong công nghệ tự lái.', 2, 501042, 39, '52200028', 1),
(349, 'Thách thức chính trong thị giác máy.', 2, 501042, 39, '52200028', 1),
(350, 'Ưu và nhược điểm của thị giác máy.', 3, 501042, 39, '52200028', 1),
(351, 'Tầm quan trọng của thị giác máy trong các lĩnh vực khác nhau.', 3, 501042, 39, '52200028', 1),
(352, 'Cơ hội và thách thức trong nghiên cứu và phát triển thị giác máy.', 3, 501042, 39, '52200028', 1),
(353, 'Khái niệm cơ bản về Robot và Tích hợp Cảm biến là gì?', 1, 501042, 40, '52200028', 1),
(354, 'Các loại cảm biến phổ biến được sử dụng trong robot.', 1, 501042, 40, '52200028', 1),
(355, 'Quá trình tích hợp cảm biến vào robot.', 1, 501042, 40, '52200028', 1),
(356, 'Ứng dụng của robot có tích hợp cảm biến trong thực tế.', 2, 501042, 40, '52200028', 1),
(357, 'Thách thức chính trong tích hợp cảm biến vào robot.', 2, 501042, 40, '52200028', 1),
(358, 'Ưu và nhược điểm của việc sử dụng robot có tích hợp cảm biến.', 2, 501042, 40, '52200028', 1),
(359, 'Tầm quan trọng của robot có tích hợp cảm biến trong công nghệ hiện đại.', 3, 501042, 40, '52200028', 1),
(360, 'Cơ hội và thách thức trong phát triển robot có tích hợp cảm biến.', 3, 501042, 40, '52200028', 1),
(361, 'Tiềm năng và triển vọng của robot có tích hợp cảm biến trong tương lai.', 3, 501042, 40, '52200028', 1),
(362, 'Khái niệm cơ bản về mạng IoT là gì?', 1, 501042, 41, '52200028', 1),
(363, 'Các thành phần cơ bản của mạng IoT.', 1, 501042, 41, '52200028', 1),
(364, 'Tầm quan trọng của mạng IoT trong cuộc sống hàng ngày.', 1, 501042, 41, '52200028', 1),
(365, 'Các ứng dụng của mạng IoT trong công nghệ thông tin và cuộc sống.', 2, 501042, 41, '52200028', 1),
(366, 'Thách thức chính trong triển khai và quản lý mạng IoT.', 2, 501042, 41, '52200028', 1),
(367, 'Cơ hội và tiềm năng của mạng IoT trong tương lai.', 2, 501042, 41, '52200028', 1),
(368, 'Ưu và nhược điểm của mạng IoT.', 3, 501042, 41, '52200028', 1),
(369, 'Cách mạng công nghiệp 4.0 và vai trò của mạng IoT.', 3, 501042, 41, '52200028', 1),
(370, 'Những thách thức bảo mật và quyền riêng tư trong mạng IoT.', 3, 501042, 41, '52200028', 1),
(371, 'Khái niệm cơ bản về Blockchain là gì?', 1, 501042, 42, '52200028', 1),
(372, 'Cơ chế hoạt động của Blockchain.', 1, 501042, 42, '52200028', 1),
(373, 'Ứng dụng của Blockchain trong cuộc sống hàng ngày.', 1, 501042, 42, '52200028', 1),
(374, 'Các loại Blockchain và sự khác biệt giữa chúng.', 2, 501042, 42, '52200028', 1),
(375, 'Ưu và nhược điểm của Blockchain.', 2, 501042, 42, '52200028', 1),
(376, 'Cách mạng công nghiệp và vai trò của Blockchain.', 2, 501042, 42, '52200028', 1),
(377, 'Thách thức chính trong triển khai và quản lý Blockchain.', 3, 501042, 42, '52200028', 1),
(378, 'Tiềm năng của Blockchain trong các lĩnh vực như tài chính, y tế, và bất động sản.', 3, 501042, 42, '52200028', 1),
(379, 'Vấn đề bảo mật và quyền riêng tư liên quan đến Blockchain.', 3, 501042, 42, '52200028', 1),
(380, 'Khái niệm cơ bản về công nghệ 5G là gì?', 1, 501042, 43, '52200028', 1),
(381, 'Tính năng và ưu điểm của công nghệ 5G so với các thế hệ trước.', 1, 501042, 43, '52200028', 1),
(382, 'Ứng dụng của công nghệ 5G trong cuộc sống hàng ngày và các ngành công nghiệp.', 1, 501042, 43, '52200028', 1),
(383, 'Thách thức chính trong triển khai và phát triển công nghệ 5G.', 2, 501042, 43, '52200028', 1),
(384, 'Sự khác biệt giữa mạng 5G và các thế hệ trước đó.', 2, 501042, 43, '52200028', 1),
(385, 'Tiềm năng và triển vọng của công nghệ 5G trong tương lai.', 2, 501042, 43, '52200028', 1),
(386, 'Cơ hội và thách thức của việc triển khai mạng 5G trên toàn cầu.', 3, 501042, 43, '52200028', 1),
(387, 'Vấn đề về bảo mật và ảnh hưởng của công nghệ 5G đối với quyền riêng tư.', 3, 501042, 43, '52200028', 1),
(388, 'Công nghệ 5G và tầm quan trọng của nó trong việc phát triển kinh tế và xã hội.', 3, 501042, 43, '52200028', 1),
(389, 'Khái niệm cơ bản về trí tuệ nhân tạo (AI) là gì?', 1, 501042, 44, '52200028', 1),
(390, 'Lịch sử phát triển của trí tuệ nhân tạo.', 1, 501042, 44, '52200028', 1),
(391, 'Ứng dụng của trí tuệ nhân tạo trong cuộc sống hàng ngày.', 1, 501042, 44, '52200028', 1),
(392, 'Các phương pháp học của máy trong trí tuệ nhân tạo.', 2, 501042, 44, '52200028', 1),
(393, 'Hệ thống học có giám sát và không giám sát khác nhau như thế nào?', 2, 501042, 44, '52200028', 1),
(394, 'Khái niệm về mạng nơ-ron nhân tạo (ANN).', 2, 501042, 44, '52200028', 1),
(395, 'Ưu điểm và nhược điểm của trí tuệ nhân tạo.', 3, 501042, 44, '52200028', 1),
(396, 'Khái niệm cơ bản về Lập trình Hướng đối tượng là gì?', 1, 503005, 45, '52200028', 1),
(397, 'Đặc điểm chính của Lập trình Hướng đối tượng.', 1, 503005, 45, '52200028', 1),
(398, 'Lợi ích của Lập trình Hướng đối tượng.', 1, 503005, 45, '52200028', 1),
(399, 'Các thành phần cơ bản của một lớp trong OOP.', 2, 503005, 45, '52200028', 1),
(400, 'Sự khác biệt giữa lớp và đối tượng.', 2, 503005, 45, '52200028', 1),
(401, 'Khái niệm về gói và tính đóng gói (Encapsulation).', 2, 503005, 45, '52200028', 1),
(402, 'Cách triển khai tính đóng gói trong OOP.', 3, 503005, 45, '52200028', 1),
(403, 'Các ví dụ thực tế về Lập trình Hướng đối tượng.', 3, 503005, 45, '52200028', 1),
(404, 'Ứng dụng của Lập trình Hướng đối tượng trong phát triển phần mềm.', 3, 503005, 45, '52200028', 1),
(405, 'Khái niệm về kế thừa trong OOP là gì?', 1, 503005, 46, '52200028', 1),
(406, 'Các loại kế thừa trong Lập trình Hướng đối tượng.', 1, 503005, 46, '52200028', 1),
(407, 'Lợi ích của kế thừa trong OOP.', 1, 503005, 46, '52200028', 1),
(408, 'Cách triển khai kế thừa trong một ngôn ngữ lập trình.', 2, 503005, 46, '52200028', 1),
(409, 'Sự khác biệt giữa kế thừa đơn và đa kế thừa.', 2, 503005, 46, '52200028', 1),
(410, 'Khái niệm về lớp cơ sở (base class) và lớp dẫn xuất (derived class).', 2, 503005, 46, '52200028', 1),
(411, 'Các vấn đề gặp phải khi sử dụng kế thừa trong OOP.', 3, 503005, 46, '52200028', 1),
(412, 'Cách giải quyết vấn đề kế thừa đa cấp trong OOP.', 3, 503005, 46, '52200028', 1),
(413, 'Ví dụ thực tế về việc sử dụng kế thừa trong lập trình.', 3, 503005, 46, '52200028', 1),
(414, 'Khái niệm về tính đa hình (polymorphism) trong OOP là gì?', 1, 503005, 47, '52200028', 1),
(415, 'Lợi ích của tính đa hình trong Lập trình Hướng đối tượng.', 1, 503005, 47, '52200028', 1),
(416, 'Ví dụ cơ bản về tính đa hình.', 1, 503005, 47, '52200028', 1),
(417, 'Cách triển khai tính đa hình trong một ngôn ngữ lập trình.', 2, 503005, 47, '52200028', 1),
(418, 'Sự khác biệt giữa đa hình tĩnh và đa hình động.', 2, 503005, 47, '52200028', 1),
(419, 'Khái niệm về nạp chồng (overloading) và ghi đè (overriding).', 2, 503005, 47, '52200028', 1),
(420, 'Các ví dụ thực tế về nạp chồng phương thức.', 3, 503005, 47, '52200028', 1),
(421, 'Các ví dụ thực tế về ghi đè phương thức.', 3, 503005, 47, '52200028', 1),
(422, 'Tầm quan trọng của tính đa hình trong phát triển phần mềm.', 3, 503005, 47, '52200028', 1),
(423, 'Khái niệm về giao diện (interface) trong OOP là gì?', 1, 503005, 48, '52200028', 1),
(424, 'Lợi ích của việc sử dụng giao diện trong Lập trình Hướng đối tượng.', 1, 503005, 48, '52200028', 1),
(425, 'Ví dụ cơ bản về giao diện.', 1, 503005, 48, '52200028', 1),
(426, 'Cách triển khai giao diện trong một ngôn ngữ lập trình.', 2, 503005, 48, '52200028', 1),
(427, 'Sự khác biệt giữa lớp trừu tượng (abstract class) và giao diện.', 2, 503005, 48, '52200028', 1),
(428, 'Các ví dụ thực tế về việc sử dụng giao diện.', 2, 503005, 48, '52200028', 1),
(429, 'Khái niệm về đa kế thừa qua giao diện.', 3, 503005, 48, '52200028', 1),
(430, 'Cách giải quyết các vấn đề liên quan đến đa kế thừa.', 3, 503005, 48, '52200028', 1),
(431, 'Tầm quan trọng của giao diện trong thiết kế phần mềm.', 3, 503005, 48, '52200028', 1),
(432, 'Khái niệm về lớp trừu tượng (abstract class) trong OOP là gì?', 1, 503005, 49, '52200028', 1),
(433, 'Lợi ích của việc sử dụng lớp trừu tượng trong Lập trình Hướng đối tượng.', 1, 503005, 49, '52200028', 1),
(434, 'Ví dụ cơ bản về lớp trừu tượng.', 1, 503005, 49, '52200028', 1),
(435, 'Cách triển khai lớp trừu tượng trong một ngôn ngữ lập trình.', 2, 503005, 49, '52200028', 1),
(436, 'Sự khác biệt giữa lớp trừu tượng và giao diện.', 2, 503005, 49, '52200028', 1),
(437, 'Các ví dụ thực tế về việc sử dụng lớp trừu tượng.', 2, 503005, 49, '52200028', 1),
(438, 'Khái niệm về phương thức trừu tượng.', 3, 503005, 49, '52200028', 1),
(439, 'Các vấn đề gặp phải khi sử dụng lớp trừu tượng.', 3, 503005, 49, '52200028', 1),
(440, '<p>Để đọc file, ch&uacute;ng ta sử dụng <em><strong>h&agrave;m</strong></em> n&agrave;o dưới đ&acirc;y?</p>\n', 1, 503073, 33, '50000000', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cautraloi`
--

CREATE TABLE `cautraloi` (
  `macautl` int(11) NOT NULL,
  `macauhoi` int(11) NOT NULL,
  `noidungtl` varchar(500) NOT NULL,
  `ladapan` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cautraloi`
--

INSERT INTO `cautraloi` (`macautl`, `macauhoi`, `noidungtl`, `ladapan`) VALUES
(1, 1, 'Object Open Programming', 0),
(2, 1, 'Open Object Programming', 0),
(3, 1, 'Object Oriented Programming.', 1),
(4, 1, 'Object Oriented Proccessing.', 0),
(5, 2, 'Tính đóng gói, tính kế thừa, tính đa hình, tính đặc biệt hóa.', 0),
(6, 2, 'Tính đóng gói, tính kế thừa, tính đa hình, tính trừu tượng.', 1),
(7, 2, 'Tính chia nhỏ, tính kế thừa.', 0),
(8, 2, 'Tính đóng gói, tính trừu tượng.', 0),
(9, 3, 'Lập trình hướng đối tượng là phương pháp đặt trọng tâm vào các đối tượng, nó không cho phép dữ liệu chuyển động một cách tự do trong hệ thống.', 1),
(10, 3, 'Lập trình hướng đối tượng là phương pháp lập trình cơ bản gần với mã máy', 0),
(11, 3, 'Lập trình hướng đối tượng là phương pháp mới của lập trình máy tính, chia chương trình thành các hàm; quan tâm đến chức năng của hệ thống.', 0),
(12, 3, 'Lập trình hướng đối tượng là phương pháp đặt trọng tâm vào các chức năng, cấu trúc chương trình được xây dựng theo cách tiếp cận hướng chức năng.', 0),
(13, 4, 'Hiện tượng lớp con kế thừa định nghĩa một hàm hoàn toàn giống lớp cha.', 1),
(14, 4, 'Hiện tượng lớp con kế thừa định nghĩa một hàm cùng tên nhưng khác kiểu với một hàm ở lớp cha.', 0),
(15, 4, 'Hiện tượng lớp con kế thừa định nghĩa một hàm cùng tên, cùng kiểu với một hàm ở lớp cha nhưng khác đối số', 0),
(16, 4, 'Hiện tượng lớp con kế thừa định nghĩa một hàm cùng tên, cùng các đối số nhưng khác kiểu với một hàm ở lớp cha.', 0),
(17, 5, 'public.', 0),
(18, 5, 'protected.', 0),
(19, 5, 'friendly.', 1),
(20, 5, 'private.', 0),
(21, 6, 'private, friendly, protected.', 0),
(22, 6, 'friendly, public.', 0),
(23, 6, 'friendly, protected, public.', 1),
(24, 6, 'public, protected.', 0),
(25, 7, 'Khởi tạo giá trị cho các thành phần dữ liệu của đối tượng.', 1),
(26, 7, 'Khai báo kiểu cho các thành phần dữ liệu của đối tượng.', 0),
(27, 7, 'Khai báo các phương thức của đối tượng.', 0),
(28, 7, 'Tất cả đều sai.', 0),
(29, 8, 'Lúc hủy đối tượng.', 0),
(30, 8, 'Lúc tạo đối tượng.', 1),
(31, 8, 'Lúc sử dụng đối tượng.', 0),
(32, 8, 'Cả ba câu trên đều đúng.', 0),
(33, 9, 'Không được trùng với tên lớp.', 0),
(34, 9, 'Phải trùng với tên lớp.', 1),
(35, 9, 'Đặt tên tùy ý.', 0),
(36, 9, 'Tất cả đều đúng.', 0),
(37, 10, 'Khởi tạo đối tượng (bằng toán tử new) cho đến hết phương trình.', 0),
(38, 10, 'Khởi tạo đối tượng (bằng toán tử new) cho đến hết phương thức chứa nó.', 0),
(39, 10, 'Khởi tạo đối tượng (bằng toán tử new) cho đến hết khối chứa nó.', 1),
(40, 10, 'Tất cả đều đúng.', 0),
(41, 11, 'Lấy danh từ chính mô tả khái niệm làm tên lớp.', 0),
(42, 11, 'Lấy các danh từ mô tả cho khái niệm chính làm thuộc tính.', 0),
(43, 11, 'Lấy các động từ tác động lên đối tượng làm phương thức.', 1),
(44, 11, 'Tất cả đều đúng.', 0),
(45, 12, 'Thành phần dữ liệu của lớp.', 0),
(46, 12, 'Phương thức của lớp.', 0),
(47, 12, 'Đoạn code.', 0),
(48, 12, 'Tất cả đều đúng.', 1),
(49, 13, 'Kết quả xuất ra giá trị từ 0 đến 99.', 0),
(50, 13, 'Kết quả xuất ra giá trị từ 0 đến 100.', 1),
(51, 13, 'Kết quả xuất ra giá trị từ 1 đến 99.', 0),
(52, 13, 'Kết quả xuất ra giá trị từ 1 đến 100.', 0),
(53, 14, 'Đặt trước tên lớp con.', 0),
(54, 14, 'Đặt trước tên lớp cha.', 1),
(55, 14, 'Đặt sau tên lớp cha.', 0),
(56, 14, 'Tất cả đều sai.', 0),
(57, 15, 'Được phép khai báo thêm các thành phần dữ liệu.', 0),
(58, 15, 'Được phép khai báo them các phương thức.', 0),
(59, 15, 'A, B đều sai.', 0),
(60, 15, 'A, B đều đúng.', 1),
(61, 16, 'Đối tượng cha của đối tượng đang thao tác.', 0),
(62, 16, 'Đối tượng đang thao tác.', 1),
(63, 16, 'Cả 2 đều đúng.', 0),
(64, 16, 'Cả 2 đều sai.', 0),
(65, 17, 'Phải trùng với tên class, phân biệt chữ hoa và thường.', 1),
(66, 17, 'Phải trùng với tên class, không phân biệt chữ hoa và thường.', 0),
(67, 17, 'Không phải trùng với tên class.', 0),
(68, 17, 'Tất cả đều sai.', 0),
(69, 18, 'Tham chiếu (địa chỉ) của vùng nhớ chứa dữ liệu của đối tượng.', 1),
(70, 18, 'Biến static.', 0),
(71, 18, 'Biến cục bộ.', 0),
(72, 18, 'Tất cả đều sai.', 0),
(73, 19, 'Không cho phép các đối tượng thuộc các class cùng package (cùng thư mục) truy cập.', 0),
(74, 19, 'Cho phép các đối tượng thuộc các class cùng package (cùng thư mục) truy cập.', 1),
(75, 19, 'Cho phép các đối tượng thuộc các class cùng package (cùng thư mục) truy cập và khác package truy cập.', 0),
(76, 19, 'Tất cả đều đúng.', 0),
(77, 20, 'Dễ mô tả các quan hệ phân cấp trong thế giới thực.', 0),
(78, 20, 'Có tính bảo mật cao.', 0),
(79, 20, 'Câu A, B đúng.', 1),
(80, 20, 'Câu A, B sai.', 0),
(81, 21, 'Dễ tái sử dụng code.', 0),
(82, 21, 'Bảo mật kém.', 0),
(83, 21, 'Có tính bảo mật cao.', 0),
(84, 21, 'A, C đúng.', 1),
(85, 22, 'Java class file có thể được dùng ở bất kỳ platform nào.', 0),
(86, 22, 'Tính module hóa cao, dùng bộ nhớ tốt hơn với class file hơn là file thực thi vì class file cần một bước địch nữa mới được CPU thực thi.', 0),
(87, 22, 'Cả 2 đều đúng.', 0),
(88, 22, 'Cả 2 đều sai.', 1),
(89, 23, '.class.', 0),
(90, 23, '.java.', 1),
(91, 23, '.com.', 0),
(92, 23, 'Tất cả đều sai.', 0),
(93, 24, 'Classes, Compiler, Debugger, Java Runtime Environment.', 1),
(94, 24, 'Classes, Compiler, Debugger.', 0),
(95, 24, 'Classes, Compiler, Java Runtime Environment.', 0),
(96, 24, 'Compiler, Debugger, Java Runtime Environment.', 0),
(97, 25, 'int age = x.getAge();', 1),
(98, 25, 'getAge(x);', 0),
(99, 25, 'getName(x);', 0),
(100, 25, 'int age = getAge(x);', 0),
(101, 26, 'Che dấu dữ liệu.', 0),
(102, 26, 'Bên ngoài chỉ giao tiếp được với đối tượng thông qua một số phương thức.', 1),
(103, 26, 'Cả 2 câu A, B đều đúng.', 0),
(104, 26, 'Cả 2 câu A, B đều sai.', 0),
(105, 27, 'if, else, switch, case, default, break.', 1),
(106, 27, 'IF, ELSE, SWITCH, CASE, DEFAULT, BREAK.', 0),
(107, 27, 'Cả 2 câu A, B đều đúng.', 0),
(108, 27, 'Cả 2 câu A, B đều sai.', 0),
(109, 28, 'True, False, Null.', 0),
(110, 28, 'TRUE, FALSE, NULL.', 0),
(111, 28, 'True, False, NULL.', 1),
(112, 28, 'true, false, null.', 0),
(113, 29, 'Java.', 0),
(114, 29, 'Oak.', 1),
(115, 29, 'Cafe', 0),
(116, 29, 'James golings.', 0),
(117, 30, 'XX.Display;', 0),
(118, 30, 'XX.Display();', 0),
(119, 30, 'objX.Display();', 1),
(120, 30, 'Display();', 0),
(121, 31, 'Các lớp được tạo thể hiện từ đó;', 0),
(122, 31, 'Một thể hiện của lớp;', 1),
(123, 31, 'Một tham chiếu đến một thuộc tính;', 0),
(124, 31, 'Một biến;', 0),
(125, 32, 'Method', 1),
(126, 32, 'Function', 0),
(127, 32, 'Procedure', 0),
(128, 32, 'Class;', 0),
(129, 33, 'Var;', 1),
(130, 33, 'Int;', 0),
(131, 33, 'Class;', 0),
(132, 33, 'Display', 0),
(133, 34, 'This', 1),
(134, 34, 'Super', 0),
(135, 34, 'Private', 0),
(136, 34, 'Tất cả đều sai;', 0),
(137, 35, 'Override', 1),
(138, 35, 'Overload', 0),
(139, 35, 'Super', 0),
(140, 35, 'Tất cả đều đúng', 0),
(141, 36, 'Constructor', 1),
(142, 36, 'Destructor', 0),
(143, 36, 'Initializer', 0),
(144, 36, 'Tất cả đều đúng', 0),
(145, 37, 'Abstract', 1),
(146, 37, 'Virtual', 0),
(147, 37, 'Static', 0),
(148, 37, 'Tất cả đều sai', 0),
(149, 38, 'Abstract', 1),
(150, 38, 'Virtual', 0),
(151, 38, 'Static', 0),
(152, 38, 'Tất cả đều đúng', 0),
(153, 39, 'Lớp được kế thừa từ lớp cha', 1),
(154, 39, 'Lớp được tạo bởi một đối tượng', 0),
(155, 39, 'Lớp được tạo bởi một phương thức', 0),
(156, 39, 'Tất cả đều đúng', 0),
(157, 40, 'Cơ chế chia chương trình thành các hàm và thủ tục thực hiện các chức năng riêng rẽ.', 0),
(158, 40, 'Cơ chế cho thấy một hàm có thể có nhiều thể hiện khác nhau ở từng thời điểm.', 0),
(159, 40, 'Cơ chế rang buộc dữ liệu và thao tác trên dữ liệu đó thành một thể thống nhất, tránh được các tác động bất ngờ từ bên ngoài. Thể thống nhất này gọi là đối tượng.', 1),
(160, 40, 'Cơ chế không cho phép các thành phần khác truy cập đến bên trong nó.', 0),
(161, 41, 'Khả năng xây dựng các lớp mới từ các lớp cũ, lớp mới được gọi là lớp dẫn xuất, lớp cũ được gọi là lớp cơ sở', 1),
(162, 41, 'Khả năng sử dụng lại các hàm đã xây dựng', 0),
(163, 41, 'Khả năng sử dụng lại các kiểu dữ liệu đã xây dựng', 0),
(164, 41, 'Tất cả đều đúng', 0),
(165, 42, 'Derived Class', 1),
(166, 42, 'Base Class', 0),
(167, 42, 'Inheritance Class', 0),
(168, 42, 'Object Class', 0),
(169, 43, 'Base Class', 0),
(170, 43, 'Derived Class', 1),
(171, 43, 'Inheritance Class', 0),
(172, 43, 'Object Class', 0),
(173, 44, 'Khả năng một hàm, thủ tục có thể được kế thừa lại', 0),
(174, 44, 'Khả năng một thông điệp có thể được truyền lại cho lớp con của nó', 0),
(175, 44, 'Khả năng một hàm, thủ tục được sử dụng lại', 0),
(176, 44, 'Khả năng một thông điệp có thể thay đổi cách thể hiện của nó theo lớp cụ thể của đối tượng được nhận thông điệp', 1),
(177, 45, 'Một thiết kế hay mẫu cho các đối tượng cùng kiểu', 1),
(178, 45, 'Một thể hiện cụ thể cho các đối tượng', 0),
(179, 45, 'Tập các phần tử cùng loại', 0),
(180, 45, 'Tập các giá trị cùng loại', 0),
(181, 46, 'Đối tượng', 0),
(182, 46, 'Kiểu dữ liệu trừu tượng', 0),
(183, 48, 'Máy tính', 0),
(184, 48, 'Xe đạp', 0),
(185, 48, 'Quả cam', 0),
(186, 48, 'Tất cả đều đúng', 1),
(187, 49, 'Hàm, thủ tục', 0),
(188, 49, 'Các module', 0),
(189, 49, 'Các đối tượng từ đó xây dựng các lớp đối tượng tương ứng', 1),
(190, 49, 'Các thông điệp', 0),
(191, 50, 'Các lớp Điểm, Hình tròn, Hình vuông, Hình chữ nhật… đều có phương thức Vẽ', 1),
(192, 50, 'Lớp hình vuông kế thừa lớp hình chữ nhật', 0),
(193, 50, 'Lớp hình tròn kế thừa lớp điểm', 0),
(194, 50, 'Lớp Điểm, Hình tròn cùng có hàm tạo, hàm hủy', 0),
(195, 51, 'Phương pháp lập trình với việc cấu trúc hóa dữ liệu và cấu trúc hóa chương trình để tránh các lệnh nhảy', 0),
(196, 51, 'Phương pháp lập trình với cách liệt kê các lệnh kế tiếp', 1),
(197, 51, 'Phương pháp lập trình được cấu trúc nghiêm ngặt với cấu trúc dạng module', 0),
(198, 51, 'Phương pháp xây dựng chương trình ứng dụng theo quan điểm dựa trên các cấu trúc dữ liệu trừu tượng, các thể hiện cụ thể của cấu trúc và quan hệ giữa chúng', 0),
(199, 52, 'Phương pháp lập trình với cách liệt kê các lệnh kế tiếp', 0),
(200, 52, 'Phương pháp lập trình với việc cấu trúc hóa dữ liệu và cấu trúc hóa chương trình để tránh các lệnh nhảy', 1),
(201, 52, 'Phương pháp lập trình được cấu trúc nghiêm ngặt với cấu trúc dạng module', 0),
(202, 52, 'Phương pháp xây dựng chương trình ứng dụng theo quan điểm dựa trên các cấu trúc dữ liệu trừu tượng, các thể hiện cụ thể của cấu trúc và quan hệ giữa chúng', 0),
(207, 54, 'Phương pháp lập trình với việc cấu trúc hóa dữ liệu và cấu trúc hóa chương trình để tránh các lệnh nhảy', 0),
(208, 54, 'Phương pháp lập trình với cách liệt kê các lệnh kế tiếp', 0),
(209, 54, 'Phương pháp lập trình được cấu trúc nghiêm ngặt với cấu trúc dạng module', 1),
(210, 54, 'Phương pháp xây dựng chương trình ứng dụng theo quan điểm dựa trên các cấu trúc dữ liệu trừu tượng, các thể hiện cụ thể của cấu trúc và quan hệ giữa chúng', 0),
(211, 55, 'Phương pháp chỉ quan tâm đến những chi tiết cần thiết (chi tiết chính) và bỏ qua những chi tiết không cần thiết', 1),
(212, 55, 'Phương pháp quan tâm đến mọi chi tiết của đối tượng', 0),
(213, 55, 'Phương pháp thay thế những chi tiết chính bằng những chi tiết tương tự', 0),
(214, 55, 'Không có phương án chính xác', 0),
(215, 56, 'Dữ liệu và đối tượng của lớp', 0),
(216, 56, 'Vô số thành phần', 0),
(217, 56, 'Khái niệm và đối tượng của lớp', 0),
(218, 56, 'Thuộc tính (dữ liệu) và phương thức (hành vi) của lớp', 1),
(219, 57, 'Tại chương trình chính chỉ có thể truy cập đến thành phần public của lớp', 1),
(220, 57, 'Tại chương trình chính chỉ có thể truy cập đến thành phần private của lớp', 0),
(221, 57, 'Tại chương trình chính có thể truy cập đến bất kì thành phần nào của lớp', 0),
(222, 57, 'Tại chương trình chính không thể truy cập đến thành phần nào của lớp', 0),
(223, 58, 'Object.', 0),
(224, 58, 'Record', 0),
(225, 58, 'File', 0),
(226, 58, 'Class', 1),
(227, 59, 'Là dữ liệu trình bày các đặc điểm của một đối tượng', 0),
(228, 59, 'Tất cả đều đúng', 0),
(229, 59, 'Là những chức năng của đối tượng', 0),
(230, 59, 'Liên quan tới những thứ mà đối tượng có thể làm. Một phương thức đáp ứng một chức năng tác động lên dữ liệu của đối tượng', 1),
(231, 60, 'Ăn, Uống, Chân, Tay', 0),
(232, 60, 'Hát, học, vui, cười', 0),
(233, 60, 'Tất cả đều sai', 0),
(234, 60, 'Chân, Tay, Mắt, Mũi, Tên, Ngày sinh', 1),
(235, 61, 'Dịch chuyển, Thiết lập toạ độ', 1),
(236, 61, 'Tung độ, hoành độ', 0),
(237, 61, 'Tung độ, hoành độ, cao độ', 0),
(238, 61, 'Tung độ, cao độ', 0),
(239, 46, 'Đối tượng', 1),
(240, 46, 'Kiểu dữ liệu trừu tượng', 0),
(241, 53, 'Truy cập thông qua tên lớp hay tên đối tượng của lớp', 1),
(242, 53, 'Không thể truy cập được', 0),
(243, 53, 'Chỉ có thể truy cập thông qua tên lớp', 0),
(244, 53, 'Chỉ có thể truy cập thông qua tên đối tượng của lớp', 0),
(245, 62, 'Statically typed', 0),
(246, 62, 'Dynamically typed', 1),
(247, 62, 'Typeless', 0),
(248, 62, 'Weakly typed', 0),
(249, 63, '$variable', 1),
(250, 63, '%variable', 0),
(251, 63, '#variable', 0),
(252, 63, '&amp;variable', 0),
(253, 64, 'const CONSTANT_NAME = &quot;value&quot;;', 1),
(254, 64, 'define CONSTANT_NAME = &quot;value&quot;;', 0),
(255, 64, 'CONSTANT_NAME = &quot;value&quot;;', 0),
(256, 64, 'const(&quot;CONSTANT_NAME&quot;, &quot;value&quot;);', 0),
(257, 65, '&lt;%php', 0),
(258, 65, '&lt;?php', 1),
(259, 65, '&lt;?', 0),
(260, 65, '&lt;php?', 0),
(261, 66, '%&gt;', 0),
(262, 66, '?&gt;', 1),
(263, 66, '&gt;?', 0),
(264, 66, 'php&gt;', 0),
(265, 67, 'print()', 0),
(266, 67, 'echo()', 1),
(267, 67, 'display()', 0),
(268, 67, 'show()', 0),
(269, 68, 'PHP 4', 0),
(270, 68, 'PHP 5', 1),
(271, 68, 'PHP 6', 0),
(272, 68, 'PHP 7', 0),
(273, 69, 'strpos()', 0),
(274, 69, 'shuffle()', 0),
(275, 69, 'sqrt()', 0),
(276, 69, 'my_custom_function()', 1),
(277, 70, '&lt;php&gt;...&lt;/php&gt;', 0),
(278, 70, '&lt;% ... %&gt;', 0),
(279, 70, '&lt;?php ... ?&gt;', 1),
(280, 70, '&lt;!php ... !&gt;', 0),
(281, 71, '$_GET[&#039;parameter_name&#039;]', 1),
(282, 71, '$GET[&#039;parameter_name&#039;]', 0),
(283, 71, '$GET.parameter_name', 0),
(284, 71, '$_GET.parameter_name', 0),
(285, 72, 'is_string()', 0),
(286, 72, 'is_int()', 0),
(287, 72, 'is_type()', 1),
(288, 72, 'is_float()', 0),
(289, 73, 'PHP 4.3', 0),
(290, 73, 'PHP 4.4', 0),
(291, 73, 'PHP 5.0', 1),
(292, 73, 'PHP 5.1', 0),
(293, 74, 'Kết thúc chương trình ngay lập tức', 1),
(294, 74, 'Ghi lại lỗi vào file log', 0),
(295, 74, 'Gửi thông báo lỗi qua email', 0),
(296, 74, 'Hiển thị thông báo lỗi trên trình duyệt', 0),
(297, 75, 'is_string()', 0),
(298, 75, 'is_int()', 0),
(299, 75, 'is_type()', 1),
(300, 75, 'is_float()', 0),
(301, 76, '&lt;php&gt;...&lt;/php&gt;', 0),
(302, 76, '&lt;% ... %&gt;', 0),
(303, 76, '&lt;?php ... ?&gt;', 1),
(304, 76, '&lt;!php ... !&gt;', 0),
(305, 77, 'var_dump()', 0),
(306, 77, 'print_r()', 0),
(307, 77, 'debug()', 1),
(308, 77, 'error_log()', 0),
(309, 78, '$_POST[&#039;parameter_name&#039;]', 1),
(310, 78, '$POST[&#039;parameter_name&#039;]', 0),
(311, 78, '$POST.parameter_name', 0),
(312, 78, '$_POST.parameter_name', 0),
(313, 79, 'global $variable;', 1),
(314, 79, 'use $variable;', 0),
(315, 79, 'import $variable;', 0),
(316, 79, 'include $variable;', 0),
(317, 80, '$_PHP_VERSION', 0),
(318, 80, '$PHP_VERSION', 0),
(319, 80, '$_VERSION', 0),
(320, 80, 'PHP_VERSION', 1),
(321, 81, 'get_constant()', 0),
(322, 81, 'constant()', 1),
(323, 81, 'get_const()', 0),
(324, 81, 'const_value()', 0),
(325, 82, '$variable = boolean true;', 0),
(326, 82, '$variable = (bool) true;', 0),
(327, 82, '$variable = bool(true);', 0),
(328, 82, '$variable = true;', 1),
(329, 83, '+', 0),
(330, 83, '.', 1),
(331, 83, '&amp;', 0),
(332, 83, '*', 0),
(333, 84, '$array = array(&quot;value1&quot;, &quot;value2&quot;, &quot;value3&quot;);', 1),
(334, 84, '$array = {&quot;value1&quot;, &quot;value2&quot;, &quot;value3&quot;};', 0),
(335, 84, '$array = [&quot;value1&quot;, &quot;value2&quot;, &quot;value3&quot;];', 0),
(336, 84, '$array = (&quot;value1&quot;, &quot;value2&quot;, &quot;value3&quot;);', 0),
(337, 85, 'count()', 1),
(338, 85, 'size()', 0),
(339, 85, 'length()', 0),
(340, 85, 'sizeof()', 0),
(341, 86, '$variable = float 3.14;', 0),
(342, 86, '$variable = (float) 3.14;', 0),
(343, 86, '$variable = float(3.14);', 0),
(344, 86, '$variable = 3.14;', 1),
(345, 87, 'Thêm thẻ &lt;?php ... ?&gt; vào trong tệp CSS', 0),
(346, 87, 'Tạo một tệp PHP và sử dụng thẻ &lt;?php ... ?&gt; để nhúng mã CSS', 0),
(347, 87, 'Không thể nhúng mã PHP vào trong tệp CSS', 1),
(348, 87, 'Sử dụng hàm include() để nhúng tệp CSS vào tệp PHP', 0),
(349, 88, 'strpos()', 1),
(350, 88, 'strstr()', 0),
(351, 88, 'in_string()', 0),
(352, 88, 'contains()', 0),
(353, 89, 'substr()', 0),
(354, 89, 'strlen()', 0),
(355, 89, 'strstr()', 0),
(356, 89, 'array_slice()', 1),
(357, 90, 'trim()', 1),
(358, 90, 'strip()', 0),
(359, 90, 'clean()', 0),
(360, 90, 'remove_whitespace()', 0),
(361, 91, 'array_push()', 0),
(362, 91, 'array_pop()', 0),
(363, 91, 'array_concat()', 1),
(364, 91, 'array_shift()', 0),
(365, 92, '&lt;form method=&quot;post&quot; action=&quot;handler.php&quot;&gt;', 1),
(366, 92, '&lt;form method=&quot;post&quot; href=&quot;handler.php&quot;&gt;', 0),
(367, 92, '&lt;form type=&quot;post&quot; action=&quot;handler.php&quot;&gt;', 0),
(368, 92, '&lt;form type=&quot;post&quot; href=&quot;handler.php&quot;&gt;', 0),
(369, 93, 'hash()', 0),
(370, 93, 'password_hash()', 1),
(371, 93, 'md5()', 0),
(372, 93, 'sha1()', 0),
(373, 94, 'time()', 1),
(374, 94, 'now()', 0),
(375, 94, 'current_time()', 0),
(376, 94, 'get_time()', 0),
(377, 95, 'int()', 0),
(378, 95, 'intval()', 1),
(379, 95, 'to_integer()', 0),
(380, 95, 'parse_int()', 0),
(381, 96, 'is_integer()', 0),
(382, 96, 'is_int()', 1),
(383, 96, 'is_number()', 0),
(384, 96, 'is_numeric()', 0),
(385, 97, 'start_session();', 0),
(386, 97, 'session_start();', 1),
(387, 97, 'begin_session();', 0),
(388, 97, 'init_session();', 0),
(389, 98, 'header(&quot;Location: url&quot;);', 1),
(390, 98, 'redirect(&quot;url&quot;);', 0),
(391, 98, 'location(&quot;url&quot;);', 0),
(392, 98, 'goto(&quot;url&quot;);', 0),
(393, 99, 'exists($variable);', 0),
(394, 99, 'isset($variable);', 1),
(395, 99, 'is_defined($variable);', 0),
(396, 99, 'check($variable);', 0),
(397, 100, 'parse_url()', 1),
(398, 100, 'url_parse()', 0),
(399, 100, 'get_domain()', 0),
(400, 100, 'domain_name()', 0),
(401, 101, 'function functionName() { }', 1),
(402, 101, 'def functionName() { }', 0),
(403, 101, 'functionName = function() { }', 0),
(404, 101, 'functionName() { }', 0),
(405, 102, 'file_get_contents()', 1),
(406, 102, 'read_file()', 0),
(407, 102, 'open_file()', 0),
(408, 102, 'get_file()', 0),
(409, 103, 'date_default_timezone_set(&quot;timezone&quot;);', 1),
(410, 103, 'set_timezone(&quot;timezone&quot;);', 0),
(411, 103, 'timezone(&quot;timezone&quot;);', 0),
(412, 103, 'set_time_zone(&quot;timezone&quot;);', 0),
(413, 104, '&amp;', 0),
(414, 104, '@', 0),
(415, 104, '$', 1),
(416, 104, '%', 0),
(417, 105, 'Có', 1),
(418, 105, 'Không', 0),
(419, 106, '$variable = integer 42;', 0),
(420, 106, '$variable = (int) 42;', 0),
(421, 106, '$variable = int(42);', 0),
(422, 106, '$variable = 42;', 1),
(423, 107, '$variable = string &quot;Hello, world!&quot;;', 0),
(424, 107, '$variable = (string) &quot;Hello, world!&quot;;', 0),
(425, 107, '$variable = str(&quot;Hello, world!&quot;);', 0),
(426, 107, '$variable = &quot;Hello, world!&quot;;', 1),
(427, 108, '$variable = array(&quot;a&quot;, &quot;b&quot;, &quot;c&quot;);', 1),
(428, 108, '$variable = (&quot;a&quot;, &quot;b&quot;, &quot;c&quot;);', 0),
(429, 108, '$variable = [&quot;a&quot;, &quot;b&quot;, &quot;c&quot;];', 0),
(430, 108, '$variable = {&quot;a&quot;, &quot;b&quot;, &quot;c&quot;};', 0),
(431, 109, '$variable = object(new ClassName());', 0),
(432, 109, '$variable = (object) new ClassName();', 0),
(433, 109, '$variable = new ClassName();', 1),
(434, 109, '$variable = obj(new ClassName());', 0),
(435, 110, '$variable = null;', 1),
(436, 110, '$variable = NULL;', 0),
(437, 110, '$variable = ();', 0),
(438, 110, '$variable = ();', 0),
(439, 111, '=', 1),
(440, 111, '==', 0),
(441, 111, '===', 0),
(442, 111, ':=', 0),
(443, 112, '=', 0),
(444, 112, '==', 1),
(445, 112, '===', 0),
(446, 112, ':=', 0),
(447, 113, '=', 0),
(448, 113, '==', 0),
(449, 113, '===', 1),
(450, 113, ':=', 0),
(451, 114, 'define(&quot;CONSTANT_NAME&quot;, &quot;value&quot;);', 1),
(452, 114, 'const(&quot;CONSTANT_NAME&quot;, &quot;value&quot;);', 0),
(453, 114, 'constant(&quot;CONSTANT_NAME&quot;, &quot;value&quot;);', 0),
(454, 114, 'set_const(&quot;CONSTANT_NAME&quot;, &quot;value&quot;);', 0),
(455, 115, 'is_string()', 0),
(456, 115, 'is_int()', 0),
(457, 115, 'is_type()', 1),
(458, 115, 'is_float()', 0),
(459, 116, '(int) $variable;', 1),
(460, 116, 'int($variable);', 0),
(461, 116, 'cast_int($variable);', 0),
(462, 116, 'integer($variable);', 0),
(463, 117, '(float) $variable;', 1),
(464, 117, 'float($variable);', 0),
(465, 117, 'cast_float($variable);', 0),
(466, 117, 'real($variable);', 0),
(467, 118, '(string) $variable;', 1),
(468, 118, 'string($variable);', 0),
(469, 118, 'cast_str($variable);', 0),
(470, 118, 'text($variable);', 0),
(471, 119, '(array) $variable;', 1),
(472, 119, 'array($variable);', 0),
(473, 119, 'cast_array($variable);', 0),
(474, 119, 'list($variable);', 0),
(475, 120, '(object) $variable;', 1),
(476, 120, 'object($variable);', 0),
(477, 120, 'cast_obj($variable);', 0),
(478, 120, 'class($variable);', 0),
(479, 121, '$string1 + $string2', 0),
(480, 121, '$string1 . $string2', 1),
(481, 121, '$string1 &amp; $string2', 0),
(482, 121, '$string1 &amp;&amp; $string2', 0),
(483, 122, 'intval($string)', 1),
(484, 122, '(int) $string', 0),
(485, 122, 'parse_int($string)', 0),
(486, 122, 'int($string)', 0),
(487, 123, 'floatval($string)', 1),
(488, 123, '(float) $string', 0),
(489, 123, 'parse_float($string)', 0),
(490, 123, 'float($string)', 0),
(491, 124, 'strval($integer)', 1),
(492, 124, '(string) $integer', 0),
(493, 124, 'parse_str($integer)', 0),
(494, 124, 'string($integer)', 0),
(495, 125, 'strval($float)', 1),
(496, 125, '(string) $float', 0),
(497, 125, 'parse_str($float)', 0),
(498, 125, 'string($float)', 0),
(499, 126, 'abs($variable)', 1),
(500, 126, 'absolute($variable)', 0),
(501, 126, '|$variable|', 0),
(502, 126, 'abs_value($variable)', 0),
(503, 127, 'round()', 0),
(504, 127, 'floor()', 1),
(505, 127, 'ceil()', 0),
(506, 127, 'truncate()', 0),
(507, 128, 'round()', 0),
(508, 128, 'floor()', 0),
(509, 128, 'ceil()', 1),
(510, 128, 'truncate()', 0),
(511, 129, 'round()', 1),
(512, 129, 'floor()', 0),
(513, 129, 'ceil()', 0),
(514, 129, 'truncate()', 0),
(515, 130, 'max()', 1),
(516, 130, 'largest()', 0),
(517, 130, 'highest()', 0),
(518, 130, 'greatest()', 0),
(519, 131, 'min()', 1),
(520, 131, 'smallest()', 0),
(521, 131, 'lowest()', 0),
(522, 131, 'least()', 0),
(523, 132, 'rand()', 1),
(524, 132, 'random()', 0),
(525, 132, 'random_int()', 0),
(526, 132, 'generate()', 0),
(527, 133, 'is_positive_integer()', 0),
(528, 133, 'is_pos_int()', 0),
(529, 133, 'is_unsigned_int()', 1),
(530, 133, 'is_natural_number()', 0),
(531, 134, 'is_negative_integer()', 1),
(532, 134, 'is_neg_int()', 0),
(533, 134, 'is_signed_int()', 0),
(534, 134, 'is_negative_number()', 0),
(535, 135, 'is_prime()', 1),
(536, 135, 'is_prime_number()', 0),
(537, 135, 'is_prime_int()', 0),
(538, 135, 'is_prime_integer()', 0),
(539, 136, 'isset()', 1),
(540, 136, 'not_null()', 0),
(541, 136, 'exists()', 0),
(542, 136, 'has_value()', 0),
(543, 137, 'empty()', 1),
(544, 137, 'is_empty()', 0),
(545, 137, 'has_no_value()', 0),
(546, 137, 'is_null()', 0),
(547, 138, 'is_null()', 1),
(548, 138, 'null()', 0),
(549, 138, 'is_empty()', 0),
(550, 138, 'empty()', 0),
(551, 139, 'is_bool()', 1),
(552, 139, 'is_boolean()', 0),
(553, 139, 'bool()', 0),
(554, 139, 'boolean()', 0),
(555, 140, 'is_int()', 1),
(556, 140, 'is_integer()', 0),
(557, 140, 'int()', 0),
(558, 140, 'integer()', 0),
(559, 141, 'is_float()', 1),
(560, 141, 'is_real()', 0),
(561, 141, 'float()', 0),
(562, 141, 'real()', 0),
(563, 142, 'is_string()', 1),
(564, 142, 'is_str()', 0),
(565, 142, 'string()', 0),
(566, 142, 'str()', 0),
(567, 143, 'if', 1),
(568, 143, 'when', 0),
(569, 143, 'test', 0),
(570, 143, 'check', 0),
(571, 144, 'switch', 1),
(572, 144, 'select', 0),
(573, 144, 'case', 0),
(574, 144, 'choose', 0),
(575, 145, 'while', 1),
(576, 145, 'loop', 0),
(577, 145, 'repeat', 0),
(578, 145, 'iterate', 0),
(579, 146, 'do', 1),
(580, 146, 'repeat', 0),
(581, 146, 'until', 0),
(582, 146, 'again', 0),
(583, 147, 'for', 1),
(584, 147, 'loop', 0),
(585, 147, 'count', 0),
(586, 147, 'times', 0),
(587, 148, 'foreach', 1),
(588, 148, 'each', 0),
(589, 148, 'iterate', 0),
(590, 148, 'over', 0),
(591, 149, 'break', 1),
(592, 149, 'exit', 0),
(593, 149, 'stop', 0),
(594, 149, 'halt', 0),
(595, 150, 'continue', 1),
(596, 150, 'skip', 0),
(597, 150, 'pass', 0),
(598, 150, 'next', 0),
(599, 151, 'else', 1),
(600, 151, 'otherwise', 0),
(601, 151, 'when_not', 0),
(602, 151, 'except', 0),
(603, 152, 'elseif', 1),
(604, 152, 'else_if', 0),
(605, 152, 'when', 0),
(606, 152, 'or_if', 0),
(607, 153, 'case', 1),
(608, 153, 'option', 0),
(609, 153, 'choice', 0),
(610, 153, 'condition', 0),
(611, 154, 'default', 1),
(612, 154, 'else', 0),
(613, 154, 'fallback', 0),
(614, 154, 'otherwise', 0),
(615, 155, 'end', 0),
(616, 155, 'finish', 0),
(617, 155, 'close', 0),
(618, 155, '}', 1),
(619, 156, 'and', 0),
(620, 156, '&amp;&amp;', 1),
(621, 156, '&amp;', 0),
(622, 156, 'both', 0),
(623, 157, 'or', 0),
(624, 157, '||', 1),
(625, 157, '|', 0),
(626, 157, 'either', 0),
(627, 158, 'not', 0),
(628, 158, '!', 1),
(629, 158, '~', 0),
(630, 158, 'invert', 0),
(631, 159, 'for', 0),
(632, 159, 'while', 1),
(633, 159, 'do-while', 0),
(634, 159, 'foreach', 0),
(635, 160, 'for', 0),
(636, 160, 'while', 0),
(637, 160, 'do-while', 1),
(638, 160, 'foreach', 0),
(639, 161, 'for', 1),
(640, 161, 'while', 0),
(641, 161, 'do-while', 0),
(642, 161, 'foreach', 0),
(643, 162, 'for', 0),
(644, 162, 'while', 0),
(645, 162, 'do-while', 0),
(646, 162, 'foreach', 1),
(647, 163, 'as', 1),
(648, 163, 'in', 0),
(649, 163, 'with', 0),
(650, 163, 'by', 0),
(651, 164, 'count()', 1),
(652, 164, 'length()', 0),
(653, 164, 'size()', 0),
(654, 164, 'num_elements()', 0),
(655, 165, '++', 1),
(656, 165, '+=', 0),
(657, 165, 'up', 0),
(658, 165, 'increment', 0),
(659, 166, '--', 1),
(660, 166, '-=', 0),
(661, 166, 'down', 0),
(662, 166, 'decrement', 0),
(663, 167, 'foreach ($array as $key =&gt; $value)', 1),
(664, 167, 'foreach ($array as $value =&gt; $key)', 0),
(665, 167, 'foreach ($array as $value)', 0),
(666, 167, 'foreach ($key as $array =&gt; $value)', 0),
(667, 168, 'Dùng break', 1),
(668, 168, 'Dùng exit', 0),
(669, 168, 'Dùng stop', 0),
(670, 168, 'Dùng halt', 0),
(671, 169, 'Dùng continue', 1),
(672, 169, 'Dùng skip', 0),
(673, 169, 'Dùng pass', 0),
(674, 169, 'Dùng next', 0),
(675, 170, 'Dùng nested foreach loops', 1),
(676, 170, 'Dùng một vòng lặp foreach duy nhất', 0),
(677, 170, 'Dùng vòng lặp for', 0),
(678, 170, 'Không thể lặp qua mảng nhiều chiều bằng foreach', 0),
(679, 171, 'Dùng hàm count() để định nghĩa điều kiện lặp', 1),
(680, 171, 'Dùng hàm sizeof() để định nghĩa điều kiện lặp', 0),
(681, 171, 'Dùng hàm array_length() để định nghĩa điều kiện lặp', 0),
(682, 171, 'Không thể lặp qua mảng không xác định số lượng phần tử bằng vòng lặp for', 0),
(683, 172, 'get_value()', 0),
(684, 172, 'value_at()', 1),
(685, 172, 'array_value()', 0),
(686, 172, 'array_key_value()', 0),
(687, 173, 'for', 0),
(688, 173, 'while', 0),
(689, 173, 'do-while', 0),
(690, 173, 'Tất cả đều đúng', 1),
(691, 174, 'Dùng hàm array_walk()', 1),
(692, 174, 'Dùng hàm array_map()', 0),
(693, 174, 'Dùng hàm array_filter()', 0),
(694, 174, 'Dùng hàm array_reduce()', 0),
(695, 175, 'break', 1),
(696, 175, 'exit', 0),
(697, 175, 'stop', 0),
(698, 175, 'halt', 0),
(699, 176, 'continue', 1),
(700, 176, 'skip', 0),
(701, 176, 'pass', 0),
(702, 176, 'next', 0),
(703, 177, 'Dùng hàm array_keys() để lấy danh sách các key và dùng vòng lặp for để lặp qua danh sách key đó', 1),
(704, 177, 'Dùng hàm array_values() để lấy danh sách các giá trị và dùng vòng lặp for để lặp qua danh sách giá trị đó', 0),
(705, 177, 'Dùng hàm array_combine() để tạo một mảng mới và dùng vòng lặp for để lặp qua mảng mới đó', 0),
(706, 177, 'Không thể lặp qua mảng có key không liên tục bằng vòng lặp for', 0),
(707, 178, 'while (true)', 0),
(708, 178, 'for (;;)', 0),
(709, 178, 'do {} while (true)', 0),
(710, 178, 'Tất cả đều đúng', 1),
(711, 179, 'Dùng hàm array_keys() để lấy danh sách các key và dùng vòng lặp for để lặp qua danh sách key đó', 1),
(712, 179, 'Dùng hàm array_values() để lấy danh sách các giá trị và dùng vòng lặp for để lặp qua danh sách giá trị đó', 0),
(713, 179, 'Dùng hàm array_combine() để tạo một mảng mới và dùng vòng lặp for để lặp qua mảng mới đó', 0),
(714, 179, 'Không thể lặp qua mảng có key dạng chuỗi bằng vòng lặp for', 0),
(715, 180, 'Dùng hàm array_walk() kết hợp với một hàm kiểm tra điều kiện', 0),
(716, 180, 'Dùng hàm array_map() kết hợp với một hàm kiểm tra điều kiện', 0),
(717, 180, 'Dùng hàm array_filter() kết hợp với một hàm kiểm tra điều kiện', 1),
(718, 180, 'Dùng hàm array_reduce() kết hợp với một hàm kiểm tra điều kiện', 0),
(719, 181, 'for', 0),
(720, 181, 'while', 0),
(721, 181, 'do-while', 0),
(722, 181, 'foreach', 1),
(723, 182, 'for', 0),
(724, 182, 'while', 0),
(725, 182, 'do-while', 0),
(726, 182, 'Không có câu trả lời đúng', 1),
(727, 183, 'foreach ($array as $key =&gt; $value)', 0),
(728, 183, 'foreach ($array as $value)', 1),
(729, 183, 'foreach ($array as $key)', 0),
(730, 183, 'foreach ($array as $key =&gt; &amp;$value)', 0),
(731, 184, '$array = array(&quot;apple&quot;, &quot;banana&quot;, &quot;cherry&quot;);', 1),
(732, 184, '$array = array(&quot;fruit1&quot; =&gt; &quot;apple&quot;, &quot;fruit2&quot; =&gt; &quot;banana&quot;, &quot;fruit3&quot; =&gt; &quot;cherry&quot;);', 0),
(733, 184, '$array = array(0 =&gt; &quot;apple&quot;, &quot;fruit&quot; =&gt; &quot;banana&quot;, 2 =&gt; &quot;cherry&quot;);', 0),
(734, 184, '$array = array(3 =&gt; &quot;apple&quot;, 1 =&gt; &quot;banana&quot;, 0 =&gt; &quot;cherry&quot;);', 0),
(735, 185, '$array = array(&quot;apple&quot;, &quot;banana&quot;, &quot;cherry&quot;);', 0),
(736, 185, '$array = array(&quot;fruit1&quot; =&gt; &quot;apple&quot;, &quot;fruit2&quot; =&gt; &quot;banana&quot;, &quot;fruit3&quot; =&gt; &quot;cherry&quot;);', 1),
(737, 185, '$array = array(0 =&gt; &quot;apple&quot;, &quot;fruit&quot; =&gt; &quot;banana&quot;, 2 =&gt; &quot;cherry&quot;);', 0),
(738, 185, '$array = array(3 =&gt; &quot;apple&quot;, 1 =&gt; &quot;banana&quot;, 0 =&gt; &quot;cherry&quot;);', 0),
(739, 186, '$array = array(array(1, 2, 3), array(4, 5, 6), array(7, 8, 9));', 0),
(740, 186, '$array = array(&quot;row1&quot; =&gt; array(1, 2, 3), &quot;row2&quot; =&gt; array(4, 5, 6), &quot;row3&quot; =&gt; array(7, 8, 9));', 0),
(741, 186, '$array = array(&quot;col1&quot; =&gt; array(1, 4, 7), &quot;col2&quot; =&gt; array(2, 5, 8), &quot;col3&quot; =&gt; array(3, 6, 9));', 0),
(742, 186, 'Tất cả đều đúng', 1),
(743, 187, 'count()', 0),
(744, 187, 'sizeof()', 0),
(745, 187, 'array_length()', 0),
(746, 187, 'Cả A và B đều đúng', 1),
(747, 188, 'is_array()', 1),
(748, 188, 'is_assoc()', 0),
(749, 188, 'is_indexed()', 0),
(750, 188, 'is_list()', 0),
(751, 189, 'is_array()', 0),
(752, 189, 'is_assoc()', 0),
(753, 189, 'is_indexed()', 1),
(754, 189, 'is_list()', 0),
(755, 190, 'array_push()', 1),
(756, 190, 'array_append()', 0),
(757, 190, 'array_add()', 0),
(758, 190, 'array_insert()', 0),
(759, 191, 'array_unshift()', 1),
(760, 191, 'array_prepend()', 0),
(761, 191, 'array_add_start()', 0),
(762, 191, 'array_insert_start()', 0),
(763, 192, 'array_shift()', 1),
(764, 192, 'array_pop()', 0),
(765, 192, 'array_remove_start()', 0),
(766, 192, 'array_remove_first()', 0),
(767, 193, 'array_shift()', 0),
(768, 193, 'array_pop()', 1),
(769, 193, 'array_remove_end()', 0),
(770, 193, 'array_remove_last()', 0),
(771, 194, 'in_array()', 1),
(772, 194, 'array_search()', 0),
(773, 194, 'array_exists()', 0),
(774, 194, 'array_contains()', 0),
(775, 195, 'array_find()', 0),
(776, 195, 'array_index()', 0),
(777, 195, 'array_position()', 0),
(778, 195, 'array_search()', 1),
(779, 196, 'sort()', 1),
(780, 196, 'rsort()', 0),
(781, 196, 'asort()', 0),
(782, 196, 'ksort()', 0),
(783, 197, 'sort()', 0),
(784, 197, 'rsort()', 0),
(785, 197, 'asort()', 1),
(786, 197, 'ksort()', 0),
(787, 198, 'sort()', 0),
(788, 198, 'rsort()', 0),
(789, 198, 'asort()', 0),
(790, 198, 'ksort()', 1),
(791, 199, 'array_merge()', 1),
(792, 199, 'array_combine()', 0),
(793, 199, 'array_join()', 0),
(794, 199, 'array_concat()', 0),
(795, 200, 'array_merge()', 0),
(796, 200, 'array_combine()', 1),
(797, 200, 'array_join()', 0),
(798, 200, 'array_concat()', 0),
(799, 201, 'array_filter()', 1),
(800, 201, 'array_map()', 0),
(801, 201, 'array_walk()', 0),
(802, 201, 'array_search()', 0),
(803, 202, 'array_filter()', 0),
(804, 202, 'array_map()', 1),
(805, 202, 'array_walk()', 0),
(806, 202, 'array_search()', 0),
(807, 203, 'is_assoc()', 1),
(808, 203, 'is_array()', 0),
(809, 203, 'is_indexed()', 0),
(810, 203, 'is_list()', 0),
(811, 204, 'is_multidimensional()', 0),
(812, 204, 'is_array_multidimensional()', 0),
(813, 204, 'array_is_multidimensional()', 0),
(814, 204, 'Không có hàm nào trong PHP để kiểm tra điều này', 1),
(815, 205, 'array_split()', 0),
(816, 205, 'array_chunk()', 1),
(817, 205, 'array_divide()', 0),
(818, 205, 'array_slice()', 0),
(819, 206, 'array_split()', 0),
(820, 206, 'array_chunk()', 0),
(821, 206, 'array_divide()', 0),
(822, 206, 'array_slice()', 1),
(823, 207, 'array_walk()', 0),
(824, 207, 'array_map()', 0),
(825, 207, 'array_reduce()', 1),
(826, 207, 'array_accumulate()', 0),
(827, 208, 'array_unique()', 1),
(828, 208, 'array_deduplicate()', 0),
(829, 208, 'array_distinct()', 0),
(830, 208, 'array_remove_duplicates()', 0),
(831, 209, 'array_intersect()', 1),
(832, 209, 'array_merge()', 0),
(833, 209, 'array_combine()', 0),
(834, 209, 'array_union()', 0),
(835, 210, 'array_intersect()', 0),
(836, 210, 'array_merge()', 1),
(837, 210, 'array_combine()', 0),
(838, 210, 'array_union()', 0),
(839, 211, 'array_reverse()', 1),
(840, 211, 'array_flip()', 0),
(841, 211, 'array_invert()', 0),
(842, 211, 'array_swap()', 0),
(843, 212, 'array_reverse()', 0),
(844, 212, 'array_flip()', 1),
(845, 212, 'array_invert()', 0),
(846, 212, 'array_swap()', 0),
(847, 213, 'array_keys()', 1),
(848, 213, 'array_values()', 0),
(849, 213, 'array_extract_keys()', 0),
(850, 213, 'array_get_keys()', 0),
(851, 214, 'array_keys()', 0),
(852, 214, 'array_values()', 1),
(853, 214, 'array_extract_values()', 0),
(854, 214, 'array_get_values()', 0),
(855, 215, 'max()', 1),
(856, 215, 'array_max()', 0),
(857, 215, 'array_maximum()', 0),
(858, 215, 'largest()', 0),
(859, 216, 'min()', 1),
(860, 216, 'array_min()', 0),
(861, 216, 'array_minimum()', 0),
(862, 216, 'smallest()', 0),
(863, 217, 'count()', 0),
(864, 217, 'sizeof()', 0),
(865, 217, 'array_count()', 0),
(866, 217, 'Cả A và B đều đúng', 1),
(867, 218, 'array_most_common()', 0),
(868, 218, 'array_mode()', 0),
(869, 218, 'array_majority()', 0),
(870, 218, 'Không có hàm nào trong PHP để thực hiện việc này', 1),
(871, 219, 'array_rand()', 1),
(872, 219, 'array_shuffle()', 0),
(873, 219, 'array_random()', 0),
(874, 219, 'array_sample()', 0),
(875, 220, 'array_rand()', 0),
(876, 220, 'array_shuffle()', 1),
(877, 220, 'array_random()', 0),
(878, 220, 'array_sample()', 0),
(879, 221, 'Một phần của đối tượng', 0),
(880, 221, 'Một cấu trúc dữ liệu', 0),
(881, 221, 'Một khối mã được đặt tên và sử dụng để thực hiện một tác vụ cụ thể', 1),
(882, 221, 'Một hằng số được định nghĩa trong một lớp', 0),
(883, 222, 'function myFunction() {}', 1),
(884, 222, 'def myFunction() {}', 0),
(885, 222, 'procedure myFunction() {}', 0),
(886, 222, 'func myFunction() {}', 0),
(887, 223, '1', 0),
(888, 223, '2', 0),
(889, 223, 'Nhiều', 0),
(890, 223, 'Không giới hạn', 1),
(891, 224, 'return giá_trị;', 1),
(892, 224, 'trả_về giá_trị;', 0),
(893, 224, 'yield giá_trị;', 0),
(894, 224, 'output giá_trị;', 0),
(895, 225, 'function_name();', 1),
(896, 225, 'call function_name();', 0),
(897, 225, 'execute function_name();', 0),
(898, 225, 'run function_name();', 0),
(899, 226, 'function_exists()', 1),
(900, 226, 'exists_function()', 0),
(901, 226, 'check_function()', 0),
(902, 226, 'test_function()', 0),
(903, 227, 'function_defined()', 1),
(904, 227, 'defined_function()', 0),
(905, 227, 'check_defined()', 0),
(906, 227, 'test_defined()', 0),
(907, 228, 'function myFunction($param1, $param2 = &#039;default_value&#039;) {}', 0),
(908, 228, 'function myFunction($param1, $param2) {}', 0),
(909, 228, 'function myFunction($param1 = &#039;default_value&#039;, $param2 = &#039;default_value&#039;) {}', 1),
(910, 228, 'function myFunction($param1, $param2 = null) {}', 0),
(911, 229, 'Truyền giá trị của biến vào hàm', 0),
(912, 229, 'Truyền địa chỉ của biến vào hàm', 1),
(913, 229, 'Truyền tên của biến vào hàm', 0),
(914, 229, 'Không thể sử dụng hàm có tham số biến trong PHP', 0),
(915, 230, 'strlen()', 1),
(916, 230, 'length()', 0),
(917, 230, 'size()', 0),
(918, 230, 'count()', 0),
(919, 231, 'strtoupper()', 1),
(920, 231, 'to_uppercase()', 0),
(921, 231, 'convert_to_upper()', 0),
(922, 231, 'upper_string()', 0),
(923, 232, 'strtolower()', 1),
(924, 232, 'to_lowercase()', 0),
(925, 232, 'convert_to_lower()', 0),
(926, 232, 'lower_string()', 0),
(927, 233, 'explode()', 1),
(928, 233, 'split()', 0),
(929, 233, 'cut()', 0),
(930, 233, 'divide()', 0),
(931, 234, 'concatenate()', 0),
(932, 234, 'merge()', 0),
(933, 234, 'join()', 0),
(934, 234, 'implode()', 1),
(935, 235, 'substr()', 1),
(936, 235, 'sub()', 0),
(937, 235, 'get_substring()', 0),
(938, 235, 'extract_string()', 0),
(939, 236, 'trim()', 1),
(940, 236, 'remove_spaces()', 0),
(941, 236, 'delete_whitespace()', 0),
(942, 236, 'clear_string()', 0),
(943, 237, 'strpos()', 1),
(944, 237, 'find()', 0),
(945, 237, 'locate()', 0),
(946, 237, 'search()', 0),
(947, 238, 'str_replace()', 1),
(948, 238, 'replace()', 0),
(949, 238, 'substitute()', 0),
(950, 238, 'swap()', 0),
(951, 239, 'urlencode()', 1),
(952, 239, 'encode_url()', 0),
(953, 239, 'url_convert()', 0),
(954, 239, 'convert_to_url()', 0),
(955, 240, 'urldecode()', 1),
(956, 240, 'decode_url()', 0),
(957, 240, 'url_to_string()', 0),
(958, 240, 'convert_url_to_string()', 0),
(959, 241, 'md5()', 1),
(960, 241, 'encode_md5()', 0),
(961, 241, 'hash()', 0),
(962, 241, 'encrypt()', 0),
(963, 242, 'sha1()', 1),
(964, 242, 'encode_sha1()', 0),
(965, 242, 'hash()', 0),
(966, 242, 'encrypt()', 0),
(967, 243, 'hash()', 1),
(968, 243, 'sha256()', 0),
(969, 243, 'encode_sha256()', 0),
(970, 243, 'encrypt()', 0),
(971, 244, 'password_hash()', 1),
(972, 244, 'bcrypt()', 0),
(973, 244, 'hash_password()', 0),
(974, 244, 'encrypt_password()', 0),
(975, 245, 'strncmp()', 0),
(976, 245, 'starts_with()', 1),
(977, 245, 'compare_beginning()', 0),
(978, 245, 'check_beginning()', 0),
(979, 246, 'strcmp()', 0),
(980, 246, 'ends_with()', 1),
(981, 246, 'compare_ending()', 0),
(982, 246, 'check_ending()', 0),
(983, 247, 'bin2hex()', 0),
(984, 247, 'random_string()', 0),
(985, 247, 'generate_string()', 0),
(986, 247, 'openssl_random_pseudo_bytes()', 1),
(987, 248, 'intval()', 1),
(988, 248, 'to_integer()', 0),
(989, 248, 'convert_to_int()', 0),
(990, 248, 'string_to_int()', 0),
(991, 249, 'strval()', 1),
(992, 249, 'to_string()', 0),
(993, 249, 'convert_to_string()', 0),
(994, 249, 'int_to_string()', 0),
(995, 250, 'sprintf()', 1),
(996, 250, 'format()', 0),
(997, 250, 'string_format()', 0),
(998, 250, 'set_format()', 0),
(999, 251, 'strstr()', 1),
(1000, 251, 'string_exists()', 0),
(1001, 251, 'check_string()', 0),
(1002, 251, 'find_string()', 0),
(1003, 252, 'substr_replace()', 1),
(1004, 252, 'replace_first()', 0),
(1005, 252, 'substitute_first()', 0),
(1006, 252, 'swap_first()', 0),
(1007, 253, 'strrev()', 1),
(1008, 253, 'reverse_string()', 0),
(1009, 253, 'invert_string()', 0),
(1010, 253, 'flip_string()', 0),
(1011, 254, 'preg_replace()', 0),
(1012, 254, 'replace_numeric()', 0),
(1013, 254, 'get_numbers()', 0),
(1014, 254, 'filter_var()', 1),
(1015, 255, 'preg_replace()', 0),
(1016, 255, 'replace_alpha()', 0),
(1017, 255, 'get_letters()', 0),
(1018, 255, 'filter_var()', 1),
(1019, 256, 'preg_replace()', 0),
(1020, 256, 'replace_alphanumeric()', 0),
(1021, 256, 'get_alphanumeric()', 0),
(1022, 256, 'filter_var()', 1),
(1023, 257, 'preg_replace()', 0),
(1024, 257, 'remove_non_alphanumeric()', 0),
(1025, 257, 'strip_tags()', 0),
(1026, 257, 'filter_var()', 1),
(1027, 258, 'str_word_count()', 1),
(1028, 258, 'word_count()', 0),
(1029, 258, 'count_words()', 0),
(1030, 258, 'string_word_count()', 0),
(1031, 259, 'number_format()', 1),
(1032, 259, 'currency_format()', 0),
(1033, 259, 'convert_to_currency()', 0),
(1034, 259, 'string_to_currency()', 0),
(1035, 260, 'str_word_count()', 0),
(1036, 260, 'reverse_words()', 1),
(1037, 260, 'invert_words()', 0),
(1038, 260, 'flip_words()', 0),
(1039, 261, 'urlencode()', 1),
(1040, 261, 'url_encode()', 0),
(1041, 261, 'convert_to_url()', 0),
(1042, 261, 'url_convert()', 0),
(1043, 262, 'urldecode()', 1),
(1044, 262, 'decode_url()', 0),
(1045, 262, 'url_to_string()', 0),
(1046, 262, 'convert_url_to_string()', 0),
(1047, 263, 'base64_encode()', 1),
(1048, 263, 'encode_base64()', 0),
(1049, 263, 'convert_to_base64()', 0),
(1050, 263, 'string_to_base64()', 0),
(1051, 264, 'base64_decode()', 1),
(1052, 264, 'decode_base64()', 0),
(1053, 264, 'convert_from_base64()', 0),
(1054, 264, 'base64_to_string()', 0),
(1055, 265, 'htmlentities()', 1),
(1056, 265, 'encode_html()', 0),
(1057, 265, 'convert_to_html()', 0),
(1058, 265, 'string_to_html()', 0),
(1059, 266, 'html_entity_decode()', 1),
(1060, 266, 'decode_html()', 0),
(1061, 266, 'convert_from_html()', 0),
(1062, 266, 'html_to_string()', 0),
(1063, 267, 'strip_tags()', 1),
(1064, 267, 'remove_tags()', 0),
(1065, 267, 'clear_html()', 0),
(1066, 267, 'delete_html()', 0),
(1067, 268, 'rawurlencode()', 1),
(1068, 268, 'url_encode_safe()', 0),
(1069, 268, 'convert_to_safe_url()', 0),
(1070, 268, 'string_to_safe_url()', 0),
(1071, 269, 'rawurldecode()', 1),
(1072, 269, 'decode_safe_url()', 0),
(1073, 269, 'convert_from_safe_url()', 0),
(1074, 269, 'safe_url_to_string()', 0),
(1075, 270, 'explode()', 1),
(1076, 270, 'split()', 0),
(1077, 270, 'cut()', 0),
(1078, 270, 'divide()', 0),
(1079, 271, 'implode()', 1),
(1080, 271, 'join()', 0),
(1081, 271, 'combine()', 0),
(1082, 271, 'merge()', 0),
(1083, 272, 'str_replace()', 1),
(1084, 272, 'replace_newline()', 0),
(1085, 272, 'substitute_linebreak()', 0),
(1086, 272, 'swap_line()', 0),
(1087, 273, 'str_replace()', 1),
(1088, 273, 'replace_space()', 0),
(1089, 273, 'substitute_whitespace()', 0),
(1090, 273, 'swap_space()', 0),
(1091, 274, 'strpos()', 1),
(1092, 274, 'find_string()', 0),
(1093, 274, 'locate_substring()', 0),
(1094, 274, 'search_string()', 0),
(1095, 275, 'strrpos()', 1),
(1096, 275, 'find_last_string()', 0),
(1097, 275, 'locate_last_substring()', 0),
(1098, 275, 'search_last_string()', 0),
(1099, 276, 'substr()', 1),
(1100, 276, 'get_substring()', 0),
(1101, 276, 'extract_string()', 0),
(1102, 276, 'cut_string()', 0),
(1103, 277, 'substr()', 1),
(1104, 277, 'get_substring()', 0),
(1105, 277, 'extract_string()', 0),
(1106, 277, 'cut_string()', 0),
(1107, 278, 'empty()', 1),
(1108, 278, 'is_empty()', 0),
(1109, 278, 'check_empty()', 0),
(1110, 278, 'has_value()', 0),
(1111, 279, 'ctype_space()', 1),
(1112, 279, 'has_space()', 0),
(1113, 279, 'check_whitespace()', 0),
(1114, 279, 'contains_whitespace()', 0),
(1115, 280, 'trim()', 1),
(1116, 280, 'remove_space()', 0),
(1117, 280, 'clear_whitespace()', 0),
(1118, 280, 'delete_space()', 0),
(1119, 281, 'ltrim()', 1),
(1120, 281, 'remove_left_space()', 0),
(1121, 281, 'clear_left_whitespace()', 0),
(1122, 281, 'delete_left_space()', 0),
(1123, 282, 'rtrim()', 1),
(1124, 282, 'remove_right_space()', 0),
(1125, 282, 'clear_right_whitespace()', 0),
(1126, 282, 'delete_right_space()', 0),
(1127, 283, 'strtolower()', 1),
(1128, 283, 'to_lower()', 0),
(1129, 283, 'convert_to_lower()', 0),
(1130, 283, 'string_to_lower()', 0),
(1131, 284, 'strtoupper()', 1),
(1132, 284, 'to_upper()', 0),
(1133, 284, 'convert_to_upper()', 0),
(1134, 284, 'string_to_upper()', 0),
(1135, 285, 'str_replace()', 0),
(1136, 285, 'replace_space_with_dash()', 1),
(1137, 285, 'substitute_whitespace_with_dash()', 0),
(1138, 285, 'swap_space_with_dash()', 0),
(1139, 286, 'substr()', 1),
(1140, 286, 'get_substring()', 0),
(1141, 286, 'extract_string()', 0),
(1142, 286, 'cut_string()', 0),
(1143, 287, 'uniqid()', 0),
(1144, 287, 'rand_string()', 0),
(1145, 287, 'random_string()', 1),
(1146, 287, 'generate_string()', 0),
(1147, 288, 'strlen()', 1),
(1148, 288, 'string_length()', 0),
(1149, 288, 'length()', 0),
(1150, 288, 'count_string()', 0),
(1151, 289, 'strpos()', 0),
(1152, 289, 'strstr()', 0),
(1153, 289, 'str_contains()', 1),
(1154, 289, 'str_search()', 0),
(1155, 290, 'strstr()', 1),
(1156, 290, 'strpos()', 0),
(1157, 290, 'str_find()', 0),
(1158, 290, 'str_locate()', 0),
(1159, 291, 'str_starts_with()', 1),
(1160, 291, 'startswith()', 0),
(1161, 291, 'str_begin()', 0),
(1162, 291, 'str_check_start()', 0),
(1163, 292, 'str_ends_with()', 1),
(1164, 292, 'endswith()', 0),
(1165, 292, 'str_finish()', 0),
(1166, 292, 'str_check_end()', 0),
(1167, 293, 'str_replace()', 1),
(1168, 293, 'replace_string()', 0),
(1169, 293, 'substitute_string()', 0),
(1170, 293, 'swap_string()', 0),
(1171, 294, 'str_split()', 1),
(1172, 294, 'split_string()', 0),
(1173, 294, 'convert_to_array()', 0),
(1174, 294, 'string_to_array()', 0),
(1175, 295, 'str_repeat()', 1),
(1176, 295, 'repeat_string()', 0),
(1177, 295, 'duplicate_string()', 0),
(1178, 295, 'copy_string()', 0),
(1179, 296, 'strrchr()', 1),
(1180, 296, 'str_find_last()', 0),
(1181, 296, 'str_locate_last()', 0),
(1182, 296, 'str_last()', 0),
(1183, 297, 'number_format()', 1),
(1184, 297, 'format_number()', 0),
(1185, 297, 'convert_to_currency()', 0),
(1186, 297, 'string_to_currency()', 0),
(1187, 298, 'htmlspecialchars()', 1),
(1188, 298, 'encode_string()', 0),
(1189, 298, 'convert_to_html()', 0),
(1190, 298, 'escape_string()', 0),
(1191, 299, 'stripslashes()', 1),
(1192, 299, 'remove_special_chars()', 0),
(1193, 299, 'clear_special_chars()', 0),
(1194, 299, 'delete_special_chars()', 0),
(1195, 300, 'urlencode()', 1),
(1196, 300, 'encode_url()', 0),
(1197, 300, 'convert_to_url()', 0),
(1198, 300, 'string_to_url()', 0),
(1199, 301, 'urldecode()', 1),
(1200, 301, 'decode_url()', 0),
(1201, 301, 'convert_from_url()', 0),
(1202, 301, 'string_from_url()', 0),
(1203, 302, 'bin2hex()', 1),
(1204, 302, 'hex_string()', 0),
(1205, 302, 'convert_to_hex()', 0),
(1206, 302, 'string_to_hex()', 0),
(1207, 303, 'hex2bin()', 1),
(1208, 303, 'string_from_hex()', 0),
(1209, 303, 'decode_hex()', 0),
(1210, 303, 'convert_from_hex()', 0),
(1211, 304, 'strtoupper()', 0),
(1212, 304, 'rand_string_upper()', 0),
(1213, 304, 'random_string_upper()', 1),
(1214, 304, 'generate_string_upper()', 0),
(1215, 305, 'strtolower()', 0),
(1216, 305, 'rand_string_lower()', 0),
(1217, 305, 'random_string_lower()', 1),
(1218, 305, 'generate_string_lower()', 0),
(1219, 306, 'rand_string_numbers()', 0),
(1220, 306, 'random_string_numbers()', 0),
(1221, 306, 'generate_string_numbers()', 1),
(1222, 306, 'num_string()', 0),
(1223, 307, 'str_ireplace()', 1),
(1224, 307, 'str_replace_all()', 0),
(1225, 307, 'replace_word()', 0),
(1226, 307, 'replace_all()', 0),
(1227, 308, 'str_starts_with()', 1),
(1228, 308, 'startswith()', 0),
(1229, 308, 'str_begin()', 0),
(1230, 308, 'str_check_start()', 0),
(1231, 309, 'str_ends_with()', 1),
(1232, 309, 'endswith()', 0),
(1233, 309, 'str_finish()', 0),
(1234, 309, 'str_check_end()', 0),
(1235, 310, 'base64_encode()', 1),
(1236, 310, 'encode_base64()', 0),
(1237, 310, 'convert_to_base64()', 0),
(1238, 310, 'string_to_base64()', 0),
(1239, 311, 'base64_decode()', 1),
(1240, 311, 'decode_base64()', 0),
(1241, 311, 'convert_from_base64()', 0),
(1242, 311, 'string_from_base64()', 0),
(1243, 312, 'utf8_encode()', 1),
(1244, 312, 'encode_utf8()', 0),
(1245, 312, 'convert_to_utf8()', 0),
(1246, 312, 'string_to_utf8()', 0),
(1247, 313, 'utf8_decode()', 1),
(1248, 313, 'decode_utf8()', 0),
(1249, 313, 'convert_from_utf8()', 0),
(1250, 313, 'string_from_utf8()', 0),
(1251, 314, 'ascii()', 1),
(1252, 314, 'convert_to_ascii()', 0),
(1253, 314, 'string_to_ascii()', 0),
(1254, 314, 'to_ascii()', 0),
(1255, 315, 'ctype_digit()', 1),
(1256, 315, 'is_digit()', 0),
(1257, 315, 'check_number()', 0),
(1258, 315, 'is_numeric()', 0),
(1259, 316, 'ctype_alpha()', 1),
(1260, 316, 'is_alpha()', 0),
(1261, 316, 'check_letters()', 0),
(1262, 316, 'is_string()', 0),
(1263, 317, 'ctype_alnum()', 1),
(1264, 317, 'is_alnum()', 0),
(1265, 317, 'check_alpha_num()', 0),
(1266, 317, 'is_string_alnum()', 0),
(1267, 318, 'ctype_lower()', 1),
(1268, 318, 'is_lower()', 0),
(1269, 318, 'check_lowercase()', 0),
(1270, 318, 'is_string_lower()', 0),
(1271, 319, 'ctype_upper()', 1),
(1272, 319, 'is_upper()', 0),
(1273, 319, 'check_uppercase()', 0),
(1274, 319, 'is_string_upper()', 0),
(1275, 320, 'ctype_xdigit()', 1),
(1276, 320, 'is_xdigit()', 0),
(1277, 320, 'check_hexadecimal()', 0),
(1278, 320, 'is_string_xdigit()', 0),
(1279, 321, 'strrev()', 1),
(1280, 321, 'reverse_string()', 0),
(1281, 321, 'flip_string()', 0),
(1282, 321, 'invert_string()', 0),
(1283, 322, 'substr()', 1),
(1284, 322, 'get_string_part()', 0),
(1285, 322, 'extract_string()', 0),
(1286, 322, 'string_section()', 0),
(1287, 323, 'substr()', 1),
(1288, 323, 'get_string_part_last()', 0),
(1289, 323, 'extract_string_last()', 0),
(1290, 323, 'string_section_last()', 0),
(1291, 324, 'substr()', 1),
(1292, 324, 'get_string_part_end()', 0),
(1293, 324, 'extract_string_end()', 0),
(1294, 324, 'string_section_end()', 0),
(1295, 325, 'trim()', 1),
(1296, 325, 'strip_string()', 0),
(1297, 325, 'clear_string()', 0),
(1298, 325, 'remove_spaces()', 0),
(1299, 326, 'ltrim()', 1),
(1300, 326, 'remove_left_spaces()', 0),
(1301, 326, 'clear_left_string()', 0),
(1302, 326, 'strip_left_string()', 0),
(1303, 327, 'date()', 1),
(1304, 327, 'current_date()', 0),
(1305, 327, 'current_time()', 0),
(1306, 327, 'time()', 0),
(1307, 328, 'time()', 1),
(1308, 328, 'get_timestamp()', 0),
(1309, 328, 'current_timestamp()', 0),
(1310, 328, 'timestamp_now()', 0),
(1311, 329, 'date()', 1),
(1312, 329, 'timestamp_to_date()', 0),
(1313, 329, 'convert_timestamp()', 0),
(1314, 329, 'time_to_date()', 0),
(1315, 330, 'strtotime()', 0),
(1316, 330, 'date_diff()', 1),
(1317, 330, 'calculate_time()', 0),
(1318, 330, 'time_difference()', 0),
(1319, 331, 'strtotime()', 0),
(1320, 331, 'date_diff()', 1),
(1321, 331, 'calculate_days()', 0),
(1322, 331, 'day_difference()', 0),
(1323, 332, 'date_add()', 1),
(1324, 332, 'add_time()', 0),
(1325, 332, 'time_add()', 0),
(1326, 332, 'append_date()', 0),
(1327, 333, 'date_sub()', 1),
(1328, 333, 'subtract_time()', 0),
(1329, 333, 'time_sub()', 0),
(1330, 333, 'remove_date()', 0),
(1331, 334, 'strtotime()', 1),
(1332, 334, 'date_to_timestamp()', 0),
(1333, 334, 'convert_date()', 0),
(1334, 334, 'time_to_timestamp()', 0),
(1335, 335, 'date()', 1),
(1336, 335, 'timezone_date()', 0),
(1337, 335, 'set_timezone()', 0),
(1338, 335, 'convert_timezone()', 0),
(1339, 336, 'date_format()', 1),
(1340, 336, 'format_date()', 0),
(1341, 336, 'convert_date_format()', 0),
(1342, 336, 'change_date_format()', 0),
(1343, 337, 'date()', 0),
(1344, 337, 'month_name()', 1),
(1345, 337, 'get_month()', 0),
(1346, 337, 'name_month()', 0),
(1347, 338, 'date()', 0),
(1348, 338, 'day_name()', 1),
(1349, 338, 'get_day()', 0),
(1350, 338, 'name_day()', 0),
(1351, 339, 'date()', 0),
(1352, 339, 'day_number()', 1),
(1353, 339, 'get_day_number()', 0),
(1354, 339, 'number_day()', 0),
(1355, 340, 'checkdate()', 1),
(1356, 340, 'validate_date()', 0),
(1357, 340, 'is_valid_date()', 0),
(1358, 340, 'date_check()', 0),
(1359, 341, 'DateTime::createFromFormat()', 1),
(1360, 341, 'create_datetime()', 0),
(1361, 341, 'datetime_from_string()', 0),
(1362, 341, 'parse_date()', 0),
(1363, 342, 'DateTime::createFromFormat()', 0),
(1364, 342, 'create_datetime()', 0),
(1365, 342, 'datetime_from_timestamp()', 1),
(1366, 342, 'parse_timestamp()', 0),
(1367, 343, 'DateTime::add()', 1),
(1368, 343, 'add_time()', 0),
(1369, 343, 'time_add()', 0),
(1370, 343, 'append_datetime()', 0),
(1371, 344, 'DateTime::sub()', 1),
(1372, 344, 'subtract_time()', 0),
(1373, 344, 'time_sub()', 0),
(1374, 344, 'remove_datetime()', 0),
(1375, 345, 'DateTime::format()', 1),
(1376, 345, 'get_datetime_value()', 0),
(1377, 345, 'datetime_attribute()', 0);
INSERT INTO `cautraloi` (`macautl`, `macauhoi`, `noidungtl`, `ladapan`) VALUES
(1378, 345, 'get_datetime_property()', 0),
(1379, 346, 'DateTime::diff()', 1),
(1380, 346, 'compare_datetime()', 0),
(1381, 346, 'datetime_compare()', 0),
(1382, 346, 'DateTime::compare()', 0),
(1383, 347, 'DateTime::format()', 1),
(1384, 347, 'datetime_to_string()', 0),
(1385, 347, 'convert_datetime()', 0),
(1386, 347, 'DateTime::toString()', 0),
(1387, 348, 'DateTime::format()', 1),
(1388, 348, 'format_datetime()', 0),
(1389, 348, 'convert_datetime_format()', 0),
(1390, 348, 'change_datetime_format()', 0),
(1391, 349, 'DateTimeZone::__construct()', 1),
(1392, 349, 'create_timezone()', 0),
(1393, 349, 'timezone_from_string()', 0),
(1394, 349, 'parse_timezone()', 0),
(1395, 350, 'DateTime::setTimezone()', 1),
(1396, 350, 'set_timezone()', 0),
(1397, 350, 'timezone_set()', 0),
(1398, 350, 'DateTime::timezone()', 0),
(1399, 351, 'timezone_identifiers_list()', 1),
(1400, 351, 'list_timezones()', 0),
(1401, 351, 'supported_timezones()', 0),
(1402, 351, 'get_timezones()', 0),
(1403, 352, 'DateTime::setTimezone()', 1),
(1404, 352, 'set_timezone()', 0),
(1405, 352, 'convert_timezone()', 0),
(1406, 352, 'DateTime::convert()', 0),
(1407, 353, 'DateInterval::createFromDateString()', 1),
(1408, 353, 'create_date_interval()', 0),
(1409, 353, 'interval_from_string()', 0),
(1410, 353, 'parse_interval()', 0),
(1411, 354, 'DateTime::diff()', 0),
(1412, 354, 'DateInterval::diff()', 1),
(1413, 354, 'interval_between()', 0),
(1414, 354, 'calculate_interval()', 0),
(1415, 355, 'strtotime()', 1),
(1416, 355, 'DateTime::diff()', 0),
(1417, 355, 'DateInterval::diff()', 0),
(1418, 355, 'calculate_time_difference()', 0),
(1419, 356, 'DateTime::diff()', 0),
(1420, 356, 'DateInterval::diff()', 1),
(1421, 356, 'calculate_minutes_difference()', 0),
(1422, 356, 'strtotime()', 0),
(1423, 357, 'DateInterval::diff()', 1),
(1424, 357, 'DateTime::diff()', 0),
(1425, 357, 'calculate_hours_difference()', 0),
(1426, 357, 'strtotime()', 0),
(1427, 358, 'DateInterval::diff()', 1),
(1428, 358, 'DateTime::diff()', 0),
(1429, 358, 'calculate_days_difference()', 0),
(1430, 358, 'strtotime()', 0),
(1431, 359, 'DateInterval::diff()', 1),
(1432, 359, 'DateTime::diff()', 0),
(1433, 359, 'calculate_years_difference()', 0),
(1434, 359, 'strtotime()', 0),
(1435, 360, 'DateTime::createFromFormat()', 0),
(1436, 360, 'create_datetime()', 0),
(1437, 360, 'datetime_from_date_time()', 0),
(1438, 360, 'DateTime::create()', 1),
(1439, 361, 'DateTime::createFromFormat()', 0),
(1440, 361, 'create_datetime()', 0),
(1441, 361, 'datetime_from_timestamp()', 0),
(1442, 361, 'DateTime::createFromTimestamp()', 1),
(1443, 362, 'checkdate()', 0),
(1444, 362, 'is_last_day_of_month()', 1),
(1445, 362, 'is_month_end()', 0),
(1446, 362, 'last_day_of_month()', 0),
(1447, 363, 'date()', 0),
(1448, 363, 'week_number()', 1),
(1449, 363, 'get_week_number()', 0),
(1450, 363, 'number_week()', 0),
(1451, 364, 'date()', 0),
(1452, 364, 'week_number()', 0),
(1453, 364, 'get_week_number()', 0),
(1454, 364, 'number_week_in_month()', 1),
(1455, 365, 'date()', 0),
(1456, 365, 'week_number()', 0),
(1457, 365, 'get_week_number()', 1),
(1458, 365, 'number_weekday()', 0),
(1459, 366, 'DateTime::format()', 1),
(1460, 366, 'format_datetime()', 0),
(1461, 366, 'create_date_string()', 0),
(1462, 366, 'DateTime::toString()', 0),
(1463, 367, 'DateTime::format()', 1),
(1464, 367, 'format_datetime()', 0),
(1465, 367, 'convert_datetime_format()', 0),
(1466, 367, 'change_datetime_format()', 0),
(1467, 368, 'date()', 0),
(1468, 368, 'month_name()', 1),
(1469, 368, 'get_month_name()', 0),
(1470, 368, 'name_month()', 0),
(1471, 369, 'date()', 0),
(1472, 369, 'month_number()', 1),
(1473, 369, 'get_month_number()', 0),
(1474, 369, 'number_month()', 0),
(1475, 370, 'date()', 0),
(1476, 370, 'day_name()', 1),
(1477, 370, 'get_day_name()', 0),
(1478, 370, 'name_day()', 0),
(1479, 371, 'date()', 0),
(1480, 371, 'day_number()', 1),
(1481, 371, 'get_day_number()', 0),
(1482, 371, 'number_day()', 0),
(1483, 372, 'DatePeriod::__construct()', 1),
(1484, 372, 'create_date_period()', 0),
(1485, 372, 'date_range()', 0),
(1486, 372, 'DateTime::range()', 0),
(1487, 373, 'DateTime::diff()', 0),
(1488, 373, 'DateInterval::diff()', 0),
(1489, 373, 'DatePeriod::getDates()', 1),
(1490, 373, 'get_date_range()', 0),
(1491, 374, 'random_date()', 1),
(1492, 374, 'generate_random_date()', 0),
(1493, 374, 'DateTime::getTimestamp()', 0),
(1494, 374, 'DateTime::setTimestamp()', 0),
(1495, 375, 'validate_date_format()', 0),
(1496, 375, 'checkdate()', 1),
(1497, 375, 'validate_datetime()', 0),
(1498, 375, 'is_date_format()', 0),
(1499, 376, 'DateTime::createFromFormat()', 1),
(1500, 376, 'convert_date_format()', 0),
(1501, 376, 'change_date_format()', 0),
(1502, 376, 'DateTime::modify()', 0),
(1503, 377, 'date()', 0),
(1504, 377, 'is_weekday()', 0),
(1505, 377, 'DateTime::format()', 0),
(1506, 377, 'DateTime::isWeekday()', 1),
(1507, 378, 'DateTime::diff()', 1),
(1508, 378, 'DateInterval::diff()', 0),
(1509, 378, 'calculate_hours_difference()', 0),
(1510, 378, 'strtotime()', 0),
(1511, 379, 'DateTime::diff()', 1),
(1512, 379, 'DateInterval::diff()', 0),
(1513, 379, 'calculate_minutes_difference()', 0),
(1514, 379, 'strtotime()', 0),
(1515, 380, 'DateTime::diff()', 1),
(1516, 380, 'DateInterval::diff()', 0),
(1517, 380, 'calculate_seconds_difference()', 0),
(1518, 380, 'strtotime()', 0),
(1519, 381, 'DateTime::diff()', 0),
(1520, 381, 'DateInterval::diff()', 1),
(1521, 381, 'calculate_days_difference()', 0),
(1522, 381, 'strtotime()', 0),
(1523, 382, 'DateTime::diff()', 0),
(1524, 382, 'DateInterval::diff()', 0),
(1525, 382, 'calculate_weeks_difference()', 1),
(1526, 382, 'strtotime()', 0),
(1527, 383, 'DateTime::diff()', 0),
(1528, 383, 'DateInterval::diff()', 0),
(1529, 383, 'calculate_months_difference()', 1),
(1530, 383, 'strtotime()', 0),
(1531, 384, 'DateTime::diff()', 0),
(1532, 384, 'DateInterval::diff()', 0),
(1533, 384, 'calculate_years_difference()', 1),
(1534, 384, 'strtotime()', 0),
(1535, 385, 'calculate_session_expiry_time()', 1),
(1536, 385, 'session_cache_expire()', 0),
(1537, 385, 'session_cache_limiter()', 0),
(1538, 385, 'session_set_cookie_params()', 0),
(1539, 386, 'date_default_timezone_set()', 0),
(1540, 386, 'DateTimeZone::__construct()', 0),
(1541, 386, 'DateTime::setTimezone()', 1),
(1542, 386, 'timezone_convert()', 0),
(1543, 387, 'date_default_timezone_get()', 1),
(1544, 387, 'DateTimeZone::getName()', 0),
(1545, 387, 'getTimezoneName()', 0),
(1546, 387, 'timezone_current()', 0),
(1547, 388, 'is_dir()', 0),
(1548, 388, 'is_hidden()', 1),
(1549, 388, 'check_hidden()', 0),
(1550, 388, 'verify_directory()', 0),
(1551, 389, 'basename()', 1),
(1552, 389, 'file_name()', 0),
(1553, 389, 'get_file_name()', 0),
(1554, 389, 'name()', 0),
(1555, 390, 'copy()', 1),
(1556, 390, 'duplicate_file()', 0),
(1557, 390, 'replicate_file()', 0),
(1558, 390, 'clone_file()', 0),
(1559, 391, 'rename()', 1),
(1560, 391, 'change_name()', 0),
(1561, 391, 'modify_name()', 0),
(1562, 391, 'update_name()', 0),
(1563, 392, 'is_link()', 1),
(1564, 392, 'is_symbolic_link()', 0),
(1565, 392, 'check_symbolic_link()', 0),
(1566, 392, 'verify_link()', 0),
(1567, 393, 'pathinfo()', 1),
(1568, 393, 'file_extension()', 0),
(1569, 393, 'get_file_extension()', 0),
(1570, 393, 'extension()', 0),
(1571, 394, 'is_fifo()', 1),
(1572, 394, 'check_fifo()', 0),
(1573, 394, 'verify_fifo()', 0),
(1574, 394, 'fifo_exists()', 0),
(1575, 395, 'is_char()', 1),
(1576, 395, 'check_char()', 0),
(1577, 395, 'verify_char()', 0),
(1578, 395, 'char_exists()', 0),
(1579, 396, 'dirname()', 1),
(1580, 396, 'parent_directory()', 0),
(1581, 396, 'get_parent_directory()', 0),
(1582, 396, 'up_directory()', 0),
(1583, 397, 'rmdir()', 1),
(1584, 397, 'remove_directory()', 0),
(1585, 397, 'delete_folder()', 0),
(1586, 397, 'erase_directory()', 0),
(1587, 398, 'is_socket()', 1),
(1588, 398, 'check_socket()', 0),
(1589, 398, 'verify_socket()', 0),
(1590, 398, 'socket_exists()', 0),
(1591, 399, 'filemtime()', 1),
(1592, 399, 'get_file_time()', 0),
(1593, 399, 'file_time()', 0),
(1594, 399, 'time()', 0),
(1595, 400, 'is_ascii()', 1),
(1596, 400, 'check_ascii()', 0),
(1597, 400, 'verify_ascii()', 0),
(1598, 400, 'ascii_exists()', 0),
(1599, 401, 'stat()', 1),
(1600, 401, 'file_info()', 0),
(1601, 401, 'get_file_info()', 0),
(1602, 401, 'info()', 0),
(1603, 402, 'is_reg()', 1),
(1604, 402, 'check_reg()', 0),
(1605, 402, 'verify_reg()', 0),
(1606, 402, 'reg_exists()', 0),
(1607, 403, 'file()', 1),
(1608, 403, 'read_file()', 0),
(1609, 403, 'get_file_content()', 0),
(1610, 403, 'file_content()', 0),
(1611, 404, 'file_get_contents()', 1),
(1612, 404, 'read_file()', 0),
(1613, 404, 'get_file_content()', 0),
(1614, 404, 'file_content()', 0),
(1615, 405, 'file_put_contents()', 1),
(1616, 405, 'write_file()', 0),
(1617, 405, 'put_file_content()', 0),
(1618, 405, 'file_content()', 0),
(1619, 406, 'chmod()', 1),
(1620, 406, 'change_permission()', 0),
(1621, 406, 'modify_permission()', 0),
(1622, 406, 'update_permission()', 0),
(1623, 407, 'chown()', 1),
(1624, 407, 'change_owner()', 0),
(1625, 407, 'modify_owner()', 0),
(1626, 407, 'update_owner()', 0),
(1627, 408, 'chgrp()', 1),
(1628, 408, 'change_group()', 0),
(1629, 408, 'modify_group()', 0),
(1630, 408, 'update_group()', 0),
(1631, 409, 'is_webp()', 1),
(1632, 409, 'check_webp()', 0),
(1633, 409, 'verify_webp()', 0),
(1634, 409, 'webp_exists()', 0),
(1635, 410, 'filesize()', 0),
(1636, 410, 'human_file_size()', 1),
(1637, 410, 'get_human_file_size()', 0),
(1638, 410, 'file_size()', 0),
(1639, 411, 'du()', 0),
(1640, 411, 'folder_size()', 1),
(1641, 411, 'get_folder_size()', 0),
(1642, 411, 'directory_size()', 0),
(1643, 412, 'scandir()', 1),
(1644, 412, 'list_files()', 0),
(1645, 412, 'get_files()', 0),
(1646, 412, 'files()', 0),
(1647, 413, 'str_getcsv()', 1),
(1648, 413, 'read_csv()', 0),
(1649, 413, 'get_csv_content()', 0),
(1650, 413, 'csv_content()', 0),
(1651, 414, 'fputcsv()', 1),
(1652, 414, 'write_csv()', 0),
(1653, 414, 'put_csv_content()', 0),
(1654, 414, 'csv_content()', 0),
(1655, 415, 'is_pdf()', 1),
(1656, 415, 'check_pdf()', 0),
(1657, 415, 'verify_pdf()', 0),
(1658, 415, 'pdf_exists()', 0),
(1659, 416, 'is_zip()', 1),
(1660, 416, 'check_zip()', 0),
(1661, 416, 'verify_zip()', 0),
(1662, 416, 'zip_exists()', 0),
(1663, 417, 'zip()', 1),
(1664, 417, 'compress()', 0),
(1665, 417, 'archive()', 0),
(1666, 417, 'pack()', 0),
(1667, 418, 'unzip()', 0),
(1668, 418, 'extract()', 1),
(1669, 418, 'decompress()', 0),
(1670, 418, 'unarchive()', 0),
(1671, 419, 'fopen()', 1),
(1672, 419, 'new_file()', 0),
(1673, 419, 'create_file()', 0),
(1674, 419, 'open_file()', 0),
(1675, 420, 'fclose()', 1),
(1676, 420, 'close_file()', 0),
(1677, 420, 'end_file()', 0),
(1678, 420, 'shut_file()', 0),
(1679, 421, 'rename()', 1),
(1680, 421, 'change_name()', 0),
(1681, 421, 'modify_name()', 0),
(1682, 421, 'update_name()', 0),
(1683, 422, 'unlink()', 1),
(1684, 422, 'delete_file()', 0),
(1685, 422, 'remove_file()', 0),
(1686, 422, 'erase_file()', 0),
(1687, 423, 'is_png()', 1),
(1688, 423, 'check_png()', 0),
(1689, 423, 'verify_png()', 0),
(1690, 423, 'png_exists()', 0),
(1691, 424, 'is_jpeg()', 1),
(1692, 424, 'check_jpeg()', 0),
(1693, 424, 'verify_jpeg()', 0),
(1694, 424, 'jpeg_exists()', 0),
(1695, 425, 'is_gif()', 1),
(1696, 425, 'check_gif()', 0),
(1697, 425, 'verify_gif()', 0),
(1698, 425, 'gif_exists()', 0),
(1699, 426, 'is_bmp()', 1),
(1700, 426, 'check_bmp()', 0),
(1701, 426, 'verify_bmp()', 0),
(1702, 426, 'bmp_exists()', 0),
(1703, 427, 'is_webp()', 1),
(1704, 427, 'check_webp()', 0),
(1705, 427, 'verify_webp()', 0),
(1706, 427, 'webp_exists()', 0),
(1707, 428, 'is_mp4()', 1),
(1708, 428, 'check_mp4()', 0),
(1709, 428, 'verify_mp4()', 0),
(1710, 428, 'mp4_exists()', 0),
(1711, 429, 'is_avi()', 1),
(1712, 429, 'check_avi()', 0),
(1713, 429, 'verify_avi()', 0),
(1714, 429, 'avi_exists()', 0),
(1715, 430, 'is_mp3()', 1),
(1716, 430, 'check_mp3()', 0),
(1717, 430, 'verify_mp3()', 0),
(1718, 430, 'mp3_exists()', 0),
(1719, 431, 'mkdir()', 1),
(1720, 431, 'new_dir()', 0),
(1721, 431, 'create_dir()', 0),
(1722, 431, 'make_dir()', 0),
(1723, 432, 'rmdir()', 1),
(1724, 432, 'delete_dir()', 0),
(1725, 432, 'remove_dir()', 0),
(1726, 432, 'erase_dir()', 0),
(1727, 433, 'rmdir_recursive()', 0),
(1728, 433, 'delete_dir_recursive()', 1),
(1729, 433, 'remove_dir_recursive()', 0),
(1730, 433, 'erase_dir_recursive()', 0),
(1731, 434, 'rename()', 1),
(1732, 434, 'change_name()', 0),
(1733, 434, 'modify_name()', 0),
(1734, 434, 'update_name()', 0),
(1735, 435, 'scandir()', 1),
(1736, 435, 'list_directories()', 0),
(1737, 435, 'get_directories()', 0),
(1738, 435, 'directories()', 0),
(1739, 436, 'glob()', 0),
(1740, 436, 'get_files_recursive()', 1),
(1741, 436, 'files_recursive()', 0),
(1742, 436, 'list_files_recursive()', 0),
(1743, 437, 'file_exists()', 1),
(1744, 437, 'item_exists()', 0),
(1745, 437, 'object_exists()', 0),
(1746, 437, 'entity_exists()', 0),
(1747, 438, 'is_file()', 1),
(1748, 438, 'check_file()', 0),
(1749, 438, 'verify_file()', 0),
(1750, 438, 'file_path()', 0),
(1751, 439, 'is_dir()', 1),
(1752, 439, 'check_dir()', 0),
(1753, 439, 'verify_dir()', 0),
(1754, 439, 'dir_path()', 0),
(1755, 440, '<p>fread($file, $length)</p>\n', 1),
(1756, 440, '<p>fwrite($file, $length)</p>\n', 0),
(1757, 440, '<p>fdir($file, $length)</p>\n', 0),
(1758, 440, '<p>Kh&ocirc;ng đ&aacute;p &aacute;n n&agrave;o đ&uacute;ng</p>\n', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdethi`
--

CREATE TABLE `chitietdethi` (
  `made` int(11) NOT NULL,
  `macauhoi` int(11) NOT NULL,
  `thutu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdethi`
--

INSERT INTO `chitietdethi` (`made`, `macauhoi`, `thutu`) VALUES
(5, 100, 1),
(7, 396, 1),
(7, 399, 2),
(7, 402, 3),
(10, 154, 1),
(10, 155, 2),
(10, 157, 3),
(10, 158, 4),
(10, 160, 5),
(10, 161, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietketqua`
--

CREATE TABLE `chitietketqua` (
  `makq` int(11) NOT NULL,
  `macauhoi` int(11) NOT NULL,
  `dapanchon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietketqua`
--

INSERT INTO `chitietketqua` (`makq`, `macauhoi`, `dapanchon`) VALUES
(37, 2, 5),
(37, 3, 9),
(37, 5, 17),
(37, 9, 33),
(37, 33, 129),
(37, 35, 137),
(40, 154, 611),
(39, 154, 614),
(40, 155, 616),
(39, 155, 618),
(40, 157, 624),
(39, 157, 626),
(40, 158, 629),
(39, 158, 630),
(39, 160, 638),
(40, 160, 638),
(39, 161, 642),
(40, 161, 642),
(41, 219, 871),
(41, 220, 876),
(38, 237, 943),
(41, 238, 949),
(41, 242, 965),
(38, 249, 991),
(38, 250, 995),
(38, 251, 999),
(38, 259, 1031),
(38, 260, 1036),
(41, 292, 1165),
(41, 294, 1174);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietnhom`
--

CREATE TABLE `chitietnhom` (
  `manhom` int(11) NOT NULL,
  `manguoidung` varchar(50) NOT NULL DEFAULT '0',
  `hienthi` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietnhom`
--

INSERT INTO `chitietnhom` (`manhom`, `manguoidung`, `hienthi`) VALUES
(0, '1234567890', 1),
(0, '5220006300', 1),
(3, '5220000080', 1),
(3, '5220000084', 1),
(21, '52200017', 1),
(21, '52200080', 1);

--
-- Bẫy `chitietnhom`
--
DELIMITER $$
CREATE TRIGGER `update_group_participants_after_delete` AFTER DELETE ON `chitietnhom` FOR EACH ROW UPDATE nhom
SET siso = 
(SELECT count(*) FROM chitietnhom where manhom = OLD.manhom)
WHERE manhom = OLD.manhom
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_group_participants_after_insert` AFTER INSERT ON `chitietnhom` FOR EACH ROW UPDATE nhom
SET siso = 
(SELECT count(*) FROM chitietnhom where manhom = NEW.manhom)
WHERE manhom = NEW.manhom
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietquyen`
--

CREATE TABLE `chitietquyen` (
  `manhomquyen` int(11) NOT NULL,
  `chucnang` varchar(50) NOT NULL,
  `hanhdong` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietquyen`
--

INSERT INTO `chitietquyen` (`manhomquyen`, `chucnang`, `hanhdong`) VALUES
(1, 'chuong', 'create'),
(1, 'chuong', 'delete'),
(1, 'chuong', 'update'),
(1, 'chuong', 'view'),
(1, 'monhoc', 'create'),
(1, 'monhoc', 'delete'),
(1, 'monhoc', 'update'),
(1, 'monhoc', 'view'),
(1, 'nguoidung', 'create'),
(1, 'nguoidung', 'delete'),
(1, 'nguoidung', 'update'),
(1, 'nguoidung', 'view'),
(1, 'nhomquyen', 'create'),
(1, 'nhomquyen', 'delete'),
(1, 'nhomquyen', 'update'),
(1, 'nhomquyen', 'view'),
(1, 'phancong', 'create'),
(1, 'phancong', 'delete'),
(1, 'phancong', 'update'),
(1, 'phancong', 'view'),
(10, 'cauhoi', 'create'),
(10, 'cauhoi', 'view'),
(10, 'chuong', 'create'),
(10, 'chuong', 'delete'),
(10, 'chuong', 'update'),
(10, 'chuong', 'view'),
(10, 'dethi', 'create'),
(10, 'dethi', 'delete'),
(10, 'dethi', 'update'),
(10, 'dethi', 'view'),
(10, 'document', 'create'),
(10, 'document', 'delete'),
(10, 'document', 'update'),
(10, 'document', 'view'),
(10, 'hocphan', 'create'),
(10, 'hocphan', 'delete'),
(10, 'hocphan', 'update'),
(10, 'hocphan', 'view'),
(10, 'monhoc', 'view'),
(10, 'thongbao', 'create'),
(10, 'thongbao', 'delete'),
(10, 'thongbao', 'update'),
(10, 'thongbao', 'view'),
(11, 'tghocphan', 'join'),
(11, 'tgthi', 'join'),
(13, 'nguoidung', 'view'),
(14, 'tghocphan', 'join'),
(14, 'tgthi', 'join');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietthongbao`
--

CREATE TABLE `chitietthongbao` (
  `matb` int(11) NOT NULL,
  `manhom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietthongbao`
--

INSERT INTO `chitietthongbao` (`matb`, `manhom`) VALUES
(0, 0),
(0, 2),
(0, 3),
(5, 2),
(5, 3),
(6, 4),
(6, 5),
(6, 6),
(7, 11),
(14, 21),
(14, 23);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuong`
--

CREATE TABLE `chuong` (
  `machuong` int(11) NOT NULL,
  `tenchuong` varchar(255) NOT NULL,
  `mamonhoc` int(11) NOT NULL,
  `trangthai` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chuong`
--

INSERT INTO `chuong` (`machuong`, `tenchuong`, `mamonhoc`, `trangthai`) VALUES
(1, '1. ADT', 504008, 1),
(2, '2. Linked List', 504008, 1),
(3, '3. Stack & Queue', 504008, 1),
(4, '4. Recursion', 504008, 1),
(5, '5. Analysis of Algorithms', 504008, 1),
(6, '6. Sorting', 504008, 1),
(7, '7. Hashing', 504008, 1),
(8, '8. BST', 504008, 1),
(9, '9. AVL', 504008, 1),
(10, '10. Priority Queue & Binary Max Heap', 504008, 1),
(11, '11. Graph Basic', 504008, 1),
(12, '12. BFS & DFS', 504008, 1),
(13, '13. MST', 504008, 1),
(14, '14. Bellman Ford', 504008, 1),
(15, '15. Dijkstra', 504008, 1),
(16, '1.Process management', 502047, 1),
(17, '2.Threads and concurrency', 502047, 1),
(18, '3.Synchronization tools', 502047, 1),
(19, '4.Deadlock', 502047, 1),
(20, '5.Memory management', 502047, 1),
(21, '6.Virtual memory', 502047, 1),
(22, '7.I/O management', 502047, 1),
(23, '8.Mass-Storage Structure', 502047, 1),
(24, '9.File-System Interface', 502047, 1),
(25, '1.Cơ bản về PHP', 503073, 1),
(26, '2.Biến và kiểu dữ liệu', 503073, 1),
(27, '3.Câu lệnh điều khiển', 503073, 1),
(28, '4.Vòng lặp', 503073, 1),
(29, '5.Mảng', 503073, 1),
(30, '6.Hàm', 503073, 1),
(31, '7.Xử lý chuỗi', 503073, 1),
(32, '8.Xử lý ngày tháng', 503073, 1),
(33, '9.Xử lý file', 503073, 1),
(34, '10.Lập trình hướng đối tượng (OOP)', 503073, 1),
(35, '1.An overview of C/C++', 501042, 1),
(36, '2.Functions and Top-down design Techniques', 501042, 1),
(37, '3.Iteration Structures', 501042, 1),
(38, '4.Testing and debugging', 501042, 1),
(39, '5.Pointers and Arrays', 501042, 1),
(40, '6.Multi-dimensional arrays', 501042, 1),
(41, '7.Files', 501042, 1),
(42, '8.Characters and Strings', 501042, 1),
(43, '9.Recursion', 501042, 1),
(44, '10.Sorting and Searching', 501042, 1),
(45, '11.User-defined data types', 501042, 1),
(46, '1. Introduction to Java', 503005, 1),
(47, '2. Object – Class - Encapsulation in OOP	', 503005, 1),
(48, '3.Inheritance in OOP', 503005, 1),
(49, '4.Abstraction in OOP', 503005, 1),
(50, '5.Polymorphism in OOP', 503005, 1),
(51, '6.Java Collections', 503005, 1),
(52, '7.Exception handing and File processing', 503005, 1),
(53, '8.Modeling programming and OOP', 503005, 1),
(54, '9.Nested Class', 503005, 1),
(55, '10.Design Pattern', 503005, 1),
(56, '12.Testing', 501042, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmucchucnang`
--

CREATE TABLE `danhmucchucnang` (
  `chucnang` varchar(50) NOT NULL,
  `tenchucnang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmucchucnang`
--

INSERT INTO `danhmucchucnang` (`chucnang`, `tenchucnang`) VALUES
('caidat', 'Cài đặt'),
('cauhoi', 'Quản lý câu hỏi'),
('chuong', 'Quản lý chương'),
('dethi', 'Quản lý đề thi'),
('hocphan', 'Quản lý học phần'),
('monhoc', 'Quản lý môn học'),
('nguoidung', 'Quản lý người dùng'),
('nhomquyen', 'Quản lý nhóm quyền'),
('phancong', 'Quản lý phân công'),
('sinhvien', 'Sinh viên'),
('tailieu', 'Tài liệu giảng dạy'),
('tghocphan', 'Tham gia học phần'),
('tgthi', 'Tham gia thi'),
('thongbao', 'Thông báo');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dethi`
--

CREATE TABLE `dethi` (
  `made` int(11) NOT NULL,
  `monthi` int(11) DEFAULT NULL,
  `nguoitao` varchar(50) DEFAULT NULL,
  `tende` varchar(255) DEFAULT NULL,
  `thoigiantao` datetime DEFAULT current_timestamp(),
  `thoigianthi` int(11) DEFAULT NULL,
  `thoigianbatdau` datetime DEFAULT NULL,
  `thoigianketthuc` datetime DEFAULT NULL,
  `hienthibailam` tinyint(1) DEFAULT NULL,
  `xemdiemthi` tinyint(1) DEFAULT NULL,
  `xemdapan` tinyint(1) DEFAULT NULL,
  `troncauhoi` tinyint(1) DEFAULT NULL,
  `trondapan` tinyint(1) DEFAULT NULL,
  `nopbaichuyentab` tinyint(1) DEFAULT NULL,
  `loaide` int(11) DEFAULT NULL,
  `socaude` int(11) DEFAULT NULL,
  `socautb` int(11) DEFAULT NULL,
  `socaukho` int(11) DEFAULT NULL,
  `trangthai` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dethi`
--

INSERT INTO `dethi` (`made`, `monthi`, `nguoitao`, `tende`, `thoigiantao`, `thoigianthi`, `thoigianbatdau`, `thoigianketthuc`, `hienthibailam`, `xemdiemthi`, `xemdapan`, `troncauhoi`, `trondapan`, `nopbaichuyentab`, `loaide`, `socaude`, `socautb`, `socaukho`, `trangthai`) VALUES
(3, 503005, '52200084', '24/05', '2024-05-24 14:20:18', 30, '2024-05-25 12:00:00', '2024-05-26 12:00:00', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0),
(4, 503005, '52200084', '24/05', '2024-05-24 16:15:29', 5, '2024-05-24 17:00:00', '2024-05-28 12:00:00', 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0),
(5, 503005, '52200084', '24/05', '2024-05-24 16:31:43', 5, '2024-05-24 16:37:00', '2024-05-26 12:00:00', 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 1),
(6, 501042, '52200084', '25/05', '2024-05-25 20:00:37', 5, '2024-05-25 20:01:00', '2024-05-26 12:00:00', 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1),
(7, 503005, '52200084', '25052024', '2024-05-25 22:21:24', 5, '2024-05-25 22:22:00', '2024-05-30 12:00:00', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1),
(8, 504008, '52200028', '25052024', '2024-05-25 22:46:52', 15, '2024-05-25 22:47:00', '2024-05-31 12:00:00', 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 1),
(9, 503073, '50000000', 'Đề thi thử LT web và ứng dụng 26/05/2024', '2024-05-26 18:54:21', 15, '2024-05-26 19:00:00', '2024-06-02 12:00:00', 1, 1, 0, 0, 0, 0, 1, 2, 2, 2, 1),
(10, 503073, '50000000', 'Đề kiểm tra 5 phút', '2024-05-26 19:09:01', 5, '2024-05-26 19:15:00', '2024-05-26 20:00:00', 1, 1, 0, 0, 0, 0, 0, 2, 2, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dethitudong`
--

CREATE TABLE `dethitudong` (
  `made` int(11) NOT NULL,
  `machuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dethitudong`
--

INSERT INTO `dethitudong` (`made`, `machuong`) VALUES
(3, 0),
(4, 47),
(4, 49),
(4, 52),
(5, 47),
(5, 49),
(5, 51),
(6, 35),
(6, 36),
(6, 37),
(6, 38),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 33);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `mamonhoc` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `documents`
--

INSERT INTO `documents` (`id`, `mamonhoc`, `title`, `filename`, `uploaded_at`) VALUES
(1, 501042, 'Tài liệu thực hành', 'LAB1.docx', '2024-05-16 15:16:23'),
(2, 501042, 'Tài liệu thực hành', 'LAB2.pdf', '2024-05-16 15:33:59'),
(3, 501042, 'Tài liệu thực hành', 'LAB3.pdf', '2024-05-16 15:34:15'),
(4, 501042, 'Tài liệu thực hành', 'LAB4.pdf', '2024-05-16 15:34:21'),
(5, 501042, 'Tài liệu thực hành', 'LAB5.pdf', '2024-05-16 15:34:30'),
(6, 501042, 'Slide bài giảng', 'Gioithieu.pdf', '2024-05-16 15:36:15'),
(7, 501042, 'Slide bài giảng', 'MangArray.pdf', '2024-05-16 15:36:29'),
(8, 501042, 'Slide bài giảng', 'DeQui.pdf', '2024-05-16 15:36:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giaodethi`
--

CREATE TABLE `giaodethi` (
  `made` int(11) NOT NULL,
  `manhom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giaodethi`
--

INSERT INTO `giaodethi` (`made`, `manhom`) VALUES
(3, 2),
(3, 3),
(4, 2),
(4, 3),
(5, 2),
(5, 3),
(6, 0),
(7, 2),
(7, 3),
(8, 18),
(9, 21),
(9, 23),
(10, 21),
(10, 23);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ketqua`
--

CREATE TABLE `ketqua` (
  `makq` int(11) NOT NULL,
  `made` int(11) NOT NULL,
  `manguoidung` varchar(50) NOT NULL DEFAULT '',
  `diemthi` double DEFAULT NULL,
  `thoigianvaothi` datetime DEFAULT current_timestamp(),
  `thoigianlambai` int(11) DEFAULT NULL,
  `socaudung` int(11) DEFAULT NULL,
  `solanchuyentab` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ketqua`
--

INSERT INTO `ketqua` (`makq`, `made`, `manguoidung`, `diemthi`, `thoigianvaothi`, `thoigianlambai`, `socaudung`, `solanchuyentab`) VALUES
(1, 2, '52200080', NULL, '2024-05-24 13:40:43', NULL, NULL, 0),
(24, 2, '52200081', NULL, '2024-05-24 14:03:32', NULL, NULL, 4),
(37, 8, '52200080', 5, '2024-05-25 22:47:28', 14, 3, 0),
(41, 9, '52200017', 3.33, '2024-05-26 19:29:15', 9, 2, 0),
(38, 9, '52200080', 10, '2024-05-26 19:19:45', 41, 6, 5),
(40, 10, '52200017', 3.33, '2024-05-26 19:28:54', 11, 2, 0),
(39, 10, '52200080', 1.67, '2024-05-26 19:22:18', 274, 1, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monhoc`
--

CREATE TABLE `monhoc` (
  `mamonhoc` int(11) NOT NULL,
  `tenmonhoc` varchar(255) NOT NULL,
  `sotinchi` int(11) DEFAULT NULL,
  `sotietlythuyet` int(11) DEFAULT NULL,
  `sotietthuchanh` int(11) DEFAULT NULL,
  `trangthai` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `monhoc`
--

INSERT INTO `monhoc` (`mamonhoc`, `tenmonhoc`, `sotinchi`, `sotietlythuyet`, `sotietthuchanh`, `trangthai`) VALUES
(501042, 'Phương pháp lập trình', 3, 30, 30, 1),
(502047, 'Nhập môn hệ điều hành', 3, 30, 30, 1),
(502051, 'Hệ cơ sở dữ liệu', 4, 45, 30, 1),
(503005, 'Lập trình hướng đối tượng', 4, 45, 30, 1),
(503073, 'Lập trình web và ứng dụng', 4, 45, 30, 1),
(504008, 'Cấu trúc dữ liệu và giải thuật', 4, 45, 30, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `email` varchar(255) NOT NULL,
  `id` varchar(8) NOT NULL,
  `googleid` varchar(150) DEFAULT NULL,
  `hoten` varchar(255) NOT NULL,
  `gioitinh` tinyint(1) DEFAULT NULL,
  `ngaysinh` date DEFAULT '1990-01-01',
  `avatar` varchar(255) DEFAULT NULL,
  `ngaythamgia` date NOT NULL DEFAULT current_timestamp(),
  `matkhau` varchar(60) DEFAULT NULL,
  `trangthai` int(11) NOT NULL,
  `sodienthoai` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `manhomquyen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`email`, `id`, `googleid`, `hoten`, `gioitinh`, `ngaysinh`, `avatar`, `ngaythamgia`, `matkhau`, `trangthai`, `sodienthoai`, `token`, `otp`, `manhomquyen`) VALUES
('dzoanxuanthanh@tdtu.edu.vn', '50000000', NULL, 'Dzoãn Xuân Thanh', 1, '1995-05-11', 'doanxuanthanh-66523c6c05aa5.jpg', '2024-05-26', '$2y$10$3mWgB.lD.j99k8pCW04GMuWyaWCHPimnFvzLTIFe93ErqK3B8pgsG', 1, NULL, '1716745374$2y$10$QeyV4LixYN.UCL2FTGkzVeaFn6aDY6UTrjk.eji.4A5On8wBjfL7m', NULL, 10),
('52200001@student.tdtu.edu.vn', '52200001', NULL, 'Bùi Đông Tấn Đạt', 1, '2004-05-05', NULL, '2024-05-26', '$2y$10$0iepudxAmDA/lwSJvD4km.a1skwxFWVxxZO8BJITf248yrWIqK7kC', 1, NULL, NULL, NULL, 11),
('52200017@student.tdtu.edu.vn', '52200017', NULL, 'Hà Thị Nguyệt Hà', 0, '2004-05-07', NULL, '2024-05-26', '$2y$10$ILAofZVWIJa/a8.UZRJZwOKOBmYCNw/S2MxTS4sgaS4rgjfF9p3/.', 1, NULL, '1716741479$2y$10$OyUm.gezS7p.4WmLNiwuMOjHePQjS4yGLsV.3TZBGuSiIxKwSGEkq', NULL, 11),
('52200028@student.tdtu.edu.vn', '52200028', '100101229550800922586', 'Lâm Huỳnh Như', 0, '2004-01-26', 'avt-642a79bfbf4dd.jpg', '2023-04-03', '$2y$10$F3FQFNZwijEhnKf4EVrkVeaJNtW0icztly.M4sNrHn2GDsT1DsARy', 1, NULL, '1716745229$2y$10$zmXaVmyVM8UQozoz9hcRa.JxJ66qWg8cuS2ge/0z7dHvXAypphdI6', NULL, 1),
('52200080@student.tdtu.edu.vn', '52200080', NULL, 'Nguyễn Nhật Huy', 1, '1990-01-27', NULL, '2023-04-03', '$2y$10$a2demg5OZygKUd5i.YDez.Y8MrtZBgu34W51quO38dF1FoipCjrTa', 1, NULL, '1716742808$2y$10$Q4zJbHj3kJ6D/Vt7ATnuOuJ.qfMDvswOP/oKDk9jD4fTtcD.6No/u', NULL, 11),
('52200084@student.tdtu.edu.vn', '52200084', NULL, 'Nguyễn Quốc Huy', 1, '2004-08-22', '358140110_1338057256775146_7731038226251460712_n-6643a4dab2af7.jpg', '2023-04-03', '$2y$10$Adc/bN3b/DF9NVdwJyYvkeJOIvc4wy4Az31BZStbb3NGvKypz2K/q', 1, NULL, '1716740568$2y$10$CjTuXUb.lZGPrmlrFR4Bl.RUIrdya/esD.WzteeIELUu8hkf.mDFK', NULL, 10);

--
-- Bẫy `nguoidung`
--
DELIMITER $$
CREATE TRIGGER `delete_chitietnhom_by_id` BEFORE DELETE ON `nguoidung` FOR EACH ROW DELETE FROM chitietnhom WHERE chitietnhom.manguoidung = OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom`
--

CREATE TABLE `nhom` (
  `manhom` int(11) NOT NULL,
  `tennhom` varchar(255) NOT NULL,
  `mamoi` varchar(50) DEFAULT NULL,
  `siso` int(11) DEFAULT 0,
  `ghichu` varchar(255) DEFAULT NULL,
  `namhoc` int(11) DEFAULT NULL,
  `hocky` int(11) DEFAULT NULL,
  `trangthai` tinyint(1) DEFAULT 1,
  `hienthi` tinyint(1) DEFAULT 1,
  `giangvien` varchar(50) NOT NULL DEFAULT '',
  `mamonhoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhom`
--

INSERT INTO `nhom` (`manhom`, `tennhom`, `mamoi`, `siso`, `ghichu`, `namhoc`, `hocky`, `trangthai`, `hienthi`, `giangvien`, `mamonhoc`) VALUES
(19, 'Nhóm 1', '22dbaf9', 0, 'Ca 1 - Phòng: C403', 2024, 1, 1, 1, '52200084', 503073),
(20, 'Nhóm 2', 'daedc8f', 0, 'Ca 2 - Phòng: C403', 2024, 1, 1, 1, '52200084', 503073),
(21, 'Nhóm 1', '6ff86d5', 2, 'Ca 1 - Phòng: C403', 2024, 1, 1, 1, '50000000', 503073),
(22, 'Nhóm 2', '55cdb4d', 0, 'Ca 2 - Phòng: C403', 2024, 2, 0, 1, '50000000', 503073),
(23, 'Nhóm 2', '93cc7d1', 0, 'Ca 2 - Phòng: C403', 2024, 1, 1, 1, '50000000', 503073);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhomquyen`
--

CREATE TABLE `nhomquyen` (
  `manhomquyen` int(11) NOT NULL,
  `tennhomquyen` varchar(50) NOT NULL,
  `trangthai` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhomquyen`
--

INSERT INTO `nhomquyen` (`manhomquyen`, `tennhomquyen`, `trangthai`) VALUES
(1, 'Admin', 1),
(10, 'Giảng viên', 1),
(11, 'Sinh viên', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phancong`
--

CREATE TABLE `phancong` (
  `mamonhoc` int(11) NOT NULL,
  `manguoidung` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phancong`
--

INSERT INTO `phancong` (`mamonhoc`, `manguoidung`) VALUES
(503005, '50000000'),
(503073, '50000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongbao`
--

CREATE TABLE `thongbao` (
  `matb` int(11) NOT NULL,
  `noidung` varchar(255) DEFAULT NULL,
  `thoigiantao` datetime DEFAULT NULL,
  `nguoitao` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thongbao`
--

INSERT INTO `thongbao` (`matb`, `noidung`, `thoigiantao`, `nguoitao`) VALUES
(14, 'Ngày 26/05 chúng ta sẽ nghĩ học vì thầy bận', '2024-05-26 18:17:58', '50000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tuyen`
--

CREATE TABLE `tuyen` (
  `matuyendung` int(11) NOT NULL,
  `tennhatuyendung` varchar(100) NOT NULL,
  `chitiet` varchar(255) NOT NULL,
  `luong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cauhoi`
--
ALTER TABLE `cauhoi`
  ADD PRIMARY KEY (`macauhoi`),
  ADD KEY `FK_CAUHOI_NGUOIDUNG` (`nguoitao`),
  ADD KEY `FK_CAUHOI_CHUONG` (`machuong`),
  ADD KEY `FK_CAUHOI_MONHOC` (`mamonhoc`);

--
-- Chỉ mục cho bảng `cautraloi`
--
ALTER TABLE `cautraloi`
  ADD PRIMARY KEY (`macautl`),
  ADD KEY `FK_CAUTRALOI_CAUHOI` (`macauhoi`);

--
-- Chỉ mục cho bảng `chitietdethi`
--
ALTER TABLE `chitietdethi`
  ADD PRIMARY KEY (`made`,`macauhoi`) USING BTREE,
  ADD KEY `FK_CHITIETDETHI_CAUHOI` (`macauhoi`);

--
-- Chỉ mục cho bảng `chitietketqua`
--
ALTER TABLE `chitietketqua`
  ADD PRIMARY KEY (`makq`,`macauhoi`),
  ADD KEY `FK_CHITIETKETQUA_CAUHOI` (`macauhoi`),
  ADD KEY `FK_CHITIETKETQUA_CAUTRALOI` (`dapanchon`);

--
-- Chỉ mục cho bảng `chitietnhom`
--
ALTER TABLE `chitietnhom`
  ADD PRIMARY KEY (`manhom`,`manguoidung`),
  ADD KEY `FK_CHITIETNHOM_NGUOIDUNG` (`manguoidung`);

--
-- Chỉ mục cho bảng `chitietquyen`
--
ALTER TABLE `chitietquyen`
  ADD PRIMARY KEY (`manhomquyen`,`chucnang`,`hanhdong`) USING BTREE,
  ADD KEY `hanhdong` (`chucnang`) USING BTREE;

--
-- Chỉ mục cho bảng `chitietthongbao`
--
ALTER TABLE `chitietthongbao`
  ADD PRIMARY KEY (`matb`,`manhom`),
  ADD KEY `FK_CHITIETTHONGBAO_NHOM` (`manhom`);

--
-- Chỉ mục cho bảng `chuong`
--
ALTER TABLE `chuong`
  ADD PRIMARY KEY (`machuong`),
  ADD KEY `FK_CHUONG_MONHOC` (`mamonhoc`);

--
-- Chỉ mục cho bảng `danhmucchucnang`
--
ALTER TABLE `danhmucchucnang`
  ADD PRIMARY KEY (`chucnang`) USING BTREE;

--
-- Chỉ mục cho bảng `dethi`
--
ALTER TABLE `dethi`
  ADD PRIMARY KEY (`made`);

--
-- Chỉ mục cho bảng `dethitudong`
--
ALTER TABLE `dethitudong`
  ADD PRIMARY KEY (`made`,`machuong`),
  ADD KEY `FK_DETHITUDONG_CHUONG` (`machuong`);

--
-- Chỉ mục cho bảng `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mamonhoc` (`mamonhoc`);

--
-- Chỉ mục cho bảng `giaodethi`
--
ALTER TABLE `giaodethi`
  ADD PRIMARY KEY (`made`,`manhom`),
  ADD KEY `FK_GIAODETHI_NHOM` (`manhom`),
  ADD KEY `FK_GIAODETHI_DETHI` (`made`);

--
-- Chỉ mục cho bảng `ketqua`
--
ALTER TABLE `ketqua`
  ADD PRIMARY KEY (`made`,`manguoidung`),
  ADD UNIQUE KEY `stt` (`makq`) USING BTREE,
  ADD KEY `FK_KETQUA_NGUOIDUNG` (`manguoidung`);

--
-- Chỉ mục cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`mamonhoc`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_NGUOIDUNG_NHOMQUYEN` (`manhomquyen`) USING BTREE;

--
-- Chỉ mục cho bảng `nhom`
--
ALTER TABLE `nhom`
  ADD PRIMARY KEY (`manhom`),
  ADD KEY `FK_NHOM_NGUOIDUNG` (`giangvien`),
  ADD KEY `FK_nhom_monhoc` (`mamonhoc`);

--
-- Chỉ mục cho bảng `phancong`
--
ALTER TABLE `phancong`
  ADD PRIMARY KEY (`mamonhoc`,`manguoidung`),
  ADD KEY `FK_giangday_nguoidung` (`manguoidung`);

--
-- Chỉ mục cho bảng `thongbao`
--
ALTER TABLE `thongbao`
  ADD PRIMARY KEY (`matb`);

--
-- Chỉ mục cho bảng `tuyen`
--
ALTER TABLE `tuyen`
  ADD PRIMARY KEY (`matuyendung`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cauhoi`
--
ALTER TABLE `cauhoi`
  MODIFY `macauhoi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;

--
-- AUTO_INCREMENT cho bảng `cautraloi`
--
ALTER TABLE `cautraloi`
  MODIFY `macautl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1759;

--
-- AUTO_INCREMENT cho bảng `chitietketqua`
--
ALTER TABLE `chitietketqua`
  MODIFY `makq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `chuong`
--
ALTER TABLE `chuong`
  MODIFY `machuong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `dethi`
--
ALTER TABLE `dethi`
  MODIFY `made` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `ketqua`
--
ALTER TABLE `ketqua`
  MODIFY `makq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  MODIFY `mamonhoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504009;

--
-- AUTO_INCREMENT cho bảng `nhom`
--
ALTER TABLE `nhom`
  MODIFY `manhom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `thongbao`
--
ALTER TABLE `thongbao`
  MODIFY `matb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietdethi`
--
ALTER TABLE `chitietdethi`
  ADD CONSTRAINT `FK_CHITIETDETHI_CAUHOI` FOREIGN KEY (`macauhoi`) REFERENCES `cauhoi` (`macauhoi`);

--
-- Các ràng buộc cho bảng `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`mamonhoc`) REFERENCES `monhoc` (`mamonhoc`);

--
-- Các ràng buộc cho bảng `phancong`
--
ALTER TABLE `phancong`
  ADD CONSTRAINT `FK_giangday_monhoc` FOREIGN KEY (`mamonhoc`) REFERENCES `monhoc` (`mamonhoc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_phancong_nguoidung` FOREIGN KEY (`manguoidung`) REFERENCES `nguoidung` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
