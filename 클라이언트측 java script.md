# 요소 노드 취득 311p
+ 문서 트리에서 요소 노드를 추출하는 단계는 빠뜨릴 수 없다. '요소를 취득해 그 값을 꺼내기' , '처리한 결과를 요소에 반영하기',
'새로만든 요소를 어떤 요소 밑에 추가하기' 등이 있다. 

#노드 워킹

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>문서객체 모델</title>
</head>
<body>

 
    <form >
        <label for="foods">가장 먹고 싶은 음식은? :</label>
        <select id="food">
        
            <option value="라면">라면</option>
            <option value="만두">만두</option>
            <option value="불고기">불고기</option>
        
        </select>
        <input type="submit" value="송신" />
    </form>
    <script type = "text/javascript" src="dom.js"></script>   
</body>
</html>





let s = document.getElementById("food");    //select id=food 를 취득
let opts = s.childNodes;                    //<select> 요소 아래의 자식노드를 취득

for(let i=0,len = opts.length; i<len;i++){  //자식 노드를 순서대로 취득  
    let opt = opts.item(i);
    if(opt.nodeType === 1){                 //자식 노드가 요소 노드인 경우에만 그값을 로그 표시
        console.log(opt.value);
    }
}



요소 바로 아래의 자식 노드 군을 취득하는 것은 childNodes 프로퍼티의 역할이다

+ nodeType
1 요소노드               6 처리 명령 노드
2 속성노드               7 주석 노드
3 덱트스 노드            8 문서 노드 
4 CDATA 섹션             9 문서형 선언 노드
5 실제 참조 노드         10 기법 선언 노드


+ querySelector 메소드의 반환값은 조건에 맞는 요소를 모두 포함한 NodeList 객체이다. 처음부터 취득해야 할 요소가 하나라고 
알고있는경우나 요소 그룹의 맨처음의 하나만 취득하고 싶은 경우에는 querySelector 메소드를 이용한다. 이경우 반환값은 Element객체가된다.

+  특정 id 값. class 속성 등으로 요소를 검색할 경우 getXXXX메소드
+ 보다 복잡한 검색 조건으로 검색할 경우 queryXXXX 메소드 


