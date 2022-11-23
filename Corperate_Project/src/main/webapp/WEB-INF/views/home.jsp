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

/* 도넛2 */

#donut-slider {
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -140px 0 0 -140px;
  width: 280px;
  height: 280px;
  overflow: hidden;
}
#donut-slider .handle {
  position: absolute;
  width: 150%;
  height: 100%;
  cursor: ew-resize;
}
#donut-slider .value {
  position: absolute;
  top: 50%;
  left: 0;
  width: 100%;
  height: 100px;
  margin: -50px 0 0 0;
  color: #666;
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 60px;
  font-weight: bold;
  line-height: 100px;
  text-align: center;
}
#ddd{
	 margin-left: 80%;
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
                    	 <fmt:formatNumber var="oc" type="number" maxFractionDigits="0"  value="${order_Count/10 }" />
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
                    	 <fmt:formatNumber var="sc" type="number" maxFractionDigits="0"  value="${sell_Count/10 }" />
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
                        <h3 class="fw-black mb-2">매출액</h3>
                        <p class="small text-secondary mb-1"></p>
                        <h4 class="mb-3">
                        	<fmt:formatNumber var="sm" value="${sell_Money }" pattern="#,###" />
	                    	 <fmt:formatNumber var="smp" type="number" maxFractionDigits="0"  value="${sell_Money/1000000 }" /><!--1억을 목표 -->
                        ${sm } 원
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
                        <g id="SvgjsG1670" class="apexcharts-inner apexcharts-graphical" transform="translate(33.5, 0)"><defs id="SvgjsDefs1669"><clipPath id="gridRectMasks3lmnalgl"><rect id="SvgjsRect1672" width="130" height="148" x="-2" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMasks3lmnalgl"></clipPath><clipPath id="nonForecastMasks3lmnalgl"></clipPath><clipPath id="gridRectMarkerMasks3lmnalgl"><rect id="SvgjsRect1673" width="130" height="200" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1674" class="apexcharts-pie"><g id="SvgjsG1675" transform="translate(0, 0) scale(1)"><circle id="SvgjsCircle1676" r="37.35121951219512" cx="63" cy="63" fill="transparent"></circle><g id="SvgjsG1677" class="apexcharts-slices"><g id="SvgjsG1678" class="apexcharts-series apexcharts-pie-series" seriesName="App" rel="1" data:realIndex="0"><path id="SvgjsPath1679" d="M 63 5.536585365853654 A 57.463414634146346 57.463414634146346 0 1 1 52.23242982526908 119.44557957845831 L 56.001079386424905 99.6896267259979 A 37.35121951219512 37.35121951219512 0 1 0 63 25.648780487804878 L 63 5.536585365853654 z" fill="rgba(99,102,241,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-0" index="0" j="0" data:angle="190.8" data:startAngle="0" data:strokeWidth="0" data:value="53" data:pathOrig="M 63 5.536585365853654 A 57.463414634146346 57.463414634146346 0 1 1 52.23242982526908 119.44557957845831 L 56.001079386424905 99.6896267259979 A 37.35121951219512 37.35121951219512 0 1 0 63 25.648780487804878 L 63 5.536585365853654 z"></path></g><g id="SvgjsG1680" class="apexcharts-series apexcharts-pie-series" seriesName="Service" rel="2" data:realIndex="1"><path id="SvgjsPath1681" d="M 52.23242982526908 119.44557957845831 A 57.463414634146346 57.463414634146346 0 0 1 9.57186827432389 84.15369380792929 L 28.271714378310527 76.74990097515403 A 37.35121951219512 37.35121951219512 0 0 0 56.001079386424905 99.6896267259979 L 52.23242982526908 119.44557957845831 z" fill="rgba(13,202,240,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-1" index="0" j="1" data:angle="57.599999999999994" data:startAngle="190.8" data:strokeWidth="0" data:value="16" data:pathOrig="M 52.23242982526908 119.44557957845831 A 57.463414634146346 57.463414634146346 0 0 1 9.57186827432389 84.15369380792929 L 28.271714378310527 76.74990097515403 A 37.35121951219512 37.35121951219512 0 0 0 56.001079386424905 99.6896267259979 L 52.23242982526908 119.44557957845831 z"></path></g><g id="SvgjsG1682" class="apexcharts-series apexcharts-pie-series" seriesName="Product" rel="3" data:realIndex="2"><path id="SvgjsPath1683" d="M 9.57186827432389 84.15369380792929 A 57.463414634146346 57.463414634146346 0 0 1 62.989970742202864 5.536586241071504 L 62.99348098243186 25.64878105669648 A 37.35121951219512 37.35121951219512 0 0 0 28.271714378310527 76.74990097515403 L 9.57186827432389 84.15369380792929 z" fill="rgba(250,204,21,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-2" index="0" j="2" data:angle="111.6" data:startAngle="248.4" data:strokeWidth="0" data:value="31" data:pathOrig="M 9.57186827432389 84.15369380792929 A 57.463414634146346 57.463414634146346 0 0 1 62.989970742202864 5.536586241071504 L 62.99348098243186 25.64878105669648 A 37.35121951219512 37.35121951219512 0 0 0 28.271714378310527 76.74990097515403 L 9.57186827432389 84.15369380792929 z"></path></g></g></g></g><line id="SvgjsLine1684" x1="0" y1="0" x2="126" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1685" x1="0" y1="0" x2="126" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG1671" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend"></div><div class="apexcharts-tooltip apexcharts-theme-dark" style="left: 113.212px; top: 35px;"><div class="apexcharts-tooltip-series-group apexcharts-active" ><span class="apexcharts-tooltip-marker" style="background-color: rgb(99, 102, 241); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">Total :</span><span class="apexcharts-tooltip-text-y-value">100,000$</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2; display: none; background-color: rgb(99, 102, 241);"><span class="apexcharts-tooltip-marker" style="background-color: rgb(99, 102, 241); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">App: </span><span class="apexcharts-tooltip-text-y-value">53</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 3; display: none; background-color: rgb(99, 102, 241);"><span class="apexcharts-tooltip-marker" style="background-color: rgb(99, 102, 241); display: none;"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">App: </span><span class="apexcharts-tooltip-text-y-value">53</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div></div></div>
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
                      <h3 class="mb-sm-0">공지사항</h3>
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
          <div class="col-12 col-md-6 col-lg-4">
            <div class="card h-100">
              <div class="card-header border-bottom-0 d-flex justify-content-between">
                <div>
                   <h3 class="fw-black mb-2">수주 금액</h3>
                  <small class="text-secondary">목표 : 1,000,000$</small>
                </div>
                <div class="dropdown">
                  <button class="btn text-secondary p-0 dropdown-toggle no-caret" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                    </svg>
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li><button class="dropdown-item" type="button">Last 28 days</button></li>
                    <li><button class="dropdown-item" type="button">Last month</button></li>
                    <li><button class="dropdown-item" type="button">Last year</button></li>
                  </ul>
                </div>
              </div>
              <div class="card-body">
              	 	<div id="donut-slider">
				    	<div class="value"></div>
				    	<div class="handle"></div>
				 	</div>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <div class="card h-100">
              <div class="card-header border-bottom-0 d-flex justify-content-between">
                <h6 class="mb-0">Goal Overview</h6>
                <button class="btn text-secondary p-0" type="button">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"></path>
                  </svg>
                </button>
              </div>
              <div class="card-body">
                <div id="goal" style="min-height: 184.383px;"><div id="apexchartsjb67pg88" class="apexcharts-canvas apexchartsjb67pg88 apexcharts-theme-light" style="width: 406px; height: 184.383px;"><svg id="SvgjsSvg1795" width="406" height="184.38333333333333" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1797" class="apexcharts-inner apexcharts-graphical" transform="translate(93.5, -10)"><defs id="SvgjsDefs1796"><clipPath id="gridRectMaskjb67pg88"><rect id="SvgjsRect1799" width="227" height="245" x="-3" y="-1" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskjb67pg88"></clipPath><clipPath id="nonForecastMaskjb67pg88"></clipPath><clipPath id="gridRectMarkerMaskjb67pg88"><rect id="SvgjsRect1800" width="225" height="247" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><g id="SvgjsG1801" class="apexcharts-radialbar"><g id="SvgjsG1802"><g id="SvgjsG1803" class="apexcharts-tracks"><g id="SvgjsG1804" class="apexcharts-radialbar-track apexcharts-track" rel="1"><path id="apexcharts-radialbarTrack-0" d="M 67.12823170731704 185.62210629703168 A 86.74353658536586 86.74353658536586 0 1 1 153.87176829268293 185.62210629703168" fill="none" fill-opacity="1" stroke="rgba(229,231,235,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="6.506334146341463" stroke-dasharray="0" class="apexcharts-radialbar-area" data:pathOrig="M 67.12823170731704 185.62210629703168 A 86.74353658536586 86.74353658536586 0 1 1 153.87176829268293 185.62210629703168"></path></g></g><g id="SvgjsG1806"><g id="SvgjsG1810" class="apexcharts-series apexcharts-radial-series" seriesName="seriesx1" rel="1" data:realIndex="0"><path id="SvgjsPath1811" d="M 67.12823170731704 185.62210629703168 A 86.74353658536586 86.74353658536586 0 1 1 196.17557970735362 124.0696787414294" fill="none" fill-opacity="0.85" stroke="rgba(22,163,74,0.85)" stroke-opacity="1" stroke-linecap="round" stroke-width="6.707560975609756" stroke-dasharray="0" class="apexcharts-radialbar-area apexcharts-radialbar-slice-0" data:angle="249" data:value="83" index="0" j="0" data:pathOrig="M 67.12823170731704 185.62210629703168 A 86.74353658536586 86.74353658536586 0 1 1 196.17557970735362 124.0696787414294"></path></g><circle id="SvgjsCircle1807" r="78.49036951219513" cx="110.5" cy="110.5" class="apexcharts-radialbar-hollow" fill="transparent"></circle><g id="SvgjsG1808" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)" style="opacity: 1;"><text id="SvgjsText1809" font-family="Helvetica, Arial, sans-serif" x="110.5" y="126.5" text-anchor="middle" dominant-baseline="auto" font-size="2rem" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-datalabel-value" style="font-family: Helvetica, Arial, sans-serif;">83%</text></g></g></g></g><line id="SvgjsLine1812" x1="0" y1="0" x2="221" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1813" x1="0" y1="0" x2="221" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG1798" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend"></div></div></div>
              </div>
              <div class="card-footer p-0">
                <div class="row text-center mx-0">
                  <div class="col-6 border-end py-1">
                    <small class="text-secondary">Completed</small>
                    <h6>786,617</h6>
                  </div>
                  <div class="col-6 py-1">
                    <small class="text-secondary">In Progress</small>
                    <h6>13,561</h6>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <div class="card h-100">
              <div class="card-header border-bottom-0 d-flex justify-content-between">
                <h6 class="mb-0">Transactions</h6>
                <div class="dropdown">
                  <button class="btn text-secondary p-0 dropdown-toggle no-caret" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
                    </svg>
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li><button class="dropdown-item" type="button">Last 28 days</button></li>
                    <li><button class="dropdown-item" type="button">Last month</button></li>
                    <li><button class="dropdown-item" type="button">Last year</button></li>
                  </ul>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex align-items-center">
                  <svg class="align-self-start text-primary" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 9V7a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2m2 4h10a2 2 0 002-2v-6a2 2 0 00-2-2H9a2 2 0 00-2 2v6a2 2 0 002 2zm7-5a2 2 0 11-4 0 2 2 0 014 0z"></path>
                  </svg>
                  <div class="mx-2">
                    <h6 class="mb-0">Wallet</h6>
                    <small class="text-secondary">Starbucks</small>
                  </div>
                  <span class="ms-auto text-danger">- $74</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                  <svg class="align-self-start text-success" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                  </svg>
                  <div class="mx-2">
                    <h6 class="mb-0">Bank transfer</h6>
                    <small class="text-secondary">Add money</small>
                  </div>
                  <span class="ms-auto text-success">+ $480</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                  <svg class="align-self-start text-primary" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                  </svg>
                  <div class="mx-2">
                    <h6 class="mb-0">Paypal</h6>
                    <small class="text-secondary">Add money</small>
                  </div>
                  <span class="ms-auto text-success">+ $590</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                  <svg class="align-self-start text-danger" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"></path>
                  </svg>
                  <div class="mx-2">
                    <h6 class="mb-0">Master card</h6>
                    <small class="text-secondary">Ordered food</small>
                  </div>
                  <span class="ms-auto text-danger">- $23</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                  <svg class="align-self-start text-info" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6"></path>
                  </svg>
                  <div class="mx-2">
                    <h6 class="mb-0">Transfer</h6>
                    <small class="text-secondary">Refund</small>
                  </div>
                  <span class="ms-auto text-success">+ $98</span>
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
width = typeof width !== 'undefined' ? width : 290;
height = typeof height !== 'undefined' ? height : 290;
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


/* 두번쨰 도넛 */
$(function() {
	  var s = new DonutSlider('donut-slider', 30);
	  s.setValue(${order_Money/100000000} * 0.9+0.02);
	});

	////////////////////////

	var DonutSlider = function(elementId, borderSize) {
	  var _this = this,
	      size = Math.min($('#' + elementId).width(), 
	                      $('#' + elementId).height());
	  this.pie = d3.layout.pie().sort(null);
	  this.arc = d3.svg.arc()
	             .innerRadius((size / 2) - borderSize)
	             .outerRadius(size / 2);
	  this.svg = d3.select('#' + elementId).append('svg')
	             .attr('width', size)
	             .attr('height', size)
	             .append('g')
	             .attr('transform', 'translate(' + size / 2 + ',' + size / 2 + ')');
	  this.path = this.svg.selectAll('path')
	              .data(this.pie([0, 100]))
	              .enter().append('path')
	                .attr('fill', function(d, i) { 
	                   return _this.colors[i];
	                })
	                .attr('d', this.arc);
	  this.dragdealer = new Dragdealer(elementId, {
	    x: 1,
	    slide: false,
	    animationCallback: function(x, y) {
	      _this.updateChart((1 - x) * 100);
	      $('#' + elementId).find('.value').text(Math.round((1 - x) * 100));
	    }
	  });
	};
	DonutSlider.prototype = {
	  colors: ['#ff6666', '#eee'],
	  setValue: function(value) {
	    this.dragdealer.setValue(1 - value, 0, true);
	  },
	  updateChart: function(value) {
	    this.path.data(this.pie([value, 100 - value]))
	             .attr('d', this.arc);      
	  }
	};
	
	
	var modalForm = $("#modalForm");
	 function insertBtn(){
		 document.getElementById('no').value='123';
		 readonly(false);
		 clearModal();
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
