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
<form method="post" action="">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 公告管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
                    <button type="button" class="button border-red" onclick="DelSelect()"><span class="icon-trash-o"></span> 批量删除</button>
                <li> <a class="button border-main icon-plus-square-o" href="/notice/toAddOrUpdate"> 添加公告</a> </li>
                </li>
<%--                <li>--%>
<%--                    <input type="text" placeholder="请输入搜索关键字" name="searchLike" id="searchLike" class="input" style="width:250px; line-height:17px;display:inline-block" />--%>
<%--                    &lt;%&ndash;                    <a  class="button border-main icon-search" onclick="changesearch()" > 搜索</a>&ndash;%&gt;--%>
<%--                    <button type="submit" class="button border-main icon-search" onclick="changesearch()" >搜索</button>--%>
<%--                </li>--%>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="120">ID</th>
                <th>标题</th>
                <th>编辑人</th>
                <th>发布时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${list}" var="map" varStatus="status">
                <tr>
                    <td><input type="checkbox" name="id[]"  value="${map.id}" />${status.index + 1}</td>
                    <td>${map.title}</td>
                    <td>${map.releasePeople}</td>
                    <td><fmt:formatDate  type="date" value="${map.releaseTime}" /></td>
                    <td>
                        <div class="button-group">
                            <a class="button border-green"  href="/notice/toAddOrUpdate?id=${map.id}" onclick="return update(${map.id})">
                                <span class="icon-edit"></span> 编辑</a>
                            <a class="button border-red" href="javascript:void(0)"  onclick="return del(${map.id})">
                                <span class="icon-trash-o"></span>删除</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
</form>
<script type="text/javascript">


    function del(id){
        layer.confirm('确定删除吗？', {
            btn: ['确定','取消'] //按钮
        }, function(){   //点击确定访问后台
            $.ajax({
                url:"/notice/deleteById",
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
                    url:"/notice/deleteByListId",
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