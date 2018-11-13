<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        console.log("${param.id}");
        $("#editDeptInputForm").form('load','${pageContext.request.contextPath}/dept/queryOne?id=${param.id}');
    })
</script>
<div style="text-align: center;">
    <form id="editDeptInputForm" class="easyui-form" method="post">
        <div style="margin-top: 70px;">
            部门id: <input type="text" name="id" class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            部门编号: <input type="text" name="no"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            部门名称: <input type="text" name="name"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            部门人数: <input type="text" name="number"  class="easyui-textbox">
        </div>
        <div style="margin-top: 20px;">
            成立时间: <input type="date" name="createDate"  class="easyui-datebox">
        </div>
    </form>
</div>