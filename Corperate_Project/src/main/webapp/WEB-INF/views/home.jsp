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


.circular-chart.orange .circle {
  stroke: #fbd438;
}


.percentage {
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
          <div class="col-lg-8">
            <div class="card h-100">
              <div class="card-body">
                <div class="row">
                  <div class="col-12 col-md-8">
                    <div class="d-sm-flex justify-content-between align-items-center">
                      <h6 class="mb-sm-0">Revenue Report</h6>
                      <div class="d-flex align-items-center">
                        <div class="d-flex align-items-center">
                          <svg class="text-primary me-1" viewBox="0 0 20 20" fill="currentColor" stroke-linecap="round">
                            <circle cx="10" cy="10" r="7"></circle>
                          </svg>
                          Earning
                        </div>
                        <div class="d-flex align-items-center ms-3">
                          <svg class="text-warning me-1" viewBox="0 0 20 20" fill="currentColor" stroke-linecap="round">
                            <circle cx="10" cy="10" r="7"></circle>
                          </svg>
                          Expense
                        </div>
                      </div>
                    </div>
                    <div id="revenue" style="min-height: 275px;"><div id="apexchartsl6dpow8d" class="apexcharts-canvas apexchartsl6dpow8d apexcharts-theme-light" style="width: 571px; height: 260px;"><svg id="SvgjsSvg1500" width="571" height="260" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1502" class="apexcharts-inner apexcharts-graphical" transform="translate(45.63535118103027, 30)"><defs id="SvgjsDefs1501"><linearGradient id="SvgjsLinearGradient1506" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop1507" stop-opacity="0.4" stop-color="rgba(216,227,240,0.4)" offset="0"></stop><stop id="SvgjsStop1508" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop><stop id="SvgjsStop1509" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop></linearGradient><clipPath id="gridRectMaskl6dpow8d"><rect id="SvgjsRect1511" width="519.3646488189697" height="192.99519938278198" x="-2" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskl6dpow8d"></clipPath><clipPath id="nonForecastMaskl6dpow8d"></clipPath><clipPath id="gridRectMarkerMaskl6dpow8d"><rect id="SvgjsRect1512" width="519.3646488189697" height="196.99519938278198" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><rect id="SvgjsRect1510" width="8.589410813649495" height="192.99519938278198" x="362.73728268411423" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke-dasharray="3" fill="url(#SvgjsLinearGradient1506)" class="apexcharts-xcrosshairs" y2="192.99519938278198" filter="none" fill-opacity="0.9" x1="362.73728268411423" x2="362.73728268411423"></rect><g id="SvgjsG1556" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1557" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"><text id="SvgjsText1559" font-family="Helvetica, Arial, sans-serif" x="28.63136937883165" y="221.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1560">Jan</tspan><title>Jan</title></text><text id="SvgjsText1562" font-family="Helvetica, Arial, sans-serif" x="85.89410813649495" y="221.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1563">Feb</tspan><title>Feb</title></text><text id="SvgjsText1565" font-family="Helvetica, Arial, sans-serif" x="143.15684689415826" y="221.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1566">Mar</tspan><title>Mar</title></text><text id="SvgjsText1568" font-family="Helvetica, Arial, sans-serif" x="200.41958565182154" y="221.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1569">Apr</tspan><title>Apr</title></text><text id="SvgjsText1571" font-family="Helvetica, Arial, sans-serif" x="257.68232440948486" y="221.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1572">May</tspan><title>May</title></text><text id="SvgjsText1574" font-family="Helvetica, Arial, sans-serif" x="314.9450631671482" y="221.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1575">Jun</tspan><title>Jun</title></text><text id="SvgjsText1577" font-family="Helvetica, Arial, sans-serif" x="372.2078019248115" y="221.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1578">Jul</tspan><title>Jul</title></text><text id="SvgjsText1580" font-family="Helvetica, Arial, sans-serif" x="429.47054068247485" y="221.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1581">Aug</tspan><title>Aug</title></text><text id="SvgjsText1583" font-family="Helvetica, Arial, sans-serif" x="486.7332794401382" y="221.99519938278198" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1584">Sep</tspan><title>Sep</title></text></g><line id="SvgjsLine1585" x1="0" y1="193.99519938278198" x2="515.3646488189697" y2="193.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt"></line></g><g id="SvgjsG1598" class="apexcharts-grid"><g id="SvgjsG1599" class="apexcharts-gridlines-horizontal"><line id="SvgjsLine1611" x1="0" y1="0" x2="515.3646488189697" y2="0" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1612" x1="0" y1="48.248799845695494" x2="515.3646488189697" y2="48.248799845695494" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1613" x1="0" y1="96.49759969139099" x2="515.3646488189697" y2="96.49759969139099" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1614" x1="0" y1="144.7463995370865" x2="515.3646488189697" y2="144.7463995370865" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1615" x1="0" y1="192.99519938278198" x2="515.3646488189697" y2="192.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line></g><g id="SvgjsG1600" class="apexcharts-gridlines-vertical"></g><line id="SvgjsLine1601" x1="0" y1="193.99519938278198" x2="0" y2="199.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1602" x1="57.2627387576633" y1="193.99519938278198" x2="57.2627387576633" y2="199.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1603" x1="114.5254775153266" y1="193.99519938278198" x2="114.5254775153266" y2="199.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1604" x1="171.7882162729899" y1="193.99519938278198" x2="171.7882162729899" y2="199.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1605" x1="229.0509550306532" y1="193.99519938278198" x2="229.0509550306532" y2="199.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1606" x1="286.3136937883165" y1="193.99519938278198" x2="286.3136937883165" y2="199.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1607" x1="343.57643254597986" y1="193.99519938278198" x2="343.57643254597986" y2="199.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1608" x1="400.8391713036432" y1="193.99519938278198" x2="400.8391713036432" y2="199.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1609" x1="458.1019100613065" y1="193.99519938278198" x2="458.1019100613065" y2="199.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1610" x1="515.3646488189698" y1="193.99519938278198" x2="515.3646488189698" y2="199.99519938278198" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1617" x1="0" y1="192.99519938278198" x2="515.3646488189697" y2="192.99519938278198" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line><line id="SvgjsLine1616" x1="0" y1="1" x2="0" y2="192.99519938278198" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line></g><g id="SvgjsG1513" class="apexcharts-bar-series apexcharts-plot-series"><g id="SvgjsG1514" class="apexcharts-series" rel="1" seriesName="expense" data:realIndex="0"><path id="SvgjsPath1518" d="M 20.041958565182156 192.99519938278198L 20.041958565182156 169.65421280355451Q 20.041958565182156 165.65421280355451 24.041958565182156 165.65421280355451L 24.63136937883165 165.65421280355451Q 28.63136937883165 165.65421280355451 28.63136937883165 169.65421280355451L 28.63136937883165 169.65421280355451L 28.63136937883165 192.99519938278198L 28.63136937883165 192.99519938278198z" fill="rgba(250,204,21,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 20.041958565182156 192.99519938278198L 20.041958565182156 169.65421280355451Q 20.041958565182156 165.65421280355451 24.041958565182156 165.65421280355451L 24.63136937883165 165.65421280355451Q 28.63136937883165 165.65421280355451 28.63136937883165 169.65421280355451L 28.63136937883165 169.65421280355451L 28.63136937883165 192.99519938278198L 28.63136937883165 192.99519938278198z" pathFrom="M 20.041958565182156 192.99519938278198L 20.041958565182156 192.99519938278198L 28.63136937883165 192.99519938278198L 28.63136937883165 192.99519938278198L 28.63136937883165 192.99519938278198L 28.63136937883165 192.99519938278198L 28.63136937883165 192.99519938278198L 20.041958565182156 192.99519938278198" cy="165.65421280355451" cx="77.30469732284546" j="0" val="17" barHeight="27.340986579227447" barWidth="8.589410813649495"></path><path id="SvgjsPath1520" d="M 77.30469732284546 192.99519938278198L 77.30469732284546 145.52981288070677Q 77.30469732284546 141.52981288070677 81.30469732284546 141.52981288070677L 81.89410813649495 141.52981288070677Q 85.89410813649495 141.52981288070677 85.89410813649495 145.52981288070677L 85.89410813649495 145.52981288070677L 85.89410813649495 192.99519938278198L 85.89410813649495 192.99519938278198z" fill="rgba(250,204,21,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 77.30469732284546 192.99519938278198L 77.30469732284546 145.52981288070677Q 77.30469732284546 141.52981288070677 81.30469732284546 141.52981288070677L 81.89410813649495 141.52981288070677Q 85.89410813649495 141.52981288070677 85.89410813649495 145.52981288070677L 85.89410813649495 145.52981288070677L 85.89410813649495 192.99519938278198L 85.89410813649495 192.99519938278198z" pathFrom="M 77.30469732284546 192.99519938278198L 77.30469732284546 192.99519938278198L 85.89410813649495 192.99519938278198L 85.89410813649495 192.99519938278198L 85.89410813649495 192.99519938278198L 85.89410813649495 192.99519938278198L 85.89410813649495 192.99519938278198L 77.30469732284546 192.99519938278198" cy="141.52981288070677" cx="134.56743608050874" j="1" val="32" barHeight="51.4653865020752" barWidth="8.589410813649495"></path><path id="SvgjsPath1522" d="M 134.56743608050874 192.99519938278198L 134.56743608050874 116.58053297328948Q 134.56743608050874 112.58053297328948 138.56743608050874 112.58053297328948L 139.15684689415824 112.58053297328948Q 143.15684689415824 112.58053297328948 143.15684689415824 116.58053297328948L 143.15684689415824 116.58053297328948L 143.15684689415824 192.99519938278198L 143.15684689415824 192.99519938278198z" fill="rgba(250,204,21,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 134.56743608050874 192.99519938278198L 134.56743608050874 116.58053297328948Q 134.56743608050874 112.58053297328948 138.56743608050874 112.58053297328948L 139.15684689415824 112.58053297328948Q 143.15684689415824 112.58053297328948 143.15684689415824 116.58053297328948L 143.15684689415824 116.58053297328948L 143.15684689415824 192.99519938278198L 143.15684689415824 192.99519938278198z" pathFrom="M 134.56743608050874 192.99519938278198L 134.56743608050874 192.99519938278198L 143.15684689415824 192.99519938278198L 143.15684689415824 192.99519938278198L 143.15684689415824 192.99519938278198L 143.15684689415824 192.99519938278198L 143.15684689415824 192.99519938278198L 134.56743608050874 192.99519938278198" cy="112.58053297328948" cx="191.83017483817204" j="2" val="50" barHeight="80.4146664094925" barWidth="8.589410813649495"></path><path id="SvgjsPath1524" d="M 191.83017483817204 192.99519938278198L 191.83017483817204 121.40541295785903Q 191.83017483817204 117.40541295785903 195.83017483817204 117.40541295785903L 196.41958565182154 117.40541295785903Q 200.41958565182154 117.40541295785903 200.41958565182154 121.40541295785903L 200.41958565182154 121.40541295785903L 200.41958565182154 192.99519938278198L 200.41958565182154 192.99519938278198z" fill="rgba(250,204,21,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 191.83017483817204 192.99519938278198L 191.83017483817204 121.40541295785903Q 191.83017483817204 117.40541295785903 195.83017483817204 117.40541295785903L 196.41958565182154 117.40541295785903Q 200.41958565182154 117.40541295785903 200.41958565182154 121.40541295785903L 200.41958565182154 121.40541295785903L 200.41958565182154 192.99519938278198L 200.41958565182154 192.99519938278198z" pathFrom="M 191.83017483817204 192.99519938278198L 191.83017483817204 192.99519938278198L 200.41958565182154 192.99519938278198L 200.41958565182154 192.99519938278198L 200.41958565182154 192.99519938278198L 200.41958565182154 192.99519938278198L 200.41958565182154 192.99519938278198L 191.83017483817204 192.99519938278198" cy="117.40541295785903" cx="249.09291359583534" j="3" val="47" barHeight="75.58978642492295" barWidth="8.589410813649495"></path><path id="SvgjsPath1526" d="M 249.09291359583534 192.99519938278198L 249.09291359583534 166.43762614717483Q 249.09291359583534 162.43762614717483 253.09291359583534 162.43762614717483L 253.68232440948486 162.43762614717483Q 257.68232440948486 162.43762614717483 257.68232440948486 166.43762614717483L 257.68232440948486 166.43762614717483L 257.68232440948486 192.99519938278198L 257.68232440948486 192.99519938278198z" fill="rgba(250,204,21,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 249.09291359583534 192.99519938278198L 249.09291359583534 166.43762614717483Q 249.09291359583534 162.43762614717483 253.09291359583534 162.43762614717483L 253.68232440948486 162.43762614717483Q 257.68232440948486 162.43762614717483 257.68232440948486 166.43762614717483L 257.68232440948486 166.43762614717483L 257.68232440948486 192.99519938278198L 257.68232440948486 192.99519938278198z" pathFrom="M 249.09291359583534 192.99519938278198L 249.09291359583534 192.99519938278198L 257.68232440948486 192.99519938278198L 257.68232440948486 192.99519938278198L 257.68232440948486 192.99519938278198L 257.68232440948486 192.99519938278198L 257.68232440948486 192.99519938278198L 249.09291359583534 192.99519938278198" cy="162.43762614717483" cx="306.3556523534986" j="4" val="19" barHeight="30.557573235607148" barWidth="8.589410813649495"></path><path id="SvgjsPath1528" d="M 306.3556523534986 192.99519938278198L 306.3556523534986 179.3039727726936Q 306.3556523534986 175.3039727726936 310.3556523534986 175.3039727726936L 310.94506316714813 175.3039727726936Q 314.94506316714813 175.3039727726936 314.94506316714813 179.3039727726936L 314.94506316714813 179.3039727726936L 314.94506316714813 192.99519938278198L 314.94506316714813 192.99519938278198z" fill="rgba(250,204,21,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 306.3556523534986 192.99519938278198L 306.3556523534986 179.3039727726936Q 306.3556523534986 175.3039727726936 310.3556523534986 175.3039727726936L 310.94506316714813 175.3039727726936Q 314.94506316714813 175.3039727726936 314.94506316714813 179.3039727726936L 314.94506316714813 179.3039727726936L 314.94506316714813 192.99519938278198L 314.94506316714813 192.99519938278198z" pathFrom="M 306.3556523534986 192.99519938278198L 306.3556523534986 192.99519938278198L 314.94506316714813 192.99519938278198L 314.94506316714813 192.99519938278198L 314.94506316714813 192.99519938278198L 314.94506316714813 192.99519938278198L 314.94506316714813 192.99519938278198L 306.3556523534986 192.99519938278198" cy="175.3039727726936" cx="363.61839111116194" j="5" val="11" barHeight="17.69122661008835" barWidth="8.589410813649495"></path><path id="SvgjsPath1530" d="M 363.61839111116194 192.99519938278198L 363.61839111116194 148.7463995370865Q 363.61839111116194 144.7463995370865 367.61839111116194 144.7463995370865L 368.20780192481146 144.7463995370865Q 372.20780192481146 144.7463995370865 372.20780192481146 148.7463995370865L 372.20780192481146 148.7463995370865L 372.20780192481146 192.99519938278198L 372.20780192481146 192.99519938278198z" fill="rgba(250,204,21,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 363.61839111116194 192.99519938278198L 363.61839111116194 148.7463995370865Q 363.61839111116194 144.7463995370865 367.61839111116194 144.7463995370865L 368.20780192481146 144.7463995370865Q 372.20780192481146 144.7463995370865 372.20780192481146 148.7463995370865L 372.20780192481146 148.7463995370865L 372.20780192481146 192.99519938278198L 372.20780192481146 192.99519938278198z" pathFrom="M 363.61839111116194 192.99519938278198L 363.61839111116194 192.99519938278198L 372.20780192481146 192.99519938278198L 372.20780192481146 192.99519938278198L 372.20780192481146 192.99519938278198L 372.20780192481146 192.99519938278198L 372.20780192481146 192.99519938278198L 363.61839111116194 192.99519938278198" cy="144.7463995370865" cx="420.88112986882527" j="6" val="30" barHeight="48.248799845695494" barWidth="8.589410813649495"></path><path id="SvgjsPath1532" d="M 420.88112986882527 192.99519938278198L 420.88112986882527 132.66346625518798Q 420.88112986882527 128.66346625518798 424.88112986882527 128.66346625518798L 425.4705406824748 128.66346625518798Q 429.4705406824748 128.66346625518798 429.4705406824748 132.66346625518798L 429.4705406824748 132.66346625518798L 429.4705406824748 192.99519938278198L 429.4705406824748 192.99519938278198z" fill="rgba(250,204,21,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 420.88112986882527 192.99519938278198L 420.88112986882527 132.66346625518798Q 420.88112986882527 128.66346625518798 424.88112986882527 128.66346625518798L 425.4705406824748 128.66346625518798Q 429.4705406824748 128.66346625518798 429.4705406824748 132.66346625518798L 429.4705406824748 132.66346625518798L 429.4705406824748 192.99519938278198L 429.4705406824748 192.99519938278198z" pathFrom="M 420.88112986882527 192.99519938278198L 420.88112986882527 192.99519938278198L 429.4705406824748 192.99519938278198L 429.4705406824748 192.99519938278198L 429.4705406824748 192.99519938278198L 429.4705406824748 192.99519938278198L 429.4705406824748 192.99519938278198L 420.88112986882527 192.99519938278198" cy="128.66346625518798" cx="478.1438686264886" j="7" val="40" barHeight="64.33173312759399" barWidth="8.589410813649495"></path><path id="SvgjsPath1534" d="M 478.1438686264886 192.99519938278198L 478.1438686264886 176.08738611631392Q 478.1438686264886 172.08738611631392 482.1438686264886 172.08738611631392L 482.7332794401381 172.08738611631392Q 486.7332794401381 172.08738611631392 486.7332794401381 176.08738611631392L 486.7332794401381 176.08738611631392L 486.7332794401381 192.99519938278198L 486.7332794401381 192.99519938278198z" fill="rgba(250,204,21,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 478.1438686264886 192.99519938278198L 478.1438686264886 176.08738611631392Q 478.1438686264886 172.08738611631392 482.1438686264886 172.08738611631392L 482.7332794401381 172.08738611631392Q 486.7332794401381 172.08738611631392 486.7332794401381 176.08738611631392L 486.7332794401381 176.08738611631392L 486.7332794401381 192.99519938278198L 486.7332794401381 192.99519938278198z" pathFrom="M 478.1438686264886 192.99519938278198L 478.1438686264886 192.99519938278198L 486.7332794401381 192.99519938278198L 486.7332794401381 192.99519938278198L 486.7332794401381 192.99519938278198L 486.7332794401381 192.99519938278198L 486.7332794401381 192.99519938278198L 478.1438686264886 192.99519938278198" cy="172.08738611631392" cx="535.4066073841519" j="8" val="13" barHeight="20.907813266468047" barWidth="8.589410813649495"></path><g id="SvgjsG1516" class="apexcharts-bar-goals-markers" style="pointer-events: none"><g id="SvgjsG1517" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1519" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1521" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1523" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1525" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1527" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1529" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1531" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1533" className="apexcharts-bar-goals-groups"></g></g></g><g id="SvgjsG1535" class="apexcharts-series" rel="2" seriesName="earning" data:realIndex="1"><path id="SvgjsPath1539" d="M 28.63136937883165 192.99519938278198L 28.63136937883165 142.31322622432708Q 28.63136937883165 138.31322622432708 32.63136937883165 138.31322622432708L 33.22078019248114 138.31322622432708Q 37.22078019248114 138.31322622432708 37.22078019248114 142.31322622432708L 37.22078019248114 142.31322622432708L 37.22078019248114 192.99519938278198L 37.22078019248114 192.99519938278198z" fill="rgba(99,102,241,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 28.63136937883165 192.99519938278198L 28.63136937883165 142.31322622432708Q 28.63136937883165 138.31322622432708 32.63136937883165 138.31322622432708L 33.22078019248114 138.31322622432708Q 37.22078019248114 138.31322622432708 37.22078019248114 142.31322622432708L 37.22078019248114 142.31322622432708L 37.22078019248114 192.99519938278198L 37.22078019248114 192.99519938278198z" pathFrom="M 28.63136937883165 192.99519938278198L 28.63136937883165 192.99519938278198L 37.22078019248114 192.99519938278198L 37.22078019248114 192.99519938278198L 37.22078019248114 192.99519938278198L 37.22078019248114 192.99519938278198L 37.22078019248114 192.99519938278198L 28.63136937883165 192.99519938278198" cy="138.31322622432708" cx="85.89410813649495" j="0" val="34" barHeight="54.681973158454895" barWidth="8.589410813649495"></path><path id="SvgjsPath1541" d="M 85.89410813649495 192.99519938278198L 85.89410813649495 92.45613305044174Q 85.89410813649495 88.45613305044174 89.89410813649495 88.45613305044174L 90.48351895014444 88.45613305044174Q 94.48351895014444 88.45613305044174 94.48351895014444 92.45613305044174L 94.48351895014444 92.45613305044174L 94.48351895014444 192.99519938278198L 94.48351895014444 192.99519938278198z" fill="rgba(99,102,241,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 85.89410813649495 192.99519938278198L 85.89410813649495 92.45613305044174Q 85.89410813649495 88.45613305044174 89.89410813649495 88.45613305044174L 90.48351895014444 88.45613305044174Q 94.48351895014444 88.45613305044174 94.48351895014444 92.45613305044174L 94.48351895014444 92.45613305044174L 94.48351895014444 192.99519938278198L 94.48351895014444 192.99519938278198z" pathFrom="M 85.89410813649495 192.99519938278198L 85.89410813649495 192.99519938278198L 94.48351895014444 192.99519938278198L 94.48351895014444 192.99519938278198L 94.48351895014444 192.99519938278198L 94.48351895014444 192.99519938278198L 94.48351895014444 192.99519938278198L 85.89410813649495 192.99519938278198" cy="88.45613305044174" cx="143.15684689415824" j="1" val="65" barHeight="104.53906633234024" barWidth="8.589410813649495"></path><path id="SvgjsPath1543" d="M 143.15684689415824 192.99519938278198L 143.15684689415824 29.732693251037603Q 143.15684689415824 25.732693251037603 147.15684689415824 25.732693251037603L 147.74625770780773 25.732693251037603Q 151.74625770780773 25.732693251037603 151.74625770780773 29.732693251037603L 151.74625770780773 29.732693251037603L 151.74625770780773 192.99519938278198L 151.74625770780773 192.99519938278198z" fill="rgba(99,102,241,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 143.15684689415824 192.99519938278198L 143.15684689415824 29.732693251037603Q 143.15684689415824 25.732693251037603 147.15684689415824 25.732693251037603L 147.74625770780773 25.732693251037603Q 151.74625770780773 25.732693251037603 151.74625770780773 29.732693251037603L 151.74625770780773 29.732693251037603L 151.74625770780773 192.99519938278198L 151.74625770780773 192.99519938278198z" pathFrom="M 143.15684689415824 192.99519938278198L 143.15684689415824 192.99519938278198L 151.74625770780773 192.99519938278198L 151.74625770780773 192.99519938278198L 151.74625770780773 192.99519938278198L 151.74625770780773 192.99519938278198L 151.74625770780773 192.99519938278198L 143.15684689415824 192.99519938278198" cy="25.732693251037603" cx="200.41958565182154" j="2" val="104" barHeight="167.26250613174437" barWidth="8.589410813649495"></path><path id="SvgjsPath1545" d="M 200.41958565182154 192.99519938278198L 200.41958565182154 45.81562653293608Q 200.41958565182154 41.81562653293608 204.41958565182154 41.81562653293608L 205.00899646547103 41.81562653293608Q 209.00899646547103 41.81562653293608 209.00899646547103 45.81562653293608L 209.00899646547103 45.81562653293608L 209.00899646547103 192.99519938278198L 209.00899646547103 192.99519938278198z" fill="rgba(99,102,241,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 200.41958565182154 192.99519938278198L 200.41958565182154 45.81562653293608Q 200.41958565182154 41.81562653293608 204.41958565182154 41.81562653293608L 205.00899646547103 41.81562653293608Q 209.00899646547103 41.81562653293608 209.00899646547103 45.81562653293608L 209.00899646547103 45.81562653293608L 209.00899646547103 192.99519938278198L 209.00899646547103 192.99519938278198z" pathFrom="M 200.41958565182154 192.99519938278198L 200.41958565182154 192.99519938278198L 209.00899646547103 192.99519938278198L 209.00899646547103 192.99519938278198L 209.00899646547103 192.99519938278198L 209.00899646547103 192.99519938278198L 209.00899646547103 192.99519938278198L 200.41958565182154 192.99519938278198" cy="41.81562653293608" cx="257.68232440948486" j="3" val="94" barHeight="151.1795728498459" barWidth="8.589410813649495"></path><path id="SvgjsPath1547" d="M 257.68232440948486 192.99519938278198L 257.68232440948486 135.88005291156767Q 257.68232440948486 131.88005291156767 261.68232440948486 131.88005291156767L 262.2717352231344 131.88005291156767Q 266.2717352231344 131.88005291156767 266.2717352231344 135.88005291156767L 266.2717352231344 135.88005291156767L 266.2717352231344 192.99519938278198L 266.2717352231344 192.99519938278198z" fill="rgba(99,102,241,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 257.68232440948486 192.99519938278198L 257.68232440948486 135.88005291156767Q 257.68232440948486 131.88005291156767 261.68232440948486 131.88005291156767L 262.2717352231344 131.88005291156767Q 266.2717352231344 131.88005291156767 266.2717352231344 135.88005291156767L 266.2717352231344 135.88005291156767L 266.2717352231344 192.99519938278198L 266.2717352231344 192.99519938278198z" pathFrom="M 257.68232440948486 192.99519938278198L 257.68232440948486 192.99519938278198L 266.2717352231344 192.99519938278198L 266.2717352231344 192.99519938278198L 266.2717352231344 192.99519938278198L 266.2717352231344 192.99519938278198L 266.2717352231344 192.99519938278198L 257.68232440948486 192.99519938278198" cy="131.88005291156767" cx="314.94506316714813" j="4" val="38" barHeight="61.115146471214295" barWidth="8.589410813649495"></path><path id="SvgjsPath1549" d="M 314.94506316714813 192.99519938278198L 314.94506316714813 160.00445283441542Q 314.94506316714813 156.00445283441542 318.94506316714813 156.00445283441542L 319.53447398079766 156.00445283441542Q 323.53447398079766 156.00445283441542 323.53447398079766 160.00445283441542L 323.53447398079766 160.00445283441542L 323.53447398079766 192.99519938278198L 323.53447398079766 192.99519938278198z" fill="rgba(99,102,241,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 314.94506316714813 192.99519938278198L 314.94506316714813 160.00445283441542Q 314.94506316714813 156.00445283441542 318.94506316714813 156.00445283441542L 319.53447398079766 156.00445283441542Q 323.53447398079766 156.00445283441542 323.53447398079766 160.00445283441542L 323.53447398079766 160.00445283441542L 323.53447398079766 192.99519938278198L 323.53447398079766 192.99519938278198z" pathFrom="M 314.94506316714813 192.99519938278198L 314.94506316714813 192.99519938278198L 323.53447398079766 192.99519938278198L 323.53447398079766 192.99519938278198L 323.53447398079766 192.99519938278198L 323.53447398079766 192.99519938278198L 323.53447398079766 192.99519938278198L 314.94506316714813 192.99519938278198" cy="156.00445283441542" cx="372.20780192481146" j="5" val="23" barHeight="36.990746548366545" barWidth="8.589410813649495"></path><path id="SvgjsPath1551" d="M 372.20780192481146 192.99519938278198L 372.20780192481146 98.88930636320113Q 372.20780192481146 94.88930636320113 376.20780192481146 94.88930636320113L 376.797212738461 94.88930636320113Q 380.797212738461 94.88930636320113 380.797212738461 98.88930636320113L 380.797212738461 98.88930636320113L 380.797212738461 192.99519938278198L 380.797212738461 192.99519938278198z" fill="rgba(99,102,241,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 372.20780192481146 192.99519938278198L 372.20780192481146 98.88930636320113Q 372.20780192481146 94.88930636320113 376.20780192481146 94.88930636320113L 376.797212738461 94.88930636320113Q 380.797212738461 94.88930636320113 380.797212738461 98.88930636320113L 380.797212738461 98.88930636320113L 380.797212738461 192.99519938278198L 380.797212738461 192.99519938278198z" pathFrom="M 372.20780192481146 192.99519938278198L 372.20780192481146 192.99519938278198L 380.797212738461 192.99519938278198L 380.797212738461 192.99519938278198L 380.797212738461 192.99519938278198L 380.797212738461 192.99519938278198L 380.797212738461 192.99519938278198L 372.20780192481146 192.99519938278198" cy="94.88930636320113" cx="429.4705406824748" j="6" val="61" barHeight="98.10589301958085" barWidth="8.589410813649495"></path><path id="SvgjsPath1553" d="M 429.4705406824748 192.99519938278198L 429.4705406824748 68.33173312759399Q 429.4705406824748 64.33173312759399 433.4705406824748 64.33173312759399L 434.0599514961243 64.33173312759399Q 438.0599514961243 64.33173312759399 438.0599514961243 68.33173312759399L 438.0599514961243 68.33173312759399L 438.0599514961243 192.99519938278198L 438.0599514961243 192.99519938278198z" fill="rgba(99,102,241,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 429.4705406824748 192.99519938278198L 429.4705406824748 68.33173312759399Q 429.4705406824748 64.33173312759399 433.4705406824748 64.33173312759399L 434.0599514961243 64.33173312759399Q 438.0599514961243 64.33173312759399 438.0599514961243 68.33173312759399L 438.0599514961243 68.33173312759399L 438.0599514961243 192.99519938278198L 438.0599514961243 192.99519938278198z" pathFrom="M 429.4705406824748 192.99519938278198L 429.4705406824748 192.99519938278198L 438.0599514961243 192.99519938278198L 438.0599514961243 192.99519938278198L 438.0599514961243 192.99519938278198L 438.0599514961243 192.99519938278198L 438.0599514961243 192.99519938278198L 429.4705406824748 192.99519938278198" cy="64.33173312759399" cx="486.7332794401381" j="7" val="80" barHeight="128.66346625518798" barWidth="8.589410813649495"></path><path id="SvgjsPath1555" d="M 486.7332794401381 192.99519938278198L 486.7332794401381 155.1795728498459Q 486.7332794401381 151.1795728498459 490.7332794401381 151.1795728498459L 491.32269025378764 151.1795728498459Q 495.32269025378764 151.1795728498459 495.32269025378764 155.1795728498459L 495.32269025378764 155.1795728498459L 495.32269025378764 192.99519938278198L 495.32269025378764 192.99519938278198z" fill="rgba(99,102,241,0.85)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="1" clip-path="url(#gridRectMaskl6dpow8d)" pathTo="M 486.7332794401381 192.99519938278198L 486.7332794401381 155.1795728498459Q 486.7332794401381 151.1795728498459 490.7332794401381 151.1795728498459L 491.32269025378764 151.1795728498459Q 495.32269025378764 151.1795728498459 495.32269025378764 155.1795728498459L 495.32269025378764 155.1795728498459L 495.32269025378764 192.99519938278198L 495.32269025378764 192.99519938278198z" pathFrom="M 486.7332794401381 192.99519938278198L 486.7332794401381 192.99519938278198L 495.32269025378764 192.99519938278198L 495.32269025378764 192.99519938278198L 495.32269025378764 192.99519938278198L 495.32269025378764 192.99519938278198L 495.32269025378764 192.99519938278198L 486.7332794401381 192.99519938278198" cy="151.1795728498459" cx="543.9960181978014" j="8" val="26" barHeight="41.81562653293609" barWidth="8.589410813649495"></path><g id="SvgjsG1537" class="apexcharts-bar-goals-markers" style="pointer-events: none"><g id="SvgjsG1538" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1540" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1542" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1544" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1546" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1548" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1550" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1552" className="apexcharts-bar-goals-groups"></g><g id="SvgjsG1554" className="apexcharts-bar-goals-groups"></g></g></g><g id="SvgjsG1515" class="apexcharts-datalabels" data:realIndex="0"></g><g id="SvgjsG1536" class="apexcharts-datalabels" data:realIndex="1"></g></g><line id="SvgjsLine1618" x1="0" y1="0" x2="515.3646488189697" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1619" x1="0" y1="0" x2="515.3646488189697" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1620" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1621" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1622" class="apexcharts-point-annotations"></g></g><g id="SvgjsG1586" class="apexcharts-yaxis" rel="0" transform="translate(15.635351181030273, 0)"><g id="SvgjsG1587" class="apexcharts-yaxis-texts-g"><text id="SvgjsText1588" font-family="Helvetica, Arial, sans-serif" x="20" y="31.4" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1589">120</tspan><title>120</title></text><text id="SvgjsText1590" font-family="Helvetica, Arial, sans-serif" x="20" y="79.64879984569549" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1591">90</tspan><title>90</title></text><text id="SvgjsText1592" font-family="Helvetica, Arial, sans-serif" x="20" y="127.89759969139098" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1593">60</tspan><title>60</title></text><text id="SvgjsText1594" font-family="Helvetica, Arial, sans-serif" x="20" y="176.14639953708647" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1595">30</tspan><title>30</title></text><text id="SvgjsText1596" font-family="Helvetica, Arial, sans-serif" x="20" y="224.39519938278195" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1597">0</tspan><title>0</title></text></g></g><g id="SvgjsG1503" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend" style="max-height: 130px;"></div><div class="apexcharts-tooltip apexcharts-theme-light" style="left: 412.667px; top: 152.995px;"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Jul</div><div class="apexcharts-tooltip-series-group apexcharts-active" style="order: 1; display: flex;"><span class="apexcharts-tooltip-marker" style="background-color: rgba(250, 204, 21, 0.85);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">expense: </span><span class="apexcharts-tooltip-text-y-value">30</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2; display: none;"><span class="apexcharts-tooltip-marker" style="background-color: rgba(250, 204, 21, 0.85);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label">expense: </span><span class="apexcharts-tooltip-text-y-value">30</span></div><div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div></div></div>
                  </div>
                  <div class="col-12 col-md-4 text-center px-4 vstack justify-content-between align-items-center">
                    <div class="btn-group mb-3">
                      <button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        2021
                      </button>
                      <ul class="dropdown-menu" style="">
                        <li><button class="dropdown-item" type="button">2021</button></li>
                        <li><button class="dropdown-item" type="button">2020</button></li>
                        <li><button class="dropdown-item" type="button">2019</button></li>
                      </ul>
                    </div>
                    <div class="text-secondary">
                      <h4>$25,852</h4>
                      <p>
                        <span class="fw-bolder text-dark me-25">Budget:</span>
                        <span>56,800</span>
                      </p>
                    </div>
                    <div id="budget" style="min-height: 80px;"><div id="apexchartsn8z7jxlo" class="apexcharts-canvas apexchartsn8z7jxlo apexcharts-theme-light" style="width: 200px; height: 80px;"><svg id="SvgjsSvg1623" width="200" height="80" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1625" class="apexcharts-inner apexcharts-graphical" transform="translate(0, 0)"><defs id="SvgjsDefs1624"><clipPath id="gridRectMaskn8z7jxlo"><rect id="SvgjsRect1630" width="206" height="82" x="-3" y="-1" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="forecastMaskn8z7jxlo"></clipPath><clipPath id="nonForecastMaskn8z7jxlo"></clipPath><clipPath id="gridRectMarkerMaskn8z7jxlo"><rect id="SvgjsRect1631" width="204" height="84" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><line id="SvgjsLine1629" x1="0" y1="0" x2="0" y2="80" stroke="#b6b6b6" stroke-dasharray="3" stroke-linecap="butt" class="apexcharts-xcrosshairs" x="0" y="0" width="1" height="80" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line><g id="SvgjsG1637" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1638" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"></g></g><g id="SvgjsG1651" class="apexcharts-grid"><g id="SvgjsG1652" class="apexcharts-gridlines-horizontal" style="display: none;"><line id="SvgjsLine1654" x1="0" y1="0" x2="200" y2="0" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1655" x1="0" y1="13.333333333333334" x2="200" y2="13.333333333333334" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1656" x1="0" y1="26.666666666666668" x2="200" y2="26.666666666666668" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1657" x1="0" y1="40" x2="200" y2="40" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1658" x1="0" y1="53.333333333333336" x2="200" y2="53.333333333333336" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1659" x1="0" y1="66.66666666666667" x2="200" y2="66.66666666666667" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1660" x1="0" y1="80" x2="200" y2="80" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line></g><g id="SvgjsG1653" class="apexcharts-gridlines-vertical" style="display: none;"></g><line id="SvgjsLine1662" x1="0" y1="80" x2="200" y2="80" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line><line id="SvgjsLine1661" x1="0" y1="1" x2="0" y2="80" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line></g><g id="SvgjsG1632" class="apexcharts-line-series apexcharts-plot-series"><g id="SvgjsG1633" class="apexcharts-series" seriesName="seriesx1" data:longestSeries="true" rel="1" data:realIndex="0"><path id="SvgjsPath1636" d="M 0 38.66666666666667C 7 38.66666666666667 13 56 20 56C 27 56 33 28 40 28C 47 28 53 50.66666666666667 60 50.66666666666667C 67 50.66666666666667 73 40 80 40C 87 40 93 66.66666666666666 100 66.66666666666666C 107 66.66666666666666 113 14.666666666666671 120 14.666666666666671C 127 14.666666666666671 133 40 140 40C 147 40 153 41.33333333333333 160 41.33333333333333C 167 41.33333333333333 173 62.666666666666664 180 62.666666666666664C 187 62.666666666666664 193 37.33333333333333 200 37.33333333333333" fill="none" fill-opacity="1" stroke="rgba(99,102,241,0.85)" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-line" index="0" clip-path="url(#gridRectMaskn8z7jxlo)" pathTo="M 0 38.66666666666667C 7 38.66666666666667 13 56 20 56C 27 56 33 28 40 28C 47 28 53 50.66666666666667 60 50.66666666666667C 67 50.66666666666667 73 40 80 40C 87 40 93 66.66666666666666 100 66.66666666666666C 107 66.66666666666666 113 14.666666666666671 120 14.666666666666671C 127 14.666666666666671 133 40 140 40C 147 40 153 41.33333333333333 160 41.33333333333333C 167 41.33333333333333 173 62.666666666666664 180 62.666666666666664C 187 62.666666666666664 193 37.33333333333333 200 37.33333333333333" pathFrom="M -1 120L -1 120L 20 120L 40 120L 60 120L 80 120L 100 120L 120 120L 140 120L 160 120L 180 120L 200 120"></path><g id="SvgjsG1634" class="apexcharts-series-markers-wrap" data:realIndex="0"></g></g><g id="SvgjsG1635" class="apexcharts-datalabels" data:realIndex="0"></g></g><line id="SvgjsLine1663" x1="0" y1="0" x2="200" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1664" x1="0" y1="0" x2="200" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1665" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1666" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1667" class="apexcharts-point-annotations"></g></g><rect id="SvgjsRect1628" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe"></rect><g id="SvgjsG1650" class="apexcharts-yaxis" rel="0" transform="translate(-18, 0)"></g><g id="SvgjsG1626" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend" style="max-height: 40px;"></div></div></div>
                    <button class="btn btn-primary" type="button">Increase Budget</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-4">
            <div class="card h-100">
              <div class="card-header border-bottom-0 d-flex justify-content-between">
                <div>
                   <h6 class="fw-black mb-2">수주 금액</h6>
                  <small class="text-secondary">목표 : 1,000,000$</small>
                </div>
                <div class="dropdown">
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
                <h6 class="fw-black mb-2">이익</h6>
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
                  <span class="ms-auto text-success">+ ${buyClinetCount}</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                 <i class="fa-solid fa-money-bill-transfer"></i>
                  <div class="mx-2">
                    <h6 class="mb-0">수주처</h6>
                  </div>
                  <span class="ms-auto text-success">+ ${sellClientCount }</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                <i class="fa-solid fa-user"></i>
                  <div class="mx-2">
                    <h6 class="mb-0">사원</h6>
                  </div>
                  <span class="ms-auto text-success">+ ${memberCount }</span>
                </div>
                <div class="d-flex align-items-center mt-3">
                <i class="fa-solid fa-gift"></i>
                  <div class="mx-2">
                    <h6 class="mb-0">취급 품목</h6>
                  </div>
                  <span class="ms-auto text-success">+ ${itemCount }</span>
                </div>
              </div>
            </div>
          </div>
        </div>
<!-- Modal 코드 넣을 위치 -->



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


/* 두번쨰 도넛 */
$(function() {
	  var s = new DonutSlider('donut-slider', 30);
	  s.setValue(${order_Money/1000000000} * 0.9+0.02);
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
	      $('#' + elementId).find('.value').text(Math.round((1 - x) * 100)+"%");
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

	/* 목표 */
	
	
</script>
