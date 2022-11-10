<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- JS -->
	<script type="text/javascript">
	$(document).ready(function(){
		$(".insert").on("click",function(){
			$(".modal-title").text("발주서등록");
			$(".form1").text("납기일자");
			$(".form2").text("담당자");
			$(".form3").text("거래처");
		});
		
		$(".update").on("click",function(){
			$(".modal-title").text("발주서수정");
			$(".form1").text("납기일자");
			$(".form2").text("담당자");
			$(".form3").text("거래처");
		});
		
		
	});
	
	</script>
    
<!--모달1-->
<div class="modal fade" id="addUserModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content" style="width: 1000px">
              <div class="modal-header border-0">
                <h5 class="modal-title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="taskForm">
                  <div class="mb-3">
                    <label for="form1" class="form1">1번폼</label>
                    <input type="text" name="form1" class="form-control" id="form1" required autofocus>
                    <div class="invalid-feedback">1</div>
                  </div>
                  <div class="mb-3">
                    <label for="form2" class="form2">2번폼</label>
                    <input type="email" name="form2" class="form-control" id="form2" required>
                    <div class="invalid-feedback">2</div>
                  </div>
                  <div class="mb-3">
                    <label for="form3" class="form3">3번폼</label>
                    <input type="email" name="form3" class="form-control" id="form3" required>
                    <div class="invalid-feedback">3</div>
                  </div>
                  <!-- 새로운페이지  -->
                  <div class="card">
          <div class="card-body">
            <div class="d-flex gap-1 mb-4 flex-wrap">
              <div class="d-flex gap-1 me-auto flex-wrap ">
                <form>
                
              	</form>
              </div>
              <button class="btn btn-primary d-inline-flex align-items-center gap-1 " data-bs-toggle="modal" data-bs-target="#addUserModal" id="">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd" />
                  </svg>
                  품목추가
                </button>
                <button class="btn btn-light d-inline-flex align-items-center gap-1">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM6.293 6.707a1 1 0 010-1.414l3-3a1 1 0 011.414 0l3 3a1 1 0 01-1.414 1.414L11 5.414V13a1 1 0 11-2 0V5.414L7.707 6.707a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                  </svg>
                  인쇄
                </button>
                <div class="dropdown">
                  <button class="btn btn-light d-inline-flex align-items-center gap-1 dropdown-toggle no-caret" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                      <path fill-rule="evenodd" d="M3 3a1 1 0 011-1h12a1 1 0 011 1v3a1 1 0 01-.293.707L12 11.414V15a1 1 0 01-.293.707l-2 2A1 1 0 018 17v-5.586L3.293 6.707A1 1 0 013 6V3z" clip-rule="evenodd" />
                    </svg>
                    삭제
                  </button>
                  <form class="dropdown-menu p-3" style="min-width: 250px">
                    <h6 class="dropdown-header p-0">Filter options</h6>
                    <hr>
                    <div class="vstack gap-3">
                      <div>
                        <label class="form-label">Role:</label>
                        <select class="dselect form-select" data-dselect-clearable="true">
                          <option value="">Choose role</option>
                          <option value="administrator">Administrator</option>
                          <option value="analyst">Analyst</option>
                          <option value="developer">Developer</option>
                          <option value="support">Support</option>
                          <option value="trial">Trial</option>
                        </select>
                      </div>
                      <div>
                        <label class="form-label">Two Step Verification:</label>
                        <select class="dselect form-select" data-dselect-clearable="true">
                          <option value="">Select option</option>
                          <option value="enabled">Enabled</option>
                          <option value="disabled">Disabled</option>
                        </select>
                      </div>
                      <button class="btn btn-primary" type="button">Apply</button>
                    </div>
                  </form>
                </div>
            </div>
            <div class="table-responsive my-1">
              <table class="table align-middle">
                <thead>
                  <tr>
                    <th scope="col">
                      <div>
                        <input class="form-check-input" type="checkbox" value="">
                      </div>
                    </th>
                    <th scope="col">거래처</th>
                    <th scope="col">품목코드</th>
                    <th scope="col" nowrap>품목명</th>
                    <th scope="col">입고단가</th>
                    <th scope="col">출고단가</th>
                    <th scope="col">이미지</th>
                    <th scope="col">기능</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <div>
                        <input class="form-check-input" type="checkbox" value="">
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                          <h6>Cody Fisher</h6>
                        </div>
                      </div>
                    </td>
                    <td>Administrator</td>
                    <td><span class="badge bg-light text-muted">Yesterday</span></td>
                    <td nowrap>ㅂ1ㅁㅁㅁㅁㅁㅁㅁㅁ</td>
                    <td nowrap>ㅂ2ㅁㅁㅁㅁㅁㅁㅁㅁ</td>
                    <td nowrap>10 Mar 2021</td>
                    <td>
                      <div class="btn-group btn-group-sm" role="group">
                        <button type="button" class="btn btn-light d-flex text-danger"><svg width="17" height="17" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg></button>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <nav aria-label="Page navigation borderless example">
              <ul class="pagination pagination-borderless justify-content-end">
                <li class="page-item disabled">
                  <a class="page-link d-flex align-items-center px-2" href="#" tabindex="-1" aria-disabled="true" aria-label="Previous">
                    <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                    </svg>
                  </a>
                </li>
                <li class="page-item active" aria-current="page">
                  <a class="page-link" href="javascript:void(0)">1</a>
                </li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                <li class="page-item">
                  <a class="page-link d-flex align-items-center px-2" href="javascript:void(0)" aria-label="Next">
                    <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                    </svg>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                <button type="submit" form="taskForm" class="btn btn-primary px-5">등록</button>
              </div>
            </div>
          </div>
        </div>