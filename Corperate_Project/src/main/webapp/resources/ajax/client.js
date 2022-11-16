console.log("Reply Module........");
 
// 모듈패턴(관련 있는 함수들을 하나의 모듈처럼 묶음으로 구성하는 방식)으로 ajax 관련 코드를 파일을 분리하여 작성
var replyService = (function(){
 
 	// javascript 에서는 함수정의할 때 매개변수를 3개 받는다고 했더라도, 왼쪽 순으로 채워서 호출하면 인자가 1개든 2개든 모두 가능하다는 점을 알자.
 	function getList(param, callback, error){
 	
 		var bno = param.bno;
 		var page = param.page || 1; // param.page 값이 null 이라면 디폴트로 1
 		
 		// 요청 url 맨 뒤에 .json 이 붙었다는 점에 주목.
 		$.getJSON("/replies/pages/" + page + ".json", 
 			function(data){
 				//alert(typeof(data)); object
 				if(callback){		// callback 파라미터가 undifined가 아니라면(함수 호출시 넘겨받은 인자에 callback 함수가 담겨있었다면)
 					//callback(data);	// 댓글 목록만 가져오는 경우
 					callback(data.replyCnt, data.list); // 총 댓글 수와 댓글목록을 가져오는 경우 
 				}
 			}).fail(function(xhr, status, err){
 					if(error){		// callback 파라미터가 undifined가 아니라면(함수 호출시 넘겨받은 인자에 error 처리 함수가 담겨있었다면)
 						error();
 					}
 				});
 	}// getList 함수 끝

 	
	return { // 각각의 이름으로 함수가 담긴 객체를 반환한다.
		getList : getList
	}; // replyService 객체 내부에 add 라는 메서드, getList라는 메서드가 존재하는 형태로 보여지게 됨

})(); // 마지막에 함수를 호출함으로써 함수 묶음 객체를 반환함