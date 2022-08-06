<%--
  Created by IntelliJ IDEA.
  User: 赵晟浩
  Date: 2022/03/04
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="/static/layui/css/layui.css" rel="stylesheet" />

    <script src="/static/layui/layui.js" type="text/javascript"></script>
    <script src="/static/js/jquery.js" type="text/javascript"></script>
    <script src="/static/js/area.js" type="text/javascript"></script>
    <script src="/static/js/select.js" type="text/javascript"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="body-content">
        <form method="post" class="form-x" action="">
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>学生姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input " style="width: 80%" value="${student.name}" name="name"  id="name"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>学生学号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 80%"  value="${student.studentNo}" name="studentNo" id="studentNo" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label >迁入时间：</label>
                </div>
                <div class="field">
                    <input type="date" class="input w50"  style="width: 80%" value="<fmt:formatDate  pattern="yyyy-MM-dd" type="date" value="${student.inDate}" />" id="inDate" name="inDate" size="50"   />
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>迁入区域：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 80%"  value="${student.area}" id="area" name="area" itemid="area" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>迁入地：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 80%"  value="${student.whereIn}" name="whereIn" id="whereIn" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>迁入原因：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 80%"  value="${student.whyIn}" name="whyIn" id="whyIn" />
                    <div class="tips"></div>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
<script>
    $(document).ready(function(){
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
            // $.ajax({
            //     url:"/index/toArea",
            //     type:"POST",
            //     success:function (){
            //
            //     }
            // })
        })

    });

    var s =  function() {
        var data = {
            name: $("#name").val(),
            studentNo:$("#studentNo").val(),
            inDate:$("#inDate").val(),
            area:$("#area").val(),
            whereIn:$("#whereIn").val(),
            whyIn:$("#whyIn").val(),
        }
        console.log(data)
        return data
    }
</script>
</html>