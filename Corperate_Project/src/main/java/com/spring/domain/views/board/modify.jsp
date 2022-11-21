<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<form role="form" action="/board/modify" method="post">	
					<!-- 추가, 파라미터로 담겨 넘어온 변수의 값을 저장해 뒀다가 나중에 보기기 위한 용도 -->
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
										
					<div class="form-group">
						<label>Bno</label> 
						<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly>
					</div>
	
					<div class="form-group">
						<label>Title</label> 
						<input class="form-control" name="title" value='<c:out value="${board.title}"/>' >
					</div>
	
					<div class="form-group">
						<label>Text area</label>
						<input class="form-control" rows="3" name="content" value='<c:out value="${board.content}"/>'>
					</div>
	
					<div class="form-group">
						<label>Writer</label>
						<input class="form-control" rows="3" name="writer" value='<c:out value="${board.writer}"/>' readonly>
					</div>
	
					<div class="form-group">
						<label>Reg Date</label>
						<input class="form-control" rows="3" name="regDate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.regdate}"/>' readonly>
					</div>
	
					<div class="form-group">
						<label>Update Date</label>
						<input class="form-control" rows="3" name="updateDate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.updateDate}"/>' readonly>
					</div>
					
					<button type="submit" data-oper="modify" class="btn btn-defualt">Modify</button>
					<button type="submit" data-oper="remove" class="btn btn-defualt">Remove</button>
					<button type="submit" data-oper="list" class="btn btn-info">List</button>
				</form>
				
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>
<!-- /.row -->

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	
	/* 버튼이 뭐가 눌리는지에 따라 form의 action이 달라지게 하기위한 코드 */
	var formObj = $("form");
	
	$('button').on("click", function(e){ // 모든 버튼에 대한 이벤트 처리
		
		e.preventDefault(); // submit 버튼이 눌리자마자 action 속성의 request가 보내지게되는 동작을 막는 코드. 이후 직접 submit 처리
		
		var operation = $(this).data("oper"); // button 태그의 data-oper 속성의 값이 읽힘 [modify, remove, list]
		console.log(operation);
		
		//수정버튼이 눌렸을 경우는 그냥 바로 원래 지정해준 action 값대로 반응한다.
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove"); // action 속성을 덮어 씌움
		}else if(operation === 'list'){
			formObj.attr("action", "/board/list").attr("method", "get"); //move to list
			
			// 리스트로 이동할 때는 form 안에서 2가지 정보만 넘어가면 되므로 나머지는 삭제해주는 코드
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		
		formObj.submit();
	});
});
</script>
