
https://victorydntmd.tistory.com/24  express 파일별 기능
https://devriver.tistory.com/45     에러 

클라이언트란 서버에게 서비스를 요구하는 사용자나 컴퓨터이다.

서버란 서버프로그램이 실행되고 있는 하드웨어이다./ 사용자의 요청에 의하여 서비스를 수행하고 네트워크를 관리,제어,감시하며 파일이나 프로그램
혹은 하드웨어 자원을 공유할 수 있도록 서비스한다.

일반적으로 네트워크 서비스를 받기 위하여 클라이언트가 통신을 시작한다. 클라이언트는 서버에 접속을 시도하고 그 연결 결과를 기다리든지
어떤 서비스를 요구하고 응답을 기다린다. 클아이언트의 이와 같은 요구에 대하여 서버가 응답을 보내는 방식으로 동작이 이루어진다.

네트워크와 서버 사이의 네트워크 연결은 전송계층의 포트 연결로 구현된다.

ajax(polling)
polling 방식은 클라이언트가 서버에 주기적으로 요청 후 응답을 받는 방식이다.
쓸모없는 요청과 응답때문에 많은 트래픽이 낭비되며 다음 폴링이 이루어지기 전까지 어떤 이벤트가 왔는지 모르기 때문에 실시간성이
보장되지 않는다.
실시간 메시지 전달이 크게 중요하지 않은 서비스에 적합한 방식이다.

ajax(long poll)
long poll방식은 polling 방식의 단점인 반복적인 요청으로 응답을 받는 형태에서 client가 서버에 대한 요청을 유지하여 반복적인
요청을 없애고 유효한 이벤트가 발생하면 응답을 해주는 방식이다. 즉 long 이라는 이름과 같이 오래 접속을 유지하는 것 응답을 기다리다가
응답이 오면 데이터를 처리함과 동시에 새로운 접속을 생성한다.

websocket 방식
이러한 불편점들을 개선하기 위해 만들어진 html5 표준 기술로, client와 서버가 연결이 된 후부터 http 요청/응답과는 상관없이 서버와
양방향 통신이 가능하다.

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

websocket 
사용자의 브라우저와 서버사이의 동적인 양방향 연결 채널을 구성한다. websocket api를 통해 서버로 메세지를 보내고 요청없이 응답을 
받아오는것이 가능하다. http 와같은 80번 포트를 사용한다.
단점: 오래된 버전의 웹 브라우저는 웹소켓을 지원하지 않는다.

단점해결을 위해 나온기술이 socket.io 이다.  
웹페이지가 열리는 브라우저가 웹소켓을 지원하면 웹소켓 방식으로 동작하고, 지원하지 않는 브라우저라면 일반 http를 이용해서 실시간 통신을 
흉내내는 것이다.
node.js 기반으로 만들어진 기술로 거의 모든 웹브라우저와 모바일 장치를 지원하는 실시간 웹 애플리케이션지원 라이브러리이다..

ajax 와 차이점: ajax의 경우 웹브라우저에서 데이터를 호출하면 웹 서버에서 호출된 값을 검색, 작성해서 웹 브라우저로 메세지를 보내는 형식의
구조라면 웹 소켓의 경우는 웹브라우저에서 호출해서 데이터를 가져가는 기능 포함, 반대로 서버에서 클라이언트로 호출할 수 있는 기능까지있다.


//이벤트 주고받기
  fs file system으로 node.js 환경에서 파일시스템에 접근, 사용할수 있게 해주는 npm이다
  
  
  var fs = require('fs');

fs.readFile('example.txt', 'utf-8', (err, result) => {
  if(err) throw err;
  console.log(result);
});
  
  
  첫번째 매개변수 : 읽어올파일
  두번째 매개변수 : 인코딩 방식
  세번째 매개변수 : 콜백함수
  
  fs 모듈에는 open(),close(),write(),read() 메소드등이 있다 
  
  
  
  connection - socket.io 의 기본 이벤트 - 사용자가 웹사이트를 열면 자동적으로 발생하는 이벤트이다.
   
  socket.emit 은 event를 발생시키는 함수이다. 서버쪽에서 이벤트를 발생시키면 클라이언트 페이지의 해당 이벤트 리스너에서 처리되게 된다.
  
  socket.emit을 이용하면 해당 socket을 통해 상대편으로 전달하고, io.emit 을 이용하면 서버가 현재 접속해있는 모든 클라이언트에게 이벤트를 전달한다.
  

var socket = io.connect('서버 주소');
socket.on('서버에서 받을 이벤트명', function(데이터) {
  // 받은 데이터 처리
  socket.emit('서버로 보낼 이벤트명', 데이터);
});


