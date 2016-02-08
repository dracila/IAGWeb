using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IAGWeb
{
    public partial class Collective : BaseContentPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.ContentFile = "CollectiveSource";
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