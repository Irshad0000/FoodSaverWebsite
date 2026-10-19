using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class MyDonations : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                var userId = Convert.ToInt32(Session["UserId"]);

                var dt = DbHelper.ExecuteQuery(@"
                    SELECT d.Id, d.FoodName, d.Quantity, d.Status, d.CreatedAt,
                           u.FullName AS NGOName
                    FROM Donations d
                    LEFT JOIN Users u ON u.Id = d.ClaimedByNGOId
                    WHERE d.DonorId = @u
                    ORDER BY d.CreatedAt DESC",
                    new SqlParameter("@u", userId));

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