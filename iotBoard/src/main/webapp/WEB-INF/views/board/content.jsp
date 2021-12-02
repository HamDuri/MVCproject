<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글내용</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@400;597;600&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Gaegu:wght@300&family=Gowun+Dodum&family=Hahmlet:wght@400;597;600&display=swap');
  * { margin: auto;}
   body{background-image:url('resources/images/back.jpeg');
   		background-size: 100%;
   		background-attachment: fixed; }
   table{ text-align: center; 
          width: 700px;
          border:1px #4b0082;
          color: #4A496F; }
   td{padding:10px;  background-color: #ffffff;
      text-align: left;}
   input,textarea{font-family: 'Gowun Dodum', sans-serif; font-size: 15px;}
   th{ padding: 1em;
   	   font-family: 'Hahmlet', serif;
   }   
</style>
<script src="resources/jquery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/board.js"></script>
</head>
<body>
<form action="" method="post" name="content">
<table border="1">
		<thead><tr><th colspan="2" style="background-color: #D9E5FF"><h2>글내용</h2></th></tr></thead>
		<tbody>
			<tr><th style="width:30%; background-color: #D9E5FF">글제목</th>
				<td><input name="subject" value="${dto.subject}" readonly="readonly" size="70"></td></tr>
			<tr><th style="width:30%; background-color: #D9E5FF">글쓴이</th>
				<td><input name="writer" value="${dto.writer}" readonly="readonly" size="70"></td></tr>			   
			<tr><th style="width:30%; background-color: #D9E5FF">글내용</th>
				<td><textarea rows="25" cols="70" name="content" readonly="readonly">${dto.content}</textarea></td></tr>
			<tr><th style="width:30%; background-color: #D9E5FF">이메일</th>
				<td><input type="email" value="${dto.email}" name="email"  readonly="readonly" size="70"></td></tr>			
		</tbody>
		<tfoot>
			<tr><td colspan="2" style="text-align: center; background-color: #D9E5FF">
				<input type="hidden" name="num" value="${dto.num}">
				<input type="hidden" name="ref" value="${dto.ref}">
				<input type="hidden" name="step" value="${dto.step}">
				<input type="hidden" name="lev" value="${dto.lev}">
				<input type="hidden" name="passwd" value="${dto.passwd}">
				<input type="hidden" name="currentPage" value="${pvo.currentPage}"/>
				<input type="button" value="글목록" onclick="javascript:location.href='/iotb/list?currentPage=${pvo.currentPage}'">
				<input type="button" value="답글"  onclick="javascript:sendConfirm('reply')">
				<input type="button" value="글수정" onclick="javascript:sendConfirm('update')">
				<input type="button" value="글삭제" onclick="javascript:sendConfirm('delete')">
				</td>
			</tr>
		</tfoot>
	</table>
</form>
</body>
</html>