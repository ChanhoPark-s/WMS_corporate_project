<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<script type="text/javascript">
	$(document).ready(
			function() {
				document.getElementById('sell_info').click();
				
				$("button[id='update_Sold']").click(function() {
					$("#Sold_Submit").hide();
					$("#Sold_Update_Submit").show();
				});

				$("button[id='insert_Sold']").click(function() {
					$("#Sold_Update_Submit").hide();
					$("#Sold_Submit").show();
				});

				$("button[id='Sold_Submit']").click(
						function() {
							$("form[id='taskForm']").attr('action',
									'/sell/origin/insert').submit();
						});

				$("button[id='Sold_Update_Submit']").click(
						function() {
							$("form[id='taskForm']").attr('action',
									'/sell/origin/update')
						});

				$("button[id='delete_Sold']").click(function() {
					
				});
				
			});

	function goModal(no){
		alert(no);
	}
</script>

<style>
#button_sell {
	float: right;
}
</style>
<div class="card">
	<div class="card-body">
		<div class="d-flex gap-1 mb-4 flex-wrap">
			<form>
				<input type="text" class="form-control"
					placeholder="Sold Product Search">
			</form>
			<div class="d-flex gap-1 me-auto flex-wrap">
				<button
					class="btn btn-primary d-inline-flex align-items-center gap-1"
					data-bs-toggle="modal" data-bs-target="#Sold_Product_Add_Modal"
					id="insert_Sold">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd"
							d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
							clip-rule="evenodd"></path>
                  </svg>
					등록
				</button>



			</div>
		</div>
	</div>
	<div class="table-responsive my-1">
		<table class="table align-middle">
			<thead>
				<tr>
					<th scope="col" style="text-align: center"><input
						class="form-check-input" type="checkbox" value=""></th>
					<th scope="col" style="text-align: center">판매 번호</th>
					<th scope="col" style="text-align: center">주문서 번호</th>
					<th scope="col" style="text-align: center">담당자 번호</th>
					<th scope="col" style="text-align: center">판매 날짜</th>
					<th scope="col" style="text-align: center">Actions</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="i" items="${lists}">
					<tr>
						<td style="text-align: center"><input
							class="form-check-input" type="checkbox" value=""></td>
						<td style="text-align: center">${i.no}</td>
						<td style="text-align: center">${i.order_no}</td>
						<td style="text-align: center"><span
							class="badge bg-light text-muted">${i.member_no}</span></td>

						<fmt:parseDate var="inputDay" value="${i.day}"
							pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${inputDay}" var="input"
							pattern="yyyy-MM-dd" />
						<td nowrap style="text-align: center">${input}</td>
						<td style="text-align: center">
							<!-- 수정 시작 -->
							<div class="btn-group btn-group-sm" role="group">
								<button type="button" class="btn btn-light d-flex"
									data-bs-toggle="modal" id="update_Sold"
									data-bs-target="#Sold_Product_Add_Modal">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                          </svg>
								</button>
								<!-- 수정 끝 -->
								<!-- 삭제 시작 -->
								<button type="button" class="btn btn-light d-flex text-danger"
									data-bs-toggle="modal" id="delete_Sold" onclick="goModal('${i.no}')"
									data-bs-target="#delete_Sold_modal">
									<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
										fill="none" viewBox="0 0 24 24" stroke="currentColor"
										aria-hidden="true">
                            <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
								</button>
								<!-- 삭제 끝 -->
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<nav aria-label="Page navigation borderless example">
		<ul class="pagination pagination-borderless justify-content-end">
			<li class="page-item disabled"><a
				class="page-link d-flex align-items-center px-2" href="#"
				tabindex="-1" aria-disabled="true" aria-label="Previous"> <svg
						width="20" height="20" xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd"
							d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
							clip-rule="evenodd"></path>
                    </svg>
			</a></li>
			<li class="page-item active" aria-current="page"><a
				class="page-link" href="javascript:void(0)">1</a></li>
			<li class="page-item"><a class="page-link"
				href="javascript:void(0)">2</a></li>
			<li class="page-item"><a class="page-link"
				href="javascript:void(0)">3</a></li>
			<li class="page-item"><a
				class="page-link d-flex align-items-center px-2"
				href="javascript:void(0)" aria-label="Next"> <svg width="20"
						height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
						fill="currentColor">
                      <path fill-rule="evenodd"
							d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
							clip-rule="evenodd"></path>
                    </svg>
			</a></li>
		</ul>
	</nav>

	<!-- Modal Begin -->
	<div class="modal fade" id="Sold_Product_Add_Modal" tabindex="-1"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header border-0">
					<h5 class="modal-title">Add Sold Product</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="needs-validation" id="taskForm" method="post">
						<div class="mb-3">
							<label for="order_no" class="form-label">주문서번호</label> <input
								type="text" name="order_no" class="form-control" id="order_no"
								autofocus="">
							<div class="invalid-feedback">Order_No is required.</div>
						</div>
						<div class="mb-3">
							<label for="member_no" class="form-label">담당자번호</label> <input
								type="text" name="member_no" class="form-control" id="member_no"
								required>
							<div class="invalid-feedback">Member_No is required.</div>
						</div>
						<div class="mb-3">
							<label for="day" class="form-label">판매 일자</label> <input
								type="date" name="day" class="form-control" id="day" required
								max="<%=sf.format(nowTime)%>">
							<div class="invalid-feedback">Member_No is required.</div>
						</div>
					</form>
				</div>
				<div class="modal-footer border-0">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
					<button type="button" form="taskForm" class="btn btn-primary px-5"
						id="Sold_Submit">등록</button>
					<button type="button" form="taskForm" class="btn btn-primary px-5"
						id="Sold_Update_Submit">수정</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="delete_Sold_modal" tabindex="-1"
		aria-labelledby="delete_Sold" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="delete_Sold">경고</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal end -->




</div>

<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>