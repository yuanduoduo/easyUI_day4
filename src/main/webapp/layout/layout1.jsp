<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/form.validator.rules.js"></script>
    <script>

    </script>
</head>
<body class="easyui-layout">
<%--页面头部--%>
    <div data-options="region:'north',split:true" style="height:100px; text-align: center;">
            <h1>EMS 员工管理系统 V1.0</h1>
    </div>
    <%--页面左侧--%>
    <div data-options="region:'west',title:'系统菜单',split:true" style="width:200px;"></div>
    <%--页面中间位置--%>
    <div data-options="region:'center'">

    </div>
    <%--页面尾部--%>
    <div data-options="region:'south',split:false" style="height:60px;text-align: center">
        百知教育@版权所有V1.0
    </div>
</body>
</html>
