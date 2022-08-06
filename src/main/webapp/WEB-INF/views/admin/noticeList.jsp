<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 赵晟浩
  Date: 2022/03/04
  Time: 20:39
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
    <title>公告列表</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
    <script src="/static/js/layer/layer.js"></script>
</head>
<body>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 公告列表</strong></div>
        <table class="table table-hover text-center" id="list">
            <tr>
                <th width="60">ID</th>
                <th>标题</th>
                <th>编辑人</th>
            </tr>
            <c:forEach items="${list}" var="map" varStatus="status">
                <tr>
                    <td><input type="checkbox" name="id[]"  value="${map.id}" />${status.index + 1}</td>
                    <td>${map.title}</td>
                    <td>${map.releasePeople}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
<script type="text/javascript">


    $(document).ready(function () {
        $("input[name='id[]']").each(function (){
            $(this).click(function () {
                if ($(this).is(':checked')) {
                    $("input[name='id[]']").attr('checked', false)
                    this.checked = true;
                } else {
                    $("input[name='id[]']").attr('checked', false)
                }
            });
        });
    });


    //获取选择id
    var getId = function (){
        var Checkbox=false;
        var id ;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                id = $(this).val();
                Checkbox=true;
            }
        });
        if (Checkbox){
            console.log(id);
            return id;
        }
        else{
            layer.msg('请选择您要发布的内容!', {
                time: 2000,
            });
            return false;
        }
    }

    // //修改
    // function update(id){
    //     layer.open({
    //         type: 2,
    //         title: '修改',
    //         shadeClose: true,
    //         shade: 0.8,
    //         area: ['30%', '80%'],
    //         content: '/notice/toAddOrUpdate?id='+id,    //直接显示某个页面的内容
    //         btn:['确认','取消'],
    //         yes:function (index){
    //             var data = window["layui-layer-iframe" + index].s()
    //
    //             // layer.close(index);
    //             $.ajax({
    //                 url:"/moveIn/update",
    //                 data:{
    //                     id:id,
    //                     name: data.name,
    //                     studentNo:data.studentNo,
    //                     inDate:data.inDate,
    //                     area:data.area,
    //                     whereIn:data.whereIn,
    //                     whyIn:data.whyIn,
    //                 },
    //                 type:"POST",
    //                 success:function (){
    //                     location.reload();
    //                 }
    //             })
    //         },btn2:function(index){
    //             layer.close(index);
    //         }
    //     })
    // }

</script>
</body></html>