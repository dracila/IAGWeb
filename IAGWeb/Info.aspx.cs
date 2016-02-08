using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;

namespace IAGWeb
{
    public partial class Info : BaseContentPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            base.ContentFile = "InfoSource";
            base.ViewDiv = this.ViewDiv;
            base.ViewPanel = this.ViewPanel;
            base.EditPanel = this.EditPanel;
            base.CKEditor = this.CKEditor1;
            base.UpdateButton = this.UpdateButton;

            if (!IsPostBack)
            {
                InitializeControls();
                LoadInfo();
            }
        }

    }
}