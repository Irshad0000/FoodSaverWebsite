using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace FoodSaver
{
    public partial class DonateFood : Page  // Code-behind for Donate Food page - validates input, handles image upload and saves the donation
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)  // Make sure the user is logged in before showing the form
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                txtPickupDate.Text = DateTime.Now.ToString("yyyy-MM-dd"); // Pre-fill the pickup date with today's date as a default
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Show validation errors in red by default
            lblMsg.CssClass = "d-block mb-3 text-danger";

            // Check that all required fields have been filled in
            if (string.IsNullOrWhiteSpace(txtFoodName.Text) ||
                string.IsNullOrWhiteSpace(ddlFoodType.SelectedValue) ||
                string.IsNullOrWhiteSpace(txtQuantity.Text) ||
                string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                lblMsg.Text = "Please fill all required fields.";
                return;
            }

            // Handle image upload
            string imagePath = null;
            if (fileImage.HasFile)
            {
                try
                {
                    var ext = Path.GetExtension(fileImage.FileName).ToLower();
                    if (ext != ".jpg" && ext != ".jpeg" && ext != ".png")
                    {
                        lblMsg.Text = "Only JPG and PNG images are allowed.";
                        return;
                    }

                    if (fileImage.PostedFile.ContentLength > 5 * 1024 * 1024)
                    {
                        lblMsg.Text = "Image must be under 5 MB.";
                        return;
                    }

                    var folder = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

                    var fname = Guid.NewGuid().ToString("N") + ext;
                    fileImage.SaveAs(Path.Combine(folder, fname));
                    imagePath = "Uploads/" + fname;
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "Image upload failed: " + ex.Message;
                    return;
                }
            }

            var userId = Convert.ToInt32(Session["UserId"]);

            // Insert the new donation with a 'Pending' status so NGOs can see it
            DbHelper.ExecuteNonQuery(@"
                INSERT INTO Donations
                  (DonorId, FoodName, FoodType, Category, Quantity,
                   PickupDate, PickupTime, Address, Notes, ImagePath, Status)
                VALUES
                  (@d, @n, @t, @c, @q, @pd, @pt, @ad, @nt, @img, 'Pending')",
                new SqlParameter("@d", userId),
                new SqlParameter("@n", txtFoodName.Text.Trim()),
                new SqlParameter("@t", ddlFoodType.SelectedValue),
                new SqlParameter("@c", ddlFoodCategorySafe()),
                new SqlParameter("@q", txtQuantity.Text.Trim()),
                new SqlParameter("@pd", string.IsNullOrWhiteSpace(txtPickupDate.Text)
                                          ? (object)DBNull.Value
                                          : DateTime.Parse(txtPickupDate.Text)),
                new SqlParameter("@pt", txtPickupTime.Text.Trim()),
                new SqlParameter("@ad", txtAddress.Text.Trim()),
                new SqlParameter("@nt", txtNotes.Text.Trim()),
                new SqlParameter("@img", (object)imagePath ?? DBNull.Value));

            // Send the donor to the success page after the donation is saved
            Response.Redirect("DonateSuccess.aspx");
        }

        // Returns the selected category, or an empty string if none was chosen
        private string ddlFoodCategorySafe()
        {
            return string.IsNullOrEmpty(ddlCategory.SelectedValue)
                ? ""
                : ddlCategory.SelectedValue;
        }
    }
}