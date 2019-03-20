window.onload = function(){
    var username = document.getElementById("username");
    var password = document.getElementById("password");
    var repassword = document.getElementById("repassword");
    var name = document.getElementById("name");
    var phone = document.getElementById("phone");
    var email = document.getElementById("email");
    var addr = document.getElementById("addr");
    var yzm = document.getElementById("yzm");
    var sb = document.getElementById("sb");
    username.onblur = function(){

        if(username.value ==""){
            document.getElementById("msg1").setAttribute("class","cuo");
            document.getElementById("msg1").innerHTML = "<font color='red'>用户名不能为空</font>";
            flag = false;
        }else{
            document.getElementById("msg1").setAttribute("class","dui");
            document.getElementById("msg1").innerHTML = "";
            flag = true;
        }
    }


    password.onblur = function(){

        if(password.value == ""){
            document.getElementById("msg2").setAttribute("class","cuo");
            document.getElementById("msg2").innerHTML = "<font color='red'>\密码不能为空</font>";
            flag = false;
        }else{
            document.getElementById("msg2").setAttribute("class","dui");
            document.getElementById("msg2").innerHTML = "";
        }
    }

    repassword.onblur = function(){

        if(repassword.value ==""){
            document.getElementById("msg3").setAttribute("class","cuo");
            document.getElementById("msg3").innerHTML = "<font color='red'>确认密码不能为空</font>";
            flag = false;
        }else{
            document.getElementById("msg3").setAttribute("class","dui");
            document.getElementById("msg3").innerHTML = "";
        }

        if(repassword.value != password.value){
            document.getElementById("msg3").setAttribute("class","cuo");
            document.getElementById("msg3").innerHTML = "<font color='red'>两次密码输入不一致</font>";

        }else{
            document.getElementById("msg3").setAttribute("class","dui");
            document.getElementById("msg3").innerHTML = "";
        }

    }

    name.onblur = function(){

        if(name.value ==""){
            document.getElementById("msg4").setAttribute("class","cuo");
            document.getElementById("msg4").innerHTML = "<font color='red'>姓名不能为空</font>";

        }else{
            document.getElementById("msg4").setAttribute("class","dui");
            document.getElementById("msg4").innerHTML = "";
        }
    }


    phone.onblur = function(){

        if(phone.value ==""){
            document.getElementById("msg5").setAttribute("class","cuo");
            document.getElementById("msg5").innerHTML = "<font color='red'>手机号不能为空</font>";

        }else{
            document.getElementById("msg5").setAttribute("class","dui");
            document.getElementById("msg5").innerHTML = "";
        }
    }


    email.onblur = function(){

        if(email.value ==""){
            document.getElementById("msg6").setAttribute("class","cuo");
            document.getElementById("msg6").innerHTML = "<font color='red'>邮箱不能为空</font>";

        }else{
            document.getElementById("msg6").setAttribute("class","dui");
            document.getElementById("msg6").innerHTML = "";
        }

    }


    addr.onblur = function(){

        if(addr.value ==""){
            document.getElementById("msg7").setAttribute("class","cuo");
            document.getElementById("msg7").innerHTML = "<font color='red'>居住地不能为空</font>";

        }else{
            document.getElementById("msg7").setAttribute("class","dui");
            document.getElementById("msg7").innerHTML = "";
        }

    }


    yzm.onblur = function(){

        if(yzm.value ==""){
            document.getElementById("msg8").setAttribute("class","cuo");
            document.getElementById("msg8").innerHTML = "<font color='red'>验证码不能为空</font>";

        }else{
            document.getElementById("msg8").setAttribute("class","");
            document.getElementById("msg8").innerHTML = "";
        }
    }


}

function check () {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var repassword = document.getElementById("repassword").value;
    var name = document.getElementById("name").value;
    var phone = document.getElementById("phone").value;
    var email = document.getElementById("email").value;
    var addr = document.getElementById("addr").value;
    var yzm = document.getElementById("yzm").value;

    //检查是否有未填信息
    if(username=="" ||password==""||repassword==""||name==""||phone==""||email==""||addr==""||yzm=="" ){
        alert("请检查信息后提交！");
        return false;
    }

    //检查提示未填信息后是否补填信息
    var msg;
    for(var i=1;i<=8;i++){
        msg =  document.getElementById("msg"+i);
        var res = msg.attributes["class"].value;
        if(res == "cuo"){
            alert("请检查信息后提交！");
            return false;
        }
    }

    //检查验证码
    var flag = true;
    var req = xmlHttpRequest();
    //2.处理响应结果 设置回调函数
    req.onreadystatechange = function(){
        if(req.status == 200 && req.readyState == 4){
            var data = req.responseText;
            if(data == "ok"){
                //成功
                return true;
            }else{
                alert("验证码错误,请重新填写！");
                return false;
            }
        }
    };
    //3.建立连接
    req.open("get","../yzm/getThisyzm.do?windowYzm="+yzm);
    //4.发送请求
    req.send(null);


}

function xmlHttpRequest()
{
    xmlhttp=null;
    if (window.XMLHttpRequest)
    {// code for all new browsers
        xmlhttp=new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {// code for IE5 and IE6
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}
