﻿using IAGWeb.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Owin;

namespace IAGWeb.Admin
{
    public partial class Roles : BaseDataPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                DisplayRolesInGrid();
        }

        private void DisplayRolesInGrid()
        {
            RoleList.DataSource = RoleManager.Roles.ToArray();
            RoleList.DataBind();
        }

        protected void CreateRoleButton_Click(object sender, EventArgs e)
        {
            string newRoleName = RoleName.Text.Trim();

            if (!RoleManager.RoleExists(newRoleName))
            {
                // Create the role
                RoleManager.Create(new IdentityRole { Name = newRoleName });

                // Refresh the RoleList Grid
                DisplayRolesInGrid();
            }

            RoleName.Text = string.Empty;
        }

        protected void RoleList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the RoleNameLabel
            Label RoleNameLabel = RoleList.Rows[e.RowIndex].FindControl("RoleNameLabel") as Label;

            // Delete the role
            var role = RoleManager.FindByName(RoleNameLabel.Text);

            RoleManager.Delete(role);

            // Rebind the data to the RoleList grid
            DisplayRolesInGrid();
        }
    }

}