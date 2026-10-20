using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FoodSaver
{
    public partial class Contact : Page
    {
        private string ConnectionString
        {
            get
            {
                return ConfigurationManager
                    .ConnectionStrings["FoodSaverDb"]
                    .ConnectionString;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindContactMessages();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            Page.Validate("ContactForm");

            if (!Page.IsValid)
                return;

            string sql = @"
                INSERT INTO ContactMessages
                    ([Name], [Email], [Message])
                VALUES
                    (@Name, @Email, @Message)";

            try
            {
                using (SqlConnection con =
                    new SqlConnection(ConnectionString))
                using (SqlCommand cmd =
                    new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add(
                        "@Name", SqlDbType.NVarChar, 100
                    ).Value = txtName.Text.Trim();

                    cmd.Parameters.Add(
                        "@Email", SqlDbType.NVarChar, 150
                    ).Value = txtEmail.Text.Trim();

                    cmd.Parameters.Add(
                        "@Message", SqlDbType.NVarChar, -1
                    ).Value = txtMsg.Text.Trim();

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMsg.CssClass = "text-success d-block mb-2";
                lblMsg.Text =
                    "Thank you! Your message was submitted successfully.";

                txtName.Text = "";
                txtEmail.Text = "";
                txtMsg.Text = "";

                BindContactMessages();
            }
            catch (Exception)
            {
                lblMsg.CssClass = "text-danger d-block mb-2";
                lblMsg.Text =
                    "Unable to save your message. Please check your database table and connection.";
            }
        }

        private void BindContactMessages()
        {
            string sql = @"
                SELECT Id, [Name], [Email], [Message], CreatedAt
                FROM ContactMessages
                ORDER BY CreatedAt DESC";

            try
            {
                using (SqlConnection con =
                    new SqlConnection(ConnectionString))
                using (SqlDataAdapter da =
                    new SqlDataAdapter(sql, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvContacts.DataSource = dt;
                    gvContacts.DataBind();
                }
            }
            catch (Exception)
            {
                gvContacts.DataSource = null;
                gvContacts.DataBind();
            }
        }
    }
}