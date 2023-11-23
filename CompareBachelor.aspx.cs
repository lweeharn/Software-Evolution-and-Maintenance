using System;
using System.Web.Caching;
using System.Web.UI;

namespace Assignment
{
    public partial class CompareBachelor : Page
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


        // Define a method to get program details based on the program name and detail type
        private string GetProgramDetail(string program, string detailType)
        {

            switch (program)
            {
                case "Bachelor of Science (Honours) in Management Mathematics with Computing":
                    switch (detailType)
                    {
                        case "Duration":
                            return "3 years";
                        case "Campus":
                            return "KL - Kuala Kumpur Main Campus";
                        case "Intake":
                            return "Year 1 Intake: June<br/>Year 2 Intake: June";
                        case "Careers Prospects":
                            return "Officers in financial institutions such as banks, insurance firms, and investment houses<br/>Quantitative Analysts<br/>Quality Managers<br/>Research Officers<br/>Investment Analysts<br/>Financial Analysts<br/>Management Consultants<br/>Financial Planners and Advisors<br/>Pricing Analysts<br/>Market Risk Managers<br/>Credit Risk Managers<br/>Asset/Liability Managers<br/>IT Managers<br/>Programmers";
                        case "Fees":
                            return "RM 34,100 (Malaysian Student)<br/>RM59,500 (International Student)";
                        default:
                            return "N/A";
                    }
                case "Bachelor of Computer Science (Honours) in Interactive Software Technology":
                    switch (detailType)
                    {
                        case "Duration":
                            return "3 years";
                        case "Campus":
                            return "KL - Kuala Kumpur Main Campus";
                        case "Intake":
                            return "Year 1 Intake: June<br/>Year 2 Intake: June";
                        case "Careers Prospects":
                            return "Games Designers<br/>Games Programmers<br/>Games Software Engineers<br/>Games Producers<br/>Games Testers<br/>Technical Lead<br/>Web Designers<br/>Multimedia Developers<br/>Software Developers<br/>Mobile Application Developers<br/>Systems Analysts";
                        case "Fees":
                            return "RM 35,100 (Malaysian Student)<br/>RM61,200 (International Student)";
                        default:
                            return "N/A";
                    }
                case "Bachelor of Computer Science (Honours) in Data Science":
                    switch (detailType)
                    {
                        case "Duration":
                            return "3 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus<br/>PG - Penang Branch Campus";
                        case "Intake":
                            return "Year 1 Intake: January (KL); June (KL, PG); November (KL)<br/>Year 2 Intake: June (KL, PG)";
                        case "Careers Prospects":
                            return "Data Scientists<br/>Data Engineers<br/>Data Analysts<br/>Data Modelling Engineers<br/>Software Developers<br/>Mobile Application Developers<br/>Computer Science Researchers<br/>Machine Learning Engineers";
                        case "Fees":
                            return "RM34,300 (Malaysian Student)<br/>RM59,900 (International Student)";
                        default:
                            return "N/A";
                    }
                case "Bachelor of Information Systems (Honours) in Enterprise Information Systems":
                    switch (detailType)
                    {
                        case "Duration":
                            return "3 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus";
                        case "Intake":
                            return "Year 1 Intake: June<br/>Year 2 Intake: June";
                        case "Careers Prospects":
                            return "ERP Consultants<br/>Business and Systems Analysts<br/>Business Process Consultants<br/>Business Intelligence Specialists<br/>Data Warehouse Developers<br/>IT Consultants<br/>IT Managers<br/>Programmers<br/>Web Designers<br/>Database Administrators";
                        case "Fees":
                            return "RM 34,300 (Malaysian Student)<br/>RM59,900 (International Student)";
                        default:
                            return "N/A";
                    }
                case "Bachelor of Information Technology (Honours) in Information Security":
                    switch (detailType)
                    {
                        case "Duration":
                            return "3 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus";
                        case "Intake":
                            return "Year 1 Intake: June, November<br/>Year 2 Intake: June";
                        case "Careers Prospects":
                            return "Information Security Analysts<br/>Information Security Consultants<br/>Information Security Managers<br/>Information Security Engineers<br/>Information Security Administrators<br/>Information Security Auditors<br/>Forensics Analysts<br/>Forensics Investigators<br/>Security Software Developers<br/>Mobile Application Developers<br/>Network Security Engineers";
                        case "Fees":
                            return "RM33,800 (Malaysian Student)<br/>RM60,400 (International Student)";
                        default:
                            return "N/A";
                    }
                case "Bachelor of Information Technology (Honours) in Internet Technology":
                    switch (detailType)
                    {
                        case "Duration":
                            return "3 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus<br/>PG - Penang Branch Campus";
                        case "Intake":
                            return "Year 1 Intake: June (KL, PG); November (KL)<br/>Year 2 Intake: June (KL, PG); November (KL)";
                        case "Careers Prospects":
                            return "Web Developers<br/>Multimedia Developers<br/>Mobile Application Developers<br/>Systems Analysts<br/>Network Engineers<br/>IT Consultants<br/>IT Manager<br/>IoT Developers";
                        case "Fees":
                            return "RM34,600 (Malaysian Student)<br/>RM60,400 (International Student)";
                        default:
                            return "N/A";
                    }
                case "Bachelor of Information Technology (Honours) in Software Systems Development":
                    switch (detailType)
                    {
                        case "Duration":
                            return "3 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus<br/>PG - Penang Branch Campus<br/>PK - Perak Branch Campus<br/>JH - Johor Branch Campus<br/>PH - Pahang Branch<br/>SB - Sabah Branch";
                        case "Intake":
                            return "Year 1 Intake: January (KL); June (KL, PG, PK, JH, PH, SB); November (KL, PG, PH)<br/>Year 2 Intake: June (KL, PG, PK, JH, PH, SB); November (KL, PG)";
                        case "Careers Prospects":
                            return "Programmers<br/>Web Developers<br/>Multimedia Developers<br/>Mobile Application Developers<br/>Systems Analysts<br/>Software Engineers<br/>Database Administrators<br/>Network Engineers<br/>IT Consultants<br/>IT Managers<br/>IoT Developers";
                        case "Fees":
                            return "RM 34,600 (Malaysian Student)<br/>RM60,400 (International Student)";
                        default:
                            return "N/A";
                    }
                case "Bachelor of Software Engineering (Honours)":
                    switch (detailType)
                    {
                        case "Duration":
                            return "3 years";
                        case "Campus":
                            return "KL - Kuala Lumpur Main Campus<br/>PG - Penang Branch Campus";
                        case "Intake":
                            return "Year 1 Intake: January (KL); June (KL, PG); November (KL)<br/>Year 2 Intake: June (KL, PG)";
                        case "Careers Prospects":
                            return "Software Engineers<br/>Software Testers<br/>Software Quality Assurance Engineers<br/>Software Developers<br/>Software Architects<br/>Systems Analysts<br/>Web Developers<br/>Mobile Application Developers<br/>IT Consultants<br/>IT and Project Managers<br/>Programmers";
                        case "Fees":
                            return "RM 34,600 (Malaysian Student)<br/>RM60,400 (International Student)";
                        default:
                            return "N/A";
                    }



                default:
                    return "N/A";
            }
        }
    }
}
