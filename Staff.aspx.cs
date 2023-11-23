using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Staff : System.Web.UI.Page
    {
        private int CurrentPage
        {
            get { return ViewState["CurrentPage"] != null ? Convert.ToInt32(ViewState["CurrentPage"]) : 1; }
            set { ViewState["CurrentPage"] = value; }
        }

        private void LoadData()
        {
            string sortBy = ddl_staff_sort.SelectedValue;
            string searchKeyword = txt_search.Text.Trim();

            string sql = "SELECT " +
                         "[staffID], [staffName], [staffPosition], [staffRoles], [staffDepartment], " +
                         "[staffQualification], [staffEmail], [staffMajorOfStudy], [staffAreaOfInterest], " +
                         "[staffProfilePicture] " +
                         "FROM [dbo].[Staff] ";

            if (sortBy != "Faculty of Computing And Information Technology")
            {
                lblCurrentDepartment.Text = sortBy.ToUpper();
                sql += "WHERE staffDepartment = @selectedDepartment ";
            }
            else
            {
                lblCurrentDepartment.Text = "";
            }

            if (!string.IsNullOrEmpty(searchKeyword))
            {
                if (sortBy != "Faculty of Computing And Information Technology")
                {
                    sql += " AND ";
                }
                else
                {
                    sql += " WHERE ";

                }
                sql += "staffName LIKE @searchKeyword ";
            }

            sql += "ORDER BY [staffID] " +
                   "OFFSET @StartRowIndex ROWS " +
                   "FETCH NEXT 6 ROWS ONLY";

            int startRowIndex = (CurrentPage - 1) * 6;

            string constr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    if (sortBy != "Faculty of Computing And Information Technology")
                    {
                        cmd.Parameters.AddWithValue("@selectedDepartment", sortBy);
                    }

                    if (!string.IsNullOrEmpty(searchKeyword))
                    {
                        cmd.Parameters.AddWithValue("@searchKeyword", "%" + searchKeyword + "%");
                    }

                    cmd.Parameters.AddWithValue("@StartRowIndex", startRowIndex);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        rptImages.DataSource = dt;
                        rptImages.DataBind();
                    }
                }
            }
        }





        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblSearchMessage.Text = "";
                LoadData();
                UpdatePager();
            }
        }

        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 1;
            LoadData();
            UpdatePager();
        }

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            if (CurrentPage > 1)
            {
                CurrentPage--;
                LoadData();
                UpdatePager();
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            int TotalPages = GetTotalPages();

            if (CurrentPage < TotalPages)
            {
                CurrentPage++;
                LoadData();
                UpdatePager();
            }
        }

        protected void lnkLast_Click(object sender, EventArgs e)
        {
            int TotalPages = GetTotalPages();

            CurrentPage = TotalPages;
            LoadData();
            UpdatePager();
        }

        private void UpdatePager()
        {
            int TotalPages = GetTotalPages();

            lblPager.Text = $"Page {CurrentPage} of {TotalPages}";

            lnkFirst.Enabled = CurrentPage > 1;
            lnkPrev.Enabled = CurrentPage > 1;
            lnkNext.Enabled = CurrentPage < TotalPages;
            lnkLast.Enabled = CurrentPage < TotalPages;
        }

        private int GetTotalPages()
        {
            int totalRecords = GetTotalRecordsAfterSorting();
            return totalRecords > 0 ? (int)Math.Ceiling((double)totalRecords / 6) : 1;
        }

        private int GetTotalRecordsAfterSorting()
        {
            string sortBy = ddl_staff_sort.SelectedValue;
            string searchKeyword = txt_search.Text.Trim();

            string sql = "SELECT COUNT(*) FROM [dbo].[Staff] ";

            if (sortBy != "Faculty of Computing And Information Technology")
            {
                sql += "WHERE staffDepartment = @selectedDepartment ";
            }

            if (!string.IsNullOrEmpty(searchKeyword))
            {
                if (sortBy != "Faculty of Computing And Information Technology")
                {
                    sql += " AND ";
                }
                else
                {
                    sql += " WHERE ";
                }
                sql += "(staffName LIKE @searchKeyword OR staffPosition LIKE @searchKeyword) ";
            }

            string constr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    if (sortBy != "Faculty of Computing And Information Technology")
                    {
                        cmd.Parameters.AddWithValue("@selectedDepartment", sortBy);
                    }

                    if (!string.IsNullOrEmpty(searchKeyword))
                    {
                        cmd.Parameters.AddWithValue("@searchKeyword", "%" + searchKeyword + "%");
                    }

                    conn.Open();
                    int totalRecords = (int)cmd.ExecuteScalar();

                    return totalRecords;
                }
            }
        }


        //private int GetTotalStaffCount()
        //{
        //    string sql = "SELECT COUNT(*) FROM [dbo].[Staff]";

        //    string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //    using (SqlConnection conn = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand(sql, conn))
        //        {
        //            conn.Open();
        //            return (int)cmd.ExecuteScalar();
        //        }
        //    }
        //}

        protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = e.Item.DataItem as DataRowView;
                string imageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["staffProfilePicture"]);
                (e.Item.FindControl("Image1") as Image).ImageUrl = imageUrl;
            }
        }

        protected void ddl_staff_sort_SelectedIndexChanged(object sender, EventArgs e)
        {
            CurrentPage = 1; // Reset current page to 1
            LoadData();
            UpdatePager(); // Update the pager after sorting
            rptImages.Visible = true;
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            CurrentPage = 1; // Reset current page to 1
            LoadData();
            UpdatePager(); // Update the pager after searching
            rptImages.Visible = true;
        }


    }
}
