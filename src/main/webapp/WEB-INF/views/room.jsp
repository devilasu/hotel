<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="/resources/hotelRoom.css">
    <title>객실관리</title>
</head>
<body>
    <div class="wrap">
        <div class="nav">
            <h1><a href="room"><font color="skyblue">객실관리</font></a> <a href="/booking">예약관리</a> <a href="/logout">로그아웃</a></h1>
        </div>
        <br>
        <div class="divLeft">
            <div class="roomList">
            	<select name="roomList" id="roomList" size=10 style="width:100%;">
<!--             	<c:forEach items="${list}" var="room">
	            		<option value="${room.roomcode}">${room.roomcode},${room.name},${room.type},${room.howmany},${room.howmuch}</option>
            		</c:forEach> -->
            	</select>
            </div>
        </div>
        <div class="divRight">
            <span>객실이름</span>
            <input type="text" name="roomName" id="roomName">
            <br>
            <span style="vertical-align: top;">객실분류</span>
            <div class="divScroll borderSolid">
                <select name="roomtype" id="roomtype" size=5 style="width:100%;">
<!--            <c:forEach items="${type}" var="room">
                    <option value= "${room.name}">
                        ${room.name}
                    </option>
                </c:forEach> -->
                </select>
            </div>
            <br>
            <span>숙박가능인원</span>
            <select name="num" id="num">
                <option value="1">1명</option>
                <option value="2">2명</option>
                <option value="3">3명</option>
                <option value="4">4명</option>
                <option value="5">5명</option>
                <option value="6">6명</option>
                <option value="7">7명</option>
                <option value="8">8명</option>
            </select>
            <br>
            <br>
            <span>1박요금</span>
            <input type="text" name="dayPrice" id="dayPrice">원
            <br>
            <br>
            <br>
            <input type="button" class="btn" id="btnAdd" value="등록">
            <input type="button" class="btn" id="btnDelete" value="삭제">
            <input type="button" class="btn" id="btnClear" value="Clear">
        </div>
    </div>  
</body>
<script>
function roomListInit(){
	let txt = '';
	$("#roomList").html('');
	$.get("http://localhost:8080/rooms",{},function(result){
		for(let room in result){
			txt += "<option value="+result[room].roomcode+">"+result[room].roomcode+","+result[room].name+","+result[room].type+","+result[room].howmany+","+result[room].howmuch+"</option>";
		}
		$("#roomList").append(txt);
		
	},'json');
}
function roomTypeInit(){
	let txt = '';
	$("#roomtype").html('');
	$.get("http://localhost:8080/roomtypes",{},function(result){
		for(let roomtype in result){
			txt += "<option value="+result[roomtype].typecode+">"+result[roomtype].name+"</option>";
		}
		$("#roomtype").append(txt);
	},'json');
}

function rightInit(){
	$("#roomName").val("");
	$("#roomtype option:eq(0)").prop("selected", true);
	$("#num option:eq(0)").prop("selected", true);
	$("#dayPrice").val("");
}
$(document)
.ready(function(){
	roomListInit();
	roomTypeInit();
})
	$("#roomList").change(function(){
		let selected = $("#roomList option:selected").text().split(",");
		$("#roomName").val(selected[1]);
		$("#roomtype option:contains("+selected[2]+")").prop("selected", true);
		$("#num").val(selected[3]).prop("selected", true);
		$("#dayPrice").val(selected[4]);
	})
    document.getElementById("btnAdd").onclick=function(){
		let sendReply = {roomcode:$("#roomList option:selected").val(),name:$("#roomName").val(),type:$("#roomtype option:selected").val(),howmany:$("#num option:selected").val(),howmuch:$("#dayPrice").val()};
       $.ajax({
    	   url:"/rooms",
    	   type:"post",
    	   data:JSON.stringify(sendReply),
    	   contentType:"application/json; charset=UTF-8",
    	   dataType:"json",
    	   success:function(result){
    		   roomListInit();
    	   }
       })
    }
    document.getElementById("btnDelete").onclick=function(){
    	if(confirm("삭제하시겠습니까?")){
	    	$.ajax({
	    		url : "http://localhost:8080/rooms?roomcode="+$("#roomList option:selected").val().split(",")[0],
	    	    type : "delete",
	    	    success: function(result) {
	    	    	$("#roomList option:selected").remove();
	    	    	rightInit();
	    	    }
	    	});
    	}
    	return false;
    }
    document.getElementById("btnClear").onclick=function(){
        $("#roomName, #dayPrice").val('');
        $("#roomtype option:selected").prop("selected",false);
        $("#num option:selected").prop("selected",false);
    }
</script>
</html>