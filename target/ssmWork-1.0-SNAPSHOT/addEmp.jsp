<%--
  Created by IntelliJ IDEA.
  User: Liu Ru
  Date: 2019/12/2
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>添加</title>
    <%--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">--%>

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
</head>
<body>

<form>
    <table class="t1">
        <tr>
            <th colspan="2"><h1>员工信息添加</h1></th>
        </tr>
        <tr>
            <td>员工编号：</td>
            <td><input type="text" name="empno" id="empno" value="9999"></td>
            <td>员工姓名：</td>
            <td><input type="text" name="ename" id="ename" value="张三"></td>
        </tr>
        <tr>
            <td>工作：</td>
            <td><input type="text" name="job" id="job" value="CLERK"></td>
            <td>上级编号：</td>
            <td><input type="text" name="mgr" id="mgr" value="7839"></td>
        </tr>
        <tr>
            <td>入职日期：</td>
            <td><input type="date" name="hiredate" id="hiredate"></td>
            <td>薪资：</td>
            <td><input type="text" name="sal" id="sal" value="8000"></td>
        </tr>
        <tr>
            <td>奖金：</td>
            <td><input type="text" name="comm" id="comm" value="222"></td>
            <td>部门编号：</td>
            <td><input type="text" name="deptno" id="deptno" value="20"></td>
        </tr>
        <tr>
            <td><button id="btn" type="button" class="btn btn-warning">确认添加</button></td>
        </tr>
    </table>

</form>

</body>
<script>

    $("#btn").click(function () {

        console.log($('#hiredate').val());
        var emp = {empno:$('#empno').val(),ename:$('#ename').val(),
            job:$('#job').val(),mgr:$('#mgr').val(),hiredate:$('#hiredate').val(),
            sal:$('#sal').val(),comm:$('#comm').val(),deptno:$('#deptno').val()};
        $.ajax({
            type:"post",
            url:"addEmp",
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            data:JSON.stringify(emp),
            success:function (b) {
                console.log(typeof(b));
                if(b){
                    alert("您已添加成功。");
                    window.location.href="EmpShow.jsp";
                }else{
                    alert("添加失败！");
                    window.location.href="addEmp.jsp";
                }
            }
        });
    });

</script>

</html>
