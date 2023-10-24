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
</style>
<body>
	<div class="container " align="center">
		<div class="inner join-inner mb">
			<h2 class="text-dark top">차량추가</h2>
			<form action="${path }/admin/insertCar.do" method="post"
				enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<th>이름</th>
						<td><input type="text" name="c_name" required="required"
							class="form-control" autofocus="autofocus"></td>
					</tr>
					<tr>
						<th>브랜드</th>
						<td><input type="text" name="brand" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>차종</th>
						<td><input type="radio" name="c_kind" id="경형/소형"
							value="경차/소형차" checked="checked"> <label for="경형/소형">경형/소형</label>

							<input type="radio" name="c_kind" id="준중형" value="준중형"> <label
							for="준중형차">준중형</label> <input type="radio" name="c_kind" id="중형"
							value="중형차"> <label for="중형">중형</label> <input
							type="radio" name="c_kind" id="대형" value="대형차"> <label
							for="대형">대형</label> <input type="radio" name="c_kind" id="SUV"
							value="SUV"> <label for="SUV">SUV</label></td>
					</tr>
					<tr>
						<th>최저가</th>
						<td><input type="number" name="min_price" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>최고가</th>
						<td><input type="number" name="max_price" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>출시일</th>
						<td><input type="date" name="c_date" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>엔진형식</th>
						<td><input type="text" name="engine" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>변속기형식</th>
						<td><input type="text" name="gear" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>배기량</th>
						<td><input type="number" name="deplacement"
							required="required" class="form-control"></td>
					</tr>
					<tr>
						<th>구동방식</th>
						<td><input type="text" name="drive_type" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>최고출력</th>
						<td><input type="text" name="max_output" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>서스펜션</th>
						<td><input type="text" name="suspention" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>최대토크</th>
						<td><input type="text" name="torque" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>브레이크</th>
						<td><input type="text" name="brake" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>가속도</th>
						<td><input type="text" name="accel" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>최고속도</th>
						<td><input type="text" name="max_speed" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>너비</th>
						<td><input type="number" name="width" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>높이</th>
						<td><input type="number" name="height" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>휠베이스</th>
						<td><input type="number" name="wheelbase" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>길이</th>
						<td><input type="number" name="length" required="required"
							class="form-control"></td>
					</tr>
					<tr>
						<th>표지사진</th>
						<td><input type="file" name="c_cover_img_file"
							class="form-control" required="required"></td>
					</tr>
					<tr>
						<th>사진</th>
						<td><input type="file" name="c_img_file" class="form-control"
							required="required"></td>
					</tr>
					<tr>
						<th>정면사진</th>
						<td><input type="file" name="formt_img_file" class="form-control"
							required="required"></td>
					</tr>
					<tr>
						<th>옆면사진</th>
						<td><input type="file" name="side_img_file" class="form-control"
							required="required"></td>
					</tr>
					<tr>
						<th>디자인 사진(여러장)</th>
						<td><input type="file" name="img_file" class="form-control"
							required="required" multiple="multiple"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="c_content" class="form-control"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="추가" class="btn btn-dark">
							<a href="${path }/admin/adminCar.do" class="btn btn-outline-dark">취소</a>
							</td>
					</tr>

				</table>
			</form>

		</div>
	</div>
</body>
</html>