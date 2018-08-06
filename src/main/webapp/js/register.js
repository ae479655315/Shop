function check() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var repassword = document.getElementById("repassword").value;
    var name = document.getElementById("name").value;
    var phone = document.getElementById("phone").value;
    var email = document.getElementById("email").value;
    var addr = document.getElementById("addr").value;

    if(username==""){
        document.getElementById("msg").setAttribute("class","cuo");
        document.getElementById("msg").innerHTML = "<font color='red'>用户名不能为空</font>";
        return false;
    }else{
        document.getElementById("msg").setAttribute("class","dui");
        return true;
    }

    if(password==""){
        document.getElementById("msg2").setAttribute("class","cuo");
        document.getElementById("msg2").innerHTML = "<font color='red'>密码不能为空</font>";
        return false;
    }else{
        document.getElementById("msg").setAttribute("class","dui");
        return true;
    }

    if(repassword==""){
        document.getElementById("msg3").setAttribute("class","cuo");
        document.getElementById("msg3").innerHTML = "<font color='red'>确认密码不能为空</font>";
        return false;
    }else{
        document.getElementById("msg").setAttribute("class","dui");
        return true;
    }

    if(name==""){
        document.getElementById("msg4").setAttribute("class","cuo");
        document.getElementById("msg4").innerHTML = "<font color='red'>姓名不能为空</font>";
        return false;
    }else{
        document.getElementById("msg").setAttribute("class","dui");
        return true;
    }

    if(phone==""){
        document.getElementById("msg5").setAttribute("class","cuo");
        document.getElementById("msg5").innerHTML = "<font color='red'>手机号不能为空</font>";
        return false;
    }else{
        document.getElementById("msg").setAttribute("class","dui");
        return true;
    }

    if(email==""){
        document.getElementById("msg6").setAttribute("class","cuo");
        document.getElementById("msg6").innerHTML = "<font color='red'>邮箱不能为空</font>";
        return false;
    }else{
        document.getElementById("msg").setAttribute("class","dui");
        return true;
    }

    if(addr==""){
        document.getElementById("msg7").setAttribute("class","cuo");
        document.getElementById("msg7").innerHTML = "<font color='red'>居住地不能为空</font>";
        return false;
    }else{
        document.getElementById("msg").setAttribute("class","dui");
        return true;
    }

}