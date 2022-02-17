<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>  
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>   
<%
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		  
		String p_num = request.getParameter("p_num");
		String p_name = request.getParameter("p_name");
		
		int p_price = Integer.parseInt(request.getParameter("p_price"));
		int p_cnt = Integer.parseInt(request.getParameter("p_cnt"));
		String p_img = request.getParameter("p_img");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "update product set proname=?, proprice=?, procnt=?, proimg=? where pronum=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, p_name);
			stmt.setInt(2, p_price);
			stmt.setInt(3, p_cnt);
			stmt.setString(4, p_img);
			stmt.setString(5, p_num);
			int n = stmt.executeUpdate();
			if(n>=1) {
				
				response.sendRedirect("productList.jsp");
			} else {
				
				response.sendRedirect("updateProduct.jsp?p_num="+p_num);
			}
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB연결이 실패되었거나 SQL을 처리하지 못했습니다.");
			e.printStackTrace();
		}

%>