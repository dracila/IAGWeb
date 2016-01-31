<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="IAGWeb.Schedule" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %> 

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Orar
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>Orar</h4>
    <hr />
    <asp:Label ID="lblStatus" runat="server" EnableViewState="false" CssClass="has-error"></asp:Label>
    <asp:Repeater ID="rptSchedules"
        runat="server">
        <ItemTemplate> 
           <asp:Button ID="btnSelectSchedule" CssClass="btn btn-default"
                             runat="server" 
                             Text="<%# ((System.IO.FileInfo)Container.DataItem).Name%>" 
                             OnClick="btnSelectSchedule_Click"
                             CommandArgument="<%# ((System.IO.FileInfo)Container.DataItem).FullName%>"/>
        </ItemTemplate>
    </asp:Repeater>
    <br />
    <h4><asp:Label ID="lblCurrentSchedule" runat="server"></asp:Label></h4>
    <asp:Panel ID="AdminPanel" runat="server">
        Adauga orar nou
        <asp:TextBox ID="txtNewSchedule" runat="server">
        </asp:TextBox>
        <asp:Button ID="AddButton" runat="server" CssClass="btn btn-default" OnClick="AdminButton_Click" Text="Adauga" CommandName="add" />
        <asp:Button ID="UpdateButton" runat="server" CssClass="btn btn-default" OnClick="AdminButton_Click" Text="Actualizeaza" CommandName="update" />
        <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-default" OnClick="AdminButton_Click" Text="Sterge" CommandName="delete" OnClientClick="return confirm('Sunteti sigur ca doriti sa stergeti acest orar?');" />
    </asp:Panel>
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
