<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="IAGWeb.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Cautare
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="txtSearch" runat="server">
    </asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default" Text="Cauta" OnClick="btnSearch_Click" />
    <br />
    <asp:Panel ID="pnlResults" runat="server">
        <asp:Repeater ID="rptResults" runat="server">
            <HeaderTemplate>

            </HeaderTemplate>
            <ItemTemplate>
                <div class="iagSearchResultItem">
                    <div class="iagSearchResultTitle">
                        <%# ((IAGWeb.Search.SearchResultItem)Container.DataItem).Title %>
                    </div>
                    <div class="iagSearchResultDescription">
                        <%# ((IAGWeb.Search.SearchResultItem)Container.DataItem).Description %>
                    </div>
                    <div class="iagSearchResultLink">
                        <%# ((IAGWeb.Search.SearchResultItem)Container.DataItem).Link %>
                    </div>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <br />
            </SeparatorTemplate>
            <FooterTemplate>

            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel>
</asp:Content>
