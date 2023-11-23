using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Assignment.AdResponseTicket;

namespace Assignment
{
    public partial class ViewTicket : System.Web.UI.Page
    {


        protected void btnEmailSearch_Click(object sender, EventArgs e)
        {
            // Get the user's input email
            string userEmail = searchEmail.Value.Trim();

            // Find UserID associated with the email
            int userID = GetUserIDByEmail(userEmail);

            if (userID > 0)
            {
                // UserID found, retrieve and display Ticket data
                BindTicketData(userID);
                lblEmailSearch.Text = "User ID: " + userID;
            }
            else
            {
                lblEmailSearch.Text = "Email not found in our records.";
                // Clear FormView if no data found
                gvTickets.DataSource = null;
                gvTickets.DataBind();
            }
        }

        private int GetUserIDByEmail(string email)
        {
            int userID = 0;

            // Use your database connection string here
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT userID FROM [User] WHERE email = @Email";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

                object result = command.ExecuteScalar();

                if (result != null && int.TryParse(result.ToString(), out userID))
                {
                    lblEmailSearch.Text = "Email found.";
                }

                connection.Close();
            }

            return userID;
        }

        private void BindTicketData(int userID)
        {
            // Use your database connection string here
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;" +
                "Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT ticketID, subject, content, status, createDate FROM Ticket WHERE userID = @UserID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserID", userID);

                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dt);

                gvTickets.DataSource = dt;
                gvTickets.DataBind();

                connection.Close();
            }
        }

        protected void gvTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Check if a row is selected
            if (gvTickets.SelectedIndex >= 0)
            {
                // Get the selected row
                GridViewRow row = gvTickets.SelectedRow;

                // Retrieve ticketID and userID from the selected row
                string ticketID = row.Cells[0].Text; // Assuming ticketID is in the second cell
                string subject = row.Cells[1].Text;
                string content = row.Cells[2].Text;
                string status = row.Cells[3].Text;


                // Redirect to another page with the ticketID and userID as query parameters
                Response.Redirect($"ResponseTicket.aspx?ticketID={ticketID}&subject={subject}&content={content}&status={status}");

            }

        }
    }
}