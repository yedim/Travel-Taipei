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
	String planList=request.getParameter("planList");

	Connection conn=null;
	PreparedStatement pstmt=null;
	
	if(info!=null && planList!=null )
	{
	
		String info_Arr[]=info.split(",");
		System.out.println(info+"  "+planList);
		try{
			String url = "jdbc:mysql://localhost:3306/travelDB?characterEncoding=UTF-8&serverTimezone=UTC";
			String id="root";
			String pass="1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, id,pass);
			
			String sql="update travel_plan set planList=? where planTitle=? and planContent=? and planDayCnt=? and planDate=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,planList);
			pstmt.setString(2,info_Arr[0]);
			pstmt.setString(3,info_Arr[1]);
			pstmt.setString(4,info_Arr[2]);
			pstmt.setString(5,info_Arr[3]);
			pstmt.executeUpdate();
			
			System.out.println("update 성공"); 
		}catch(Exception e){
			System.out.println("update 실패");
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