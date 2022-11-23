<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top.jsp -->
<%@include file="../../common/top.jsp"%>

<style>
table th {
	text-align: center;	
	font-size: 14px;
}

table td {
	text-align: center;
	font-size: 14px;
}
</style>

<!-- 상단 -->
<div class="card">
	<div class="card-body">
		<!-- <div class="d-flex gap-1 mb-4 flex-wrap">
			<form action="/sell/origin/sellstatus" method="get"> 
			<table>
			<tr>
				<td><select name="whatColumn" id="whatColumn" class="dselect form-select" data-dselect-clearable="true">
					<option value="">선택</option>
					<option value="item_name">품목명</option>
				</select></td>
				<td>
				<input type="text" class="form-control" placeholder="입력 후 Enter" name="keyword" id="keyword">
				</td>
			</tr>
			</table>
			</form>
		</div> -->
		<div class="table-responsive my-1">
			<table class="table align-middle" id="table">
				<thead>
				
					<tr>
						<th scope="col" style="display:none">판매번호</th>
						<th scope="col">품목명</th>
						<th scope="col">판매수량</th>
						<th scope="col">입고단가</th>
						<th scope="col">출고단가</th>
						<th scope="col">이익</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="status" items="${dlists}">
					<tr>
					<td style="display:none">${status.no}</td>
					<td style="display:none">${status.item_no}</td>
					<td>${status.item_name}</td>
					<td>${status.amount}</td>
					<td>
					<fmt:formatNumber pattern="###,###" value="${status.in_price}" var="in_price"/>${in_price} 원</td>
					<td>
					<fmt:formatNumber pattern="###,###" value="${status.out_price}" var="out_price"/>${out_price} 원</td>
					<td><fmt:formatNumber pattern="###,###" value="${(status.out_price - status.in_price)*status.amount}" var="out_price"/>${out_price} 원</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

		<div align="center">
			${pageInfo.pagingHtml}
		</div>
	</div>
</div>

<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>
<br>
