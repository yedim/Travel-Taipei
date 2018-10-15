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

		<form class="hidden" name="fileSend" method="post" action="savePlace.jsp">
			<input type="hidden" name="saveImgUrl" value="" />
			<input type="hidden" name="savePlaceName" value="" />
			<input type="hidden" name="savePlaceInfo" value="" />

		</form>
		<iframe class="hidden" name="hiddenifr" src="savePlace.jsp">	
		</iframe>
		
		<form class="hidden" name="fileDelete" method="post" action="deletePlace.jsp">
			<input type="hidden" name="deleteTitle" value="" />
		</form>
		<iframe class="hidden" name="deletehiddenifr" src="deletePlace.jsp">	
		</iframe>
	
	
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(images/bgGallery.jpg);">
		<div class="overlay"></div>
		<div class="fh5co-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Gallery</h1>
							<h2>What I want to do!</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div id="fh5co-gallery">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<span>Where I want to go and Eat</span>
					<h2>Enjoy Trip</h2>
				</div>
			</div>
			<div class="row row-bottom-padded-md">
				<div class="col-md-12">
					<ul id="fh5co-gallery-list">


<%
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String url = "jdbc:mysql://localhost:3306/travelDB?characterEncoding=UTF-8&serverTimezone=UTC";
		String id="root";
		String pass="1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url, id,pass);
		System.out.println("db연결되어 있습니다.");
		
		String sql="select * from travel_gallery";
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String imgUrl = rs.getString("imgUrl");
			String name=rs.getString("name");
			String explanation=rs.getString("explanation");
			%>
			<li class="one-third" data-animate-effect="fadeIn" style="background-image: url(<%=imgUrl%>); ">
			<a href="<%=imgUrl %>" >
			<div class="case-studies-summary">
				<span><%=explanation %></span>
				<h2><%=name %></h2>
				<button class="w3-button w3-white w3-border w3-padding-small w3-right" id='<%=name %>' onclick="galleryXBtnId(this.id)" style="z-index:100">x</button>
			</div>
			</a>
		</li>
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


					</ul>
				</div>
			</div>
		</div>
		  <button class="w3-button w3-xlarge w3-circle w3-pink w3-card-4" style="position:absolute; margin-top:20px;right:7%;" onclick="document.getElementById('id01').style.display='block'">+</button>
		
	</div>
	<!--Modal  -->
	<div id="id01" class="w3-modal" style="z-index:200">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
		<h4>가고 싶은 장소나 먹고 싶은 것</h4>
      </div>

     <div class="w3-container" >
        <div class="w3-section">
          <label><b>사진주소</b></label>
          <input id="place_imgUrl" class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter ImageUrl"  required>
          <label><b>이름</b></label>
          <input id="place_name"class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter MenuName" required>
          <label><b>설명</b></label>
          <input id="place_info" class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter MenuInfo"  required>
          <button class="w3-button w3-block w3-pink w3-section w3-padding" onclick="modalSavePlace()">Enter</button>
        </div>
      </div>


    </div>
    <form class="hidden" name="DeleteGallery" method="post" action="deletePlace.jsp">
			<input type="hidden" name="info" value="" />
		</form>
		<iframe class="hidden" name="deleteGalleryhiddenifr" src="deletePlace.jsp">	
		</iframe>
  </div>
  <script>
  function modalSavePlace(){
	  form=document.fileSend;
      form.saveImgUrl.value=document.getElementById("place_imgUrl").value;
      form.savePlaceName.value=document.getElementById("place_name").value;
      form.savePlaceInfo.value=document.getElementById("place_info").value;
      form.target="hiddenifr";
      form.submit();
      alert(document.getElementById("place_name").value+"이(가) 저장되었습니다");
      window.location.reload();
  }
  
  function galleryXBtnId(id)
  {
	 	 alert(id+"삭제합니다");
		var form = document.DeleteGallery;
		form.info.value=id;
		form.target = "deleteGalleryhiddenifr";   
		form.submit();
  }
  </script>
  


	<%@include file="bottom.jsp"%>

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