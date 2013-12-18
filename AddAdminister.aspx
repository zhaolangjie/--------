<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAdminister.aspx.cs"
    Inherits="GZDXCC.Admin.AddAdminister" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/Css/Reset.css" rel="stylesheet" type="text/css" />
    <link href="../Content/Css/Common.css" rel="stylesheet" type="text/css" />
    <link href="../Content/ligerUI/skins/Silvery/css/ligerui-all.css" rel="stylesheet"
        type="text/css" />
    <link href="CSS/Edit.css" rel="stylesheet" type="text/css" />
    <script src="../Content/Scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="../Content/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="edit">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <th>
                    登&nbsp 录&nbsp 名：
                </th>
                <td>
                    <asp:TextBox ID="tbLoginName" runat="server"></asp:TextBox><span style="color: Red;">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbLoginName"
                        Display="Dynamic" ErrorMessage="请输入登录名！" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="tbLoginName"
                        Display="Dynamic" ErrorMessage="此登录名已经存在！" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"
                        SetFocusOnError="True"></asp:CustomValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbLoginName"
                        Display="Dynamic" ErrorMessage="登录名只能在2-8个字符之间" ForeColor="Red" SetFocusOnError="True"
                        ValidationExpression="^(\s|\S){2,8}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <th>
                    密&nbsp &nbsp &nbsp &nbsp 码：
                </th>
                <td>
                    <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox><span
                        style="color: Red;">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password"
                        Display="Dynamic" ErrorMessage="请输入密码!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Password"
                        Display="Dynamic" ErrorMessage="密码长度只能在3-16个字符之间" ForeColor="Red" SetFocusOnError="True"
                        ValidationExpression="^(\s|\S){3,10}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <th>
                    确认密码：
                </th>
                <td>
                    <asp:TextBox ID="PasswordSure" TextMode="Password" runat="server"></asp:TextBox><span style="color: Red;">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PasswordSure"
                        Display="Dynamic" ErrorMessage="请确认密码" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password"
                        ControlToValidate="PasswordSure" Display="Dynamic" ErrorMessage="密码不一致" ForeColor="Red"
                        SetFocusOnError="True"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <th>
                    真是姓名：
                </th>
                <td>
                    <asp:TextBox ID="tbRealName" runat="server"></asp:TextBox><span style="color: Red;">*</span>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbRealName"
                        Display="Dynamic" ErrorMessage="真实名字长度只能在2-10个字符之间" ForeColor="Red"  ValidationExpression="^(\s|\S){2,10}$"
                        SetFocusOnError="True"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <th>
                </th>
                <td>
                    <asp:Button class="1-button" ID="Button1" runat="server" Text="提  交" 
                        onclick="Button1_Click" />&nbsp &nbsp &nbsp &nbsp &nbsp 
                    <asp:Button class="1-button" ID="Button2" runat="server" Text="清  空" 
                        onclick="Button2_Click"  CausesValidation="False" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
