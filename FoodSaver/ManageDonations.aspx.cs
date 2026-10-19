using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class ManageDonations : Page
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
            var status = ddlStatus.SelectedValue;

            var sql = @"
                SELECT d.*, 
                       don.FullName AS DonorName,
                       ngo.FullName AS NGOName
                FROM Donations d
                LEFT JOIN Users don ON don.Id = d.DonorId
                LEFT JOIN Users ngo ON ngo.Id = d.ClaimedByNGOId
                WHERE (@s = '' OR d.FoodName LIKE '%' + @s + '%')
                  AND (@st = '' OR d.Status = @st)
                ORDER BY d.CreatedAt DESC";

            var dt = DbHelper.ExecuteQuery(sql,
                new SqlParameter("@s", search),
                new SqlParameter("@st", status));

            if (dt.Rows.Count > 0)
            {
                rptDonations.DataSource = dt;
                rptDonations.DataBind();
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