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

