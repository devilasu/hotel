<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="/resources/hotelReserve.css">
    <title>예약관리</title>
</head>
<body>
    <div class="wrap">
        <div class="nav">
            <h1><a href="/room">객실관리</a> <a href="/booking"><font color="skyblue">예약관리</font></a> ${name}님 어서오세요. <a href="/logout">로그아웃</a></h1>
        </div>
        <div class="divLeft">
            <div class="search">
                숙박기간
                <input type="date" name="mindate" id="mindate" style="width:120px">
                ~
                <input type="date" name="maxdate" id="maxdate" style="width:120px">
                <br>
                객실분류
                <select name="roomType" id="roomType">
                </select>
                <input type="button" id="btnSearch" class="btn" value="찾기">
            </div>
            <div class="pReservation">
                <p>예약 가능</p>
                <select name="reservlist" id="reservlist" size=5 style="width:100%;">
                </select>

            </div>
        </div>
        <div class="divMiddle">
            객실이름
            <input type="text" readonly name="rName" id="rName">
            <br>
            숙박기간
            <input type="date"  name="rMindate" id="rMindate" style="width:120px">
            <span>~</span>
            <input type="date"  name="rMaxdate" id="rMaxdate" style="width:120px">
            <span id="totalDay"></span>
            <br>
            <span>숙박인원</span>
            <input type="text" name="num" id="num"><span>명</span>
            <br>
            <span>1박비용</span>
            <input type="text" readonly name="perPrice" id="perPrice"><span>원</span>
            <br>
            <span>총 숙박비</span>
            <input type="text" readonly readonly name="total" id="total"><span>원</span>
            <br>
            <span>예약자 모바일</span>
            <input type="tel" name="mobile" id="mobile">
            <br>
            <input type="button" class="btn" id="btnAdd" value="등록">
            <input type="button" class="btn" id="btnCancel" value="취소">
            <input type="button" class="btn" id="btnClear" value="Clear">
        </div>
        <div class="divRight">
            <span>예약된 객실</span>
            <select name="reservedlist" id="reservedlist" size=5 style="width:100%;">
                <option>광덕산</option>
                <option>흑성산</option>
                <option>태조산</option>
            </select>
        </div>
    </div>
</body>
<script>
	function calcTotalDate(){
		let startArray = $("#rMindate").val().split("-");
		let endArray = $("#rMaxdate").val().split("-");
		let startDate = new Date(startArray[0],Number(startArray[1])-1,startArray[2]);
		let endDate = new Date(endArray[0],Number(endArray[1])-1,endArray[2]);
		let betweenDate = (endDate.getTime()-startDate.getTime())/1000/60/60/24;
		$("#totalDay").html("<br>("+betweenDate+" 박)");
	}
	function roomTypeInit(){
		let txt = '';
		$("#roomtype").html('');
		$.get("http://localhost:8080/roomtypes",{},function(result){
			for(let roomtype in result){
				txt += "<option value="+result[roomtype].typecode+">"+result[roomtype].name+"</option>";
			}
			$("#roomType").append(txt);
		},'json');
	}
	function reservListInit(){
		let txt = '';
		$("#reservlist").text('');
		$.get("http://localhost:8080/reservations",{
			startDate:$("#mindate").val(),
			endDate: $("#maxdate").val(),
			roomType: $("#roomType option:selected").val()
		},function(result){
			for(let room in result){
				txt += "<option value="+result[room].roomcode+">"+result[room].name+","+result[room].type+","+result[room].howmany+","+result[room].howmuch+"</option>";
			}
			$("#reservlist").append(txt);
			
		},'json');
	}
	function reservedListInit(){
		//get으로 예약된 객실 받아오기
	}
	function clearReservation(){
		$("#reservlist option:selected").prop("selected",false);
		$("#rName").val("");
		$("#mindate").val("");
		$("#maxdate").val("");
		$("#num").val("");
		$("#perPrice").val("");
		$("#total").val("");
		$("#mobile").val("");
	}
	
	function addReservation(){
		let selected = $("#reservlist option:selected");
		if(typeof selected.val() =="undefined" || selected == null || selected ==""){
			alert("예약가능한 객실을 선택하지 않으셨습니다.");
			return false;
		}else{
			let txt = "<option>"+selected.val()+"</option>"
			$("#reservedlist").append(txt);
			selected.remove();
		}
	}
	
	function cancelReservation(){
		let selected = $("#reservedlist option:selected");
		if(typeof selected.val() =="undefined" || selected == null || selected ==""){
			alert("예약가능한 객실을 선택하지 않으셨습니다.");
			return false;
		}else{
			let txt = "<option>"+selected.val()+"</option>"
			$("#reservlist").append(txt);
			selected.remove();
		}
	}
	
	$(document)
		.ready(function(){
			roomTypeInit();
		})
		.on("click", "#btnSearch", function(){
			reservListInit();
			reservedListInit();
		})
		.on("click","#btnAdd",function(){
			addReservation();
		})
		.on("click","#btnCancel",function(){
			cancelReservation();
		})
		.on("click","#btnClear",function(){
			clearResrvation();
		});
	
	$("#reservlist").change(function(){
		let selected = $("#reservlist option:selected");
		$("#rName").val(selected.val());
		calcTotalDate();
	});
	
	$("#reservedlist").change(function(){
		let selected = $("#reservedlist option:selected");
		$("#rName").val(selected.val());
		calcTotalDate();
	});

</script>
</html>