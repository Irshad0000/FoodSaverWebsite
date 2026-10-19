using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSaver
{
    public partial class ManageUsers : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Convert.ToString(Session["Role"]) != "Admin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack) Bind();
        }

        protected void Filter_Changed(object sender, EventArgs e)
        {
            Bind();
        }

        private void Bind()
        {
            var search = txtSearch.Text.Trim();
            var role = ddlRoleFilter.SelectedValue;

            var sql = @"SELECT * FROM Users
                        WHERE (@s = '' OR FullName LIKE '%' + @s + '%' OR Email LIKE '%' + @s + '%')
                          AND (@r = '' OR Role = @r)
                        ORDER BY JoinedOn DESC";

            var dt = DbHelper.ExecuteQuery(sql,
                new SqlParameter("@s", search),
                new SqlParameter("@r", role));

            if (dt.Rows.Count > 0)
            {
                rptUsers.DataSource = dt;
                rptUsers.DataBind();
                lblShowing.Text = "Showing " + dt.Rows.Count + " user" + (dt.Rows.Count == 1 ? "" : "s");
                lblNone.Visible = false;
            }
            else
            {
                lblNone.Visible = true;
                lblShowing.Text = "";
            }
        }

        protected void rptUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Toggle")
            {
                var id = Convert.ToInt32(e.CommandArgument);
                // Don't let admin disable themselves
                if (id == Convert.ToInt32(Session["UserId"]))
                {
                    lblMsg.CssClass = "d-block mb-3 text-danger";
                    lblMsg.Text = "You cannot disable your own admin account.";
                    return;
                }

                DbHelper.ExecuteNonQuery("UPDATE Users SET IsActive = CASE WHEN IsActive = 1 THEN 0 ELSE 1 END WHERE Id=@u",
                    new SqlParameter("@u", id));

                lblMsg.CssClass = "d-block mb-3 text-success";
                lblMsg.Text = "User status updated.";
                Bind();
            }
        }
    }
}