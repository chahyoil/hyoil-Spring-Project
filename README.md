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
+ controller
  + HomecontrollerH 부분을 전부 담당했음.
   + @Autowired : 특정 서비스를 컨트롤러에서 쓸 수 있게 하는 역할
   + @RequestMapping : Jsp에서 Spring으로 넘어갈 때, mapping 해주는 역할
   + Model : Spring에서 작업을 완료하고 JSP로 넘겨줄 때, 작업완료한 특정 값을 가지고 가게 함
   + HttpSession : 특정 웹사이트에 접속했을 때, 해당 값을 다음 페이지 뿐만 아니라, 모든 페이지에서 항상 가지고 있게 함.
   + 프로젝트에서 내가 맡은 부분은 회원관리(로그인,회원가입,탈퇴), 관리자 회원관리(블락처리, 유저 등급향상, 물품 관리(물품 수정, 삭제, 추가)
   + 장바구니 삭제, 추가, 개수 변경, 리스트 구현, 구매 리스트, 추가, 구매 확정 등을 하였습니다.
