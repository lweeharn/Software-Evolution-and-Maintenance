using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class CompareDiploma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnCompare_Click(object sender, EventArgs e)
        {
            string program1 = ddlProgram1.SelectedValue;
            string program2 = ddlProgram2.SelectedValue;

            // Set program names in the table headers
            lblProgram1Name.Text = !string.IsNullOrEmpty(program1) ? program1 : "Programme";
            lblProgram2Name.Text = !string.IsNullOrEmpty(program2) ? program2 : "Programme";

            // Set program details for Program 1
            lblDuration1.Text = GetProgramDetail(program1, "Duration");
            lblCampus1.Text = GetProgramDetail(program1, "Campus");
            lblIntake1.Text = GetProgramDetail(program1, "Intake");
            lblCareersProspects1.Text = GetProgramDetail(program1, "Careers Prospects");
            lblFees1.Text = GetProgramDetail(program1, "Fees");

            // Set program details for Program 2
            lblDuration2.Text = GetProgramDetail(program2, "Duration");
            lblCampus2.Text = GetProgramDetail(program2, "Campus");
            lblIntake2.Text = GetProgramDetail(program2, "Intake");
            lblCareersProspects2.Text = GetProgramDetail(program2, "Careers Prospects");
            lblFees2.Text = GetProgramDetail(program2, "Fees");
        }

        private string GetProgramDetail(string program, string detailType)
        {

            switch (program)
            {
                case "Diploma in Computer Science":
                    switch (detailType)
                    {
                        case "Duration":
                            return "2 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus<br/>PG - Penang Branch Campus<br/>JH - Johor Branch Campus";
                        case "Intake":
                            return "June";
                        case "Careers Prospects":
                            return "Junior Analyst Programmers<br/>Junior Systems Analysts<br/>Junior Software Engineers<br/>Junior Systems Engineers<br/>Junior Research Officers<br/>Junior Quantitative Analysts<br/>Junior Software Developers";
                        case "Fees":
                            return "RM 17,600 (Malaysian Student)<br/>RM33,300 (International Student)";
                        default:
                            return "N/A";
                    }
                case "Diploma in Information Systems":
                    switch (detailType)
                    {
                        case "Duration":
                            return "2 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus<br/>PG - Penang Branch Campus<br/>PK - Perak Branch Campus";
                        case "Intake":
                            return "June";
                        case "Careers Prospects":
                            return "Junior Programmers<br/>Junior Systems Analysts<br/>Junior SAP Support Consultants<br/>Junior IT Support Executives<br/>Junior IT Executives";
                        case "Fees":
                            return "RM 17,800 (Malaysian Student)<br/>RM33,600 (International Student)";
                        default:
                            return "N/A";
                    }
                case "Diploma in Information Technology":
                    switch (detailType)
                    {
                        case "Duration":
                            return "2 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus<br/>PG - Penang Branch Campus<br/>PK - Perak Branch Campus<br/>JH - Johor Branch Campus<br/>PH - Pahang Branch<br/>SB - Sabah Branch";
                        case "Intake":
                            return "June";
                        case "Careers Prospects":
                            return "Junior Programmers<br/>Junior Systems Analysts<br/>Junior Network Support Officers<br/>Junior IT Support Executives<br/>Junior IT Executives<br/>Web Developer";
                        case "Fees":
                            return "RM 17,800 (Malaysian Student)<br/>RM33,600 (International Student)";
                        default:
                            return "N/A";
                    }
                case "Diploma in Software Engineering":
                    switch (detailType)
                    {
                        case "Duration":
                            return "2 years";
                        case "Campus":
                            return "SB - Sabah Branch";
                        case "Intake":
                            return "June";
                        case "Careers Prospects":
                            return "Junior Software Engineers<br/>Junior Software Developers<br/>Junior Software Testers<br/>Junior Web Developers<br/>Junior Database Administrators<br/>Junior Systems Analysts";
                        case "Fees":
                            return "RM 17,800 (Malaysian Student)";
                        default:
                            return "N/A";
                    }
                default:
                    return "N/A";
            }
        }
    }
}