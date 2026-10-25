using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    // Code-behind for Request Food page - validates input and saves a new food request
    public partial class RequestFood : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)  // Only logged-in users can submit a food request
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Pre-fill the required date with today's date as a default
                txtRequiredDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Show validation errors in red by default
            lblMsg.CssClass = "d-block mb-3 text-danger";

            // Check that all required fields have been filled in
            if (string.IsNullOrWhiteSpace(ddlFoodType.SelectedValue) ||
                string.IsNullOrWhiteSpace(txtQuantity.Text) ||
                string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                lblMsg.Text = "Please fill all required fields.";
                return;
            }

            // Work out the urgency level from the selected radio button
            var urgency = rbHigh.Checked ? "High"
                        : rbMedium.Checked ? "Medium"
                        : "Low";

            var userId = Convert.ToInt32(Session["UserId"]);

            DbHelper.ExecuteNonQuery(@"
                INSERT INTO Requests
                  (RequestedByUserId, FoodType, Category, Quantity,
                   RequiredDate, Address, Notes, Urgency, Status)
                VALUES
                  (@u, @t, @c, @q, @rd, @ad, @n, @ur, 'Pending')",
                new SqlParameter("@u", userId),
                new SqlParameter("@t", ddlFoodType.SelectedValue),
                new SqlParameter("@c", string.IsNullOrEmpty(ddlCategory.SelectedValue)
                                          ? (object)DBNull.Value
                                          : ddlCategory.SelectedValue),
                new SqlParameter("@q", txtQuantity.Text.Trim()),
                new SqlParameter("@rd", string.IsNullOrWhiteSpace(txtRequiredDate.Text)
                                          ? (object)DBNull.Value
                                          : DateTime.Parse(txtRequiredDate.Text)),
                new SqlParameter("@ad", txtAddress.Text.Trim()),
                new SqlParameter("@n", txtNotes.Text.Trim()),
                new SqlParameter("@ur", urgency));

            // Send the user to the success page after the request is saved
            Response.Redirect("RequestSuccess.aspx");
        }
    }
}