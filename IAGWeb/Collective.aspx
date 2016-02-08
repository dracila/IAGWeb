<%@ Page Title="Personnel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Collective.aspx.cs" Inherits="IAGWeb.Collective" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Contact Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="UpdateButton" runat="server" CssClass="btn btn-default" OnClick="UpdateButton_Click" Text="Actualizeaza" />
    <asp:Panel ID="ViewPanel" runat="server">
        <div id="ViewDiv" runat="server" enableviewstate="false"></div>
    </asp:Panel>
    <asp:Panel ID="EditPanel" runat="server">
        <div>
           <CKEditor:CKEditorControl ID="CKEditor1" BasePath="~/ckeditor/" runat="server">
           </CKEditor:CKEditorControl>
        </div>
    </asp:Panel>
</asp:Content>
