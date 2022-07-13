function joinCheck(){
    if(document.frm.custname.value.trim() == ""){
        alert("회원성명이 입력되지 않았습니다.");
        frm.custname.focus();
        return false;
    }

    if(document.frm.phone.value.trim() == ""){
        alert("전화번호가 입력되지 않았습니다.");
        frm.phone.focus();
        return false;
    }

    if(document.frm.address.value.trim() == ""){
        alert("주소가 입력되지 않았습니다.");
        frm.address.focus();
        return false;
    }

    if(document.frm.grade.value.trim() == ""){
        alert("고객등급이 입력되지 않았습니다.");
        frm.grade.focus();
        return false;
    }

    if(document.frm.city.value.trim() == ""){
        alert("도시코드가 입력되지 않았습니다.");
        frm.city.focus();
        return false;
    }

    success();
    return true;
}

function success(){
    alert("회원 등록이 완료되었습니다.");
}

function modify(){
	alert("회원정보수정이 완료되었습니다.");
}

function search(){
	window.location = "list.jsp";
}