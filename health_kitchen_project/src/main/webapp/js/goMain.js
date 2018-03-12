/**
 * 
 */

/*
 * path : 전송 URL
 * params : 전송 데이터 {'q':'a','s':'b','c':'d'...}으로 묶어서 배열 입력
 * method : 전송 방식(생략가능)
 */
  function post_to_url(path, params, method) {
    method = method || "post"; // Set method to post by default, if not specified.
    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}  
// 예시
// <script src="<c:url value='/js/goMain.js'/>" charset="utf-8"></script>  <- 자바스크립트를 포함시킨다.
// $('#goMain').on("click",function(event){ goMain 아이디를 클릭했을 때,
//	event.preventDefault();  // 디폴트 이벤트를 정지시키고
//	post_to_url("${conPath}/homewithLogin.do",{"mid":$(".basket_mid").first().text()}); 
// });  1번째 변수 : 가고자하는 do를 표기해줌 .
//      2번째 변수 : ?뒤에 붙일거 {} 형식으로 -> {"mid" : jsp에서 선택 , "second 변수" : jsp에서 선택}
//      3번째 변수 : "post" -> method를 지정해서 보내주면 post 방식으로 바로 보낼 수 있다.
//