<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>

/* 막대그래프 */
	.progress-bar {
    width: 100%;
    height: 30px;
    background-color: #dedede;
    font-weight: 600;
    font-size: .8rem;
}

.progress-bar .progress {
    height: 30px;
    padding: 0;
    text-align: center;
    background-color: #eec60a;
    color: #111;
    border-radius: 1px;
}


/* 도넛 그래프 */
#donut {
  width: 29rem;
  height: 29rem;
  margin: 0 auto;
}

path.color0 {
  fill: #1072b8;
}

path.color1 {
  fill: #35526b;
}



#ddd{
	 margin-left: 80%;
}

/* 이익 */
.flex-wrapper {
  display:flex;
  flex-flow: row nowrap;
  margin-left: 32%;
}

.single-chart {
  width: 50%;
  justify-content: space-around ;
}

.circular-chart {
  display: block;
  margin: 10px auto;
  max-width: 300px;
  max-height: 300px;
}
.circular-chart2 {
  display: block;
  margin: 10px auto;
  max-width: 300px;
  max-height: 300px;
}

.circle-bg {
  fill: none;
  stroke: #eee;
  stroke-width: 2.8;
}

.circle {
  fill: none;
  stroke-width: 4;
  stroke-linecap: round;
  animation: progress 1s ease-out forwards;
}
.circle2 {
  fill: none;
  stroke-width: 4;
  stroke-linecap: round;
  animation: progress 1s ease-out forwards;
}


.circular-chart.orange .circle {
  stroke: #fbd438;
}
.circular-chart2.blue .circle2{
	stroke:#7d7af3;
}


.percentage {
  fill: #666;
  font-family: sans-serif;
  font-size: 0.5em;
  text-anchor: middle;
}
.percentage2 {
  fill: #666;
  font-family: sans-serif;
  font-size: 0.5em;
  text-anchor: middle;
}

</style>
<!-- top.jsp -->
<%@include file="./common/top.jsp" %>

<!-- jQuery -->
<div class="row g-4">
          <div class="col-lg-4">
            <div class="row g-4">
              <div class="col-md-3 col-lg-6 col-6">
                <div class="card h-100">
                  <div class="card-body">
                    <p class="mb-0 text-secondary">수주 체결량</p>
                    <h3 class="fw-black">
                    	${order_Count }	
                    	 <fmt:formatNumber var="oc" type="number" maxFractionDigits="0"  value="${order_Count/1 }" />
					</h3>
                    <div class="progress-bar">           
					   <div class="progress" style="width:${oc}%;"> </div>
					</div>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-lg-6 col-6">
                <div class="card h-100">
                <div class="card-body">
                    <p class="mb-0 text-secondary">판매량</p>
                    <h3 class="fw-black">
                    	${sell_Count}
                    	 <fmt:formatNumber var="sc" type="number" maxFractionDigits="0"  value="${sell_Count/1 }" />
                    </h3>
                    <div class="progress-bar">           
					   <div class="progress" style="width:${sc}%;"> </div>
					</div>
                  </div>
                </div>
              </div>
              <div class="col-lg-12 col-md-6 col-12">
                <div class="card h-100">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-6">
                        <h6 class="fw-black mb-2">매출액</h6>
                        <p class="small text-secondary mb-1"></p>
                        <h4 class="mb-3">
                        	<fmt:formatNumber var="sm" value="${sell_Money }" pattern="#,###" />
	                    	 <fmt:formatNumber var="smp" type="number" maxFractionDigits="0"  value="${sell_Money/1000000 }" /><!--1억을 목표 -->
                        <i class="fa-solid fa-won-sign"></i> ${sm }
                        </h4>
                        <p class="card-text text-secondary small">
                          <span class="font-weight-bolder">
                          <fmt:formatNumber var="sell" type="number" maxFractionDigits="0"  value="${sell_Count/10 }" /></span>
                        </p>
                      </div>
                      <div class="col-6">
                        <div id="earnings" style="min-height: 132.8px;"><div id="apexchartss3lmnalgl" class="apexcharts-canvas apexchartss3lmnalgl apexcharts-theme-light" style="width: 191px; height: 132.8px;">
							<!-- 도넛차트 -->     
							<div id="donut" data-donut="39">
							</div>
                        <g id="SvgjsG1670" class="apexcharts-inner apexcharts-graphical" transform="translate(33.5, 0)"><defs id="SvgjsDefs1669"><clipPath id="gridRectMasks3lmnalgl"><rect id="SvgjsRect1672" width="130" height="148" x="-2" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMasks3lmnalgl"></clipPath><clipPath id="nonForecastMasks3lmnalgl"></clipPath><clipPath id="gridRectMarkerMasks3lmnalgl"><rect id="SvgjsRect1673" width="130" height="200" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1674" class="apexcharts-pie"><g id="SvgjsG1675" transform="translate(0, 0) scale(1)"><circle id="SvgjsCircle1676" r="37.35121951219512" cx="63" cy="63" fill="transparent"></circle><g id="SvgjsG1677" class="apexcharts-slices"><g id="SvgjsG1678" class="apexcharts-series apexcharts-pie-series" seriesName="App" rel="1" data:realIndex="0"><path id="SvgjsPath1679" d="M 63 5.536585365853654 A 57.463414634146346 57.463414634146346 0 1 1 52.23242982526908 119.44557957845831 L 56.001079386424905 99.6896267259979 A 37.35121951219512 37.35121951219512 0 1 0 63 25.648780487804878 L 63 5.536585365853654 z" fill="rgba(99,102,241,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-0" index="0" j="0" data:angle="190.8" data:startAngle="0" data:strokeWidth="0" data:value="53" data:pathOrig="M 63 5.536585365853654 A 57.463414634146346 57.463414634146346 0 1 1 52.23242982526908 119.44557957845831 L 56.001079386424905 99.6896267259979 A 37.35121951219512 37.35121951219512 0 1 0 63 25.648780487804878 L 63 5.536585365853654 z"></path></g><g id="SvgjsG1680" class="apexcharts-series apexcharts-pie-series" seriesName="Service" rel="2" data:realIndex="1"><path id="SvgjsPath1681" d="M 52.23242982526908 119.44557957845831 A 57.463414634146346 57.463414634146346 0 0 1 9.57186827432389 84.15369380792929 L 28.271714378310527 76.74990097515403 A 37.35121951219512 37.35121951219512 0 0 0 56.001079386424905 99.6896267259979 L 52.23242982526908 119.44557957845831 z" fill="rgba(13,202,240,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-1" index="0" j="1" data:angle="57.599999999999994" data:startAngle="190.8" data:strokeWidth="0" data:value="16" data:pathOrig="M 52.23242982526908 119.44557957845831 A 57.463414634146346 57.463414634146346 0 0 1 9.57186827432389 84.15369380792929 L 28.271714378310527 76.74990097515403 A 37.35121951219512 37.35121951219512 0 0 0 56.001079386424905 99.6896267259979 L 52.23242982526908 119.44557957845831 z"></path></g><g id="SvgjsG1682" class="apexcharts-series apexcharts-pie-series" seriesName="Product" rel="3" data:realIndex="2"><path id="SvgjsPath1683" d="M 9.57186827432389 84.15369380792929 A 57.463414634146346 57.463414634146346 0 0 1 62.989970742202864 5.536586241071504 L 62.99348098243186 25.64878105669648 A 37.35121951219512 37.35121951219512 0 0 0 28.271714378310527 76.74990097515403 L 9.57186827432389 84.15369380792929 z" fill="rgba(250,204,21,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-2" index="0" j="2" data:angle="111.6" data:startAngle="248.4" data:strokeWidth="0" data:value="31" data:pathOrig="M 9.57186827432389 84.15369380792929 A 57.463414634146346 57.463414634146346 0 0 1 62.989970742202864 5.536586241071504 L 62.99348098243186 25.64878105669648 A 37.35121951219512 37.35121951219512 0 0 0 28.271714378310527 76.74990097515403 L 9.57186827432389 84.15369380792929 z"></path></g></g></g></g><line id="SvgjsLine1684" x1="0" y1="0" x2="126" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1685" x1="0" y1="0" x2="126" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG1671" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend"></div><div class="apexcharts-tooltip apexcharts-theme-dark" style="left: 113.212px; top: 35px;"><div class="apexcharts-tooltip-series-group apexcharts-active" ><span class="apexcharts-tooltip-marker" style="background-color: rgb(99, 102, 241); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2; display: none; background-color: rgb(99, 102, 241);"><span class="apexcharts-tooltip-marker" style="background-color: rgb(99, 102, 241); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">App: </span><span class="apexcharts-tooltip-text-y-value">53</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 3; display: none; background-color: rgb(99, 102, 241);"><span class="apexcharts-tooltip-marker" style="background-color: rgb(99, 102, 241); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">App: </span><span class="apexcharts-tooltip-text-y-value">53</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div></div></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
  			<!--공지사항-->
          <div class="col-lg-8">
            <div class="card h-100">
              <div class="card-body">
                    <div class="d-sm-flex justify-content-between align-items-center">
                      <h3 class="mb-sm-0" style="font-size:20px">공지사항</h3>
                    <button id="insertBtn" onclick="insertBtn()"class="btn btn-light d-inline-flex align-items-center gap-"
					data-bs-toggle="modal" data-bs-target="#BoardModal">
					<i class="fa-solid fa-plus"></i>
				</button>
                    </div>
                    <div class="table-responsive my-1">
						<table class="table align-middle">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">게시일</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody id="table_insert">
								<!-- 여기에 넣어야함 테이블 -->
								<c:forEach var="bd" items="${lists }">
								<tr>
									<td>${bd.no }</td>
									<td onclick="detail('${bd.no}')" data-bs-toggle="modal" data-bs-target="#BoardModal" style="cursor: pointer;">${bd.title }</td>
									<td>
									<fmt:parseDate value="${bd.w_day}" var="day" pattern="yyyy-MM-dd" />
	              					<fmt:formatDate value="${day}" pattern="yyyy-MM-dd" />
	              					</td>
									<td>
										<div class="btn-group btn-group-sm" role="group">
											<button type="button" class="btn btn-light d-flex text-danger" onclick="deleteBoard('${bd.no}')" >
												<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>
											</button>
										</div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
              </div>
            </div>
          </div>
          
          
          
          
          <!-- 여기부터 하나 -->
          <div class="col-12 col-md-6 col-lg-4">
            <div class="card h-100">
              <div class="card-header border-bottom-0 d-flex justify-content-between">
                <h6 class="fw-black mb-2">수주잔고</h6>
              </div>
              <div class="card-body">
              <!--목표  -->
              <div class="flex-wrapper">
				  <div class="single-chart">
				    <svg viewBox="0 0 36 36" class="circular-chart2 blue">
				      <path class="circle-bg"
				        d="M18 2.0845
				          a 15.9155 15.9155 0 0 1 0 31.831
				          a 15.9155 15.9155 0 0 1 0 -31.831"
				      />
				      <fmt:formatNumber var="om" type="number" maxFractionDigits="0"  value="${order_Money/10000000 }" />
				      <path class="circle2"
				        stroke-dasharray="${order_Money/10000000  }, 10000"
				        d="M18 2.0845
				          a 15.9155 15.9155 0 0 1 0 31.831
				          a 15.9155 15.9155 0 0 1 0 -31.831"
				      />
				      <text x="18" y="20.35" class="percentage2">${om }%</text>
				    </svg>
				  </div>
			   </div>	  
              
              
              </div>
              <div class="card-footer p-0">
                <div class="row text-center mx-0">
                  <div >
                    <small class="text-secondary">수주금액</small>
                    <fmt:formatNumber var="omm" value="${order_Money }" pattern="#,###" />
                    <h6>${omm}</h6>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--여기까지  -->
          
          
          
          
          <div class="col-12 col-md-6 col-lg-4">
            <div class="card h-100">
              <div class="card-header border-bottom-0 d-flex justify-content-between">
                <h6 class="fw-black mb-2">영업이익</h6>
              </div>
              <div class="card-body">
              <!--목표  -->
              <div class="flex-wrapper">
				  <div class="single-chart">
				    <svg viewBox="0 0 36 36" class="circular-chart orange">
				      <path class="circle-bg"
				        d="M18 2.0845
				          a 15.9155 15.9155 0 0 1 0 31.831
				          a 15.9155 15.9155 0 0 1 0 -31.831"
				      />
				      <fmt:formatNumber var="ee" type="number" maxFractionDigits="0"  value="${sell_Money/purchase_Money*100 }" />
				      <path class="circle"
				        stroke-dasharray="${sell_Money/purchase_Money*100  }, 10000"
				        d="M18 2.0845
				          a 15.9155 15.9155 0 0 1 0 31.831
				          a 15.9155 15.9155 0 0 1 0 -31.831"
				      />
				      <text x="18" y="20.35" class="percentage">${ee }%</text>
				    </svg>
				  </div>
			   </div>	  
              
              
              </div>
              <div class="card-footer p-0">
                <div class="row text-center mx-0">
                  <div class="col-6 border-end py-1">
                    <small class="text-secondary">구매비용</small>
                    <fmt:formatNumber var="pm" value="${purchase_Money }" pattern="#,###" />
                    <h6>${pm}</h6>
                  </div>
                  <div class="col-6 py-1">
                    <small class="text-secondary">매출액</small>
                    <h6>${sm }</h6>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <div class="card h-100">
              <div class="card-header border-bottom-0 d-flex justify-content-between">
                <h6 class="fw-black mb-2">정보</h6>
              </div>
              <div class="card-body" style="height: 250px;">
              
                <div class="d-flex align-items-center mt-3">
                  <i class="fa-solid fa-store"></i>
                  <div class="mx-2">
                    <h6 class="mb-0">발주처</h6>
                  </div>
                  <span class="ms-auto text-success"> ${buyClinetCount}</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                 <i class="fa-solid fa-money-bill-transfer"></i>
                  <div class="mx-2">
                    <h6 class="mb-0">수주처</h6>
                  </div>
                  <span class="ms-auto text-success"> ${sellClientCount }</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                <i class="fa-solid fa-user"></i>
                  <div class="mx-2">
                    <h6 class="mb-0">사원</h6>
                  </div>
                  <span class="ms-auto text-success"> ${memberCount }</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                <i class="fa-solid fa-gift"></i>
                  <div class="mx-2">
                    <h6 class="mb-0">취급 품목</h6>
                  </div>
                  <span class="ms-auto text-success"> ${itemCount }</span>
                </div>
              </div>
            </div>
          </div>
        </div>
<!-- Modal 코드 넣을 위치 -->
		<div class="modal fade" id="BoardModal" tabindex="-1">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header border-0">
						<h5 id="modal-title"></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					
						<c:forEach var="bd" items="${lists }">
						<h6>
						<fmt:parseDate value="${bd.w_day}" var="day" pattern="yyyy-MM-dd" />
	              		<fmt:formatDate var="day" value="${day}" pattern="yyyy-MM-dd" />
						</h6>
	              					</c:forEach>
					<div class="modal-body">
						<form class="needs-validation" novalidate id="modalForm" name="modalForm" action="" method="post" >
							<div class="mb-3">
								<input type="text" class="form-control" id="w_day" name="w_day" readonly>
							<input type="hidden"id="no" name="no">
							</div>
							<div class="mb-3">
								<label for="title" class="form-label">제목</label><label class="form-label" id="ddd" >${day }</label> 
								<input type="text"class="form-control" id="title" name="title">
							</div>
							<div class="mb-3">
								<label for="content" class="form-label">내용</label> 	
								<textarea class="form-control" id="content" name="content"></textarea>
							</div>
							
						</form>
					</div>
					<div class="modal-footer border-0">
						<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
						<button type="button" form="taskForm" id="modaladdBtn" class="btn btn-primary px-5"></button>
					</div>
				</div>
			</div>
		</div>


<!-- bottom.jsp -->
<%@include file="./common/bottom.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dragdealer/0.9.8/dragdealer.js"></script>
<script>

var duration   = 500,
transition = 200;

drawDonutChart(
'#donut',
$('#donut').data('donut'),
130,
130,
".35em"
);

function drawDonutChart(element, percent, width, height, text_y) {
width = typeof width !== 'undefined' ? width : 130;
height = typeof height !== 'undefined' ? height : 130;
text_y = typeof text_y !== 'undefined' ? text_y : "-.10em";

var dataset = {
    lower: calcPercent(0),
    upper: calcPercent(percent)
  },
  radius = Math.min(width, height) / 2,
  pie = d3.layout.pie().sort(null),
  format = d3.format(".0%");

var arc = d3.svg.arc()
    .innerRadius(radius - 20)
    .outerRadius(radius);

var svg = d3.select(element).append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

var path = svg.selectAll("path")
    .data(pie(dataset.lower))
    .enter().append("path")
    .attr("class", function(d, i) { return "color" + i })
    .attr("d", arc)
    .each(function(d) { this._current = d; }); // store the initial values

var text = svg.append("text")
    .attr("text-anchor", "middle")
    .attr("dy", text_y);

if (typeof(percent) === "string") {
text.text(percent);
}
else {
var progress = 0;
var timeout = setTimeout(function () {
  clearTimeout(timeout);
  path = path.data(pie(dataset.upper)); // update the data
  path.transition().duration(duration).attrTween("d", function (a) {
    var i  = d3.interpolate(this._current, a);
    var i2 = d3.interpolate(progress, percent)
    this._current = i(0);
    return function(t) {
      text.text( format(i2(t) / 100) );
      return arc(i(t));
    };
  }); // redraw the arcs
}, 200);
}
};

function calcPercent(percent) {
return [39, 100-39];
};


	
	var modalForm = $("#modalForm");
	 function insertBtn(){
		 clearModal();
		 document.getElementById('no').value='123';
		 readonly(false);
		$(".modal").find("#modal-title").text("등록하기");
		$(".modal").find("#modaladdBtn").show();
		$(".modal").find('#modaladdBtn').text("등록");
		$(".modal").find('#w_day').hide();
		
		$('#modaladdBtn').click(function(){
			modalForm.attr("action", "/home/insert").submit();
		});
		
	}
	//삭제
	function deleteBoard(no){
		if(confirm("삭제하시겠습니까?")){
			location.href="/home/delete?no="+no;
			alert(1);
		}
	};

	function detail(no){
		
		document.getElementById('no').value=no;
		$(".modal").find("#modal-title").text("공지사항");
		$(".modal").find('#modaladdBtn').hide();
		$(".modal").find('#w_day').hide();
		$.ajax({
			url : "/home/selectOne ",
			type : "post",
			data : {  
				no : no 
			},
			datatype : 'json',
				success : function(data){ 
					$('#title').attr('readonly','true');
					$('#content').attr('readonly','true');
					document.getElementById('title').value=data.title;
					document.getElementById('content').value=data.content;
					
				}//success 
		});//ajax 
		
	}
	
	function readonly(x){
		$("#title" ).prop('title', x);
		$("#content" ).prop('content', x);
		$("#w_day" ).prop('w_day', x);
		
	}
	function clearModal(){
		document.getElementById('title').value="";
		document.getElementById('content').value= "";  
		document.getElementById('w_day').value="";
	}
</script>
