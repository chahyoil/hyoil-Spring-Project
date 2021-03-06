# hyoil-Spring-Project
저의 첫 번째 팀 프로젝트. 스프링으로 개발 했습니다.
## 개발환경은 다음과 같습니다.
---------------------------------------
![개발환경](./img/01.JPG)
---------------------------------------
## 업무분담은 다음과 같이 했습니다.
![업무분담](./img/02.JPG)
---------------------------------------
## DB의 설계도는 다음과 같습니다.
![DB설계](./img/03.JPG)
---------------------------------------

+ Controller
  + HomecontrollerH 부분을 전부 담당했음.
    - @Autowired : 특정 서비스를 컨트롤러에서 쓸 수 있게 하는 역할
    
    - @RequestMapping : Jsp에서 Spring으로 넘어갈 때, mapping 해주는 역할
    
    - Model : Spring에서 작업을 완료하고 JSP로 넘겨줄 때, 작업완료한 특정 값을 가지고 가게 함
    
    - HttpSession : 특정 웹사이트에 접속했을 때, 해당 값을 다음 페이지 뿐만 아니라, 모든 페이지에서 항상 가지고 있게 함.
    
    - 프로젝트에서 내가 맡은 부분은 회원관리(로그인,회원가입,탈퇴), 관리자 회원관리(블락처리, 유저 등급향상, 물품 관리(물품 수정, 삭제, 추가)
    
    - 장바구니 삭제, 추가, 개수 변경, 리스트 구현, 구매 리스트, 추가, 구매 확정 등을 하였습니다.


+ Service
  + AdminService 부분의 일정량
    - interface : 인터페이스를 사용하면서 implements를 해서 Service구현 단계에서는 @Override를 했음.
  
  + MemberService 부분의 일정량
  
  + ProductService 부분의 일정량
    - multipartRequest를 사용해서 이미지 파일도 추가 및 변경할 수 있도록 만들었음

+ Model
  
  + Dao와 sqlMapper 등에서 사용할 모델들을 만들어서 getter와 setter, 생성자 등으로 가지고올 수 있게 함.
    

+ Dao
  
  + Service 부분과 같은 부분을 맡음.
    
    - SqlSessionTemplate 을 사용해서, model과 sql이 서로 연결될 수 있게 만들었다.
    
    - 물품 장바구니, 구매로직에서 product 테이블과 연관있는 부분... 
    
    - 제품 재고변경, 사용자 총 구매액 변경, 상품 구매완료 update, 일정구매 이상시 회원 등급변경 등 다양한 기능을 넣었음.
    
------------------------------------------------------

+ resources
  + 이 폴더에는 db, property, sqlmap에 해당하는 것들을 넣음
  
+ javaScript 와 jquery
  + js폴더를 따로 만들어서 관리.
  + jquery에서 다양한 선택자를 이용했고, ajax 통신 방식을 적극적으로 활용함
    + closest, find, $("#id"), $(".class"), $(...).forEach( function(index, value){ } ), $(...).on("click", function(){ }
    
    + 등 다양한 함수와 jquery, javascript function을 활용했습니다.
+ jsp
  
  + jstl을 활용해서 페이지를 만들었음.
