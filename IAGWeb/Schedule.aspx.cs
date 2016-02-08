using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System.IO;

namespace IAGWeb
{
    public partial class Schedule : BaseDataPage
    {
        private string _schedulesFolder;

        protected void Page_Load(object sender, EventArgs e)
        {
            _schedulesFolder = Server.MapPath("Schedules");

            if (!IsPostBack)
            {
                InitializeControls();
                if (string.IsNullOrWhiteSpace(Request.QueryString["name"]))
                {
                    LoadSchedules(true);
                }
                else
                {
                    var fileName = Path.Combine(_schedulesFolder, Request.QueryString["name"]);
                    LoadSchedules(false);
                    LoadSchedule(new FileInfo(fileName));
                }
            }
        }

        private void LoadSchedules(bool loadFirst = false)
        {
            // create folder if not exists
            if (!Directory.Exists(_schedulesFolder))
            {
                Directory.CreateDirectory(_schedulesFolder);
            }
            else
            {
                var files = Directory.GetFiles(_schedulesFolder).Select(f => new FileInfo(f)).OrderBy(f => f.Name).ToArray();
                rptSchedules.DataSource = files;
                rptSchedules.DataBind();
                if (loadFirst)
                {
                    if (files.Length > 0)
                    {
                        LoadSchedule(files[0]);
                    }
                    else
                    {
                        LoadSchedule(null);
                    }
                }
            }
        }

        private void LoadSchedule(FileInfo file)
        {
            if (file!= null && file.Exists)
            {
                lblCurrentSchedule.Text = file.Name;
                ViewDiv.InnerHtml = File.ReadAllText(file.FullName);
            }
            else
            {
                lblCurrentSchedule.Text = string.Empty;
                ViewDiv.InnerHtml = string.Empty;
            }
        }

        private void InitializeControls()
        {
            ViewPanel.Visible = true;
            EditPanel.Visible = false;
            AdminPanel.Visible = LoggedInUserId != null && (UserManager.IsInRole(LoggedInUserId, "Admin") || UserManager.IsInRole(LoggedInUserId, "Professor"));
            UpdateButton.CommandArgument = "update";
        }

        protected void AdminButton_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            switch (button.CommandName)
            {
                case "add":
                    try
                    {
                        var fileName = Path.Combine(_schedulesFolder, txtNewSchedule.Text);
                        if (File.Exists(fileName))
                        {
                            lblStatus.Text = "There is already an schedule with this name.";
                        }
                        else
                        {
                            File.Create(fileName).Close();
                            LoadSchedules();
                            LoadSchedule(new FileInfo(fileName));
                            txtNewSchedule.Text = string.Empty;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblStatus.Text = "The schedule could not be added! " + ex.ToString();
                    }
                    break;
                case "delete":
                    if (!string.IsNullOrEmpty(lblCurrentSchedule.Text))
                    {
                        try
                        {
                            File.Delete(Path.Combine(_schedulesFolder, lblCurrentSchedule.Text));
                            LoadSchedules(true);
                        }
                        catch (Exception ex)
                        {
                            lblStatus.Text = "The schedule could not be deleted! " + ex.ToString();
                        }
                    }
                    break;
                case "update":
                    if (!string.IsNullOrEmpty(lblCurrentSchedule.Text))
                    {
                        switch (button.CommandArgument)
                        {
                            case "update":
                                ViewPanel.Visible = false;
                                EditPanel.Visible = true;
                                UpdateButton.CommandArgument = "save";
                                CKEditor1.Text = File.ReadAllText(Path.Combine(_schedulesFolder, lblCurrentSchedule.Text));
                                break;
                            case "save":
                                ViewPanel.Visible = true;
                                EditPanel.Visible = false;
                                UpdateButton.CommandArgument = "update";
                                File.WriteAllText(Path.Combine(_schedulesFolder, lblCurrentSchedule.Text), CKEditor1.Text);
                                ViewDiv.InnerHtml = CKEditor1.Text;
                                break;
                        }
                    }
                    break;
            }
        }
        
        protected void btnSelectSchedule_Click(object sender, EventArgs e)
        {
            var button = sender as Button;
            LoadSchedule(new FileInfo(button.CommandArgument));
        }
    }
}