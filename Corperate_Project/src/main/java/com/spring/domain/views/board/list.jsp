<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        <div class="panel-heading">
                            Board List Page
                            <button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
                        </div>
                        <!-- /.panel-heading -->
                        
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list}" var="board">
                                		<tr>
                                			<td><c:out value="${board.bno}"/></td>
                                			<td><a class="move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>
                                			<td><c:out value="${board.writer}"/></td>
                                			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                                		</tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            
                            <!-- Pagination -->
                            <div class="row">
                            	<div class='pull-right'>
	                            	<ul class="pagination">
	                            		<c:if test="${pageMaker.prev}">
	                            			<li class="pagination_button previous"><a href="${pageMaker.startPage - 1}">Previous</a></li>
	                            		</c:if>
	                            		
	                            		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                            			<li class="pagination_button ${pageMaker.cri.pageNum == num ? 'active' : ''}"><a href="${num}">${num}</a></li>
	                            		</c:forEach>
	                            		
	                            		<c:if test="${pageMaker.next}">
	                            			<li class="pagination_button next"><a href="${pageMaker.endPage + 1}">Next</a></li>
	                            		</c:if>
	                            	</ul>
	                            </div>
                            </div>	
                            <!-- /.Pagination -->
                            
                            <form id="actionForm" action="/board/list" method="get">
                            	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                            	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                            </form>
                            
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                        </div>
                                        <div class="modal-body">처리가 완료되었습니다.</div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            

                            <div class="well">
                                <h4>DataTables Usage Information</h4>
                                <p>DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are using a specialized version of DataTables built for Bootstrap 3. We have also customized the table headings to use Font Awesome icons in place of images. For complete documentation on DataTables, visit their website at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
                                <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
                            </div>
                        </div>
                        <!-- /.panel-body -->

                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

<%@include file="../includes/footer.jsp" %>


<script type="text/javascript">
	$(document).ready(function(){
		
		var result = '<c:out value="${result}"/>';
		
		checkModal(result)
		
		function checkModal(result){
			if(result === ''){
				return;
			}
			
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function(){
			self.location = "/board/register";
		});
		
		//페이지번호 클릭시 form 태그를 통해 해당 페이지로 이동하도록 하는 것 
		var actionForm = $("#actionForm");
		$(".pagination_button a").on("click", function(e){
			e.preventDefault(); // a태그가 클릭되었을 때 href의 링크로 이동하는 원래의 동작을 막음
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		//a태그를 클릭시 a태그의 href에 있는 게시물번호를 가져와 input 태그를 form에 추가 후 submit이 동작하게 함
		$(".move").on("click", function(e){
			e.preventDefault();// 이거 없으면 a태그의 href 값으로 이동해버림. a태그의 원래 기능이 동작하지 않도록 막는 것임
			actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "/board/get");
			actionForm.submit();
		});
	});
</script>           