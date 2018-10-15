<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String deleteTitle=request.getParameter("deleteTitle");
	
	
	String filePath = request.getRealPath("/txtfile/saveCheck.txt");
	
	BufferedReader br= new BufferedReader(new FileReader(filePath));
	ArrayList<String> strList= new ArrayList<String>();
	BufferedWriter bw=null;
	PrintWriter writer = null;	
	
	String ss=null;
	
	if(deleteTitle!=null)
	{
		int n=0;
		try{
			while(true){
				ss = br.readLine();
				if(ss==null)break;
				if(!ss.contains(deleteTitle))
					strList.add(ss);	
				n++;
			}
			br.close();
		}catch(Exception e){	
			e.getStackTrace();
		}
		
		
		try{
			bw = new BufferedWriter(new FileWriter(filePath,false));
			writer = new PrintWriter(bw,false);	
			
			for(int i=0; i<strList.size();i++){
				writer.println(strList.get(i));
			}
			writer.flush();
			writer.close();
		}catch(Exception e)
		{
			out.println("지정된 파일을 찾을 수 없습니다");
		}
	}
	

%>
</body>
</html>