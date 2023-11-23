using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class SubmitEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        //"Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\semTask2\\Assignment\\App_Data\\Database.mdf;Integrated Security=True"
        protected void btnEmailSubmit_Click(object sender, EventArgs e)
        {
            string userEmail = txtEmailSubmit.Value.Trim();

            int userId = GenerateUniqueUserId();

            string userIpAddress = GetUserIpAddress();

            // Check if the email already exists in the database
            if (!IsEmailAlreadyExists(userEmail))
            {
                // Email is unique; you can now save it to the database
                SaveEmailToDatabase(userId, userEmail, userIpAddress);
                Response.Write("Email submitted successfully.");
            }
            else
            {
                Response.Write("Email already exists in the database.");
            }
        }

        private int GenerateUniqueUserId()
        {
            Random random = new Random();
            return random.Next(1, 10000);
        }

        private string GetUserIpAddress()
        {

            string userIpAddress = Request.UserHostAddress;
            return userIpAddress;
        }

        private bool IsEmailAlreadyExists(string email)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;Integrated Security=True"))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM [User] WHERE email = @email";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@email", email);

                int count = (int)command.ExecuteScalar();

                connection.Close();

                return count > 0;
            }
        }

        private void SaveEmailToDatabase(int userID, string email, string ip)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;Integrated Security=True"))
            {
                connection.Open();

                string query = "INSERT INTO [User] (email, ip) VALUES (@email, @ip)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@userID", userID);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@ip", ip);

                command.ExecuteNonQuery();

                connection.Close();
            }
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            // Get the TextBox controls from the InsertItemTemplate
            TextBox emailTextBox = (TextBox)fvSubmitTicket.FindControl("emailTextBox");
            TextBox subjectTextBox = (TextBox)fvSubmitTicket.FindControl("subjectTextBox");
            TextBox contentTextBox = (TextBox)fvSubmitTicket.FindControl("contentTextBox");

            // Validate the email against the User table
            string userEmail = emailTextBox.Text.Trim();
            int userID = GetUserIDFromEmail(userEmail);


            if (userID == 0)
            {
                // Email doesn't exist in the User table, handle the error

                e.Cancel = true;

                // errorLabel.Text = "Email not found in our records.";
                return;
            }

            // You can generate a unique ticket ID as per your requirements
            Guid ticketID = GenerateUniqueTicketID();
            Guid? adminID = null;



            // Set the default values and the generated values
            e.Values["ticketID"] = ticketID;
            e.Values["status"] = "Pending"; // Set the default status
            e.Values["createDate"] = DateTime.Now; // Set the create date
            e.Values["archivedDate"] = DBNull.Value; // No archiving initially
            e.Values["userID"] = userID; // Assign the userID
            e.Values["adminID"] = DBNull.Value; ;

            // Insert the data into the database using SQL
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;Integrated Security=True"; // Replace with your database connection string

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Ticket (ticketID, subject, content, status, createDate, archieveDate, userID, adminID) " +
                               "VALUES (@ticketID, @subject, @content, @status, @createDate, @archivedDate, @userID, @adminID)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ticketID", ticketID);
                    command.Parameters.AddWithValue("@subject", subjectTextBox.Text.Trim());
                    command.Parameters.AddWithValue("@content", contentTextBox.Text.Trim());
                    command.Parameters.AddWithValue("@status", "Pending");
                    command.Parameters.AddWithValue("@createDate", DateTime.Now);
                    command.Parameters.AddWithValue("@archivedDate", DBNull.Value);
                    command.Parameters.AddWithValue("@userID", userID);
                    command.Parameters.AddWithValue("@adminID", DBNull.Value); // Set adminID to DBNull.Value

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }

        }

        private Guid GenerateUniqueTicketID()
        {
            return Guid.NewGuid();
        }

        private int GetUserIDFromEmail(string email)
        {

            int userID = 0; // Initialize with a default value


            using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\huezh\\Desktop\\SEM\\Assignment\\App_Data\\Database.mdf;Integrated Security=True"))
            {
                string query = "SELECT userID FROM [User] WHERE email = @Email";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    userID = (int)command.ExecuteScalar();
                    connection.Close();
                }
            }

            return userID;
        }

    }
}