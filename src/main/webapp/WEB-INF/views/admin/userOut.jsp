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
    <script src="/static/js/layer/layer.js"></script>
    <script src="/static/layui.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 户籍迁出 </strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="/moveOut/addMoveOut">
            <div class="form-group">
                <div class="label">
                    <label >学号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="no" name="studentNo" size="50" placeholder="" value="${student.studentNo}" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >学生姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50 "  id="name" name="name" size="50" placeholder="" value="${student.studentName}" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >原户籍地区：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50 area" id="oldArea" name="area" size="50"  value="${student.area}" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >原户籍地：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="oldWhere" name="whereOut" size="50"  value="${student.hold}" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >迁出区域：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50 " name="nowArea" size="50" id="area"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >迁出地：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="nowWhere" size="50" placeholder="请输入迁出地"  />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >迁出时间：</label>
                </div>
                <div class="field">
                    <input type="date" class="input w50" value="" name="outDate" size="50" placeholder=""  />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >迁出原因：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="mpass" name="whyOut" size="50" placeholder=""  />
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    $(document).ready(function(){

        $("#no").focus(function(){
            $("#no").css("background-color","#FFFFCC");
        });
        $("#no").blur(function(){
            var studentNo = $("#no").val();

            console.log(studentNo)
            $("#no").css("background-color","#D6D6FF");
            $.ajax({
                url:"/student/findByStudentNo",
                data:{studentNo: studentNo},
                type: "POST",
                success:function (data){
                    console.log(data)
                    $("#name").attr("value",data.studentName);
                    $("#oldArea").attr("value",data.area);
                    $("#oldWhere").attr("value",data.hold);
                }
            })
        });

        $("#area").focus(function (){
            layer.open({
                type: 2,
                title: '选择区域',
                shadeClose: true,
                shade: 0.8,
                area: ['300px', '80%'],
                content: '/index/toArea',    //直接显示某个页面的内容
                btn:['确认','取消'],
                yes:function (index){
                    var areas = window["layui-layer-iframe" + index].byc()
                    $("#area").attr("value",areas);
                    layer.close(index);
                },btn2:function(index){
                    layer.close(index);
                }
            })
        })
    });
</script>
</html>
