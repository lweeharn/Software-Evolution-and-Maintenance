using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class CompareDoctor : System.Web.UI.Page
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

            // Set program details for Program 2
            lblDuration2.Text = GetProgramDetail(program2, "Duration");
            lblCampus2.Text = GetProgramDetail(program2, "Campus");
            lblIntake2.Text = GetProgramDetail(program2, "Intake");
            lblCareersProspects2.Text = GetProgramDetail(program2, "Careers Prospects");
        }

        private string GetProgramDetail(string program, string detailType)
        {

            switch (program)
            {
                case "Doctor of Philosophy (Computer Science)":
                    switch (detailType)
                    {
                        case "Duration":
                            return "Full time (Malaysian & International students) - 3 years<br/>Part time (Malaysian students ONLY) - 4 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus";
                        case "Intake":
                            return "Rolling Intake (throughout the year)";
                        case "Careers Prospects":
                            return "Lead Researcher<br/>enior Data Scientist<br/>Senior Big Data Analyst<br/>Senior Data Engineer<br/>Senior Product Planner<br/>Project Manager<br/>Senior Mobile Apps Developer<br/>Senior Programmer<br/>Senior Software Developer<br/>Senior IT Strategist<br/>Senior Market Analyst<br/>Senior IT Consultant<br/>Senior Business Analyst<br/>Talent Director<br/>Senior Machine Learning Engineer";
                        default:
                            return "N/A";
                    }
                case "Doctor of Philosophy (Information Technology)":
                    switch (detailType)
                    {
                        case "Duration":
                            return "Full time (Malaysian & International students) - 3 years<br/>Part time (Malaysian students ONLY) - 4 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus";
                        case "Intake":
                            return "Rolling Intake (throughout the year)";
                        case "Careers Prospects":
                            return "Lead Researcher<br/>Senior Business Development Executive<br/>Senior Product Development Executive<br/>Senior Market Analyst<br/>Senior Product Planner<br/>Project Manager<br/>Senior Mobile Apps Developer<br/>Senior Programmer<br/>Senior Software Developer<br/>Senior IT Strategist<br/>Senior Network Security Consultant<br/>Senior IT Consultant<br/>Senior Business Analyst<br/>Talent Director<br/>Senior Data Security Consultant";
                        default:
                            return "N/A";
                    }
                case "Doctor of Philosophy (Mathematical Sciences)":
                    switch (detailType)
                    {
                        case "Duration":
                            return "Full time (Malaysian & International students) - 3 years<br/>Part time (Malaysian students ONLY) - 4 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus";
                        case "Intake":
                            return "Rolling Intake (throughout the year)";
                        case "Careers Prospects":
                            return "Business Consultant<br/>Research Scientist (Maths)<br/>Senior Data Scientist<br/>Senior Academicians in Institutions of Higher Learning";
                        default:
                            return "N/A";
                    }

                default:
                    return "N/A";
            }
        }
    }
}