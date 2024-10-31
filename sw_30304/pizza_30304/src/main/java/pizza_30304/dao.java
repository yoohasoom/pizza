package pizza_30304;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class dao {
	// 데이터베이스 연결 메서드
	public List<dto> selectSales() {
		List<dto> sales = new ArrayList<>();
		String sql = "SELECT sa.saleno, sh.scode, sh.sname, sa.saledate, p.pcode, p.pname, sa.amount, (p.cost * sa.amount) AS total "
				+ "FROM tbl_pizza_03 p, tbl_shop_03 sh, tbl_salelist_03 sa "
				+ "WHERE p.pcode = sa.pcode AND sh.scode = sa.scode ORDER BY sa.saleno";

		try (Connection con = jdbc.getConnection(); // jdbc.java에서 연결
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				dto sale = new dto();
				sale.setSaleNo(rs.getString("saleno"));
				sale.setShopCode(rs.getString("scode"));
				sale.setShopName(rs.getString("sname"));
				sale.setSaleDate(rs.getString("saledate")); // Date를 String으로 변환
				sale.setPizzaCode(rs.getString("pcode"));
				sale.setPizzaName(rs.getString("pname"));
				sale.setAmount(rs.getString("amount")); // int를 String으로 변환
				sale.setTotal(rs.getString("total")); // double을 String으로 변환

				sales.add(sale); // 리스트에 dto 객체 추가
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sales;
	}

	public void insertPizza(dto sale) { // dto 객체를 매개변수로 받음
		String sql = "INSERT INTO tbl_salelist_03 (saleno, scode, pcode, saledate, amount) VALUES (?, ?, ?, ?, ?)"; // SQL
																													// 쿼리

		// try-with-resources를 사용하여 Connection과 PreparedStatement 생성
		try (Connection con = jdbc.getConnection(); // jdbc.java에서 데이터베이스 연결 가져옴
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// dto 객체의 값을 SQL 쿼리에 설정
			pstmt.setString(1, sale.getSaleNo()); // 첫 번째 ?에 saleNo 값 설정
			pstmt.setString(2, sale.getShopCode()); // 두 번째 ?에 shopCode 값 설정
			pstmt.setString(3, sale.getPizzaCode()); // 세 번째 ?에 pizzaCode 값 설정
			pstmt.setString(4, sale.getSaleDate()); // 네 번째 ?에 saleDate 값 설정
			pstmt.setString(5, sale.getAmount()); // 다섯 번째 ?에 amount 값 설정

			// 설정된 SQL 쿼리를 실행하여 데이터를 삽입
			pstmt.executeUpdate(); // 데이터베이스에 삽입

		} catch (SQLException e) {
			// SQL 예외가 발생했을 때 오류 메시지 출력
			System.out.println("데이터 삽입 중 오류 발생: " + e.getMessage());
		} catch (Exception e) {
			// 그 외 예외가 발생했을 때 스택 트레이스를 출력
			e.printStackTrace();
		}
	}

	public List<dto> selectshop() {
	        List<dto> sales = new ArrayList<>();
	        String sql = "SELECT sh.scode, sh.sname, SUM(p.cost * sa.amount) AS total FROM tbl_pizza_03 p JOIN tbl_salelist_03 sa ON p.pcode = sa.pcode JOIN tbl_shop_03 sh ON sh.scode = sa.scode GROUP BY sh.scode, sh.sname";

	        
	        try (Connection connection = jdbc.getConnection(); // jdbc.java에서 연결
		             PreparedStatement pstmt = connection.prepareStatement(sql);
		             ResultSet rs = pstmt.executeQuery()) {

	        	while(rs.next()) {
	        	dto sale = new dto();
	        		 
				sale.setShopCode(rs.getString("scode"));
				sale.setShopName(rs.getString("sname"));
				sale.setTotal(rs.getString("total"));
				sales.add(sale); // 리스트에 sale 객체 추가
	        	}
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return sales;
	}
	
	public List<dto> selectpizza() {
        List<dto> sales = new ArrayList<>();
        String sql = "SELECT p.pcode, p.pname, SUM(p.cost * sa.amount) AS total FROM tbl_pizza_03 p JOIN tbl_salelist_03 sa ON p.pcode = sa.pcode JOIN tbl_shop_03 sh ON sh.scode = sa.scode GROUP BY p.pcode, p.pname";

        
        try (Connection connection = jdbc.getConnection(); // jdbc.java에서 연결
	             PreparedStatement pstmt = connection.prepareStatement(sql);
	             ResultSet rs = pstmt.executeQuery()) {

        	while(rs.next()) {
        	dto sale = new dto();
        		 
			sale.setPizzaCode(rs.getString("pcode"));
			sale.setPizzaName(rs.getString("pname"));
			sale.setTotal(rs.getString("total"));
			sales.add(sale); // 리스트에 sale 객체 추가
        	}
    } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return sales;
}
	
	public void signupUser(){
		
	}
}