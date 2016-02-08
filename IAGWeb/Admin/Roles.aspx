<%@ Page Title="Roles Administration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="IAGWeb.Admin.Roles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Roles Administration</h2>
    <p>
        <div class="form-group">
            <asp:Label runat="server" ID="NameLabel" AssociatedControlID="RoleName" CssClass="col-md-2 control-label"><b>Role Name</b></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="RoleName" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="RoleName"
                    CssClass="text-danger" ErrorMessage="Field is mandatory!"/>
            </div>
        </div>
        <asp:Button ID="CreateRoleButton" runat="server" Text="Create Role" 
            onclick="CreateRoleButton_Click"  CssClass="btn btn-default"/>
    </p>
    <p>
        <asp:GridView ID="RoleList" runat="server" AutoGenerateColumns="False" 
            onrowdeleting="RoleList_RowDeleting"
             GridLines="None"  
            AllowPaging="false"  
            CssClass="grid"  
            PagerStyle-CssClass="pgr"  
            AlternatingRowStyle-CssClass="alt">
            <Columns>
                <asp:CommandField DeleteText="Delete" ShowDeleteButton="True" HeaderStyle-Width="100" />
                <asp:TemplateField HeaderText="Role Name">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="RoleNameLabel" Text='<%#  Eval("Name") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>
