<%@ Page Title="User Administration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="IAGWeb.Admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>User Administration</h2>
    <p>
        <asp:GridView ID="UserList" runat="server" AutoGenerateColumns="False"
             GridLines="None"  
            AllowPaging="false"  
            CssClass="grid"  
            PagerStyle-CssClass="pgr"  
            AlternatingRowStyle-CssClass="alt">
            <Columns>
                <asp:HyperLinkField Text="Edit" DataNavigateUrlFormatString="~/Account/Manage.aspx?u={0}" DataNavigateUrlFields="Id" />
                <asp:BoundField DataField="UserName" HeaderText="Username" />
                <asp:BoundField DataField="Email" HeaderText="E-mail" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>
