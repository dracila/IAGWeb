using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;

namespace IAGWeb
{
    public class BaseContentPage : BaseDataPage
    {
        public string ContentFile{ get;  protected set; }
        public System.Web.UI.WebControls.Button UpdateButton { get; protected set; }
        public System.Web.UI.WebControls.Panel ViewPanel { get; protected set; }
        public System.Web.UI.WebControls.Panel EditPanel { get; protected set; }
        public CKEditor.NET.CKEditorControl CKEditor { get; protected set; }
        public System.Web.UI.HtmlControls.HtmlGenericControl ViewDiv { get; protected set; }

        protected void LoadInfo()
        {
            var filePath = Server.MapPath(ContentFile);
            if (!File.Exists(filePath))
            {
                File.Create(filePath).Close();
            }
            ViewDiv.InnerHtml = File.ReadAllText(filePath);
        }

        protected void InitializeControls()
        {
            ViewPanel.Visible = true;
            EditPanel.Visible = false;
            UpdateButton.Visible = LoggedInUserId != null && (UserManager.IsInRole(LoggedInUserId, "Admin") || UserManager.IsInRole(LoggedInUserId, "Professor"));
            UpdateButton.CommandArgument = "update";
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            switch (UpdateButton.CommandArgument)
            {
                case "update":
                    ViewPanel.Visible = false;
                    EditPanel.Visible = true;
                    UpdateButton.CommandArgument = "save";
                    CKEditor.Text = File.ReadAllText(Server.MapPath(ContentFile));
                    break;
                case "save":
                    ViewPanel.Visible = true;
                    EditPanel.Visible = false;
                    UpdateButton.CommandArgument = "update";
                    File.WriteAllText(Server.MapPath(ContentFile), CKEditor.Text);
                    ViewDiv.InnerHtml = CKEditor.Text;
                    break;
            }
        }

    }
}