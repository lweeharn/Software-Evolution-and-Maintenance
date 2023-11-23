using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class CompareMaster : System.Web.UI.Page
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
                case "Master of Computer Science":
                    switch (detailType)
                    {
                        case "Duration":
                            return "Full time (Malaysian & International students) - 2 years<br/>Part time (Malaysian students ONLY) - 3 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus";
                        case "Intake":
                            return "Rolling Intake (throughout the year)";
                        case "Careers Prospects":
                            return "Researcher/ R&D Analyst<br/>Academician<br/>Consultant<br/>Software Engineer<br/>Software Research Engineer<br/>Software Developer<br/>Software Analyst<br/>Software Designer<br/>Technical Lead<br/>Project Leader<br/>Solution Architect<br/>Data Scientist<br/>Quality Data Analyst";
                        default:
                            return "N/A";
                    }
                case "Master of Information Technology":
                    switch (detailType)
                    {
                        case "Duration":
                            return "Full time (Malaysian & International students) - 2 years<br/>Part time (Malaysian students ONLY) - 3 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus";
                        case "Intake":
                            return "Rolling Intake (throughout the year)";
                        case "Careers Prospects":
                            return "Researcher<br/>Business Development Executive<br/>Product Development Executive<br/>Market Analyst<br/>Product Planner<br/>Project Consultant<br/>Mobile Apps Developer<br/>Programmer<br/>Software Developer<br/>IT Strategist<br/>Network Security Consultant<br/>IT Consultant<br/>Business Analyst<br/>Data Security Consultant";
                        default:
                            return "N/A";
                    }
                case "Master of Science in Mathematical Sciences":
                    switch (detailType)
                    {
                        case "Duration":
                            return "Full time (Malaysian & International students) - 2 years<br/>Part time (Malaysian students ONLY) - 3 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus";
                        case "Intake":
                            return "Rolling Intake (throughout the year)";
                        case "Careers Prospects":
                            return "Business Analysis Consultant<br/>Data Analyst<br/>Data Scientist<br/>Insurance underwriter<br/>Machine Learning Engineer<br/>Quantitative Analyst<br/>Operations Research Analyst<br/>nResearcher<br/>Academicians in Institutions of Higher Learning";
                        default:
                            return "N/A";
                    }

                default:
                    return "N/A";
            }
        }
    }
}