<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>

<style>
#protion {
	width: 800px;
	margin: 20px auto;
}
#proNo,#pro{

 width:550px;
 height:200px;
 border:1px solid #337ab7;
 border-radius:3px;

}
 #protion #button{
width:120px;
margin:20px 250px;
 
}
 #protion #add{
margin-right:30px;
}
 #protion .pro{
font-size:15px;
 float:left;
 height:40px;
 background:#337ab7;
 line-height:40px;
 margin-left:10px;
 color:#fff;
 padding:0 10px;
 text-align:centre;
 margin-top:10px;
 border-radius:3px;
}
 #protion .select{
background:red;
}
</style>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />



<script>	
$().ready(function(){
	
	
	$("#protion .pro").click(function(){
		$(this).toggleClass("select");
	})
	
	$("#protion #add").click(function(){
		
		   if($("#proNo").find(".select").length>0){
	     var pid=$("#proNo").find(".select").data("id");
			
			  $.ajax({
				  url:"dep",
				  type:"post",
				  data:{
					  type:"manage1",
					  did:"${id}",
					  pid:pid
					 },
			    dataType:"text",
			    success:function(data){
				  if(data=="true"){
					 var dep=$("#proNo").find(".select");
					   dep.removeClass("select");
					  $("#pro").append(dep);
					  
					  
				  }
				  
			  }
				  
				  
			  })
		  }else{
			  alert("请选中");
		  }
		
		
		
	})
	
		$(" #protion #delete").click(function(){
		
		   if($("#pro").find(".select").length>0){
	     var pid=$("#pro").find(".select").data("id");
			
			  $.ajax({
				  url:"dep",
				  type:"post",
				  data:{
					  type:"manage2",
					  did:"${id}",
					  tid:pid
					 },
			    dataType:"text",
			    success:function(data){
				  if(data=="true"){
					 var dep=$("#pro").find(".select");
					   dep.removeClass("select");
					  $("#proNo").append(dep);
					  
					  
				  }
				  
			  }
				  
				  
			  })
		  }else{
			  alert("请选中");
		  }
		   });
	
	
 
		
	
    
    
	var x=0;
	 var y=0;
    $( "#protion .pro" ).draggable({
      start: function() {
      y=$(this).offset().top;
      x = $(this).offset().left;
      },
      drag: function() {
       
      },
      stop: function() {
      var pro=$(this);	  
      var y1=$(this).offset().top;
     var x1 = $(this).offset().left;
     var xmin=$("#pro").offset().left;
     var xmax=xmin+parseFloat($("#pro").css("width"));	 
     var ymin=$("#pro").offset().top;
     var ymax= ymin+parseFloat($("#pro").css("height"));
     var x1min=$("#proNo").offset().left;
     var x1max=xmin+parseFloat($("#proNo").css("width"));	 
     var y1min=$("#proNo").offset().top;
     var y1max= y1min+parseFloat($("#proNo").css("height"));
  var pid=$(this).data("id");
     if(x>=xmin&x<=xmax&y>ymin&y<ymax){
    	 if(x1>=x1min&x1<=x1max&y1>y1min&y1<y1max){
    		  $.ajax({
				  url:"dep",
				  type:"post",
				  data:{
					  type:"manage2",
					  did:"${id}",
					  tid:pid
					 },
					 dataType:"text",
					 success:function(data){
						 if(data=="true"){
							
							pro.css("position","static");
							$("#proNo").append(pro);
							pro.css("position","relative");
						pro.css("top",0);
						pro.css("left",0);
						pro.removeClass("select");
						 }
						 
					 }
					 })
					
    		 
    	 }else{
    		
    		 $(this).offset({left:x,top:y});
    		 $(this).removeClass("select");
    	 }
     } 
     else{
    	 if(x1>=xmin&x1<=xmax&y1>ymin&y1<ymax){
    	 $.ajax({
				  url:"dep",
				  type:"post",
				  data:{
					  type:"manage1",
					  did:"${id}",
					  pid:pid
					 },
					 dataType:"text",
					 success:function(data){
						 if(data=="true"){
								
								pro.css("position","static");
								$("#pro").append(pro);
								pro.css("position","relative");
							pro.css("top",0);
							pro.css("left",0);
							pro.removeClass("select");
						
						 }
						 
					 }
					 })
					
    	 } 
    	
    	 else{
    	
    	 $(this).offset({left:x,top:y});
    	 $(this).removeClass("select");
    	 }
    	 
     }
    	 
      }
    	 
      
    });
    

    
    
})


</script>

</head>
<body>
<div id="protion">


 <h1> ${name}</h1>
  <div id="pro">
 
			<c:forEach items="${proList}" var="pro">
			
			 <div class="pro" data-id="${pro.id}">${pro.name}</div>

		 </c:forEach>   
		
</div>

  <div id="button">
  <button id="add" type="button" class="btn btn-primary">↑</button>
   <button id="delete" type="button" class="btn btn-primary">↓</button>
  
  
  </div>



		<div id="proNo">

			<c:forEach items="${proListNo}" var="pro">

          <div class="pro" data-id="${pro.id}" id="#abc">${pro.name}</div>
		 </c:forEach>
		
	</div>
		
		

	</div>








