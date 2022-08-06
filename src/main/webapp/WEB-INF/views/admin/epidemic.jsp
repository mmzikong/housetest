<%--
  Created by IntelliJ IDEA.
  User: 赵晟浩
  Date: 2022/03/04
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
    <script src="/static/js/layer/layer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
    <div class="padding border-bottom">
        <ul class="search" style="padding-left:10px;">
            <li> <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button></li>
            <li><button type="button" class="button border-yellow" onclick="addArea()" ><span class="icon-plus-square-o"></span> 添加风险地</button></li>
            <li> <a class="button border-main " onclick="DelSelect()" > <span class="icon-trash-o"></span>批量删除风险地</a> </li>
            <li> <a class="button border-gray" onclick="Announcement()" > <span class="icon-leaf"></span>发布公告</a> </li>
            <li>
                <form method="post" action="/epidemic/findSearchLike">
                    <input type="text" placeholder="请输入搜索关键字" name="searchLike" id="searchLike" class="input" style="width:250px; line-height:17px;display:inline-block" />
                    <%--                    <a  class="button border-main icon-search" onclick="changesearch()" > 搜索</a>--%>
                    <button type="submit" class="button border-main icon-search" onclick="changesearch()" >搜索</button>
                </form>
            </li>
        </ul>

    </div>
    <div class="panel admin-panel margin-top">
        <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>风险地列表</strong></div>
        <div class="body-content">
            <form method="post" class="form-x" action="">
                <table class="table table-hover text-center" >
                    <tr >
                        <th width="60" style="text-align:left; padding-left:20px;">序号</th>
                        <th>风险地</th>
                        <th width="20%">操作</th>
                    </tr>
                    <c:forEach items="${e}" var="map" varStatus="status">
                        <tr>
                            <td><input type="checkbox" name="id[]" value="${map.id}" />${status.index + 1}</td>
                            <td>${map.riskRegion}</td>
                            <td>
                                <a class="button border-red"  onclick="return del(${map.id})">
                                    <span class="icon-trash-o"></span> 删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </div>
    <table class="table table-hover text-center">
        <tr>
            <th width="60" style="text-align:left; padding-left:20px;">ID</th>
            <th>姓名</th>
            <th>学号</th>
            <th>性别</th>
            <th>学院</th>
            <th>班级</th>
            <th>电话号码</th>
            <th>户籍地</th>
        </tr>
        <c:forEach items="${list}" var="map" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${map.studentName}</td>
                <td>${map.studentNo}</td>
                <td>${map.sex}</td>
                <td>${map.department}</td>
                <td>${map.studentClass}</td>>
                <td name="tel">${map.studentTel}</td>
                <td>${map.area}${map.hold}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<script type="text/javascript">


    function addArea(){
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
                $.ajax({
                    url:"/epidemic/add",
                    data:{area:areas},
                    type: "POST",
                    success:function (){
                        location.reload();
                        layer.msg('添加成功', {
                            time: 2000,
                        });
                    }
                })
            },btn2:function(index){
                layer.close(index);
            }
        })
    }

    //全选操作
    $("#checkall").click(function(){
        var allcheck = true;
        $("input[name='id[]']").each(function(){
            if (this.checked == false) {
                this.checked = true;
                allcheck = false;
            }
        });
        if (allcheck){
            $("input[name='id[]']").each(function (){
                this.checked = false;
            })
            allcheck = true;
        }
    })


    //批量删除
    function DelSelect(){
        var Checkbox=false;
        var i = 0;
        var list = [];
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                list[i] = $(this).val();
                i++;
                Checkbox=true;
            }
        });
        if (Checkbox){
            console.log(list);
            layer.confirm('你确定要删除所选内容吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){   //点击确定访问后台
                $.ajax({
                    url:"/epidemic/deleteByListId",
                    data:{idList: list},
                    traditional: true,
                    type:"POST",
                    success:function (){
                        location.reload();
                        layer.msg('已删除', {
                            time: 2000,
                        });

                    }
                })
            }, function(){   //点击取消则中断操作
                layer.msg('已取消', {
                    time: 2000, //2s后自动关闭
                });
            });
        }
        else{
            layer.msg('请选择您要删除的内容!', {
                time: 2000,
            });
            return false;
        }
    }


    //单个删除
    function del(id){
        layer.confirm('确定删除吗？', {
            btn: ['确定','取消'] //按钮
        }, function(){   //点击确定访问后台
            $.ajax({
                url:"/epidemic/deleteById",
                data:{id: id},
                type:"POST",
                success:function (){
                    location.reload();
                    layer.msg('已删除', {
                        time: 2000,
                    });

                }
            })
        }, function(){   //点击取消则中断操作
            layer.msg('已取消', {
                time: 2000, //2s后自动关闭
            });
        });
    }


    //发布公告
    function Announcement(){
        layer.open({
            type: 2,
            title: '选择发布公告',
            shadeClose: true,
            shade: 0.8,
            area: ['300px', '80%'],
            content: '/notice/noticeList',    //直接显示某个页面的内容
            btn:['确认','取消'],
            yes:function (index){
                var id = window["layui-layer-iframe" + index].getId()
                var telList = []
                var i = 0
                $("td[name='tel']").each(function(){
                    telList[i] = $(this).text();
                    i++;
                });
                console.log(telList)
                $.ajax({
                    url: "/notice/release",
                    data: {id: id, telList: telList},
                    traditional: true,
                    type:"POST",
                    success:function (){
                        layer.msg('发布成功', {
                            time: 2000,
                        });

                    }
                })
                layer.close(index);
            },btn2:function(index){
                layer.close(index);
            }
        })
    }


</script>

</body>
</html>
