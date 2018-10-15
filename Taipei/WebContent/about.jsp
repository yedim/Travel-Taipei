<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
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
<link rel="stylesheet" href="css/checkList.css">

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
	
		<form class="hidden" name="fileAdd" method="post" action="saveCheck.jsp">
			<input type="hidden" name="saveTitle" value="" />
		</form>
		<iframe class="hidden" name="addhiddenifr" src="saveCheck.jsp">	
		</iframe>
		
		<form class="hidden" name="fileDelete" method="post" action="deleteCheck.jsp">
			<input type="hidden" name="deleteTitle" value="" />
		</form>
		<iframe class="hidden" name="deletehiddenifr" src="deleteCheck.jsp">	
		</iframe>
	
		<form class="hidden" name="fileCheck" method="post" action="listCheck.jsp">
			<input type="hidden" name="checkTitle" value="" />
			<input type="hidden" name="isCheck" value="" />
		</form>
		<iframe class="hidden" name="checkhiddenifr" src="listCheck.jsp">	
		</iframe>
	
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(images/bgabout.jpg);">
		<div class="overlay"></div>
		<div class="fh5co-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc" data-animate-effect="fadeIn">
							<h1>About Me</h1>
							<h2>Prepare Trip</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div id="fh5co-couple" class="fh5co-section-gray">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>Why Taiwan</h2>
					<h3>August 11th, 2018, Taiwan</h3>
				</div>
			</div>

			<div class="couple-wrap">
				<div class="couple-half">
					<div class="groom">
						<img src="images/taiwan.jpg" alt="groom" class="img-responsive">
					</div>
					<div class="desc-groom">
						<h3>Taiwan</h3>
						<p>대만은 먹을 것으로 유명합니다</p>
					</div>
				</div>
				<p class="heart text-center"><i class="icon-heart2"></i></p>
				<div class="couple-half">
					<div class="bride">
						<img src="images/yerim.jpg" alt="groom" class="img-responsive">
					</div>
					<div class="desc-bride">
						<h3>Lee Ye Rim</h3>
						<p>평소 먹을 것을 좋아하는 저는 대만과 사랑에 빠질 것 입니다. </p>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div id="fh5co-event" class="fh5co-bg" style="background-image:url(images/img_bg_3.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<span>Airplane</span>
					<h2>Boarding Pass</h2>
				</div>
			</div>
			<div class="row" >
				<div class="display-t">
					<div class="display-tc">
						<div class="col-md-10 col-md-offset-1">
							<div class="col-md-6 col-sm-6 text-center">
								<div class="event-wrap">
									<h3>Korea - Taiwan</h3>
									<div class="event-col">
										<i class="icon-clock"></i>
										<span>1:50 PM</span>
										<span>3:25 PM</span>
									</div>
									<div class="event-col">
										<i class="icon-calendar"></i>
										<span>Saturday 11</span>
										<span>Augutst, 2018</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-2 text-center">
								<div class="event-wrap">
									<h3>Taiwan - Korea</h3>
									<div class="event-col">
										<i class="icon-clock"></i>
										<span>2:30 PM</span>
										<span>18:00 PM</span>
									</div>
									<div class="event-col">
										<i class="icon-calendar"></i>
										<span>Tuesday 14</span>
										<span>Augutst, 2018</span>
									</div>
								</div>
							</div>
							<div class="col-md-12 col-sm-6 text-center" style="margin-top:20px;">
								<div class="event-wrap  ">
									<h3>Passport Info</h3>
									<div class="event-col">
										<span>여권번호 </span>
                    					<span>M94351440 </span>

									</div>
									<div class="event-col">
										<span>유효기간</span>
                    					<span>2028.07.23 </span>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<div id="fh5co-started" class="fh5co-bg" style="background-image:url(images/img_bg_4.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row  ">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>CheckList</h2>
						<p>Things to Prepare</p>
						<input type="text" id="myInput" class="checkListInput" placeholder="Title...">
						<span onclick="newElement()" class="addBtn">Add</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<ul id="myUL" class="checkUL">
						<%
						request.setCharacterEncoding("utf-8");	
						String filePath = request.getRealPath("/txtfile/saveCheck.txt");
						BufferedReader br= new BufferedReader(new FileReader(filePath));

						String ss=null;
						String[] words;
						int n=0;
						try{
							while(true){
								ss = br.readLine();
								if(ss==null)break;
								if(n==0) {n++; continue;}		
								words= ss.split("!!");
								
								if(words[1].contains("ok"))
								{
									%>
									<li class="checked"><%=words[0] %></li>
									<%
								}
								else
								{
									%>
									<li class="checkLI"><%=words[0] %></li>
									<%
								}
							}
								br.close();
							}catch(Exception e){	
								e.getStackTrace();
							}
						%>
						</ul>
						

						<script>
						// Create a "close" button and append it to each list item
						var myNodelist = document.getElementsByClassName("checkLI");
						var i;
						for (i = 0; i < myNodelist.length; i++) {
						  var span = document.createElement("SPAN");
						  var txt = document.createTextNode("\u00D7");
						  span.className = "close";
						  span.appendChild(txt);
						  myNodelist[i].appendChild(span);
						}

						// Click on a close button to hide the current list item
						var close = document.getElementsByClassName("close");
						var i;
						for (i = 0; i < close.length; i++) {
						  close[i].onclick = function() {
						    var div = this.parentElement;
						    div.style.display = "none";
						    var str=div.textContent;
						     var substr=str.substring(0,str.indexOf("\u00D7")); 
						     
						     form=document.fileDelete;
						     form.deleteTitle.value=substr;
						      form.target="deletehiddenifr";
						      form.submit();
						      alert(substr+" 삭제되었습니다.");
						      window.location.reload();						     
						    
						  }
						}

						// Add a "checked" symbol when clicking on a list item
						var list = document.querySelector(".checkUL"); //여기다아아아
						list.addEventListener('click', function(ev) {
						  if (ev.target.tagName === 'LI') {
						    ev.target.classList.toggle('checked');
						    
						    if(ev.target.className.includes("checked"))//체크함
						    {
						    	 var str=ev.target.textContent;
								 var substr=str.substring(0,str.indexOf("\u00D7")); 
								   
						    	 form=document.fileCheck;
							     form.checkTitle.value=substr;
							     form.isCheck.value="ok";
							      form.target="checkhiddenifr";
							      form.submit();
							      alert(substr+" 체크되었습니다.");
						    }
						    else //체크취소
						    {
						    	 var str=ev.target.textContent;
								   
						    	 form=document.fileCheck;
							     form.checkTitle.value=str;
							     form.isCheck.value="no";
							     form.target="checkhiddenifr";
							     form.submit();
							     alert(str+" 체크 취소되었습니다.");
						    }
						  }
					      window.location.reload();	 

						}, false);

						// Create a new list item when clicking on the "Add" button
						function newElement() {
						  var li = document.createElement("li");
						  var inputValue = document.getElementById("myInput").value;
						  var t = document.createTextNode(inputValue);
						  li.appendChild(t);
						  if (inputValue === '') {
						    alert("You must write something!");
						  } else {
						    document.getElementById("myUL").appendChild(li);
						  }
						  document.getElementById("myInput").value = "";

						  var span = document.createElement("SPAN");
						  var txt = document.createTextNode("\u00D7");
						  span.className = "close";
						  span.appendChild(txt);
						  li.appendChild(span);

						  form=document.fileAdd;
					      form.saveTitle.value=inputValue;
					      form.target="addhiddenifr";
					      form.submit();
					      alert(inputValue+" 추가되었습니다.");
					      window.location.reload();
					      
						  for (i = 0; i < close.length; i++) {
						    close[i].onclick = function() {
						      var div = this.parentElement;
						      div.style.display = "none";
						    }
						  }
						}
						</script>
					</div>
				</div>
			</div>
</div>


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