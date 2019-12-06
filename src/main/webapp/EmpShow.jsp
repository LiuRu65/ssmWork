<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: Liu Ru
  Date: 2019/12/4
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>SHOW</title>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<style>

</style>

<body>

<h1>......员工信息展示......</h1>
按姓名<input name="likeEname" id="likeEname">&nbsp;&nbsp;<input type="button" id="btnlike" class="btn-info" value="模糊查询">&nbsp;&nbsp;
点击<a href="addEmp.jsp">此处</a>添加员工信息
<table border="1" style="text-align: center" id="t1">
    <tr>
        <th>#</th>
        <th>员工编号</th>
        <th>员工姓名</th>
        <th>工作</th>
        <th>上级编号</th>
        <th>入职日期</th>
        <th>薪资</th>
        <th>奖金</th>
        <th>部门编号</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach items="${requestScope.empList}" var="e" varStatus="i">
        <c:if test="${i.count%2==0}">
            <tr bgcolor="#5f9ea0">
        </c:if>
        <c:if test="${i.count%2!=0}">
            <tr bgcolor="#deb887">
        </c:if>
            <td>${i.count}</td>
            <td>${e.empno}</td>
            <td>${e.ename}</td>
            <td>${e.job}</td>
            <td>${e.mgr}</td>
            <td><fmt:formatDate value="${e.hiredate}" pattern="yyyy-MM-dd"/> </td>
            <td>${e.sal}</td>
            <td>${e.comm}</td>
            <td>${e.deptno}</td>
            <td><a href="delEmp?empno=${e.empno}">删除</a></td>
            <td><a href="updateEmp.jsp?empno=${e.empno}">修改</a></td>
        </tr>
    </c:forEach>
</table>
<div class="d2">
    <h1>........邮件发送.........</h1>
    <form action="sendmail" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>选择文件:</td>
                <td><input type="file" name="fujian"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" class="btn-info" value="send"></td>
            </tr>
        </table>
    </form>
</div>

<div>
    <h3>上传</h3>
    <form method="post" enctype="multipart/form-data" action="upload">
        文件1：<input type="file" name="uploadFile"><br>
        文件2：<input type="file" name="uploadFile"><br>
        文件3：<input type="file" name="uploadFile"><br>
        <input type="submit" value="上传">
    </form>
    <br>
    <form method="post" enctype="multipart/form-data" id="form2">
        文件1：<input type="file" name="uploadFile" id="file1"><br>
        文件2：<input type="file" name="uploadFile" id="file2"><br>
        文件3：<input type="file" name="uploadFile" id="file3"><br>
        <input type="button" value="上传" id="btnfile">
    </form>
</div>

</body>

<script>
    if("${requestScope.empList}"==""){
        window.location.href="EmpShow";
    }
    $("#btnlike").click(function () {
        var likeEname = $("#likeEname").val();
        console.log(likeEname);
       $.ajax({
           type:"post",
           url:"like",
           data:{likeEname:likeEname},
           success:function (data) {
               $("#t1").empty();
               $("#t1").append(
                   '<tr><th>#</th><th>员工编号</th><th>员工姓名</th><th>工作</th><th>上级编号</th>'+
                   '<th>入职日期</th><th>薪资</th><th>奖金</th><th>部门编号</th><th colspan="2">操作</th></tr>'
               );
               console.log("这里是data里的数据"+data);
                //不用解析
               $.each(data,function(index,e){
                   $("#t1").append(
                       '<tr bgcolor="#deb887"><td>'+(index+1)+'</td>'+
                       '<td>'+e.empno+'</td>'+
                       '<td>'+e.ename+'</td>'+
                       '<td>'+e.job+'</td>'+
                       '<td>'+e.mgr+'</td>'+
                       '<td>'+e.hiredate+'</td>'+
                       '<td>'+e.sal+'</td>'+
                       '<td>'+e.comm+'</td>'+
                       '<td>'+e.deptno+'</td>'+
                       '<td><a href="delEmp?empno='+e.empno+'">删除</a></td>'+
                       '<td><a href="updateEmp.jsp?empno='+e.empno+'">修改</a></td></tr>'
                   );
               });
           }
       });
    });

    $("#btnfile").click(function () {
        var fm = new FormData();
        fm.append("uploadFile",$("#file1")[0].files[0]);
        console.log(fm);
        $.ajax({
            type:"post",
            url:"ajaxupload",
            processData:false,
            contentType:false,
            data:fm,
            success:function (data) {
                alert(data);
            }
        });
    });


</script>
</html>
