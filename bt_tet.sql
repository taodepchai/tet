-- 1. Danh sách sinh viên theo Mã sinh viên tăng dần
SELECT MaSV, HoSV, TenSV, HocBong FROM SinhVien ORDER BY MaSV ASC;

-- 2. Danh sách sinh viên sắp xếp theo phái Nam/Nữ
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai, NgaySinh FROM SinhVien ORDER BY Phai DESC;

-- 3. Danh sách sinh viên theo Ngày sinh tăng dần, Học bổng giảm dần
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh, HocBong FROM SinhVien ORDER BY NgaySinh ASC, HocBong DESC;

-- 4. Danh sách môn học có tên bắt đầu bằng chữ T
SELECT MaMon, TenMon, SoTiet FROM MonHoc WHERE TenMon LIKE 'T%';

-- 5. Sinh viên có chữ cái cuối cùng trong tên là 'I'
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh, Phai FROM SinhVien WHERE TenSV LIKE '%I';

-- 6. Khoa có ký tự thứ hai là 'N'
SELECT MaKhoa, TenKhoa FROM Khoa WHERE SUBSTRING(TenKhoa, 2, 1) = 'N';

-- 7. Sinh viên có họ chứa 'Thị'
SELECT * FROM SinhVien WHERE HoSV LIKE '%Thị%';

-- 8. Sinh viên có học bổng > 100,000, sắp xếp theo Mã khoa giảm dần
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, MaKhoa, HocBong FROM SinhVien WHERE HocBong > 100000 ORDER BY MaKhoa DESC;

-- 9. Sinh viên có học bổng >= 150,000 và sinh ở Hà Nội
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, MaKhoa, NoiSinh, HocBong FROM SinhVien WHERE HocBong >= 150000 AND NoiSinh = 'Hà Nội';

-- 10. Sinh viên khoa Anh văn và khoa Vật lý
SELECT MaSV, MaKhoa, Phai FROM SinhVien WHERE MaKhoa IN ('AV', 'VL');

-- 11. Sinh viên sinh từ 01/01/1991 đến 05/06/1992
SELECT MaSV, NgaySinh, NoiSinh, HocBong FROM SinhVien WHERE NgaySinh BETWEEN '1991-01-01' AND '1992-06-05';

-- 12. Sinh viên có học bổng từ 80,000 đến 150,000
SELECT MaSV, NgaySinh, Phai, MaKhoa FROM SinhVien WHERE HocBong BETWEEN 80000 AND 150000;

-- 13. Môn học có số tiết > 30 và < 45
SELECT MaMon, TenMon, SoTiet FROM MonHoc WHERE SoTiet > 30 AND SoTiet < 45;

-- 14. Sinh viên nam khoa Anh văn và khoa Tin học
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, TenKhoa, Phai FROM SinhVien JOIN Khoa ON SinhVien.MaKhoa = Khoa.MaKhoa WHERE Phai = 'Nam' AND Khoa.MaKhoa IN ('AV', 'TH');

-- 15. Sinh viên nữ có tên chứa chữ 'N'
SELECT * FROM SinhVien WHERE Phai = 'Nữ' AND TenSV LIKE '%N%';

-- 16. Sinh viên sinh tại Hà Nội vào tháng 02
SELECT HoSV, TenSV, NoiSinh, NgaySinh FROM SinhVien WHERE NoiSinh = 'Hà Nội' AND MONTH(NgaySinh) = 2;

-- 17. Sinh viên có tuổi > 20
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) AS Tuoi, HocBong FROM SinhVien WHERE TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) > 20;

-- 18. Sinh viên tuổi từ 20-25
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) AS Tuoi, TenKhoa FROM SinhVien JOIN Khoa ON SinhVien.MaKhoa = Khoa.MaKhoa WHERE TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) BETWEEN 20 AND 25;

-- 19. Sinh viên sinh vào mùa xuân năm 1990
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai, NgaySinh FROM SinhVien WHERE YEAR(NgaySinh) = 1990 AND MONTH(NgaySinh) BETWEEN 3 AND 5;

-- 20. Thông tin học bổng theo mức
SELECT MaSV, Phai, MaKhoa, CASE WHEN HocBong > 500000 THEN 'Học bổng cao' ELSE 'Mức trung bình' END AS MucHocBong FROM SinhVien;

-- 21. Tổng số sinh viên
SELECT COUNT(*) FROM SinhVien;

-- 22. Tổng sinh viên và tổng sinh viên nữ
SELECT COUNT(*) AS TongSV, SUM(CASE WHEN Phai = 'Nữ' THEN 1 ELSE 0 END) AS TongNu FROM SinhVien;

-- 23. Tổng số sinh viên từng khoa
SELECT MaKhoa, COUNT(*) AS TongSV FROM SinhVien GROUP BY MaKhoa;

-- 24. Số lượng sinh viên học từng môn
SELECT MaMon, COUNT(DISTINCT MaSV) AS SoLuong FROM KetQua GROUP BY MaMon;

-- 25. Tổng số môn học sinh viên đã học
SELECT COUNT(DISTINCT MaMon) FROM KetQua;

-- 26. Tổng học bổng mỗi khoa
SELECT MaKhoa, SUM(HocBong) FROM SinhVien GROUP BY MaKhoa;

-- 27. Học bổng cao nhất của mỗi khoa
SELECT MaKhoa, MAX(HocBong) FROM SinhVien GROUP BY MaKhoa;

-- 28. Tổng sinh viên nam và nữ của mỗi khoa
SELECT MaKhoa, SUM(CASE WHEN Phai = 'Nam' THEN 1 ELSE 0 END) AS Nam, SUM(CASE WHEN Phai = 'Nữ' THEN 1 ELSE 0 END) AS Nu FROM SinhVien GROUP BY MaKhoa;

-- 29. Số lượng sinh viên theo độ tuổi
SELECT TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) AS Tuoi, COUNT(*) FROM SinhVien GROUP BY Tuoi;

-- 30. Năm sinh có 2 sinh viên
SELECT YEAR(NgaySinh), COUNT(*) FROM SinhVien GROUP BY YEAR(NgaySinh) HAVING COUNT(*) = 2;

-- 31. Nơi có hơn 2 sinh viên học
SELECT NoiSinh, COUNT(*) FROM SinhVien GROUP BY NoiSinh HAVING COUNT(*) > 2;

-- 32. Môn có trên 3 sinh viên dự thi
SELECT MaMon, COUNT(DISTINCT MaSV) FROM KetQua GROUP BY MaMon HAVING COUNT(DISTINCT MaSV) > 3;

-- 33. Sinh viên thi lại trên 2 lần
SELECT MaSV FROM KetQua WHERE LanThi > 2 GROUP BY MaSV HAVING COUNT(*) > 2;

-- 34. Sinh viên nam có điểm TB lần 1 > 7.0
SELECT MaSV FROM KetQua WHERE Phai = 'Nam' AND LanThi = 1 AND DiemTB > 7.0;

-- 35. Sinh viên rớt trên 2 môn lần thi 1
SELECT MaSV FROM KetQua WHERE LanThi = 1 AND Diem < 5 GROUP BY MaSV HAVING COUNT(*) > 2;

-- 36. Khoa có hơn 2 sinh viên nam
SELECT MaKhoa FROM SinhVien WHERE Phai = 'Nam' GROUP BY MaKhoa HAVING COUNT(*) > 2;

-- 37. Khoa có 2 sinh viên nhận học bổng 200,000 - 300,000
SELECT MaKhoa FROM SinhVien WHERE HocBong BETWEEN 200000 AND 300000 GROUP BY MaKhoa HAVING COUNT(*) = 2;

-- 38. Số sinh viên đậu/rớt từng môn
SELECT MaMon, SUM(CASE WHEN Diem >= 5 THEN 1 ELSE 0 END) AS Dau, SUM(CASE WHEN Diem < 5 THEN 1 ELSE 0 END) AS Rot FROM KetQua GROUP BY MaMon;

-- 39. Sinh viên có học bổng cao nhất
SELECT * FROM SinhVien ORDER BY HocBong DESC LIMIT 1;

-- 40. Sinh viên có điểm cao nhất môn CSDL lần 1
SELECT MaSV FROM KetQua WHERE MaMon = 'CSDL' AND LanThi = 1 ORDER BY Diem DESC LIMIT 1;
