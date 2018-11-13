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
        $(function () {
            $("#btn").click(function () {
                var exists = $("#tt").tabs('exists','控制面板');
                if(!exists){
                    $("#tt").tabs('add',{
                        title:'控制面板',
                        iconCls:'icon-man',
                        href:'${pageContext.request.contextPath}/index.jsp',
                        closable:true,
                    });
                }else{
                    $("#tt").tabs('select','控制面板');
                }
            })
        })
    </script>
</head>
<body>
    <div id="tt" class="easyui-tabs" data-options="width:600,height:400">
        <div data-options="title:'学生管理',iconCls:'icon-ok',closable:true"></div>
    </div>
    <input type="button" id="btn" value="添加一个选项卡到tabs上">
</body>
</html>
