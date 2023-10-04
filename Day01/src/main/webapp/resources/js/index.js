// 추가한 함수
// 주민번호 앞자리 6자 다입력하면 바로 뒷자리입력하게 커서변경됨
function moveNext(obj, length, nextObj) {
	if (obj.value.length == length) {
		nextObj.focus();
	}
}

function formCheck(obj) {
	if (obj.rn1.value.trim().length !== 6) {
		alert('주민등록번호 앞자리는 6자리');
		obj.rn1.value = "";
		obj.rn1.focus();
		return false;
	}
	// NaN = Not a Number, Number()는 인수를 숫자로변경
	if (isNaN(Number(obj.rn1.value))) {
		alert('주민등록번호 앞자리는 숫자만 입력');
		obj.rn1.value = "";
		obj.rn1.focus();
		return false;
	}
	if (obj.rn2.value.trim().length !== 7) {
		alert('주민등록번호 뒷자리는 7자리');
		obj.rn2.value = "";
		obj.rn2.focus();
		return false;
	}
	if (isNaN(Number(obj.rn2.value))) {
		alert('주민번호 뒷자리는 숫자만 입력');
		obj.rn2.value = "";
		obj.rn2.focus();
		return false;
	}
	
	// 주민번호 유효성검사
	rnCheck = obj.rn1.value.trim() + obj.rn2.value.trim();
	sum = 0;
	for (i = 0; i < 12; i++) {
		sum += rnCheck.charAt(i) * (i < 8 ? i + 2 : i - 6);
	}
	result = (11 - sum % 11);
	if (result != rnCheck.charAt(12)) {
		alert("주민등록 번호가 올바르지 않습니다");
		obj.rn2.value = "";
		obj.rn2.focus();
		return false;
	}
	return true;
}

function checkPw() {
	var pw = document.getElementById('registPW').value;
	if (pw.length < 4) {
		window.alert('비밀번호는 4자이상으로 작성해주세요');
		document.getElementById('registPW').value = '';
	}
	if (pw != '' && document.getElementById('checkPW').value != '') {
		if (pw == document.getElementById('checkPW').value) {
			window.alert('비밀번호 일치');
		} else {
			window.alert('비밀번호 불일치');
			document.getElementById('checkPW').value = '';
		}
	}
}

// 랜덤메뉴 생성
// 소주
function sojuRandomFood() {
	$("#randomFoodList").fadeToggle();
	
	// 소주안주 목록 작성, 추가
	var sulFoodList = [
	"김치찌개",
	"김치전",
	"김치",
	"치킨",
	"파스타",
	"닭발",
	"곱창",
	"화채"
	];
	
	let randomThree = [];
	for(var i = 0; i < 3; i++) {
		let n = Math.floor(Math.random() * sulFoodList.length);
		if (! sameNum(n)) {
      		randomThree.push(n);
    	} else {
      		i--;
    	}
  	}
  	
	function sameNum (n) {
		return randomThree.find((e) => (e === n));
	}
	
	const sulFood1 = sulFoodList[randomThree[0]];
	const sulFood2 = sulFoodList[randomThree[1]];
	const sulFood3 = sulFoodList[randomThree[2]];
	const html = '<div style="color:black; font-weight:bold;"/>';
	const foodBtnElement1 = document.getElementById("showFood1");
	foodBtnElement1.innerHTML = html + sulFood1;
	const foodBtnElement2 = document.getElementById("showFood2");
	foodBtnElement2.innerHTML = html + sulFood2;
	const foodBtnElement3 = document.getElementById("showFood3");
	foodBtnElement3.innerHTML = html + sulFood3;
	
}

// 맥주
function beerRandomFood() {
	$("#randomFoodList").fadeToggle();
	
	// 맥주안주 목록 작성, 추가
	var sulFoodList = [
	"견과류",
	"김치전",
	"튀김",
	"치킨",
	"과자",
	"닭발",
	"곱창",
	];
	
	let randomThree = [];
	for(var i = 0; i < 3; i++) {
		let n = Math.floor(Math.random() * sulFoodList.length);
		if (! sameNum(n)) {
      		randomThree.push(n);
    	} else {
      		i--;
    	}
  	}
  	
	function sameNum (n) {
		return randomThree.find((e) => (e === n));
	}
	
	const sulFood1 = sulFoodList[randomThree[0]];
	const sulFood2 = sulFoodList[randomThree[1]];
	const sulFood3 = sulFoodList[randomThree[2]];
	const html = '<div style="color:black; font-weight:bold;"/>';
	const foodBtnElement1 = document.getElementById("showFood1");
	foodBtnElement1.innerHTML = html + sulFood1;
	const foodBtnElement2 = document.getElementById("showFood2");
	foodBtnElement2.innerHTML = html + sulFood2;
	const foodBtnElement3 = document.getElementById("showFood3");
	foodBtnElement3.innerHTML = html + sulFood3;
	
}

// 와인
function wineRandomFood() {
	$("#randomFoodList").fadeToggle();
	
	// 와인안주 목록 작성, 추가
	var sulFoodList = [
	"파스타",
	"김치전",
	"튀김",
	"치킨",
	"과자",
	"닭발",
	"곱창",
	];
	
	let randomThree = [];
	for(var i = 0; i < 3; i++) {
		let n = Math.floor(Math.random() * sulFoodList.length);
		if (! sameNum(n)) {
      		randomThree.push(n);
    	} else {
      		i--;
    	}
  	}
  	
	function sameNum (n) {
		return randomThree.find((e) => (e === n));
	}
	
	const sulFood1 = sulFoodList[randomThree[0]];
	const sulFood2 = sulFoodList[randomThree[1]];
	const sulFood3 = sulFoodList[randomThree[2]];
	const html = '<div style="color:black; font-weight:bold;"/>';
	const foodBtnElement1 = document.getElementById("showFood1");
	foodBtnElement1.innerHTML = html + sulFood1;
	const foodBtnElement2 = document.getElementById("showFood2");
	foodBtnElement2.innerHTML = html + sulFood2;
	const foodBtnElement3 = document.getElementById("showFood3");
	foodBtnElement3.innerHTML = html + sulFood3;
	
}

// 보드카
function vodkaRandomFood() {
	$("#randomFoodList").fadeToggle();
	
	// 보드카안주 목록 작성, 추가
	var sulFoodList = [
	"파스타",
	"김치전",
	"튀김",
	"치킨",
	"과자",
	"닭발",
	"곱창",
	];
	
	let randomThree = [];
	for(var i = 0; i < 3; i++) {
		let n = Math.floor(Math.random() * sulFoodList.length);
		if (! sameNum(n)) {
      		randomThree.push(n);
    	} else {
      		i--;
    	}
  	}
  	
	function sameNum (n) {
		return randomThree.find((e) => (e === n));
	}
	
	const sulFood1 = sulFoodList[randomThree[0]];
	const sulFood2 = sulFoodList[randomThree[1]];
	const sulFood3 = sulFoodList[randomThree[2]];
	const html = '<div style="color:black; font-weight:bold;"/>';
	const foodBtnElement1 = document.getElementById("showFood1");
	foodBtnElement1.innerHTML = html + sulFood1;
	const foodBtnElement2 = document.getElementById("showFood2");
	foodBtnElement2.innerHTML = html + sulFood2;
	const foodBtnElement3 = document.getElementById("showFood3");
	foodBtnElement3.innerHTML = html + sulFood3;
	
}

// 위스키
function whiskeyRandomFood() {
	$("#randomFoodList").fadeToggle();
	
	// 위스키안주 목록 작성, 추가
	var sulFoodList = [
	"견과류",
	"김치전",
	"튀김",
	"치킨",
	"과자",
	"닭발",
	"곱창",
	];
	
	let randomThree = [];
	for(var i = 0; i < 3; i++) {
		let n = Math.floor(Math.random() * sulFoodList.length);
		if (! sameNum(n)) {
      		randomThree.push(n);
    	} else {
      		i--;
    	}
  	}
  	
	function sameNum (n) {
		return randomThree.find((e) => (e === n));
	}
	
	const sulFood1 = sulFoodList[randomThree[0]];
	const sulFood2 = sulFoodList[randomThree[1]];
	const sulFood3 = sulFoodList[randomThree[2]];
	const html = '<div style="color:black; font-weight:bold;"/>';
	const foodBtnElement1 = document.getElementById("showFood1");
	foodBtnElement1.innerHTML = html + sulFood1;
	const foodBtnElement2 = document.getElementById("showFood2");
	foodBtnElement2.innerHTML = html + sulFood2;
	const foodBtnElement3 = document.getElementById("showFood3");
	foodBtnElement3.innerHTML = html + sulFood3;
	
}

// 메뉴 숨기기
function hideMenu() {
	document.querySelector('#randomFoodList').style.display = "none";
}
