<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="../room/room_header.jsp" />

<body>

<div class="room_contents">
      <!-- 게시판 출력 사이즈 줄임 -->
		  <div class="board_part" >
		   <c:if test="${empty list}" >
        <a href="form">게시판 만들기</a>
       </c:if>
       
     <div class="d-flex justify-content-between mb-3">
		   <i class="fas fa-cog" onclick="func()" id="boardManagement" style="display:inline-block; font-size:1.2em;"></i>
		   <span id="addlink" style="margin-left:5em;"></span>
		 </div>  
		   
		   <!-- 게시판 목록 출력 -->
			 <div class="board_list">
			 
				 <c:forEach items="${list}" var="item">
				   <div class="d-flex justify-content-between border-bottom board_list__div" style="height:3em; align-items:center;">
				      <input name="boardNo" type="hidden" value="${item.boardNo}">
				      <span class="board_title_list" onclick="targetControl('../post/list?bno=${item.boardNo}&bTitle=${item.title}')">${item.title}</span>
				      <span>
				      <a href="updateForm?no=${item.boardNo}" style="margin-right:1em;"><span class="board_update"></span></a>     
				      <a href="delete?no=${item.boardNo}"><span class="board_delete"></span></a>
				      </span>
				   </div>
				 </c:forEach>
			   </div>
			   </div>
			   
			   <!-- iframe float -->
			   <div class="post_part" style="position:absolute; position:static top; margin:0px 300px 100px 350px; width:70%; height:150%;">
			     <iframe id="iframeTarget" name="postList" class="post_part__content" scrolling="no"></iframe>
	       </div>
	       
     </div>
     
		<script>
		$(document).ready(function() {
			      if(${fn:length(list)} > 0) {
		          targetControl('../post/list?bno=${list[0].boardNo}&bTitle=${list[0].title}');
		        }
			  }
		);
		
		function targetControl(url) {
			console.log(url);
		  document.getElementById('iframeTarget').src = url;
		}
		</script>
     <script>
     const role = ${nowMember.role};
     const element = document.getElementById("boardManagement");
     if (role == 0) {
    	 element.style.display = "";
     } else {
    	 element.style.display = "none";
     }
     
     let state = 0; // 0일 때 - 기본, 1일 때 - 관리모드
     const addlink = document.getElementById("addlink");
		 const updateBtnArr = document.getElementsByClassName("board_update");
		 const deleteBtnArr = document.getElementsByClassName("board_delete");
		 
		 // const content = "<a href='form' >새 게시판 </a>";
		 // 게시판 추가 아이콘, 마우스 오버시 말풍선 띄우기
		 const content = "<a href='form' ><i class='fas fa-folder-plus' style='font-size:1.2em;' title='게시판을 추가합니다.'></i></a>";

		 const rBtn = "<i class='fas fa-edit'></i>"
		 const xBtn = "<i class='fas fa-times'></i>";
		 
     function func() {
    	console.log("func()");
			if(state === 0) {
				state = 1;
    		addlink.innerHTML = content;
				for(let i in deleteBtnArr) {
					document.getElementsByClassName("board_update")[i].innerHTML = rBtn;
					document.getElementsByClassName("board_delete")[i].innerHTML = xBtn;
				}
			} else {
				state = 0;
				addlink.innerHTML = "";
				for(let i in deleteBtnArr) {
					document.getElementsByClassName("board_update")[i].innerHTML = "";
					document.getElementsByClassName("board_delete")[i].innerHTML = "";
				}
 			}
     }

		 </script>

   </body>
</html>
