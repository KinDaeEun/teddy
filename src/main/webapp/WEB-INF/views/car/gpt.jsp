<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>날짜 및 시간 선택기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
</head>
<body>
    <h1>날짜 및 시간 선택</h1>
    <input type="text" id="datetimePicker" placeholder="날짜 및 시간 선택">
	
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        flatpickr("#datetimePicker", {
            enableTime: true,  // 시간 선택 활성화
            dateFormat: "Y-m-d H:i",  // 날짜 및 시간 형식
            minDate: "today",  // 오늘 이전 날짜를 선택할 수 없게 함
        });
    </script>
</body>
</html>
