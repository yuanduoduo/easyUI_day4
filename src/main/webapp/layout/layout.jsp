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
<body>
<div id="cc" class="easyui-layout"  data-options="fit:true">
    <div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>
    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>
    <div data-options="region:'west',title:'West',split:true" style="width:100px;"></div>
    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>
</div>
</body>
</html>
