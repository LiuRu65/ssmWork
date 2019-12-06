<%--
  Created by IntelliJ IDEA.
  User: Liu Ru
  Date: 2019/12/5
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
</head>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">

<style type="text/css">
    input{
        width:200px;
        height:30px;
        border: 1px solid #1b6d85;
        margin: 10px 10px;
    }
    .t1{
        width: 800px;
        overflow: hidden;
        text-align: center;
    }
</style>
<body>
<form>
    <table class="t1" style="text-align: center">
        <tr>
            <th colspan="2"><h1>员工信息修改</h1></th>
        </tr>
        <tr>
            <td>员工编号：</td>
            <td><input type="text" name="empno" id="empno" value="" readonly></td>
            <td>员工姓名：</td>
            <td><input type="text" name="ename" id="ename"></td>
        </tr>
        <tr>
            <td>工作：</td>
            <td><input type="text" name="job" id="job"></td>
            <td>上级编号：</td>
            <td><input type="text" name="mgr" id="mgr"></td>
        </tr>
        <tr>
            <td>入职日期：</td>
            <td><input type="text" name="hiredate" id="hiredate"></td>
            <td>薪资：</td>
            <td><input type="text" name="sal" id="sal"></td>
        </tr>
        <tr>
            <td>奖金：</td>
            <td><input type="text" name="comm" id="comm"></td>
            <td>部门编号：</td>
            <td><input type="text" name="deptno" id="deptno"></td>
        </tr>
        <tr>
            <td><button id="btn" type="button" class="btn btn-warning">确认修改</button></td>
        </tr>
    </table>

</form>

</body>
<script>
    var text = decodeURI(window.location.href);
    var eno = text.split("?empno=")[1];
    console.log(eno);

    $.ajax({
        type:"post",
        url:"selectByeno",
        data:{eno:eno},
        success:function(e){
            console.log(e);
            $("#empno").val(e.empno);
            $("#ename").val(e.ename);
            $("#job").val(e.job);
            $("#mgr").val(e.mgr);
            $("#hiredate").val(e.hiredate);
            $("#sal").val(e.sal);
            $("#comm").val(e.comm);
            $("#deptno").val(e.deptno);
        }
    });

    $("#btn").click(function () {
        var emp = {empno:$('#empno').val(),ename:$('#ename').val(),
            job:$('#job').val(),mgr:$('#mgr').val(),hiredate:$('#hiredate').val(),
            sal:$('#sal').val(),comm:$('#comm').val(),deptno:$('#deptno').val()};
        console.log("修改页面。。。"+emp);
       $.ajax({
           type:"post",
           url:"updateEmp",
           contentType:"application/json;charset=UTF-8",
           dataType:"json",
           data:JSON.stringify(emp),
           /*data:{emp:emp},*/
           success:function (b) {
               console.log(typeof(b));
               if(b){
                   alert("您已修改成功");
                   window.location.href="EmpShow.jsp";
               }else{
                   alert("修改失败！");
               }

           }
       })
    });
</script>
</html>
