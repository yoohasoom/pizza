<%@page import="pizza_30304.dto"%>
<%@page import="pizza_30304.dao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    dao pizzadao = new dao(); // dao 객체 생성
    
    // 사용자 입력값을 dto 객체에 설정
    dto newSale = new dto();
    newSale.setSaleNo(request.getParameter("id"));
    newSale.setShopCode(request.getParameter("name"));
    newSale.setSaleDate(request.getParameter("password"));

    pizzadao.insertPizza(newSale); 
%>

