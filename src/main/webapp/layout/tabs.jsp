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
        function test(title,index) {
            console.log(title);
            console.log(index);
        }
    </script>
</head>
<body>
    <div class="easyui-tabs" data-options="onSelect:test,pill:true,narrow:false,justified:true,headerWidth:100,tabPosition:'top',toolPosition:'left',tools:'#tab-tools',scrollDuration:5000,scrollIncrement:400,width:600,height:400,plain:false,fit:false">
        <div data-options="title:'我的',iconCls:'icon-man'">
            this is xiaohei
        </div>
        <div data-options="title:'我的选项卡'">
            this is xiaohong
        </div>
    </div>
</body>
</html>
