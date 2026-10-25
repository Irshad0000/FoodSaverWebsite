using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    // Code-behind for My Donations page - loads all donations made by the logged-in donor
    public partial class MyDonations : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)  // Only logged-in donors can view this page
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                var userId = Convert.ToInt32(Session["UserId"]);

                // Join donations with users to get the NGO name for claimed donations
                var dt = DbHelper.ExecuteQuery(@"
                    SELECT d.Id, d.FoodName, d.Quantity, d.Status, d.CreatedAt,
                           u.FullName AS NGOName
                    FROM Donations d
                    LEFT JOIN Users u ON u.Id = d.ClaimedByNGOId
                    WHERE d.DonorId = @u
                    ORDER BY d.CreatedAt DESC",
                    new SqlParameter("@u", userId));

                // Bind the donations list, or show the empty-state label if there are none
                if (dt.Rows.Count > 0)
                {
                    rptMy.DataSource = dt;
                    rptMy.DataBind();
                }
                else
                {
                    lblNone.Visible = true;
                }
            }
        }
    }
}