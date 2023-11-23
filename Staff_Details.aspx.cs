using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Staff_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                string staffID = Request.QueryString["staffID"];
                string connectionString = constr; //replace with your connection string
                string query = "select * from dbo.Staff where dbo.Staff.staffID=@staffID;";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@staffID", staffID);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        string staffName = reader["staffName"].ToString();
                        string staffPosition = reader["staffPosition"].ToString();
                        string staffDepartment = reader["staffDepartment"].ToString();
                        string staffRoles = reader["staffRoles"].ToString();
                        string staffQualification = reader["staffQualification"].ToString();
                        string staffEmail = reader["staffEmail"].ToString();
                        string staffMajorOfStudy = reader["staffMajorOfStudy"].ToString();
                        string staffAreaOfInterest = reader["staffAreaOfInterest"].ToString();
                        //set the product details to your label controls
                        lblStaffName.Text = staffName;
                        lblStaffPosition.Text = staffPosition;
                        lblStaffDepartment.Text = staffDepartment;
                        lblStaffRoles.Text = staffRoles;
                        lblStaffQualification.Text = staffQualification;
                        lblStaffEmail.Text = staffEmail;
                        lblStaffMajorOfStudy.Text = staffMajorOfStudy;
                        lblStaffAreaOfStudy.Text = staffAreaOfInterest;

                        Image1.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])reader["staffProfilePicture"]);
                    }
                    reader.Close();
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Staff.aspx");
        }
    }
}