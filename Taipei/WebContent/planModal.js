function cardSurvey(title_value,content_value,startDayObj,cnt)
{
	
	var container =  document.createElement("div");
	container.className="container";
	container.style.paddingTop="200px";
	document.getElementById("fh5co-couple-story").appendChild(container);

	var row1 = document.createElement("div");
	row1.className="row";
	container.appendChild(row1);

	var titleDiv = document.createElement("div");
	titleDiv.className="col-md-8 col-md-offset-2 text-center fh5co-heading";
	row1.appendChild(titleDiv);
	
	var titleSpan = document.createElement("span");
	var titleSpanText=document.createTextNode(content_value);
	titleSpan.appendChild(titleSpanText);
    titleDiv.appendChild(titleSpan);
    
    var h2 = document.createElement("h2");
    var h2text=document.createTextNode(title_value);
    h2.appendChild(h2text);
    titleDiv.appendChild(h2);

	var row2 = document.createElement("div");
	row2.className="row";
	container.appendChild(row2);

	var timelinediv = document.createElement("div");
	timelinediv.className="col-md-12 col-md-offset-0";
	row2.appendChild(timelinediv);
	
	var ul = document.createElement("ul");
	ul.className="timeline";
	ul.setAttribute('id',title_value);
	timelinediv.appendChild(ul);
	
	var dateObj=startDayObj;
	var g_planDayCnt="";
	var g_timeFormat="";
	 for(var i=1; i<=cnt;i++){
		 var li = document.createElement("li");
		 ul.appendChild(li);
		 if(i%2==0)
		 {
	       li.className="timeline-inverted";
		 }
		 
		var timelinePanel = document.createElement("div");
		timelinePanel.className="timeline-panel";
		li.appendChild(timelinePanel);
		
		var timelineHeading=  document.createElement("div");
		timelinePanel.appendChild(timelineHeading);
		
		
		var timelineTitle = document.createElement("h3");
        var timelineTitletext=document.createTextNode("Day"+i);
        timelineTitle.appendChild(timelineTitletext);
        timelineHeading.appendChild(timelineTitle);
        
		var timelineDate = document.createElement("span");
		var timeFormat=dateObj.getFullYear()+"/"+(parseInt(dateObj.getMonth())+1)+"/"+dateObj.getDate();
        var timelineDatetext=document.createTextNode(timeFormat);
        timelineDate.className="date";
        timelineDate.appendChild(timelineDatetext);
        timelineHeading.appendChild(timelineDate);

        var timelineBody = document.createElement("div");
        timelineBody.className="timeline-body";
        timelinePanel.appendChild(timelineBody);
        
        var planListContent=document.createElement("p");
        var planListContent_text=document.createTextNode("..");
        planListContent.appendChild(planListContent_text);
        timelineBody.appendChild(planListContent);
        
        var aBtn = document.createElement("a");
        var aBtn_text= document.createTextNode("Modify");
        aBtn.setAttribute('id',title_value+","+content_value+","+"Day"+i+","+timeFormat+"..");
        aBtn.className="btn btn-default btn-sm";
        aBtn.appendChild(aBtn_text);
        aBtn.onclick = function(){getBtnId(this.id)};
        timelineBody.appendChild(aBtn);
        
		dateObj.setDate(dateObj.getDate()+1);
		
		g_planDayCnt+="Day"+i+",";
		g_timeFormat+=timeFormat+",";
	 }
	 
	var form = document.fileSend;
	form.planTitle.value=title_value;
	form.planContent.value = content_value;
	form.planDayCnt.value=g_planDayCnt;
	form.planDate.value=g_timeFormat;
	form.planList.value="..";
	form.target = "hiddenifr";   
	form.submit();
	
	var xBtn = document.createElement("button");
	var xBtn_Text = document.createTextNode("x");
	xBtn.className="w3-button w3-xlarge w3-circle w3-pink w3-card-4";
	xBtn.setAttribute('id','xbtn'+title_value);
	xBtn.style.position="absolute";
	xBtn.style.right="7%";
	xBtn.style.marginTop="20px";
	xBtn.appendChild(xBtn_Text);
	timelinediv.appendChild(xBtn);
	
}

function getBtnId(id)
{
	document.getElementById("btnId").value=id;
}

function getXBtnId(id)
{
	alert("삭제합니다");
	var form = document.Delete;
	form.info.value=id;
	form.target = "deletehiddenifr";   
	form.submit();

}
function createCardSurvey()
{
    //surveycard 생성되는 공간
	var surveyTitle_value=document.getElementById("surveyTitle").value;
	var content_value=document.getElementById("surveyContent").value;
	
	var startDay = document.getElementById("startDay").value;
	var endDay = document.getElementById("endDay").value;
   
    var startDayArr=startDay.split("-"); 
	var endDayArr=endDay.split("-"); 
	
	var startDayObj = new Date(startDayArr[0], Number(startDayArr[1])-1, startDayArr[2]);  
	var endDayObj = new Date(endDayArr[0], Number(endDayArr[1])-1, endDayArr[2]);  
	  
	var betweenDay = ((endDayObj.getTime() - startDayObj.getTime())/1000/60/60/24)+1;     	
    var cnt = betweenDay;
	cardSurvey(surveyTitle_value,content_value,startDayObj,cnt);
	resetSurvey();
	
	alert(betweenDay+"일 동안의 여행");
}

function createSurvey(header)
{
    var form = document.fileGet;
	form.surveyTitle.value=header.id;//설문제목
	form.submit();
}

function modifyPlan()
{
	var btnId = document.getElementById("btnId").value;
	var checkForm = document.getElementById("checkboxPlanList");
	var txt="";
	for(var i=0; i<checkForm.length;i++)
	{
		if(checkForm[i].checked)
		{
    		txt=txt+checkForm.elements[i].value+",";
		}
	}
	    	
	var form = document.Modify;
	form.info.value=btnId;
	form.planList.value=txt;
	form.target = "modifyhiddenifr";   
	form.submit();
}

function resetSurvey()
{
      document.getElementById("surveyTitle").value="";
      document.getElementById("surveyContent").value="";
      document.getElementById("startDay").value="";
      document.getElementById("endDay").value="";
}