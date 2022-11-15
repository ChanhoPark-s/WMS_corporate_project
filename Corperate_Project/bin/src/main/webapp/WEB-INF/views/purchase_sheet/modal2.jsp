<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- JS -->
	<script type="text/javascript">
	$(document).ready(function(){
		$("#addPurchase").on("click",function(){
			$(".modal-title").text("발주서등록");
			$(".form1").text("납기일자");
			$(".form2").text("거래처");
			$(".form3").text("담당자");
			
			
		});
	});
	
	</script>
    
    
<div class="modal fade" id="addUserModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
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
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                <button type="submit" form="taskForm" class="btn btn-primary px-5">등록</button>
              </div>
            </div>
          </div>
        </div>