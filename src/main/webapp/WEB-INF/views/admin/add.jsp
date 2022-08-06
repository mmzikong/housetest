<%--
  Created by IntelliJ IDEA.
  User: 赵晟浩
  Date: 2022/03/04
  Time: 20:44
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
    <link href="/static/layui/css/layui.css" rel="stylesheet" />

    <script src="/static/layui/layui.js" type="text/javascript"></script>
    <script src="/static/js/jquery.js" type="text/javascript"></script>
    <script src="/static/js/area.js" type="text/javascript"></script>
    <script src="/static/js/select.js" type="text/javascript"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="/student/add">
            <div class="form-group">
                <div class="label">
                    <label>学生姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input " style="width: 50%" value="" name="studentName" data-validate="required:请输入学生姓名" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>学生学号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 50%"  value="" name="studentNo" data-validate="required:请输入学生学号" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>学生性别：</label>
                </div>
                <div class="field">
                    <input type="text" class="input " style="width: 50%"  value="" name="sex" data-validate="required:请输入学生性别" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>所属学院：</label>
                </div>
                <div class="field">
                    <select name="department"  id="department" style="width: 50%" class="input w50">
                        <option value="">请选择学院</option>
                        <option value="">管理学院</option>
                        <option value="">金融贸易学院</option>
                        <option value="">国际学院</option>
                        <option value="">传媒与艺术设计学院</option>
                        <option value="">信息工程学院</option>
                        <option value="">继续教育学院</option>
                    </select>
<%--                    <input type="text" class="input" style="width: 50%"  value="" name="department" data-validate="required:请输入学生所在学院" />--%>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>所在班级：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 50%"  value="" name="studentClass" data-validate="required:请输入学生所在班级" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>身份证号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 50%"  value="" name="studentId" data-validate="required:请输入学生身份证号" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>名族：</label>
                </div>
                <div class="field">
                    <input type="text" class="input " style="width: 50%"  value="" name="nation" data-validate="required:请输入学生名族" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>电话号码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input " style="width: 50%"  value="" name="studentTel" data-validate="required:请输入学生电话号码" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>户籍区域：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 50%"  value="" id="area" name="area" data-validate="" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>户籍地：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" style="width: 50%"  value="" name="hold" data-validate="required:请输入学生户籍" />
                    <div class="tips"></div>
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


</script>
</html>