<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	
	function cancelPay(order_number){
		
		console.log("order_number : " + order_number)
		var member_num = document.getElementById("member_num").value;
		console.log("member_number : " + member_num)
		
		var IMP = window.IMP;
		IMP.init(""); // IMP 입력
		
		$.ajax({
			url : "payment_cancel.do",
			type : "post",
			headers : {"Content-Type" : "application/json"},
			// contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data : JSON.stringify({
				order_number : order_number
			}),
			dataType : "json"
		}).done(function(data){
			
			console.log(data);
			
			if (data.result === "success") {
    			var msg = '환불이 완료되었습니다.';
				alert(msg);
				window.location = "orderChk.do?member_num=" + member_num;
			} else {
    			var msg = '환불과정에서 문제가 발생했습니다.';
    			alert(msg);
    			window.location = "orderChk.do?member_num=" + member_num;
    		}
		}).fail(function(jqXHR, textStatus, errorThrown) {
		    console.error("AJAX 요청 실패:", textStatus, errorThrown);
		    var msg = 'AJAX 요청 중 오류가 발생했습니다.';
		    alert(msg);
		    window.location = "orderChk.do?member_num=" + member_num;
		});
		
	}
	function shipmentTracking로이동() {
        //var member_num = document.getElementById("member_num").value;
        var win=window.open("","PopupWin","width=900 height=600");
        document.PopForm.submit();
        //win.document.write("tracckShipment.do?member_num="+member_num);
        //window.location = "trackShipment.do?member_num=" + member_num;
    }
	
	
</script>

<style>
.btn1 {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 3px;
	margin-right: 0px;
}

.btn2 {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 0px;
	margin-right: 4px;
}

table {
	
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table th {
	
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #efefef;
}

.box {
	width: 10%;
	padding: 10px;
}

table td {

	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
} 

 .button-container {
        text-align: center;
        margin-top: 20px;
             
    }
    
    .tracking-button {
		border: 1px solid skyblue;
		background-color: rgba(0, 0, 0, 0);
		color: skyblue;
        padding: 5px;
        border-radius: 5px;
        margin-left: 10px; /* 왼쪽 여백 추가 */
        margin-right: 50px;
    }
#title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;} 
</style>
<div align=center>
    <h2 id=title>주문 목록</h2>
    <table border="1">
        <thead>
            <tr>
                <th width="10%">주문 번호</th>
                <th width="7%">주문 정보</th>
                <th width="7%">가격</th>
                <th width="6%">주문 타입</th>
                <th width="10%">적립 예정 포인트</th>
                <th width="30%">주문 컨텐츠</th>
                <th width="15%">주문 시간</th>
                <th width="15%">주문 취소/구매확정</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${orderList}" var="order">
                <tr>
                    <td>${order.order_number}</td>
                    <td>${order.order_info}</td>
                    <td>${order.order_price}</td>
                    <td>${order.order_type}</td>
                    <td>${order.order_point}</td>
                    <td>${order.order_content}</td>
                    <td>${order.order_time}</td>
                    <td>
                    	<c:if test="${order.confirm_pay == 1}">
                    		<input type="button" class="btn btn-primary" value="구매확정" disabled>
                    		<input type="button" class="btn btn-primary" value="취소/환불" disabled>
                    	</c:if>
                    	<c:if test="${order.confirm_pay == 0}">
                    		<a class="btn btn-primary" href="cPay.do?order_number=${order.order_number}&order_point=${order.order_point}&member_num=${sessionScope.memberVO.member_num}">확정</a>
                    		<input type="button" onclick="cancelPay('${order.order_number}')" class="btn btn-primary" value="취소/환불">
                    	</c:if>
                    </td>	
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="button-container">
    <form name="PopForm" action="trackShipment.do?member_num=${sessionScope.memberVO.member_num }"  target="PopupWin">
     <button onclick="shipmentTracking로이동()" class="tracking-button" >택배 위치 확인</button>
	</form>
</div>
</div>




<input type="hidden" name="member_num" id="member_num" value="${sessionScope.memberVO.member_num}">

<%@ include file="/WEB-INF/views/bottom.jsp"%>