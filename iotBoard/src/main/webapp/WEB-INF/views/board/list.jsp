<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글목록</title>
	<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@400;597;600&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Gaegu:wght@300&family=Gowun+Dodum&family=Hahmlet:wght@400;597;600&display=swap');
	  * { margin: auto  }
	   body{background-image:url('resources/images/back.jpeg');
   		background-size: 100%;
   		background-attachment: fixed; }
	   table{ text-align: center; 
	      width: 1000px;
	      border:1px #4b0082;
	      color: #4A496F;
	   }
	   td{padding:5px;}
	   input,textarea,p{font-family: 'Gowun Dodum', sans-serif; font-size: 15px;}
	   th{ padding: 1em;  font-family: 'Gowun Dodum', sans-serif; font-size: 15px; }   
	   th,td{ border:1px solid blue; font-family: 'Gowun Dodum', sans-serif; font-size: 17px;}
	   h2{ padding: 1em;
	   font-family: 'Hahmlet', serif;
	   	   text-align:center }   
	   a:link{color: black; text-decoration: none}
	   a:visited{color: black; text-decoration: none}
	   a:hover{color: black; text-decoration: none}
	</style>
</head>
<body>
<h2>게 시 글 목 록</h2>
<p>
<p style="text-align:right; width: 1000px;">전체게시글 수 : &nbsp; ${pvo.allCount}</p>
<p style="text-align:left; width: 1000px;"><input type="button" value="글쓰기" onclick="javascript:location.href='writeForm'" /></p>
<table border="">
	<thead>
	 <tr style="background-color: #e6e6fa">
	  <th>번호</th> <th>제목</th> <th>작성자</th> <th>작성일자</th> <th>IP</th> <th>조회수</th>
	 </tr>
	</thead>
	<tbody>
	 <c:choose>
	  <c:when test="${fn:length(list)>0}">
	   <c:forEach var="dto" items="${list}">
	 	<tr>
		  <td style="text-align: center; width: 7%">${dto.no}</td>
		  <td style="text-align: left; width: 45%">
		  <c:choose>
		  	<c:when test="${dto.lev==0}">
		  		<img src="resources/images/level.gif" width="5px">
		  	</c:when>
		  	<c:when test="${dto.lev>0}">
		  		<img src="resources/images/level.gif" width="${dto.lev*10}px">
		  		<img src="resources/images/arro.png">
		  	</c:when>
		  </c:choose>
		  <a href="content?num=${dto.num}&amp;currentPage=${pvo.currentPage}">${dto.subject}</a>
		  <c:if test="${dto.readcount>=7}"><img src = "resources/images/like.gif" width="30px"/></c:if>
		  </td>
		  <td><a href="mailto:${dto.email}">${dto.writer}</a></td>
		  <td>${dto.reg_date}</td>
		  <td>${dto.ip}</td>
		  <td style="text-align:center; width:9%">${dto.readcount}</td>
	 	</tr>
	   </c:forEach>
	  </c:when>
	  <c:when test="${fn:length(list)==0}">
	 	<tr>
	 	 <td colspan="6" style="text-align:center">게시글이 없습니다.</td>
	 	</tr>
	  </c:when>
	 </c:choose>
	</tbody>
	<tfoot>
	 	<tr>
	 	 <td colspan="6" style="text-align:center">
	 	  <c:forEach var = "i" begin="${1}" end="${pvo.pagAllCnt}">
	 	    <a href="list?currentPage=${i}">[${i}]</a>&nbsp;&nbsp;
	 	  </c:forEach>
	 	</tr>
	</tfoot>
</table>
</body>
</html>