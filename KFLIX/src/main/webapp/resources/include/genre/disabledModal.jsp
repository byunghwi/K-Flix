<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal" tabindex="-1" id="recoverymodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title text-light">활성화</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	       <div class="modal-body">
	        <p>활성화 하시겠습니까?</p>
	      </div>
          <div class="modal-footer">
	          	<input type="hidden" id="recoveryid" name="genre_id"/>
		        <button onclick="recoveryBtn(1);" class="btn btn-warning" >활성화</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	     </div>
      </div>
    </div>
  </div>
  
<div class="modal" tabindex="-1" id="recoveryconfrim">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-warning">
        <h5 class="modal-title text-light">활성화</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
	      활성화되었습니다.
	  </div>     
	   
      <div class="modal-footer">
       	<button type="button" class="btn btn-warning" data-bs-dismiss="modal">확인</button>
       </div>    
    </div>
  </div>
</div>
