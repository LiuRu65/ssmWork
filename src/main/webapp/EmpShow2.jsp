<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>SHOW</title>
</head>
<body>
<h1>......员工信息展示......</h1>
点击<a href="addEmp.jsp">此处</a>添加员工信息
<table border="1" style="text-align: center" >
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
<div class="fenye">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li><a>共${page.getPageTotal()}页</a></li>
            <li><a href="msg?pageno=1&flag=findAllmsg">首页</a></li>
            <li><a href="msg?pageno=${page.getPrevious()}&flag=findAllmsg">上一页</a></li>
            <li><a>第${page.getPageNo()}页</a></li>
            <li><a href="msg?pageno=${page.getNext()}&flag=findAllmsg">下一页</a></li>
            <li><a href="msg?pageno=${page.getLast()}&flag=findAllmsg">尾页</a></li>
        </ul>
    </nav>
</div>

</body>
<script>
    if("${requestScope.empList}"==""){
        window.location.href="EmpShow";
    }
</script>
</html>
