<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

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
    
	#title{
		margin-bottom:20px; 
		margin-top: 30px; 
		color:#9BE8D8;
	} 
</style>

<div align=center>
    <h2 id=title>이번 달 판매량</h2>
    <table border="1">
        <thead>
            <tr>
                <th width="50%">유형 1</th>
                <th width="50%">유형 2</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td><img src="resources/img/graph1.png"></td>
                    <td><img src="resources/img/grapg2.png"></td>
                </tr>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/views/bottom.jsp"%>