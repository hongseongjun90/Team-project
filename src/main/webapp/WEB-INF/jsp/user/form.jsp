<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/style.css" />
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
html, body {
    margin: 0px;
    padding: 0px;
    width: 100%;
    height: 100%;
}
input {
    font-size:1em;
  margin-top: 1em;
  width: 100%;
  height: 2.5em;
}
button {
margin-top: 1.3em;
  font-weight: 700;
  font-size: 1em;
  width: 5em;
  height: 2em;
  margin-left:5em;
}
</style>
</head>
<body>
<div class="center-container">
<div class="login_box">
    <h1>회원 가입</h1>
    <div style="width:70%;">
    <form id="addForm" action='signup' method='post' enctype='multipart/form-data'>
        <input id = "emailInput" name='email' type='email' placeholder="   이메일"><br>
        <input id = "nameInput" name='name' type='text' placeholder="   이름"><br>
        <input id="passwordInput" name='password' type='password' placeholder="   비밀번호">
        <label id="passwordLabel"></label><br>
        <input name="loginMethod" type="hidden" value="0">
        <button id="completeBtn">완료</button>
    </form>
    </div>
    </div>
    </div>
    <script>
    const reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    const passwordBox = document.getElementById("passwordInput");
    const emailBox = document.getElementById("emailInput");
    const nameBox = document.getElementById("nameInput");
    let label = document.getElementById("passwordLabel");
    document.getElementById("completeBtn").addEventListener("click", function(event) {
            event.preventDefault();
        if(emailBox.value == "" || nameBox.value == "" || passwordBox.value == "") {
                label.innerHTML = "모든 정보를 입력해주세요.";
        } else {
            let password = passwordBox.value;
            if(false === reg.test(password)) {
	            passwordBox.focus();
	            label.innerHTML = "비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.";
	          } else {
	            document.getElementById("addForm").submit();
	          }
        }
        
    
    });
    </script>
</body>
</html>