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
	
	return true;
}

function loginEmptyCheck(obj) {
	var inputId = document.getElementById('userId').value;
	if (inputId < 1) {
		alert('아이디를 입력하지 않았습니다');
		obj.userId.focus();
		return false;
	}
	
	if (obj.userPw.value.trim().length < 1) {
		alert('비밀번호를 입력하지 않았습니다');
		obj.userPw.focus();
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