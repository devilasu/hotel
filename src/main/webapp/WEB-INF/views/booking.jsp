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
            <h1><a href="/room">객실관리</a> <a href="/booking"><font color="skyblue">예약관리</font></a> ${uid}님 어서오세요. <a href="/logout">로그아웃</a></h1>
        </div>
        <div class="divLeft">
            <div class="search">
                숙박기간
                <input type="text" name="minday" id="minday" style="width:70px">
                ~
                <input type="text" name="maxday" id="maxday" style="width:70px">
                <br>
                객실분류
                <select name="roomType" id="roomType">
                    <option value="sweet">Sweet Room</option>
                    <option value="family">Family Room</option>
                    <option value="double">Double Room</option>
                    <option value="single">Single Room</option>
                </select>
                <input type="button" id="btnSearch" class="btn" value="찾기">
            </div>
            <div class="pReservation">
                <p>예약 가능</p>
                <select name="reservlist" id="reservlist" size=5 style="width:100%;">
                    <option>한라산</option>
                    <option>백두산</option>
                    <option>관악산</option>
                    <option>남산</option>
                </select>

            </div>
        </div>
        <div class="divMiddle">
            객실이름
            <input type="text" readonly name="rName" id="rName">
            <br>
            숙박기간
            <input type="text" readonly name="minday" id="minday" style="width:60px">
            <span>~</span>
            <input type="text" readonly name="maxday" id="maxday" style="width:60px">
            <span>(N박)</span>
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
            <select name="reservedlist" id="reserveedlist" size=5 style="width:100%;">
                <option>광덕산</option>
                <option>흑성산</option>
                <option>태조산</option>
            </select>
        </div>
    </div>
</body>
<script>
    document.getElementById("btnSearch").onclick=function(){
        let sel = document.getElementById("roomType");
        alert(sel.options[sel.selectedIndex].value+"룸을 검색합니다.");
    }
    document.getElementById("btnAdd").onclick=function(){
        alert("내용을 예약합니다.");
    }
    document.getElementById("btnCancel").onclick=function(){
        alert("예약을 취소합니다.");
    }
    document.getElementById("btnClear").onclick=function(){
        alert("내용을 비웁니다.");
    }
</script>
</html>