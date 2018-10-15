<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Sacramento" rel="stylesheet">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="js/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="planModal.js"></script>

<style>
.hidden
{
	width:1px;
	height:1px;
	border:0;
}

</style>

</head>
<body>
	<div class="fh5co-loader"></div>

	<div id="page">
		<%@include file="top.jsp"%>

	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(images/bgtravelplan.jpg);">
		<div class="overlay"></div>
		<div class="fh5co-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Plan</h1>
							<h2>What I am going to do</h2>
							<a href="#" class="btn btn-default btn-sm" onclick="document.getElementById('id01').style.display='block'">Add</a>		
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</header>


	<div id="fh5co-couple-story" class="fh5co-section-gray">
		<%
				Connection conn=null;
				PreparedStatement pstmt=null;
				PreparedStatement pstmt2=null;
				ResultSet rs=null;
				ResultSet rs2=null;
				try{
					String url = "jdbc:mysql://localhost:3306/travelDB?characterEncoding=UTF-8&serverTimezone=UTC";
					String id="root";
					String pass="1234";
					
					Class.forName("com.mysql.jdbc.Driver");
					conn=DriverManager.getConnection(url, id,pass);
					System.out.println("db연결되어 있습니다.");
					
					String sql="select distinct planTitle, planContent from travel_plan";
					pstmt=conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					int n=0; 
					while(rs.next()){
						String planTitle=rs.getString("planTitle");
						String planContent=rs.getString("planContent");
						
						String sql2="select * from travel_plan where planTitle='"+planTitle+"'";
						pstmt2=conn.prepareStatement(sql2);
						rs2=pstmt2.executeQuery();
						
						if(n==0)
						{
							%>
							<div class="container">
							<%
							n++;
						}
						else
						{
							%>
							<div class="container"  style="margin-top:200px">
							<%
						}
						%>
							<div class="row">
								<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
									<span><%=planContent %></span>
									<h2><%=planTitle %></h2>
								</div>
							</div>
							
						<%
						
						%>
						<div class="row">
							<div class="col-md-12 col-md-offset-0">
								<ul class="timeline">
						<%
						int i=0;

						while(rs2.next()){
							
							String planDayCnt=rs2.getString("planDayCnt");
							String planDate=rs2.getString("planDate");
							String planList=rs2.getString("planList");

							i++;
							String aId=planTitle+","+planContent+","+planDayCnt+","+planDate+","+planList;

							if(i%2==1)
							{
								%>
								<li class="">
								<%
							}
							else
							{
								%>
								<li class="timeline-inverted">
								<%
							}
							%>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h3 class="timeline-title"><%=planDayCnt %></h3>
										<span class="date"><%=planDate %></span>
									</div>
									<div class="timeline-body">
										<p><%=planList %></p>
										<a href="#" class="btn btn-default btn-sm" id="<%=aId%>" onclick="document.getElementById('id02').style.display='block';getBtnId(this.id)">Modify</a>
										
									</div>
								</div>
							</li>
							<%
						}
						%>
							<button class="w3-button w3-xlarge w3-circle w3-pink w3-card-4" style="position:absolute; margin-top:20px;right:7%;" id="<%=planTitle%>" onclick="getXBtnId(this.id)">x</button>
						
								</ul>
							</div>
						</div>
					<%
					}
					
					
					System.out.println("planTitle select 성공");
				}catch(Exception e){
					System.out.println("planTitle select 실패");
				}finally{
					if(pstmt!=null)
						try{pstmt.close(); } catch(SQLException sqle){}
					if(conn!=null)
						try{pstmt.close(); } catch(SQLException sqle){}
				
				}
			%>
						
				</div>
			
		
	<!-- iframe 값 넘기기 -->
		<form class="hidden" name="fileSend" method="post" action="savePlan.jsp">
			<input type="hidden" name="planTitle" value="" />
			<input type="hidden" name="planContent" value="" />
			<input type="hidden" name="planDayCnt" value="" />
			<input type="hidden" name="planDate" value="" />
			<input type="hidden" name="planList" value="" />
		</form>
		<iframe class="hidden" name="hiddenifr" src="savePlan.jsp">	
		</iframe>
		
		<form class="hidden" name="Modify" method="post" action="modifyPlan.jsp">
			<input type="hidden" name="info" value="" />
			<input type="hidden" name="planList" value="" />
		</form>
		<iframe class="hidden" name="modifyhiddenifr" src="modifyPlan.jsp">	
		</iframe>
		
		<form class="hidden" name="Delete" method="post" action="deletePlan.jsp">
			<input type="hidden" name="info" value="" />
		</form>
		<iframe class="hidden" name="deletehiddenifr" src="deletePlan.jsp">	
		</iframe>

	<!--모달  -->
	 <div id="id01" class="w3-modal" style="z-index:100">
      <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div class="w3-center"><br>
          <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
        </div>
          <div class="w3-section w3-padding" id="modalArea">
            <label>제목</label>
            <input type="text" class="w3-input" placeholder="Enter Title" name="surveyTitle" id="surveyTitle" required>
            <br>
            <label>설명</label>
            <input type="text" class="w3-input" placeholder="Enter Title" name="surveyContent" id="surveyContent" required>
            <br>
            <label>여행시작날짜</label>&nbsp;  <input type="date" id="startDay"><br>
            
            <label>여행종료날짜</label>&nbsp;  <input type="date" id="endDay"><br>
            
<!--             <input type="button" value="OK" class="btn" onclick="createQuestion()" required>
 -->            
            </div>

        <div class="w3-container w3-border-top w3-light-grey">
           <button class="w3-button w3-block w3-pink w3-section w3-padding" onclick="document.getElementById('id01').style.display='none';createCardSurvey()">계획 만들기</button>
        </div>

      </div>
    </div>
	
		<!--모달  -->
	 <div id="id02" class="w3-modal" style="z-index:100">
      <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div class="w3-center"><br>
          <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
        </div>
          <div class="w3-section w3-padding" id="modalArea">
          	<input type="hidden" id="btnId" value="" />

           	<%
				try{
					String url = "jdbc:mysql://localhost:3306/travelDB?characterEncoding=UTF-8&serverTimezone=UTC";
					String id="root";
					String pass="1234";
					
					Class.forName("com.mysql.jdbc.Driver");
					conn=DriverManager.getConnection(url, id,pass);
					
					String sql="select * from travel_gallery";
					pstmt=conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					%>
					<form id="checkboxPlanList">
					<%
					while(rs.next()){
						String name=rs.getString("name");
						%>
							  <input type="checkbox" name="<%=name %>" value="<%=name %>"> <%=name %><br>
						<%	
					}
					System.out.println("select 성공");
				}catch(Exception e){
					System.out.println("select 실패");
				}finally{
					if(pstmt!=null)
						try{pstmt.close(); } catch(SQLException sqle){}
					if(conn!=null)
						try{pstmt.close(); } catch(SQLException sqle){}
				
				}
				%>
				</form>
			
				
           </div>

        <div class="w3-container w3-border-top w3-light-grey">
           <button class="w3-button w3-block w3-pink w3-section w3-padding" onclick="document.getElementById('id02').style.display='none';modifyPlan()">계획 수정</button>
        </div>

      </div>
    </div>
	
	
</div>
	<%@include file="bottom.jsp"%>
</div>
</div>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.countTo.js"></script>

	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>

	<script src="js/main.js"></script>
</body>
</html>