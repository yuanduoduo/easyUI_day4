<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script>
        $(function () {
            //页面加载完成之后显示菜单数据
            $.post("${pageContext.request.contextPath}/menu/findAll",function (meun) {
                //通过accordion的添加方式追加菜单
                console.log(meun);
                //遍历一级菜单
                $.each(meun,function (inderx,m) {
                    //遍历二级菜单
                    var content = "<div style='text-align: center;'>";
                    $.each(m.children,function (idx,child) {
                        content += "<a onclick=\"addTabs('"+child.name+"','"+child.iconCls+"','"+child.href+"')\" style='width:95%;margin:10px 0px; border: 2px #00ee00 solid;' class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.name+"</a><br>";
                    });
                    content +="</div>"
                    //添加菜单
                    $("#menu").accordion('add',{
                        title:m.name,
                        iconCls:m.iconCls,
                        content:content,
                    })

                });
            });
        });
        //点击菜单追加选项卡
        function addTabs(title,iconCls,href) {
            //添加以前先判断tabs中是否存在这个选项卡
            if(!$("#tabs").tabs('exists',title)){
                $("#tabs").tabs('add',{
                    title:title,
                    iconCls:iconCls,
                    closable:true,
                    fit:true,
                    href:"${pageContext.request.contextPath}"+href,
                });
            }else{
                $("#tabs").tabs('select',title);
            }
        }
    </script>
</head>
<body class="easyui-layout">
<%--页面头部--%>
    <div data-options="href:'${pageContext.request.contextPath}/back/main/head.jsp',region:'north',split:true" style="height:100px; text-align: center;">
    </div>
    <%--页面左侧--%>
    <div data-options="region:'west',title:'系统菜单',split:true" style="width:200px;">
        <div id="menu" class="easyui-accordion" data-options="fit:true"></div>
    </div>
    <%--页面中间位置--%>
    <div data-options="region:'center'">
        <div id="tabs" class="easyui-tabs" data-options="fit:true"></div>
    </div>
    <%--页面尾部--%>
    <div data-options="href:'${pageContext.request.contextPath}/back/main/footer.jsp',region:'south',split:false" style="height:60px;text-align: center">

    </div>
</body>
</html>
