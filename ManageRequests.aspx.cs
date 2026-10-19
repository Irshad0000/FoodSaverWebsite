using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSaver
{
    public partial class ManageRequests : Page
    {
        private string CurrentStatus
        {
            get { return ViewState["Status"] as string ?? ""; }
            set { ViewState["Status"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Convert.ToString(Session["Role"]) != "Admin")
            {
                Response.Redirect("Login.aspx");
                return;
            }
            Bind();
        }

        protected string TabClass(string status)
        {
            return CurrentStatus == status ? "active" : "";
        }

        protected void Tab_Click(object sender, EventArgs e)
        {
            var lb = (LinkButton)sender;
            CurrentStatus = Convert.ToString(lb.CommandArgument);
            Bind();
        }

        private void Bind()
        {
            var search = txtSearch.Text.Trim();

            var sql = @"
                SELECT r.*, u.FullName AS RequesterName
                FROM Requests r
                LEFT JOIN Users u ON u.Id = r.RequestedByUserId
                WHERE (@s = '' OR u.FullName LIKE '%' + @s + '%' OR r.FoodType LIKE '%' + @s + '%')
                  AND (@st = '' OR r.Status = @st)
                ORDER BY r.CreatedAt DESC";

            var dt = DbHelper.ExecuteQuery(sql,
                new SqlParameter("@s", search),
                new SqlParameter("@st", CurrentStatus));

            if (dt.Rows.Count > 0)
            {
                rptRequests.DataSource = dt;
                rptRequests.DataBind();
                lblShowing.Text = "Showing " + dt.Rows.Count + " entries";
                lblNone.Visible = false;
            }
            else
            {
                lblNone.Visible = true;
                lblShowing.Text = "";
            }
        }
    }
}