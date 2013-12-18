<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministerList.aspx.cs"
    Inherits="GZDXCC.Admin.AdministerList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理员列表</title>
    <link href="../Content/Css/Reset.css" rel="stylesheet" type="text/css" />
    <link href="../Content/Css/Common.css" rel="stylesheet" type="text/css" />
    <link href="../Content/ligerUI/skins/Silvery/css/ligerui-all.css" rel="stylesheet"
        type="text/css" />
    <link href="CSS/Edit.css" rel="stylesheet" type="text/css" />
    <link href="CSS/List.css" rel="stylesheet" type="text/css" />
    <script src="../Content/Scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="../Content/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="../Content/Scripts/jquery-querystring.js" type="text/javascript"></script>
    <script type="text/javascript">
        function openEdit(obj, width, height) {
            var p = {
                url: obj.href,
                tittle: obj.innerHTML,
                width: $(this).attr("w") || width,
                height: $(this).attr("h") || height,
                isResize: true
            };
            $.ligerDialog.open(p);
            return false;
        }
        function closeEdit() {
            location.href = location.href;
        }
        function closeAdd() {
            location.href = location.pathname + $.query.set("page", 1);
        }
        function deleteData(id) {
            if (confirm("确认要删除吗？"))
            { location.href = location.pathname + $.query.set("id", id); }
        }
        function slideToggle() {
            $("#search").slideToggle();
        }
        function setPageSize(pageSize) {
            location.href = location.pathname + $.query.set("pageSize", pageSize);
        }
        function isShowSearch() {
            if ($("tbKey").val() != "") {
                $("#search").show();
            }
        }
        $(
                function () {
                    if ($("#tbKey").val() != "") {
                        $("#search").show();
                    }
                }
        );
    </script>
</head>
<body>
    <form id="form1" runat="server" method="post" defaultbutton="btnSearch">
    <div id="list">
        <div id="nav">
            <!--<a onclick="return openEdit(this,500,600);" href="">添加信息</a> |--><a href="#" onclick="slideToggle();">搜索</a>
        </div>
        <div id="search">
            查询：<asp:TextBox ID="tbKey" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
        </div>
        <asp:Repeater ID="rpData" runat="server">
            <HeaderTemplate>
                <table id="data-list">
                    <tr>
                        <th class="id">
                            编号
                        </th>
                        <th>
                            登录名
                        </th>
                        <th>
                            真实姓名
                        </th>
                        <th>
                            最后登录IP地址
                        </th>
                        <th class="oper">
                            操作
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%#Eval("RowNo").ToString()%>
                    </td>
                    <td>
                        <%#Eval("LoginName".ToString()) %>
                    </td>
                    <td>
                        <%#Eval("RealName").ToString() %>
                    </td>
                    <td>
                        <%#Eval("LastLoginIP").ToString() %>
                    </td>
                    <td>
                        <a onclick="return openEdit(this,456,260);" href="ModifyAdminister.aspx?id=<%#Eval("ID").ToString() %>">
                            <img src="../Content/Images/edit.gif" alt="" title="编辑 " /></a>| <a href="#" onclick="deleteData(<%#Eval("ID").ToString() %>)">
                                <img src="../Content/Images/delete.gif" alt="" title="删除" /></a>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <div class="pager">
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="True" CustomInfoHTML="页大小：&lt;a href=&quot;#&quot; onclick=&quot;setPageSize(5);&quot;&gt;5&lt;/a&gt;|&lt;a href=&quot;#&quot; onclick=&quot;setPageSize(10);&quot;&gt;10&lt;/a&gt; 第%CurrentPageIndex%/%PageCount%页，共%RecordCount%条数据"
                CustomInfoSectionWidth="290px" CustomInfoTextAlign="Right" FirstPageText="首页"
                LastPageText="尾页" NextPageText="下一页"
                PageIndexBoxType="DropDownList" PagingButtonSpacing="3px" PrevPageText="上一页"
                ShowCustomInfoSection="Right" ShowNavigationToolTip="True" ShowPageIndexBox="Always"
                TextAfterPageIndexBox="页" TextBeforePageIndexBox="转向第" UrlPageSizeName="pageSize"
                UrlPaging="True" ViewStateMode="Enabled" 
                OnPageChanged="AspNetPager1_PageChanged">
            </webdiyer:AspNetPager>
        </div>
    </div>
    </form>
</body>
</html>
