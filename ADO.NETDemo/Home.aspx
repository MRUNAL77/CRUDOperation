<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ADO.NETDemo.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <style>
        .container {
            padding-left: 20%;
            padding-right: 20%;
        }

        .container1 {
            padding-left: 10%;
            padding-right: 10%;
            padding-bottom: 2%;
        }

        .text-center {
            text-align: center;
        }

        .text-right {
            text-align: right;
        }

        .text-left{
            text-align:left;
        }

        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 350px;
        }

        .auto-style4 {
            text-align: left;
            width: 120px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color:deepskyblue;padding:5px; margin-bottom:20px;">
            <h1 style="color:white; padding-left:30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRUD Operation</h1>
        </div>
        <div class="container1">

            <table class="auto-style1">
                <tr>
                    <td class="text-right"><b>Product Id:</b></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPID" runat="server" Width="200px" TabIndex="1"></asp:TextBox></td>
                    <td class="auto-style4">
                        <asp:Button ID="btnDetails" runat="server" Text="Details" Width="100px" OnClick="btnDetails_Click" /></td>
                    <td class="text-left">
                        <asp:Button ID="btnInsert" runat="server" Text="Insert" Width="100px" OnClick="btnInsert_Click1" /></td>                    
                </tr>
                <tr>
                    <td class="text-right"><b>Product Name:</b></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPNAME" runat="server" Width="200px" TabIndex="2"></asp:TextBox></td>
                    <td class="auto-style4">
                        <asp:Button ID="btnNew" runat="server" Text="New" Width="100px" OnClick="btnNew_Click" /></td>

                    <td class="text-left">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="100px" OnClick="btnUpdate_Click" /></td>
                </tr>
                <tr>
                    <td class="text-right"><b>Product Cost:</b></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtCOST" runat="server" Width="200px" TabIndex="3"></asp:TextBox></td>
                    <td class="auto-style4">
                        <asp:Button ID="btnReset" runat="server" Text="Reset" Width="100px" OnClick="btnReset_Click" /></td>
                    <td class="text-left">
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="100px" OnClick="btnDelete_Click" /></td>
                </tr>
            </table>

        </div>        
        <div class="container">
            <h1 class="text-center">Products Details Table <hr style="width:500px;" /></h1>
            <asp:GridView ID="GridView1" CssClass="text-center" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="pid" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="pid" HeaderText="Product Id" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
                    <asp:BoundField DataField="pname" HeaderText="Product Name" SortExpression="pname" />
                    <asp:BoundField DataField="cost" HeaderText="Product Price" SortExpression="cost" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectToDb %>" SelectCommand="SELECT [pid], [pname], [cost] FROM [tblProducts]"></asp:SqlDataSource>
        </div>
        <footer>
            <hr />
            <p style="padding-left:80px; padding-bottom:10px;padding-top:2px;">&copy; 2017 - CRUD Operations </p>
        </footer>
    </form>
</body>
</html>
