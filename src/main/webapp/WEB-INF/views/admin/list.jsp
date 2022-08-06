<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 赵晟浩
  Date: 2022/03/04
  Time: 20:43
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
</head>
<body>
<form method="post" action="/student/findSearchLike" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head">
            <strong class="icon-reorder"> 内容列表</strong>
<%--            <a href="" style="float:right; display:none;">添加字段</a>--%>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li> <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button></li>
                <li> <a class="button border-main icon-plus-square-o" href="/student/addView"> 添加内容</a> </li>
                <li> <a class="button border-main icon-trash-o" onclick="DelSelect()" > 删除内容</a> </li>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" name="searchLike" id="searchLike" class="input" style="width:250px; line-height:17px;display:inline-block" />
<%--                    <a  class="button border-main icon-search" onclick="changesearch()" > 搜索</a>--%>
                    <button type="submit" class="button border-main icon-search" onclick="changesearch()" >搜索</button>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="4%" style="text-align:left; padding-left:20px;">ID</th>
                <th width="7%">姓名</th>
                <th width="7%">学号</th>
                <th width="4%">性别</th>
                <th width="8%">学院</th>
                <th width="8%">班级</th>
                <th width="7%">身份证</th>
                <th width="7%">电话号码</th>
                <th width="5%">名族</th>
                <th width="7%">户籍地</th>
                <th width="10%">迁入时间</th>
                <th width="10%">迁出时间</th>
                <th width="20%">操作</th>
            </tr>
            <c:forEach items="${list}" var="vo" varStatus="status">
<%--            <volist name="list" id="vo">--%>
                <tr>
                    <td><input type="checkbox" name="id[]" value="${vo.id}" />${status.index + 1}</td>
                    <td>${vo.studentName}</td>
                    <td>${vo.studentNo}</td>
                    <td>${vo.sex}</td>
                    <td>${vo.department}</td>
                    <td>${vo.studentClass}</td>
                    <td>${vo.studentId}</td>
                    <td>${vo.studentTel}</td>
                    <td>${vo.nation}</td>
                    <td>${vo.area}${vo.hold}</td>
                    <td><fmt:formatDate  type="date" value="${vo.inDate}" /></td>
                    <td><fmt:formatDate  type="date" value="${vo.outDate}" /></td>
                    <td>
                        <div class="button-group">
                            <a class="button border-green"  onclick="return update(${vo.id})">
                                <span class="icon-edit"></span> 修改</a>
                            <a class="button border-red"  onclick="return del(${vo.id})">
                                <span class="icon-trash-o"></span> 删除</a>
                            <a class="button border-main"  href="/moveIn/toMoveIn?studentNo=${vo.studentNo}">
<%--                            <a class="button border-main"  onclick="ToMoveIn(${vo.studentNo})">--%>
                                <span class="icon-automobile"></span> 迁入</a>
                            <a class="button border-main" href="/moveOut/toMoveOut?studentNo=${vo.studentNo}" >
                                <span class="icon-car"></span> 迁出</a>
                        </div>
                    </td>
                </tr>
<%--            </volist>--%>
            </c:forEach>
        </table>
    </div>
</form>
<script type="text/javascript">

    //单个删除
    function del(id){
        layer.confirm('确定删除吗？', {
            btn: ['确定','取消'] //按钮
        }, function(){   //点击确定访问后台
            $.ajax({
                url:"/student/deleteById",
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


    //修改
    function update(id){
        layer.open({
            type: 2,
            title: '修改',
            shadeClose: true,
            shade: 0.8,
            area: ['50%', '90%'],
            content: '/student/toUpdate?id='+id,    //直接显示某个页面的内容
            btn:['确认','取消'],
            yes:function (index){
                var data = window["layui-layer-iframe" + index].s()

                // layer.close(index);
                $.ajax({
                    url:"/student/update",
                    data:{
                        id:id,
                        studentName:data.studentName,
                        studentNo:data.studentNo,
                        sex:data.sex,
                        department:data.department,
                        studentClass:data.studentClass,
                        studentId:data.studentId,
                        nation:data.nation,
                        studentTel:data.studentTel,
                        area:data.area,
                        hold:data.hold,
                        inDate:data.inDate,
                        outDate:data.outDate,
                    },
                    type:"POST",
                    success:function (){
                        location.reload();
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


    //搜索
    function changesearch(){
        var searchLike = $("#searchLike").val()
        console.log(searchLike)
    }


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
                    url:"/student/deleteByListId",
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



</script>
</body>
</html>