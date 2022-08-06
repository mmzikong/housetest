<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>省市三级联动</title>

    <link href="/static/layui/css/layui.css" rel="stylesheet" />

    <script src="/static/layui/layui.js" type="text/javascript"></script>
    <script src="/static/js/jquery.js" type="text/javascript"></script>

</head>

<body>

<div class="layui-main" style="width: 100%;height: 100%">
    <form class="layui-form"  method="post" style="margin:10px auto">
        <div class="layui-form-item" >
            <label class="layui-form-label">请选择地区</label>
            <div class="layui-inline" >
                <select name="province" id="province" lay-verify="required" lay-search lay-filter="province">
                    <option value="">省份</option>
                </select>
            </div>
            <div class="layui-inline" >
                <select name="city" id="city" lay-verify="required" lay-search lay-filter="city">
                    <option value="">地级市</option>
                </select>
            </div>
            <div class="layui-inline">
                <select name="district" id="district" lay-verify="required" lay-search>
                    <option value="">县/区</option>
                </select>
            </div>
        </div>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label"></label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <button type="submit" class="layui-btn ">提交</button>--%>
<%--            </div>--%>
<%--        </div>--%>
    </form>
</div>

<script src="/static/js/area.js" type="text/javascript"></script>
<script src="/static/js/select.js" type="text/javascript"></script>
<script type="text/javascript">
    var byc =  function() {
        var data = $("#province").val()+$("#city").val()+$("#district").val()
        return data
    }
</script>

</body>
</html>

