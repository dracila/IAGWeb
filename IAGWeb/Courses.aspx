<%@ Page Title="Course" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="IAGWeb.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server">
        <h4>Current Courses</h4>
        <hr />
        <h5>Filters</h5>
        Year: 
        <asp:DropDownList ID="ddlYear" runat="server"></asp:DropDownList>
        <br />
        Field of Study:
        <asp:DropDownList ID="ddlSubject" runat="server"></asp:DropDownList>
        <br />
        <asp:Button ID="btnRefresh" runat="server" Text="Reload" OnClick="btnRefresh_Click" CssClass="btn btn-default" />
        <br />
        <br />
        <asp:GridView ID="CoursesGrid" runat="server"  AutoGenerateColumns="False" OnRowDataBound="CoursesGrid_RowDataBound" OnRowCommand="CoursesGrid_RowCommand"
            GridLines="None"  
            AllowPaging="false"  
            CssClass="grid"  
            PagerStyle-CssClass="pgr"  
            AlternatingRowStyle-CssClass="alt">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Year" HeaderText="Year" />
                <asp:BoundField DataField="Semester" HeaderText="Semester" />
                <asp:BoundField DataField="Subject" HeaderText="Field of Study" />
                <asp:BoundField DataField="DateUploaded" HeaderText="Date" />
                <asp:TemplateField HeaderText="Added by">
                    <ItemTemplate>
                        <asp:Label ID="UploadedBy" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DownloadCount" HeaderText="Downloads" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="DownloadButton" runat="server" Text="Download" CommandName="Download" />

                        <asp:LinkButton ID="DeleteButton" runat="server" Text="Delete" CommandName="CustomDelete" OnClientClick="return confirm('Are you shure you want to delete?')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <br />
    <asp:LoginView runat="server" ID="ProfessorLogin"  ViewStateMode="Disabled">
        <RoleGroups>
            <asp:RoleGroup Roles="Professor, Admin">
                <ContentTemplate>
                    <div class="form-horizontal">
                        <section id="accountForm">
                            <asp:PlaceHolder runat="server" ID="account">
                                <div class="form-horizontal">
                                    <h4>Add Course</h4>
                                    <hr />
                                    <asp:Label ID="StatusMessageLabel" runat="server" EnableViewState="false"></asp:Label>
                                    <br/>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="NameLabel" AssociatedControlID="Name" CssClass="col-md-2 control-label">Course Name</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Name" TextMode="SingleLine" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                                                CssClass="text-danger" ErrorMessage="This field is mandatory!"
                                                ValidationGroup="Courses" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="YearLabel" AssociatedControlID="Year" CssClass="col-md-2 control-label">Study Year</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Year" TextMode="SingleLine" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Year"
                                                CssClass="text-danger" ErrorMessage="This field is mandatory!"
                                                ValidationGroup="Courses" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="SemesterLabel" AssociatedControlID="Semester" CssClass="col-md-2 control-label">Semester</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Semester" TextMode="SingleLine" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Semester"
                                                CssClass="text-danger" ErrorMessage="This field is mandatory!"
                                                ValidationGroup="Courses" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="SubjectLabel" AssociatedControlID="Subject" CssClass="col-md-2 control-label">Field of Study</asp:Label>
                                        <div class="col-md-10">
                                            <asp:TextBox runat="server" ID="Subject" TextMode="SingleLine" CssClass="form-control" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Subject"
                                                CssClass="text-danger" ErrorMessage="This field is mandatory!"
                                                ValidationGroup="Courses" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="FileLabel" AssociatedControlID="File" CssClass="col-md-2 control-label">File</asp:Label>
                                        <div class="col-md-10">
                                            <asp:FileUpload ID="File" runat="server" AllowMultiple="false"/>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="File"
                                                CssClass="text-danger" ErrorMessage="This field is mandatory!"
                                                ValidationGroup="Courses" />
                                        </div>
                                    </div>
                                    <p></p>
                                    <div class="form-group">
                                        <div class="col-md-offset-2 col-md-10">
                                            <asp:Button runat="server" Text="Add" ValidationGroup="Courses" OnClick="AddCourse_Click" CssClass="btn btn-default" />
                                        </div>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                        </section>
                    </div>   
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
</asp:Content>
