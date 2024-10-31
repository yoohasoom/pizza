<%@page import="pizza_30304.dto"%>
<%@page import="java.util.List"%>
<%@page import="pizza_30304.dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
dao pizzaDao = new dao();
List<dto> sales = pizzaDao.selectshop(); // 판매 정보 조회
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
body {
    display: grid;
    grid-template-columns: 20% 80%; /* 네비게이션과 섹션의 너비 */
    grid-template-rows: 5% 95%; /* 헤더의 높이와 나머지 부분 */
    height: 100vh; /* 전체 높이를 100%로 설정 */
}

header {
    grid-column: 1 / 3; /* 전체 열을 차지 */
    grid-row: 1 / 2; /* 첫 번째 행에 위치 */
	border-bottom: 1px solid black;
}

nav {
    grid-column: 1 / 2; /* 첫 번째 열에 위치 */
    grid-row: 2 / 3; /* 두 번째 행에 위치 */
	border-right: 1px solid black;
}

section {
    grid-column: 2 / 3; /* 두 번째 열에 위치 */
    grid-row: 2 / 3; /* 두 번째 행에 위치 */
}
a {
    display: block; /* 블록 요소로 변경 */
    margin-top: 20px;
}

</style>

</head>

<body>
<header style="background-color: skyblue; text-align: center;">
    <h3 style="margin-top : 0">피자전문점 판매관리 프로그램 Ver1.0</h3>
</header>
<nav style="background-color: silver;">
    <a href="insert.jsp">매출전표등록</a> 
    </br>
    <a href="joinall.jsp">통합매출조회</a>
    </br>
    <a href="joinshop.jsp">지점별매출현황</a>
    </br>
    <a href="joinprice.jsp">상품별매출현황</a>
    </br>
    <a href="index.jsp">홈으로</a>
    </br>
</nav>

	<section>
		<h3 align=center>지점조회</h3>

		<table border=1 align=center>
			<tr>
				<td>매장코드</td>
				<td>매장명</td>
				<td>매출액</td>
			</tr>
        <% 
        for (int i = 0; i < sales.size(); i++) {
            dto sale = sales.get(i);
        %>
            <tr>
                <td><%= sale.getShopCode() %></td>
                <td><%= sale.getShopName() %></td>
                <td><%= sale.getTotal() %></td>
            </tr>
        <% 
        } // 반복문 종료 
        %>
		</table>
	</section>

</body>
</html>
