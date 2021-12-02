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
   td{padding:10px; background-color: #ffffff;
      text-align: left;}
   input,textarea{font-family: 'Gowun Dodum', sans-serif; font-size: 15px;}
   th{ padding: 1em;
   font-family: 'Hahmlet', serif;
   }     
</style>
<script src="resources/jquery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="resources/js/board.js"></script>
<title>글쓰기</title>
</head>
<body>
  <form action="writePro" method="post" name="wForm">
   <table border="1" >
      <thead><tr><th colspan="2" style="background-color: #D9E5FF"><h2>글쓰기</h2></th></tr></thead>
      <tbody> 
          <c:if test="${dto.num!=0 and dto.ref!=0 and dto!=null}">
	          <tr><th style="width: 30%; background-color: #D9E5FF">제목</th>
	              <td><input name="subject" placeholder="제목을 입력하세요" size="50" class="chk" value="[답글]" >
		             <input type="hidden" name="num" value="${dto.num}">
			         <input type="hidden" name="ref" value="${dto.ref}">
			         <input type="hidden" name="step" value="${dto.step}">
			         <input type="hidden" name="lev" value="${dto.lev}">
	              </td>
	          </tr>
          </c:if>
          <c:if test="${dto.num==0 or dto==null}">
	          <tr><th style="width: 30%; background-color: #D9E5FF">제목</th>
	              <td><input name="subject" placeholder="제목을 입력해주세요" class="chk" size="50" ></td>
	          </tr>
          </c:if>
         <tr><th style="width: 30%; background-color: #D9E5FF">글쓴이</th>
             <td><input name="writer" placeholder="이름을 입력해주세요" class="chk" size="70"></td>
         </tr>
         <tr><th style="width: 30%; background-color: #D9E5FF">글내용</th>
             <td><textarea rows="25" cols="70" class="chk" name="content" placeholder="내용을 입력해주세요"></textarea></td>
         </tr>
         <tr><th style="width: 30%; background-color: #D9E5FF">이메일</th>
             <td><input size="70" type="email" class="chk" name="email" placeholder="이메일 주소를 입력해주세요" ></td>
         </tr>
         <tr><th style="width: 30%; background-color: #D9E5FF">비밀번호</th>
             <td><input size="70" type="password" class="chk" name="passwd" placeholder="비밀번호를 입력해주세요" ></td>
         </tr>
    </tbody>
    <tfoot>
		   <tr> <td colspan="2" style="text-align: center; background-color: #D9E5FF"> 
		         <input type="button" id="submit1" value="글저장">
		         <input type="button" value="글목록" onclick="javascript:location.href='list'">
		        </td>
		   </tr>
	</tfoot>
   </table>
  </form>
</body>
</html>