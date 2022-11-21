<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<!-- 상단 -->
<div class="card">
	<div class="card-body">
		<div class="table-responsive my-1">
			<table class="table align-middle">
				<thead>
				
					<tr>
						<th scope="col">판매번호</th>
						<th scope="col">품목명</th>
						<th scope="col">입고단가</th>
						<th scope="col">출고단가</th>
						<th scope="col">판매수량</th>
						<th scope="col">판매일</th>
						<th scope="col">이익</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="sell" items="${lists}">
					<tr>
						<td>${sell.no} </td>
						<td>${sell.item_name }</td>
						<td><fmt:formatNumber pattern="###,###" value="${sell.item_in_price}" var="in_price"/>${in_price} 원</td>
						<td><fmt:formatNumber pattern="###,-###" value="${sell.item_out_price}" var="out_price"/>${out_price} 원</td>
						<td>${sell.amount }개</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${sell.sell_day }"/></td>
						<td>${sell.item_name }</td>
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
							height="20" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd"
								d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
								clip-rule="evenodd"></path>
                    </svg>
				</a></li>
			</ul>
		</nav>
	</div>
</div>

<br>





<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>

