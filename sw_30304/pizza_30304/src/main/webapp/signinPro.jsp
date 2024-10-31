<%@page import="pizza_30304.dto"%>
<%@page import="pizza_30304.dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    dao pizzadao = new dao(); // dao 객체 생성
    
    // 사용자 입력값을 dto 객체에 설정
    dto newSale = new dto();
    newSale.setSaleNo(request.getParameter("num")); // JSP에서 num 파라미터로 입력된 값을 설정
    newSale.setShopCode(request.getParameter("shop")); // JSP에서 shop 파라미터로 입력된 값을 설정
    newSale.setSaleDate(request.getParameter("date")); // JSP에서 date 파라미터로 입력된 값을 설정
    newSale.setPizzaCode(request.getParameter("pizza")); // JSP에서 pizza 파라미터로 입력된 값을 설정
    newSale.setAmount(request.getParameter("cost")); // JSP에서 cost 파라미터로 입력된 값을 설정

    // dto 객체를 dao의 insertSale 메서드에 전달하여 데이터베이스에 삽입
    pizzadao.insertPizza(newSale); 
%>

