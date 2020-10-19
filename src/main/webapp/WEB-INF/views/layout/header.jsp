<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<title>제준서게시판</title>
<style>
h1{
margin-left: 15px;
text-align: center;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: rgb(140, 123, 198);
  justify-content: center;
}
.pagingBox{
display: block;
text-align: center;
}
div a{
float:center;
}
li {
  float: left;
}
li a {
  display: block;
  color: white;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: white;
}
#footer {
display: block;
text-align: center;
}
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: rgb(140, 123, 198);
  color: white;
}
</style>
</head>
<body>

<header>
<ul>
<li><img src="https://postfiles.pstatic.net/MjAyMDEwMTVfMTUg/MDAxNjAyNzIwODM5MjE3.4_zad4gzu4R4nFlpkegNw2YiIjFFoElhCFfvtU0YPKIg.DdK0vHRFeOh6ROnbEpnAoiCFgtcX4lsYPCeIcbLx9AYg.JPEG.jejunseo94/logo.jpg?type=w966" 
height="50" width="50"
alt="로고"></li>
<li><a href="/list">Home</a></li>
<li><a href="/saveForm">Write</a></li>
</ul>
</header>