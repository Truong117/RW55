USE Testing_System_Assignment_1;

-- Câu 1: Đã thêm trong assingment 1
-- Câu 2: lấy ra tất cả các phòng ban 
SELECT department_name
FROM Department;

-- Câu 3: lấy ra id của phòng ban "Sale"
SELECT department_ID
FROM Department
WHERE department_name = 'sale';

-- Câu 4: lấy ra thông tin account có full name dài nhất
SELECT * FROM `account`
WHERE LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM `account` )
ORDER BY account_ID;

-- Câu 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id =3
WITH CTE_DEP3 AS (SELECT * FROM `Account` WHERE department_ID = 3)
SELECT * FROM `CTE_DEP3`
WHERE LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM `CTE_DEP3`)
ORDER BY full_name;


-- Câu 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT group_name
FROM `group`
WHERE create_date > '2019-12-20' ;

-- Câu 7: Lấy ra ID của question có >= 4 câu trả lời

SELECT A.question_ID
FROM `Answer` A
GROUP BY A.question_ID
HAVING COUNT(A.question_ID) >= 4;

-- Câu 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút ho được tạo trước ngày 20/12/2019
SELECT `code`
FROM Exam
WHERE duration >= 60 AND create_date < '2019-12-20';

-- Câu 9: Lấy ra 5 Group được tạo gần đây nhất
SELECT *
FROM `Group`
ORDER BY create_date DESC
LIMIT 5;


-- Câu 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(account_ID) AS NumberOfAccount
FROM `account`
WHERE  department_ID = 2; 


-- Câu 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT  full_name
FROM `account`
WHERE full_name LIKE 'D%o';
    

-- Câu 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM Exam 
WHERE create_date < '2019-12-20';

-- Câu 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM `Question` 
WHERE (SUBSTRING_INDEX(Content, ' ', 2)) = 'câu hỏi';
SELECT (SUBSTRING_INDEX(Content, ' ', 2)) = 'câu hỏi' FROM `Question`;

-- Câu 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `Account`
SET Fullname = 'Nguyễn Bá Lộc',
	Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

-- Câu 15: 
UPDATE `GroupAccount` 
SET  AccountID = 5
WHERE GroupID = 4;