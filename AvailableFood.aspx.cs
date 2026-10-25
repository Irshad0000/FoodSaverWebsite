using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodSaver
{
    // Code-behind for AvailableFood page - lists pending donations and lets the user claim one
    public partial class AvailableFood : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only logged-in users can view available food
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            // Load the food list only on first page load, not on postbacks
            if (!IsPostBack) Bind();
        }

        private void Bind()  // Fetches all pending donations except the current user's own, newest first
        {
            var userId = Convert.ToInt32(Session["UserId"]);
            var dt = DbHelper.ExecuteQuery(   // Exclude the user's own donations so they can't claim their own food
                "SELECT * FROM Donations WHERE Status='Pending' AND DonorId<>@u ORDER BY CreatedAt DESC",
                new SqlParameter("@u", userId));

            // Bind results to the repeater, or show the empty-state label if nothing is available
            if (dt.Rows.Count > 0)
            {
                rptFood.DataSource = dt;
                rptFood.DataBind();
            }
            else
            {
                lblNone.Visible = true;
            }
        }

        protected void Claim_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            var donationId = Convert.ToInt32(btn.CommandArgument);
            var userId = Convert.ToInt32(Session["UserId"]);

            // Mark donation as claimed by the current user
            DbHelper.ExecuteNonQuery(
                "UPDATE Donations SET Status='Completed', ClaimedByNGOId=@n WHERE Id=@d",
                new SqlParameter("@n", userId),
                new SqlParameter("@d", donationId));

            // Take the user to their donations page after a successful claim
            Response.Redirect("MyDonations.aspx");
        }
    }
}