<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<main>
	<h1>게시글 목록</h1>
	<hr />
	<table id="customers">
		<tr>
			<th>ID</th>
			<th>TITLE</th>
			<th>CONTENT</th>
			<th>READCOUNT</th>
			<th>CREATEDATE</th>
		</tr>
		<c:forEach var="board" items="${boards.content}">
			<tr>
				<td>${board.id }</td>
				<td><a href="/board/${board.id}">${board.title }</td>
				<td>${board.content}</td>
				<td>${board.readCount }</td>
				<td><fmt:formatDate value="${board.createDate}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>

	</table>
	<div class="pagingBox">
	<ul class="pagination pagination-lg">
		<c:choose>
			<c:when test="${boards.first == true}">
				<li class="page-item disabled"><a class="page-link"
					href="/list?page=${boards.pageable.pageNumber}">Prev</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/list?page=${boards.pageable.pageNumber-1}">Prev</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${boards.last == true}">
		<li class="page-item disabled"><a class="page-link"
			href="/list?page=${boards.pageable.pageNumber}">Next</a></li>
			</c:when>
			<c:otherwise>
			<li class="page-item"><a class="page-link"
			href="/list?page=${boards.pageable.pageNumber+1}">Next</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</main>

<%@ include file="layout/footer.jsp"%>
