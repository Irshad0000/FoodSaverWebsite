using System;
using System.Web.UI;

namespace FoodSaver
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) || string.IsNullOrWhiteSpace(txtMsg.Text))
            {
                lblMsg.CssClass = "text-danger d-block mb-2";
                lblMsg.Text = "Please fill in your name and message.";
                return;
            }

            lblMsg.CssClass = "text-success d-block mb-2";
            lblMsg.Text = "Thanks! We'll get back to you shortly.";
            txtName.Text = "";
            txtEmail.Text = "";
            txtMsg.Text = "";
        }
    }
}