<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../headerBase.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.mb {
	margin-bottom: 100px;
}

.top {
	padding-top: 200px;
	padding-bottom: 50px;
}

.btn-top {
	margin-top: 5px;
	
}

input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
}

.file_label {
	display: inline-block;
	width: 100%;
	line-height: 15px;
	border: none;
	border: 1px solid #ccc;
	outline: 0;
	font-size: 15px;
	text-align: center;
	cursor: pointer;
	padding: 10px 12px;
	max-height: 65px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	border-radius: 5px;
	transition: all .35s;
}
</style>
<script type="text/javascript">
window.onload = function () {
    let selectedKind = "${car.c_kind}"; 
    let radios = document.getElementsByName("c_kind");
    
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].value === selectedKind) {
            radios[i].checked = true; 
            break; 
        }
    }
};

$(function() {
	$('input[type="file"]').on('change', function() {
		var fileName = $(this).val();
		var realFileName = fileName.split("\\");
		$(this).siblings('label').text(realFileName[2]);
	})

})

</script>
<body>
	<div class="container " align="center">
		<div class="inner join-inner mb">
			<h2 class="text-dark top">차량수정</h2>
			<form action="${path }/admin/adminCarUpdateResult.do" method="post"
				enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<th>번호</th>
						<td><input type="text" name="cno" readonly="readonly"
							class="form-control" autofocus="autofocus" value="${car.cno }"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="c_name" required="required"
							class="form-control" autofocus="autofocus" value="${car.c_name }"></td>
					</tr>
					<tr>
						<th>브랜드</th>
						<td><input type="text" name="brand" required="required"
							class="form-control" value="${car.brand }"></td>
					</tr>
					<tr>
						<th>차종</th>
						<td>
						
						<input type="radio" name="c_kind" id="경차/소형차"
							value="경차/소형차" checked="checked"> <label for="경차/소형차">경차/소형차</label>
							
							<input type="radio" name="c_kind" id="준중형차" value="준중형차"> <label
							for="준중형차">준중형차</label>
							
							 <input type="radio" name="c_kind" id="중형차"
							value="중형차"> <label for="중형차">중형차</label>
							
							 <input type="radio" name="c_kind" id="대형차" value="대형차"> <label
							for="대형차">대형차</label> 
							
							<input type="radio" name="c_kind" id="SUV"
							value="SUV"> <label for="SUV">SUV</label>
							</td>
					</tr>
					<tr>
						<th>최저가</th>
						<td><input type="number" name="min_price" required="required"
							class="form-control" value="${car.min_price }"></td>
					</tr>
					<tr>
						<th>최고가</th>
						<td><input type="number" name="max_price" required="required"
							class="form-control" value="${car.max_price }"></td>
					</tr>
					<tr>
						<th>출시일</th>
						<td><input type="date" name="c_date" required="required"
							class="form-control" value="${car.c_date }"></td>
					</tr>
					<tr>
						<th>엔진형식</th>
						<td><input type="text" name="engine" required="required"
							class="form-control" value="${car.engine }"></td>
					</tr>
					<tr>
						<th>변속기형식</th>
						<td><input type="text" name="gear" required="required"
							class="form-control" value="${car.gear }"></td>
					</tr>
					<tr>
						<th>배기량</th>
						<td><input type="number" name="displacement"
							required="required" class="form-control" value="${car.displacement }"></td>
					</tr>
					<tr>
						<th>구동방식</th>
						<td><input type="text" name="drive_type" required="required"
							class="form-control" value="${car.drive_type }"></td>
					</tr>
					<tr>
						<th>최고출력</th>
						<td><input type="text" name="max_output" required="required"
							class="form-control" value="${car.max_output }"></td>
					</tr>
					<tr>
						<th>서스펜션</th>
						<td><input type="text" name="suspention" required="required"
							class="form-control" value="${car.suspention }"></td>
					</tr>
					<tr>
						<th>최대토크</th>
						<td><input type="text" name="torque" required="required"
							class="form-control" value="${car.torque }"></td>
					</tr>
					<tr>
						<th>브레이크</th>
						<td><input type="text" name="brake" required="required"
							class="form-control" value="${car.brake }"></td>
					</tr>
					<tr>
						<th>가속도</th>
						<td><input type="text" name="accel" required="required"
							class="form-control" value="${car.accel }"></td>
					</tr>
					<tr>
						<th>최고속도</th>
						<td><input type="text" name="max_speed" required="required"
							class="form-control" value="${car.max_speed }"></td>
					</tr>
					<tr>
						<th>너비</th>
						<td><input type="number" name="width" required="required"
							class="form-control" value="${car.width }"></td>
					</tr>
					<tr>
						<th>높이</th>
						<td><input type="number" name="height" required="required"
							class="form-control" value="${car.height }"></td>
					</tr>
					<tr>
						<th>휠베이스</th>
						<td><input type="number" name="wheelbase" required="required"
							class="form-control" value="${car.wheelbase }"></td>
					</tr>
					<tr>
						<th>길이</th>
						<td><input type="number" name="length" required="required"
							class="form-control" value="${car.length }"></td>
					</tr>
					<tr>
						<th>표지사진</th>
						<td><label for="f1" class="file_label">${car.c_cover_img }</label>
						<input type="file" name="c_cover_img_file" id="f1"
							class="form-control" ></td>
					</tr>
					<tr>
						<th>사진</th>
						<td><label for="f2" class="file_label">${car.c_img }</label>
						<input type="file" name="c_img_file" class="form-control"
							 id="f2"></td>
					</tr>
					<tr>
						<th>정면사진</th>
						<td><label for="f3" class="file_label">${car.formt_img }</label>
						<input type="file" name="formt_img_file" class="form-control"
							 id="f3"></td>
					</tr>
					<tr>
						<th>옆면사진</th>
						<td><label for="f4" class="file_label">${car.side_img }</label>
						<input type="file" name="side_img_file" class="form-control"
							 id="f4"></td>
					</tr>

					<tr>
						<td colspan="2"><textarea rows="5" name="c_content" class="form-control" required="required">${car.c_content }</textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="수정" class="btn btn-dark">
							<a href="${path }/admin/adminCar.do" class="btn btn-outline-dark">취소</a>
							</td>
					</tr>

				</table>
			</form>

		</div>
	</div>
</body>
</html>