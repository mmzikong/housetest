<%--
  Created by IntelliJ IDEA.
  User: 赵晟浩
  Date: 2022/03/04
  Time: 19:09
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
    <title>户籍管理中心</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="/static/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />户籍管理中心</h1>
    </div>
    <div class="head-l">
        <a class="button button-little bg-green" href="/index/getPage" >
        <span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
        <a class="button button-little bg-red" href="/login/logout">
            <span class="icon-power-off"></span> 退出登录</a>
    </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-user"></span>基本设置</h2>
    <ul style="display:block">
        <li><a href="/student/listView" target="right"><span class="icon-caret-right"></span>内容管理</a></li>
        <li><a href="/moveIn/toMoveIn" target="right"><span class="icon-caret-right"></span>用户迁入</a></li>
        <li><a href="/moveOut/toMoveOut" target="right"><span class="icon-caret-right"></span>用户迁出</a></li>
        <li><a href="/moveIn/moveInView" target="right"><span class="icon-caret-right"></span>迁入管理</a></li>
        <li><a href="/moveOut/moveOutView" target="right"><span class="icon-caret-right"></span>迁出管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
    <ul>
        <li><a href="/admin/passView" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
        <li><a href="/admin/regView" target="right"><span class="icon-caret-right"></span>注册管理员</a></li>
        <li><a href="/student/addView" target="right"><span class="icon-caret-right"></span>添加内容</a></li>
        <li><a href="/epidemic/epidemicView" target="right"><span class="icon-caret-right"></span>疫情管理</a></li>
        <li><a href="/notice/noticeView" target="right"><span class="icon-caret-right"></span>公告管理</a></li>
    </ul>
</div>
<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a href="/student/listView" target="right" class="icon-home"> 首页</a></li>
</ul>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="/student/listView" name="right" width="100%" height="100%"></iframe>
</div>

</body>
</html>
