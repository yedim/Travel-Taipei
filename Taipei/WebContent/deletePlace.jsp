<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String info=request.getParameter("info");
	
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	if(info!=null)
	{
		try{
			String url = "jdbc:mysql://localhost:3306/travelDB?characterEncoding=UTF-8&serverTimezone=UTC";
			String id="root";
			String pass="1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, id,pass);
		
			String sql="delete from travel_gallery where name = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,info);
		
			pstmt.executeUpdate();
		
		System.out.println("delete gallery 성공");
		}catch(Exception e){
			System.out.println("delete gallery 실패");
		}finally{
			if(pstmt!=null)
				try{pstmt.close(); } catch(SQLException sqle){}
			if(conn!=null)
				try{pstmt.close(); } catch(SQLException sqle){}

		}
	}
	
	

%>
</body>
</html>