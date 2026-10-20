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
            if (!Page.IsValid) return;

            // Save to database. Assumes a table named Contacts (Name, Email, Message, CreatedAt)
            try
            {
                var sql = "INSERT INTO Contacts([yourname],[email],[message]) VALUES(@name,@email,CONVERT(varbinary(150), @msg))";
                var prms = new System.Data.SqlClient.SqlParameter[] {
                    new System.Data.SqlClient.SqlParameter("@name", txtName.Text.Trim()),
                    new System.Data.SqlClient.SqlParameter("@email", string.IsNullOrWhiteSpace(txtEmail.Text)? (object)DBNull.Value : txtEmail.Text.Trim()),
                    new System.Data.SqlClient.SqlParameter("@msg", txtMsg.Text.Trim())
                };

                DbHelper.ExecuteNonQuery(sql, prms);

                lblMsg.CssClass = "text-success d-block mb-2";
                lblMsg.Text = "Thanks! We'll get back to you shortly.";
                txtName.Text = "";
                txtEmail.Text = "";
                txtMsg.Text = "";
            }
            catch (Exception ex)
            {
                // Log the exception to App_Data so the developer can inspect the cause.
                try
                {
                    var logPath = Server.MapPath("~/App_Data/ContactErrors.log");
                    var log = $"[{DateTime.UtcNow:u}] Error inserting contact. Name={txtName.Text}, Email={txtEmail.Text}\n{ex}\n";
                    System.IO.File.AppendAllText(logPath, log);
                }
                catch { /* ignore logging errors */ }

                lblMsg.CssClass = "text-danger d-block mb-2";
                lblMsg.Text = "An error occurred while sending your message. The error has been logged.";
            }
        }

    }
}