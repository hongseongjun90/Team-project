<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/style.css" />
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
<script src="/Team-project/script/kakao.js"></script>
    <script>
        Kakao.init('e42d7bc3930faad4ef83d4fb783cf136');
        console.log(Kakao.isInitialized());
        function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
          return
        }
        Kakao.Auth.logout(function() {
        	window.location.href="../auth/logout";
        })
      }
    </script>
    <!-- 라이브러리 추가 -->
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

<!-- 구글 메타 태그 추가 -->
<meta name = "google-signin-client_id"
content = "360175730868-7161sh4v73h0hsufdvgmoa9u3o25oi21.apps.googleusercontent.com">  
    <script>
    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
          console.log('User signed out.');
          auth2.disconnect();
          window.location.href="../auth/logout";
        });
      }
    
    function onLoad() {
        gapi.load('auth2', function() {
          gapi.auth2.init();
        });
      }
      </script>
</head>
<body>
<div class="container">
  <div class="header main_header">
    <div class="main_header__column">
      <a href="#"><i class="fas fa-bars" style="font-size:1.2em; margin-right: 0.8em;"></i></a>
      <span style="font-weight:600; font-size:1.5em;">BTS</span>
    </div>
    <div class="main_header__column">
      <c:if test="${loginUser.alterKey == 'Y' }">
      <span><a href="../calendar/calendar">캘린더</a></span>
      <span id="assignClass" style="cursor:pointer;">수업 참여</span>
      <span onclick="popup()" style="cursor: pointer;">수업 만들기</span>
      </c:if>
        <c:if test="${not empty loginUser}">
        <div class="header__user">
          <c:if test="${not empty loginUser.profilePhoto}">
            <c:if test="${loginUser.loginMethod > 0}">
                <span class="header__user__photo"><img src='${loginUser.profilePhoto}'></span>
            </c:if>
            <c:if test="${loginUser.loginMethod == 0}">
                <span class="header__user__photo"><img src='${pageContext.servletContext.contextPath}/upload/user/thumbnail.${loginUser.profilePhoto}.jpg'></span>
            </c:if>
          </c:if>
          <c:if test="${empty loginUser.profilePhoto}">
            <i class="far fa-user" style="font-size:1.5em; margin-right: 0.3em;"></i>
          </c:if>
          <span><a href="${pageContext.servletContext.contextPath}/app/user/detail?userNo=${loginUser.userNo}">${loginUser.name}</a></span>
        </div>
          <c:if test="${loginUser.loginMethod == 2}">
              <a href="#" onclick="signOut();">Sign out</a>
            </c:if>
          <c:if test="${loginUser.loginMethod == 0}">
             <a href="../auth/logout">logout</a>
          </c:if>
          <c:if test="${loginUser.loginMethod == 1}">
             <button class="api-btn" onclick="kakaoLogout()">logout</button>
          </c:if>
        </c:if>
    </div>
  </div>
  