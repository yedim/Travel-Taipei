<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String saveImgUrl=request.getParameter("saveImgUrl");
	String savePlaceName=request.getParameter("savePlaceName");
	String savePlaceInfo=request.getParameter("savePlaceInfo");

	Connection conn=null;
	PreparedStatement pstmt=null;
	
	if(saveImgUrl!=null && savePlaceName!=null && savePlaceInfo!=null)
	{
		try{
			String url = "jdbc:mysql://localhost:3306/travelDB?characterEncoding=UTF-8&serverTimezone=UTC";
			String id="root";
			String pass="1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, id,pass);
			
			String sql="insert into travel_gallery values(?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,saveImgUrl);/*"images/06yongsansa.jpg"  */
			pstmt.setString(2,savePlaceName);/*"용산사"  */
			pstmt.setString(3,savePlaceInfo);/*"타이페이에서 가장 오래된 사찰"  */
			pstmt.executeUpdate();
			
			System.out.println("insert 성공");
		}catch(Exception e){
			System.out.println("insert 실패");
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