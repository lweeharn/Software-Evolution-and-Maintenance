<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Searching.aspx.cs" Inherits="Assignment.Searching" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Include Fuse.js library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/6.4.6/fuse.min.js"></script>

    <style type="text/css">
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        /* Header styles */
        h2 {
            color: #333;
        }

        /* Education list styles */
        .education-list {
            list-style: none;
            padding-left: 0;
        }

        .degree-label {
            cursor: pointer;
            color: #007bff;
            font-size: 18px;
            margin-bottom: 5px;
        }

        /* Program list styles */
        .degree-programs {
            display: none;
            margin-left: 0;
            padding-left: 20px;
        }

            .degree-programs li {
                list-style-type: none;
                margin-bottom: 5px;
            }

            .degree-programs a {
                text-decoration: none;
                color: #333;
                font-weight: bold;
                font-size: 16px;
            }

                .degree-programs a:hover {
                    color: #007bff;
                }

        /* Search container styles */
        .search-container {
            margin-bottom: 10px;
        }

            .search-container input[type="text"] {
                width: 300px;
                padding: 5px;
            }

            .search-container button {
                background-color: #007bff;
                border: none;
                color: white;
                padding: 5px 10px;
                cursor: pointer;
            }

        /* Program info styles */
        .program-info {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            margin-top: 10px;
        }

            .program-info h5 {
                color: #007bff;
                font-size: 24px;
                font-weight: bold;
                margin-top: 10px;
                margin-bottom: 10px;
            }
    </style>

    <script type="text/javascript">
        // JavaScript function to toggle the program list for a degree type
        function togglePrograms(degreeType) {
            var programList = document.getElementById(degreeType + '-programs');
            var otherProgramLists = document.querySelectorAll('.degree-programs:not(#' + degreeType + '-programs)');

            if (programList.style.display === 'none') {
                programList.style.display = 'block';
                // Hide other program lists
                otherProgramLists.forEach(function (list) {
                    list.style.display = 'none';
                });
            } else {
                programList.style.display = 'none';
            }
        }

        // JavaScript function to load and display detailed information for programs from a text file
        function displayProgramInfo(textFileUrl) {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', textFileUrl, true);

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        var content = xhr.responseText;
                        var infoDiv = document.getElementById('programInfo');
                        infoDiv.innerHTML = formatProgramInfo(content);
                    } else {
                        var infoDiv = document.getElementById('programInfo');
                        infoDiv.textContent = 'Error loading content.';
                    }
                }
            };

            xhr.send();
        }

        // JavaScript function to search for programs based on user input
        function searchPrograms() {
            var userInput = document.getElementById('programSearch').value.toLowerCase();
            var programLinks = document.querySelectorAll('.degree-programs a');

            programLinks.forEach(function (link) {
                var programName = link.textContent.toLowerCase();
                var programList = link.closest('.degree-programs');

                // Check if the program name contains the user's input
                if (programName.includes(userInput)) {
                    // Display the program
                    programList.style.display = 'block';
                    link.style.display = 'block';
                } else {
                    // Hide the program
                    link.style.display = 'none';
                }
            });
        }

        // JavaScript function to reset the search
        function resetSearch() {
            document.getElementById('programSearch').value = '';
            var programLinks = document.querySelectorAll('.degree-programs a');
            programLinks.forEach(function (link) {
                link.style.display = 'none';
            });
        }

        function formatProgramInfo(content) {
            var formattedContent = '';
            var sections = content.split(/\n(?=[A-Z ]+:)/);
            sections.forEach(function (section) {
                var lines = section.trim().split('\n');
                if (lines.length > 0) {
                    var heading = lines[0].trim();

                    if (heading.toUpperCase() !== "PROGRAMME OVERVIEW") {
                        formattedContent += '<div class="program-info"><h5>' + heading.toUpperCase() + '</h5>';
                        var contentLines = lines.slice(1);
                        contentLines.forEach(function (line) {
                            // Check for specific keywords and wrap them in <strong> tags
                            line = line.replace(/Duration:/gi, '<strong>Duration:</strong>');
                            line = line.replace(/Campus:/gi, '<strong>Campus:</strong>');
                            line = line.replace(/Intake:/gi, '<strong>Intake:</strong>');
                            line = line.replace(/Career Prospects:/gi, '<strong>Career Prospects:</strong>');
                            line = line.replace(/Fees & Financial Aids:/gi, '<strong>Fees & Financial Aids:</strong>');

                            formattedContent += line + '<br />';
                        });
                        formattedContent += '</div>';
                    }
                }
            });
            return formattedContent;
        }
    </script>

    <form runat="server">
          <div class="container">
        <h2 style="text-align: center; margin-bottom: 40px;">Education Information</h2>

        <div class="search-container">
            <label for="programSearch">Search Programs: </label>
            <input type="text" id="programSearch" placeholder="Search programs" onkeyup="searchPrograms()" />
            <button type="button" onclick="resetSearch()">Reset</button>
        </div>

        <ul class="education-list">
            <!-- Diploma Programs -->
            <li>
                <label class="degree-label" onclick="togglePrograms('diploma')">Diploma</label>
                <a href="CompareDiploma.aspx" style="color: green; text-decoration: underline;">[compare?]</a>
                <ul id="diploma-programs" class="degree-programs">
                    <!-- Add Diploma programs here -->
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Diploma/diploma_computer_science.txt')">Diploma in Computer Science</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Diploma/diploma_information_systems.txt')">Diploma in Information Systems</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Diploma/diploma_information_technology.txt')">Diploma in Information Technology</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Diploma/diploma_software_engineering.txt')">Diploma in Software Engineering</a></li>
                </ul>
            </li>

            <!-- Master Degree Programs -->
            <li>
                <label class="degree-label" onclick="togglePrograms('master')">Master Degree</label>
                <a href="CompareMaster.aspx" style="color: green; text-decoration: underline;">[compare?]</a>
                <ul id="master-programs" class="degree-programs">
                    <!-- Add Master Degree programs here -->
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Master/master_computer_science.txt')">Master of Computer Science</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Master/master_information_technology.txt')">Master of Information Technology</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Master/master_of_science_in_mathematical_sciences.txt')">Master of Science in Mathematical Sciences</a></li>
                </ul>
            </li>




            <li>
                <label class="degree-label" onclick="togglePrograms('bachelor')">Bachelor</label>
                <a href="CompareBachelor.aspx" style="color: green; text-decoration: underline;">[compare?]</a>
                <ul id="bachelor-programs" class="degree-programs">
                    <!-- Add Bachelor programs here -->
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Bachelor/bachelor_Management_Mathematics_with_Computing.txt')">Bachelor of Science (Honours) in Management Mathematics with Computing</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Bachelor/bachelor_Interactive_Software_Technology.txt')">Bachelor of Computer Science (Honours) in Interactive Software Technology</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Bachelor/bachelor_Data_Science.txt')">Bachelor of Computer Science (Honours) in Data Science</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Bachelor/bachelor_Enterprise_Information_Systems.txt')">Bachelor of Information Systems (Honours) in Enterprise Information Systems</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Bachelor/bachelor_Information_Security.txt')">Bachelor of Information Technology (Honours) in Information Security</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Bachelor/bachelor_Internet_Technology.txt')">Bachelor of Information Technology (Honours) in Internet Technology</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Bachelor/bachelor_Software_Systems_Development.txt')">Bachelor of Information Technology (Honours) in Software Systems Development</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Bachelor/bachelor_Software_Engineering.txt')">Bachelor of Software Engineering (Honours)</a></li>
                </ul>
            </li>



            <!-- Doctor of Philosophy Programs -->
            <li>
                <label class="degree-label" onclick="togglePrograms('phd')">Doctor of Philosophy</label>
                <a href="CompareDoctor.aspx" style="color: green; text-decoration: underline;">[compare?]</a>

                <ul id="phd-programs" class="degree-programs">
                    <!-- Add Doctor of Philosophy programs here -->
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Doctor/doctor_Computer_Science.txt')">Doctor of Philosophy (Computer Science)</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Doctor/doctor_Information_Technology.txt')">Doctor of Philosophy (Information Technology)</a></li>
                    <li><a href="javascript:void(0);" onclick="displayProgramInfo('Doctor/doctor_Mathematical_Sciences.txt')">Doctor of Philosophy (Mathematical Sciences)</a></li>
                </ul>
            </li>
        </ul>
    </div>


    <!-- Div to display program information -->
    <div class="container program-info" id="programInfo">
        <!-- Content will be displayed here -->
    </div>

    </form>
  
    <!-- Include Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</asp:Content>

