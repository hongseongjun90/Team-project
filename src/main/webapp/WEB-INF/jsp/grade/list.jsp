<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../room/room_header.jsp" />

<div class="room_contents">
  <div class="container-fluid">
    <div class="row d-flex">
      <div class="col-4">
        <select class="form-control form-control-sm col-6" id="filter_list"
          onclick="activeFilter(this.value)">
          <option>전체</option>
          <option>제출</option>
          <option>미제출</option>
        </select>
      </div>
      <div class="col-8 d-flex">
        <select class="form-control form-control-sm col-2 mr-2" id="searchType">
          <option value="student">학생명</option>
          <option value="assignment">과제명</option>
        </select> <input type="text" class="form-control form-control-sm col-6" id="keyword"
          onkeyup="search(this.value)" placeholder="검색어를 입력하세요">
      </div>
    </div>
    <div class="row mt-3" id="grade_contents">
      <ul class="d-flex flex-column" id="grade_list" style="width: 100%">
        <li class="d-flex border-bottom p-3" v-for="user in users" v-if="user.role != 0">
          <div class="col-2 user_info font-weight-bold" style="font-size:1.2em;">{{user.user.name}}</div>
          <div class="col-10 d-flex flex-wrap align-content-around">
            <div v-for="submit in submits">
              <!-- 과제 제출한 경우 box -->
              <div v-if="submit.user.userNo == user.userNo && submit.createDate != null"
                class="bg-info text-white grade-assignment-card text-center font-weight-bold d-flex flex-column justify-content-center border m-1 rounded-lg">
                <a class="d-block text-truncate"
                  v-bind:href="`../assignmentSubmit/submitted?assignmentNo=`+submit.assignmentNo+`&from=1`"
                  :title="submit.assignment.title"> {{ submit.assignment.title }} </a>
                <div>{{ submit.score }}</div>
              </div>
              <!-- 과제 제출하지 않은 경우 box -->
              <div v-if="submit.user.userNo == user.userNo && submit.createDate == null"
                class="bg-light text-secondary grade-assignment-card text-center font-weight-bold d-flex flex-column justify-content-center border m-1 rounded-lg">
                <a class="d-block text-truncate"
                  v-bind:href="`../assignmentSubmit/submitted?assignmentNo=`+submit.assignmentNo+`&from=1`"
                  :title="submit.assignment.title"> {{ submit.assignment.title }} </a>
                <div>{{ submit.score }}</div>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</div>
<script>
const clazzMembersJson = eval('('+ '${clazzMembers}' +')');
const submitsJson = eval('('+ '${userAssignmentSubmits}' +')');
const assignmentsJson = eval('('+ '${assignments}' +')');


//성적 템플릿
console.log(submitsJson);
var grade_list = new Vue({
    el: '#grade_list',
    data: {
      users: clazzMembersJson,
      submits: submitsJson
    }
  })

//필터를 위해 과제 목록을 렌더링
var filter_list = new Vue({
    el: '#filter_list',
    data: {
      assignments: assignmentsJson
    }
  })
  
  //과목 div에 링크를 달기 위한 부분
  let linkbox = document.getElementsByClassName("assignments_info green");
  for(let l of linkbox) {
    l.addEventListener("click", function() {
      var myEvent = new MouseEvent("click", {
          bubbles: true, cancelable: true, view: window
        }); 
      
      l.getElementsByTagName('a')[0].dispatchEvent(myEvent);
      
    })
  }
  
  //필터 기능
  function activeFilter(value) {
    if(value == "미제출"){
    grade_list.submits = submitsJson.filter(function (item) {
            return item.createDate == null;
        })
    } else if(value == "제출"){
      grade_list.submits = submitsJson.filter(function (item) {
          return item.createDate != null;
        })
    } else if(value == "전체") {
      grade_list.submits = submitsJson;
      return;
    } else {
        grade_list.submits = submitsJson.filter(function (item) {
          return item.assignment.title.match(value);
        })
    }
  }
  
  //검색 기능
  function search(value) {
	  grade_list.submits = submitsJson;
	  grade_list.users = clazzMembersJson;
	  
	  let searchType = $('#searchType').val();
	  if(searchType == 'assignment') {
		  grade_list.submits = submitsJson.filter(function (item) {
	          return item.assignment.title.includes(value);
	        })
	  } else if(searchType == 'student') {
		  grade_list.users = clazzMembersJson.filter(function (item) {
	            return item.user.name.includes(value);
	          })
	  }
	  
  }

    
</script>
</body>
</html>