<%--
  Created by IntelliJ IDEA.
  User: 赵晟浩
  Date: 2022/03/04
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 注册管理员</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="/admin/adminReg">
            <div class="form-group">
                <div class="label">
                    <label >管理员帐号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="uname" name="userName" size="50"  />

                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="passWord" size="50" placeholder="请输入密码" data-validate="required:请输入密码,length#>=5:新密码不能小于5位" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >确认密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入密码" data-validate="required:请再次输入密码,repeat#passWord:两次输入的密码不一致" />
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" onclick="success()"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    function success(){
        layer.msg('注册成功', {
            time: 2000, //2s后自动关闭
        });
    }
</script>
</html>
