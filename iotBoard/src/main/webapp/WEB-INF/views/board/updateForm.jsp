<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
      color: #4A496F;
   }
   td{padding:10px;  background-color: #ffffff;
      text-align: left;}
   input,textarea{font-family: 'Gowun Dodum', sans-serif; font-size: 15px;}
   th{ padding: 1em;
  font-family: 'Hahmlet', serif;
   }   
</style>
<title>글수정</title>
<script src="resources/jquery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/board.js"></script>
</head>
<body>
   <form action="updatePro" method="post" name="wForm">
   <table border="1">
      <thead><tr><th colspan="2" style="background-color: #D9E5FF"><h2>글수정</h2></th></tr></thead>
      <tbody> 
         <tr><th style="width: 30%; background-color: #D9E5FF">제목</th>
	         <td><input name="subject" value='${dto.subject}' class="chk" size="50">
	         	 <input type="hidden" value='${dto.num}' name="num">
	         </td>
	     </tr>
         <tr><th style="width: 30%; background-color: #D9E5FF">글쓴이</th>
             <td><input name="writer" value='${dto.writer}' class="chk" size="70"></td>
         </tr>
         <tr><th style="width: 30%; background-color: #D9E5FF">글내용</th>
             <td><textarea rows="25" cols="60" class="chk" name="content">${dto.content}</textarea></td>
         </tr>
         <tr><th style="width: 30%; background-color: #D9E5FF">이메일</th>
             <td><input size="70" type="email" class="chk" name="email" value='${dto.email}'></td>
         </tr>
         <tr><th style="width: 30%; background-color: #D9E5FF">비밀번호</th>
             <td><input size="70" type="password" class="chk" name="passwd" value='${dto.passwd}'></td>
         </tr>
    </tbody>
    <tfoot>
		   <tr> <td colspan="2" style="text-align: center; background-color: #D9E5FF"> 		   		
		         <input type="hidden" value="${pvo.currentPage}" name="currentPage"/>
		         <input type="button" value="글수정" id="submit1">
		         <input type="button" value="글목록" onclick="javascript:location.href='list?currentPage=${pvo.currentPage}'">
		        </td>
		   </tr>
	</tfoot>
   </table>
   </form>
   
</body>
</html>