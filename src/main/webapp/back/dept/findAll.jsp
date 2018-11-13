<%@page pageEncoding="UTF-8" isELIgnored="false"%>

<script>
    $(function () {
        $("#deptDg").datagrid({
            url:"${pageContext.request.contextPath}/dept/findAll",//发送请求
            pagination:true,//分页工具栏
            pageNumber:1,//当前页
            pageSize:2,//每页显示记录数
            pageList:[2,5,10,15,100],
            rownumbers:true,
            singleSelect:false,
            selectOnCheck:true,
            toolbar:'#ww',
            onLoadSuccess:function () {
                $(".options").linkbutton();
            },
            columns:[[
                {title:'cks',field:'cks',checkbox:true},
                {title:'部门id',field:'id',width:120},
                {title:'部门编号',field:'no',width:120},
                {title:'部门名称',field:'name',width:120},
                {title:'部门人数',field:'number',width:120},
                {title:'成立时间',field:'createDate',width:120},
                {title:'操作',field:'options',width:220,
                    formatter:function (value,row,index) {
                        return "<a href='javascript:;' class='options' onclick=\"delRow('"+row.id+"')\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;"+
                            "<a href='javascript:;' class='options' onclick=\"openEditDeptDialog('"+row.id+"')\" data-options=\"iconCls:'icon-edit',plain:true\">更新</a>";
                    }
                },


            ]]

        });
    });
    function openEditDeptDialog(id) {
        $("#editDeptDialog").dialog({
            href:'${pageContext.request.contextPath}/back/dept/edit.jsp?id='+id,
            buttons:[
                {
                    iconCls:'icon-save',
                    text:"修改",
                    handler:function () {
                        $("#editDeptInputForm").form('submit',{
                            url:"${pageContext.request.contextPath}/dept/update",
                            success:function (result) {//注意一定是json字符串   使用需要转为js对象
                                //关闭dialog
                                $("#editDeptDialog").dialog('close');
                                //刷新datagrid
                                $("#deptDg").datagrid('reload');//刷新当前datagrid
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    //提示修改信息
                                    $.messager.show({title:'提示',msg:'用户信息修改成功！！！'});
                                }else{
                                    $.messager.show({title:'提示',msg:result.messager});
                                }

                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:'取消',
                    handler:function () {
                        $("#editDeptDialog").dialog('close');
                    }
                },
            ]
        });
    }
    //删除一行事件
    function delRow(id) {
        //获取当前点击id发送ajax请求删除id这个信息
        $.post("${pageContext.request.contextPath}/dept/delete",{"id":id},function (result) {//响应成功后回调
            //刷新datagrid数据
            $("#deptDg").datagrid('reload');//刷新当前datagrid
        });
    }

    //批量删除多行
    function delBatchRows() {
        var rows=$("#deptDg").datagrid('getSelections');
        if (rows.length<=0){
            $.messager.show({title:'提示',msg:'至少选中一行！！！'});
        } else{
            var ids=[];
            for (var i=0;i<rows.length;i++){
                console.log(rows[i].id);
                ids.push(rows[i].id);
            }
            console.log(ids);
            // 发送ajax请求传递数组 注意：$.get   $.post 只能传递简单数据（key=value）不能传递数组类型的数据
            //                   如果想要传递数组类型的数据只能使用$.ajax 并且还要设置其中的一个属性
            $.ajax({
                url:"${pageContext.request.contextPath}/dept/delete",
                type:"POST",
                traditional:true,//传递数据类型时必须设置这个属性为true
                data:{ids:ids},
                success:function (result) {
                    if(result.success){
                        //提示消息
                        $.messager.show({title:'提示',msg:"删除成功！！！"});
                    }else{
                        $.messager.show({title:'提示',msg:result.messager});
                    }
                    $("#deptDg").datagrid('reload');//刷新当前datagrid
                },
            })
        }
    }
    function openSaveDeptDialog() {
        $("#saveDeptDialog").dialog({
            href:'${pageContext.request.contextPath}/back/dept/save.jsp',
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function(){
                    //保存用户信息
                    $("#saveDeptInputForm").form('submit',{
                        url:'${pageContext.request.contextPath}/dept/save',
                        success:function(result){//响应的一定是json格式字符串   使用应该先转为js对象
                            var resultObj = $.parseJSON(result);
                            if(resultObj.success){
                                //提示信息
                                $.messager.show({title:'提示',msg:"员工添加成功!!!"});
                            }else{
                                //提示信息
                                $.messager.show({title:'提示',msg:resultObj.message});
                            }
                            //关闭对话框
                            $("#saveDeptDialog").dialog('close');
                            //刷新datagrid
                            $("#deptDg").datagrid('reload');
                        }
                    });
                }
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function(){
                    $("#saveDeptDialog").dialog('close');
                }
            }]
        });
    }
</script>
<table id="deptDg" class="easyui-datagrid" data-options="fit:true">


</table>
<div id="ww">
    <a class="easyui-linkbutton" onclick="openSaveDeptDialog();" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a class="easyui-linkbutton" onclick="delBatchRows();" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
</div>
<div id="saveDeptDialog" data-options="draggable:false,iconCls:'icon-save',width:600,height:400,title:'保存用户信息'">
</div>
<%--更新用户对话框--%>
<div id="editDeptDialog" data-options="draggable:false,iconCls:'icon-edit',width:600,height:400,title:'更新用户信息'"></div>
