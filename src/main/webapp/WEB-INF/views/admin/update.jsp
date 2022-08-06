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
                    <input type="text" class="input " style="width: 80%" value="${student.studentName}" name="studentName"  id="studentName"/>
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
                    <label>学生性别：</label>
                </div>
                <div class="field">
                    <input type="text" class="input " style="width: 80%"  value="${student.sex}" name="sex" id="sex" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>所属学院：</label>
                </div>
                <div class="field">
                    <select name="department"  id="department" style="width: 50%" class="input w50">
                        <option value="${student.department}" >${student.department}</option>
                        <option value="管理学院">管理学院</option>
                        <option value="金融贸易学院">金融贸易学院</option>
                        <option value="国际学院">国际学院</option>
                        <option value="传媒与艺术设计学院">传媒与艺术设计学院</option>
                        <option value="信息工程学院">信息工程学院</option>
                        <option value="继续教育学院">继续教育学院</option>
                    </select>
<%--                    <input type="text" class="input" style="width: 80%"  value="" name="department" id="department" />--%>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>所在班级：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 80%"  value="${student.studentClass}" name="studentClass" id="studentClass" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>身份证号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 80%"  value="${student.studentId}" name="studentId" id="studentId" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>名族：</label>
                </div>
                <div class="field">
                    <input type="text" class="input " style="width: 80%"  value="${student.nation}" name="nation" id="nation" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>电话号码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input " style="width: 80%"  value="${student.studentTel}" name="studentTel" id="studentTel" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>户籍区域：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 80%"  value="${student.area}" id="area" name="area" itemid="area" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label" style="width: 80%">
                    <label>户籍地：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 80%"  value="${student.hold}" name="hold" id="hold" />
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
                    <label >迁出时间：</label>
                </div>
                <div class="field">
                    <input type="date" class="input w50" style="width: 80%" value="<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${student.outDate}" />" id="outDate"  name="outDate" dirname="outDate" size="50"   />
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
            studentName: $("#studentName").val(),
            studentNo:$("#studentNo").val(),
            sex:$("#sex").val(),
            department:$("#department").val(),
            studentClass:$("#studentClass").val(),
            studentId:$("#studentId").val(),
            nation:$("#nation").val(),
            studentTel:$("#studentTel").val(),
            area:$("#area").val(),
            hold:$("#hold").val(),
            inDate:$("#inDate").val(),
            outDate:$("#outDate").val(),
        }
        console.log(data)
        return data
    }
</script>
</html>