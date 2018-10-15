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
	String planTitle=request.getParameter("planTitle");
	String planContent=request.getParameter("planContent");
	String planDayCnt=request.getParameter("planDayCnt");
	String planDate=request.getParameter("planDate");
	String planList=request.getParameter("planList");
	
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	if(planTitle!=null && planContent!=null && planDayCnt!=null && planDate!=null && planList!=null)
	{
		String planDayCnt_Arr[]=planDayCnt.split(",");
		String planDate_Arr[]=planDate.split(",");
		
		try{
			String url = "jdbc:mysql://localhost:3306/travelDB?characterEncoding=UTF-8&serverTimezone=UTC";
			String id="root";
			String pass="1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, id,pass);
			
			for(int i=0;i<planDayCnt_Arr.length;i++)
			{
				String sql="insert into travel_plan values(?,?,?,?,?)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,planTitle);
				pstmt.setString(2,planContent);
				pstmt.setString(3,planDayCnt_Arr[i]);
				pstmt.setString(4,planDate_Arr[i]);
				pstmt.setString(5,planList);
				
				pstmt.executeUpdate();
			}
			
			
			System.out.println("plan insert 성공");
		}catch(Exception e){
			System.out.println("plan insert 실패");
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