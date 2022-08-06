<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn" >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
    <script src="/static/js/layer/layer.js"></script>

</head>
<body>
<div class="bg"></div>
<div class="container">

    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form action="/login/login" method="post">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top"><h1>户籍管理中心</h1></div>
                    <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="userName"  placeholder="登录账号" data-validate="required:请填写账号" />
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" name="passWord" placeholder="登录密码" data-validate="required:请填写密码" />
                                <span class="icon icon-key margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field">
                                <input type="text" class="input input-big" id="YZ" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                                <img src="/verification" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="changeCode(this.src=this.src+'?')">
<%--                                <img src="/static/images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">--%>
                                <input type="hidden" id="code" name="code"  value='${massage}'>
                            </div>
                        </div>
                    </div>
                    <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big"  value="登录" id="login" onclick="yz()"></div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>

<script type="text/javascript">

    function changeCode(src){
        $('.passcode').attr("src",src);
        // var src = " getVerifyCode?"+new Date().getTime(); //加时间戳，防止浏览器利用缓存
        <%--//data-validate="${code}!=${"#YZ"}:验证码错误"--%>
        // $('.verifyCode').attr("src",src);                  //jQuery写法

    }
    function yz(){
        var code =  $("#code").val();

        console.log(code)

    }
</script>



</html>