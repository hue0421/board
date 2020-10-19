<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>



<main>
	<h1>상세보기</h1>
	<hr />
	<table border="1">
		<tr>
			<td>ID</td>
			<td>${board.id}</td>
		</tr>
		<tr>
			<td>TITLE</td>
			<td><input id="title" type="text" value="${board.title}" /></td>

		</tr>
		<tr>
			<td>READCOUNT</td>
			<td>${board.readCount }</td>

		</tr>
		<tr>
			<td>CREATEDATE</td>
			<td>${board.createDate }</td>

		</tr>
		<tr>
			<td>CONTENT</td>
			<td><textarea id="summernote" name="content">${board.content}</textarea></td>

		</tr>
	</table>

	<button onclick="updateBoard(${board.id})">수정</button>
	<button onclick="deleteBoard(${board.id})">삭제</button>

</main>
<script>
$(document).ready(function() {
	  $('#summernote').summernote();
	});
</script>
<script>
      $('#summernote').summernote({
        placeholder: '여기에 내용을 입력해주세요',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
<script>
	function updateBoard(id){
	//id,title,content
		let title_el = document.querySelector("#title");
		let content_el = document.querySelector("#summernote");
		let title = title_el.value;
		let content = content_el.value;
		
		
		console.log("id : ", id);
		console.log("title : ", title);
		console.log("content : ", content);

		let board = {
			title: title,
			content: content
				}
		fetch("/board/"+id,{
			method:"put",
			headers:{
				'Content-Type': 'application/json; charset=utf-8',
			},
			body:JSON.stringify(board)
			}).then(res=>res.text()).then(res=>{
				if(res=="ok"){
					alert("수정성공");
					location.reload();
				}else{
					alert("수정실패");
					
					}
				});
		
		console.log(board);
		}
	

	function deleteBoard(id){
		fetch("/board/"+id,{
			method:"delete"
			}).then(res=>res.text()).then(res=>{
				if(res=="ok"){
					alert("삭제성공");
					location.href="/list";
				}else{
					alert("삭제실패");
				}
			});
		
	}



</script>
<%@ include file="layout/footer.jsp"%>
