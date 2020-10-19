<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<main>
	<h1>글쓰기 페이지</h1>
	<hr />
	<div class="mb-3">
		<label for="title">제목</label> <input type="text" class="form-control"
			name="title" id="title" placeholder="제목을 입력해 주세요">
	</div>
	<label for="content">내용</label>
	<textarea id="summernote" name="content"></textarea>
	<button onclick="saveBoard()">글쓰기 완료</button>

</main>
<script>
function saveBoard(){
	//let title_el = document.querySelector("#title");
	//let content_el = document.querySelector("#summernote");
	let title = $("#title").val();
	let content = $("#summernote").val();
	
	let board = {
			title: title,
			content: content
				}
	console.log(board);
fetch("/save",{
	method:"post",
	headers:{
		'Content-Type': 'application/json; charset=utf-8',
	},
	body:JSON.stringify(board)
	}).then(res=>res.text()).then(res=>{
		if(res=="ok"){
			alert("저장성공");
			location.href="/list";
		}else{
			alert("저장실패");
			
			}
		});
}
</script>
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
<%@ include file="layout/footer.jsp"%>