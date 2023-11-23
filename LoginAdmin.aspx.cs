using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            if (AuthenticateUser(email, password))
            {
                // Redirect to the dashboard upon successful login
                Response.Redirect("Admin.aspx");
            }
            else
            {
                // Display an error message for failed login
                // You can show an error message label or handle it as per your UI design
                lblErrorLogin.Text = "Invalid email or password. Please try again.";
            }
        }

        private bool AuthenticateUser(string email, string password)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM Admin WHERE Email = @Email AND Password = @Password";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    int result = (int)command.ExecuteScalar();

                    if (result == 1)
                    {
                        // Authentication successful
                        return true;
                    }
                }
            }

            // Authentication failed
            return false;
        }
    }
}