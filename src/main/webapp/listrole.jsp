<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath() %>/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=request.getContextPath() %>/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/lineicons/style.css">
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath() %>/assets/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/css/style-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/bootstrap-treeview/dist/bootstrap-treeview.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/bTabs-master/b.tabs.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.css">
    <style type="text/css">
        .btn-group > .btn, .btn-group-vertical > .btn {
            position: relative;
            float: left;
            width: 50.9px;
            height: 34px;
        }
    </style>
</head>
<body>

<button type="button" class="btn btn-default" onclick="addrole()">新增</button>

<table class="table" id="queryrole" border="1"  bordercolor="#00FFFF"></table>

<div class="modal fade" id="xx" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
    <form class="form-login" id="updaterole" action="index.jsp">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                    <h4 class="modal-title">修改页面</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="roleid"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色名称</label>
                        <div class="col-sm-5">
                            <input type="text" name="rolename">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary" type="button" onclick="updateRole()">保存</button>
                </div>
            </div>
        </div>
    </form>
</div>

<div class="modal fade" id="xxx" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
    <form class="form-login" id="addrole2" action="index.jsp">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                    <h4 class="modal-title">新增页面</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色名称</label>
                        <div class="col-sm-5">
                            <input type="text" name="rolename">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary" type="button" onclick="addaa()">提交</button>
                </div>
            </div>
        </div>
    </form>
</div>


<!-- 模态提示框（Modal） -->

<div class="modal fade" id="myModalzhuwu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:352px;height:100px">
        <div class="modal-content">
            <div class="modal-header" style="width:350px;height: 50px">
                <h4 class="modal-title" id="myModalLabel">最新消息</h4>
            </div>
            <div class="modal-body" align="center" style="height:80px"><font size="5px">你确定删除此条信息吗?</font></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-default" onclick="deletezw()" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>


<script src="<%=request.getContextPath() %>/assets/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
<%--<script src="<%=request.getContextPath()%>/js/bootStrap-addTabs/bootstrap.addtabs.js"></script>--%>
<script src="<%=request.getContextPath()%>/js/bootstrap-table/dist/bootstrap-table.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
<!-- js placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/jquery.backstretch.min.js"></script>

<script type="text/javascript">

  //=======================================信息查询=====================================

    $(function(){

        $("#queryrole").bootstrapTable({
            url:"<%=request.getContextPath()%>/user/queryRole",
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
            pageSize: 3,                     //每页的记录行数（*）
            pageList: [1, 2, 4, 5],        //可供选择的每页的行数（*）
            search: true,                      //是否显示表格搜索
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列（选择显示的列）
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 3,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            sheight: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
            showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,
            columns:[[
                {field:'roleid',title:'序号',width:100},
                {field:'rolename',title:'名称',width:100},
                {field:'act',title:'操作',width:100,
                    formatter: function(value,row,index){
                        return "<button type='button'  class='btn btn-success' href='#updateyhtck' class='btn cye-lm-tag' data-toggle='modal' onclick='updatehx("+row.roleid+")'>修改</button>&nbsp;&nbsp;<button type='button' onclick='deleterole("+row.roleid+")' class='btn btn-danger'>删除</button>";
                    }
                },
            ]]

        })
    })

//删除
    function deleterole(roleid){

        $.ajax({
            url:"<%=request.getContextPath()%>/user/delRole?roleid="+roleid,
            type:"post",
            dataType:"text",
            async:false,
            success:function(delsuccess){
                location.reload();
            }
        })
    }

//回显
  function  updatehx(roleid){

      $.ajax({
          url:"<%=request.getContextPath()%>/user/updateHx?roleid="+roleid,
          type:"post",
          dataType:"text",
          async:false,
          success:function(role){
              alert(role)
              $("[name='roleid']").val(role[0].roleid);
              $("[name='rolename']").val(role[1].rolename);
              $('#xx').modal({
                  keyboard:false,
                  backdrop:false,
              })
          },
          error:function(){
              alert("hx出错");
          }
      })
  }

  //修改
  function updateRole(){
        $.ajax({
            url:"<%=request.getContextPath()%>/user/upRole",
            type:"post",
            data:$("#updaterole").serialize(),
            dataType:"text",
            async:false,
            success:function(){
                location.reload();
            },
            error:function(){
                alert("修改出错");
            }
        })
  }
//新增

      function   addrole(){
          $('#xxx').modal({
              keyboard:false,
              backdrop:false
          })
      }

    function addaa() {
        alert(123);
        $.ajax({
            type: "post",
            url: "<%=request.getContextPath()%>/user/addrole",
            data: $("#addrole2").serialize(),
            success: function (addsuccess) {
                location.reload();
            },
            error: function () {

            }
        })
     }






</script>

</body>
</html>