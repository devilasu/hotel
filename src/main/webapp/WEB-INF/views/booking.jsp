<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="/resources/hotelRoom.css">
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <title>예약관리</title>
</head>
<body>
    <div class="container">
    	<div class="row">
    		<span class="col-md-2 col-md-offset-9">
    		${name}님 어서오세요
    		</span>
    		<a class="btn btn-default col-md-1" href="/logout">로그아웃</a>
    	</div>
        <div class="nav nav-tabs">
            <li role="presentation"><a href="/room">객실관리</a></li>
            <li class="active" role="presentation"><a href="/booking">예약관리</a></li>
        </div>
        <div class="row">
	        <div class="divLeft col-md-4">
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
	        <div class="divMiddle col-md-4">
	        <br>
	        	<div class="row">
		            <h5 class="col-md-3">객실이름</h5>
		            <input class="col-md-7" type="text" readonly name="rName" id="rName">
	            </div>
	            <div class="row">
		            <h5 class="col-md-3">숙박기간</h5>
		            <input class="col-md-7" type="date"  name="rMindate" id="rMindate">
		        </div>
		        <div class="row">
		            <h4 class="col-md-1 col-md-offset-1">~</h4>
		            <input class="col-md-7" type="date"  name="rMaxdate" id="rMaxdate">
	            	<span class="col-md-3" id="totalDay"></span>
	            </div>
	            <div class="row">
		            <h5 class="col-md-3">숙박인원</h5>
		            <input class="col-md-7" type="number" name="num" id="num" min="0"><span>명</span>
	            </div>
	            <div class="row">
		            <h5 class="col-md-3">1박비용</h5>
		            <input class="col-md-7" type="text" readonly name="perPrice" id="perPrice"><span>원</span>
	            </div>
	            <div class="row">
		            <h5 class="col-md-3">총 숙박비</h5>
		            <input class="col-md-7" type="text" readonly readonly name="total" id="total"><span>원</span>
	            </div>
	            <div class="row">
		            <h5 class="col-md-4">예약자 모바일</h5>
		            <input class="col-md-6" type="tel" name="mobile" id="mobile">
	            </div>
	            <div class="row">
		            <input type="button" class="btn btn-primary col-md-2" id="btnAdd" value="등록">
		            <input type="button" class="btn btn-danger col-md-2" id="btnCancel" value="취소">
		            <input type="button" class="btn btn-default col-md-2" id="btnClear" value="Clear">
		        </div>
	        </div>
	        <div class="divRight col-md-4">
	            <span>예약된 객실</span>
	            <select name="reservedlist" id="reservedlist" size=10 style="width:100%;">
	            </select>
	        </div>
        </div>
    </div>
</body>
<script>
	function calcTotalDate(startdate, enddate){
		let startArray = String(startdate).split("-");
		let endArray = String(enddate).split("-");
		let startDate = new Date(startArray[0],Number(startArray[1])-1,startArray[2]);
		let endDate = new Date(endArray[0],Number(endArray[1])-1,endArray[2]);
		let betweenDate = (endDate.getTime()-startDate.getTime())/1000/60/60/24;
		return betweenDate;
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
		$.get("http://localhost:8080/reservrooms",{
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
		let txt = '';
		$("#reservedlist").text('');
		$.get("http://localhost:8080/reservedrooms",{
			startDate:$("#mindate").val(),
			endDate: $("#maxdate").val(),
			roomType: $("#roomType option:selected").val()
		},function(result){
			for(let room in result){
				txt += "<option value="+result[room].bookcode+">"+result[room].name+","+result[room].startDate.split(' ')[0]+","+result[room].endDate.split(' ')[0]+","+result[room].howmanyNum+","+result[room].howmany+","+result[room].howmuch+","+result[room].mobile+"</option>";
			}
			$("#reservedlist").append(txt);
			
		},'json');
	}
	function clearReservation(){
		$("#reservlist option:selected").prop("selected",false);
		$("#rName").val("");
		$("#rMindate").val("");
		$("#rMaxdate").val("");
		$("#num").val("");
		$("#perPrice").val("");
		$("#total").val("");
		$("#mobile").val("");
	}
	
	function addReservation(){
		let selected = $("#reservlist option:selected");
		let selected2 = $("#reservedlist option:selected");
		if((typeof selected.val() =="undefined" || selected == null || selected =="") && (typeof selected2.val() =="undefined" || selected2 == null || selected2 =="") ){
			alert("예약가능한 객실을 선택하지 않으셨습니다.");
			return false;
		}else{
			$.post( "http://localhost:8080/reservrooms",{
				bookcode:$("#reservedlist option:selected").val(),
				roomcode:$("#reservlist option:selected").val(),
				startDate:$("#rMindate").val(),
				endDate:$("#rMaxdate").val(),
				howmanyNum:$("#num").val(),
				mobile:$("#mobile").val()
			},function(result){
				if(typeof selected2.val() != "undefined"){
					selected2.remove();
					let txt = "<option value="+result+">"+$("#rName").val()+","+$("#rMindate").val()+","+$("#rMaxdate").val()+","+$("#num").val()+","+$("#num").prop("max")+","+$("#perPrice").val()+","+$("#mobile").val()+"</option>";
					$("#reservedlist").append(txt);
					
				}else{
					let txt = "<option value="+result+">"+$("#rName").val()+","+$("#rMindate").val()+","+$("#rMaxdate").val()+","+$("#num").val()+","+$("#num").prop("max")+","+$("#perPrice").val()+","+$("#mobile").val()+"</option>";
					$("#reservedlist").append(txt);
					selected.remove();
				}
			},'json'
			);
		}
	}
	function cancelReservation(){
		let selected = $("#reservedlist option:selected");
		if(typeof selected.val() =="undefined" || selected == null || selected ==""){
			alert("예약한 객실을 선택하지 않으셨습니다.");
			return false;
		}else{
			console.log($("#reservedlist option:selected").val());
			if(confirm("삭제하시겠습니까?")){
		    	$.ajax({
		    		url : "http://localhost:8080/reservrooms?bookcode="+$("#reservedlist option:selected").val(),
		    	    type : "delete",
		    	    success: function(result) {
		    	    	reservListInit();
		    			selected.remove();
		    			return false;
		    	    }
		    	});
	    	}
		}
	}
	
	$(document)
		.ready(function(){
			roomTypeInit();
		})
		.on("click", "#btnSearch", function(){
			let startdate = $("#mindate").val();
			let enddate = $("#maxdate").val();
			if(startdate>enddate || startdate == "" || enddate==""){
				alert("날짜를 제대로 입력하세요.");
				return false;
			}else{
				reservListInit();
				reservedListInit();
				return false;
			}
		})
		.on("click","#btnAdd",function(){
			addReservation();
			return false;
		})
		.on("click","#btnCancel",function(){
			cancelReservation();
			return false;
		})
		.on("click","#btnClear",function(){
			clearReservation();
			return false;
		})
		.on("blur","#num",function(){
			let max = parseInt(this.getAttribute("max"));
			let min = parseInt(this.getAttribute("min"));
			if(parseInt($("#num").val())>max)
				$("#num").val(max);
			if(parseInt($("#num").val())<min)
				$("#num").val(min);
		})
		.on("keypress","#num",function(){
			if( (event.keyCode < 48) || (event.keyCode > 57))
				event.returnValue = false;
		});
	
	$("#reservlist").change(function(){
		let selected = $("#reservlist option:selected");
		let txtArray = selected.text().split(',');
		$("#rName").val(txtArray[0]);
		$("#rMindate").val($("#mindate").val());
		$("#rMaxdate").val($("#maxdate").val());
		let betweenday = calcTotalDate($("#rMindate").val(),$("#rMaxdate").val());
		$("#totalDay").html("("+betweenday+" 박)");
		$("#num").val("");
		$("#num").attr('max',txtArray[2]);
		$("#perPrice").val(txtArray[3]);
		$("#total").val(txtArray[3]*betweenday);
		$("#mobile").val("");
		$("#reservedlist option:selected").prop("selected",false);
		return false;
	});
	
	$("#reservedlist").change(function(){
		let selected = $("#reservedlist option:selected");
		let selectedArray = selected.text().split(",");
		$("#rName").val(selectedArray[0]);
		$("#rMindate").val(selectedArray[1]);
		$("#rMaxdate").val(selectedArray[2]);
		$("#num").val(selectedArray[3]);
		$("#num").attr('max',selectedArray[4]);
		$("#perPrice").val(selectedArray[5]);
		$("#total").val($("#perPrice").val()*calcTotalDate($("#rMindate").val(),$("#rMaxdate").val()));
		$("#mobile").val(selectedArray[6]);
		$("#totalDay").html("("+calcTotalDate($("#rMindate").val(),$("#rMaxdate").val())+" 박)");
		$("#reservlist option:selected").prop("selected",false);
		return false;
	});

</script>
</html>