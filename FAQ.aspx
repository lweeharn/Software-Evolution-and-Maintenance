<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Assignment.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <h2>Frequently Asked Questions</h2>

        <div class="accordion">
            <div class="accordion-item">
                <button id="accordion-button-1" aria-expanded="false" type="button"><span class="accordion-title">What is Computer Science faculty?</span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                    <p>
                        Computer Science faculty refers to the group of professors, lecturers, and educators in an academic institution who specialize in teaching and researching various aspects of computer science. 
                        They play a crucial role in educating students and advancing knowledge in the field.
                    </p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-2" aria-expanded="false" type="button"><span class="accordion-title">What qualifications do Computer Science faculty have?</span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                    <p>
                        Computer Science faculty typically hold advanced degrees, such as a Ph.D. or master's degree, in computer science or a closely related field. 
                        Further significant research and experiences are erquired for Ph.D.
                    </p>
                </div>
            </div>
            <div class="accordion-item">
                <button id="accordion-button-3" aria-expanded="false" type="button"><span class="accordion-title">What career support and advice can I get from the Computer Science faculty?</span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                    <p>
                        Faculty members can offer guidance on career paths, internship opportunities, and job prospects in the field of Computer Science. 
                        They may also connect you with alumni networks and industry contacts.
                    </p>
                </div>
            </div>

            <div class="accordion-item">
                <button id="accordion-button-4" aria-expanded="false" type="button"><span class="accordion-title">How can I contact Computer Science faculty for research collaborations or questions about their work?</span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                    <p>
                        You can typically find contact information for Computer Science faculty members on their institution's website or in academic directories. 
                        Sending a polite and concise email expressing your interest or questions is a common way to initiate contact.
                    </p>
                </div>
            </div>
        </div>
        <div style="margin-top: 30px;">
                    <a class="button1" href="SubmitEmail.aspx" style="margin: 0; font-size: 20px; padding: 10px 25px; ">Submit A Ticket</a>

        </div>


    </div>



    <style>
        @import url("https://fonts.googleapis.com/css?family=Hind:300,400&display=swap");

        .button1:link, a:visited {
            background-color: white;
            color: black;
            border: 2px solid black;
            text-decoration: none;
        }

        .button1:hover, a:active {
            background-color: black;
            color: white;
            text-decoration: none;
        }

        * {
            box-sizing: border-box;
        }

            *::before, *::after {
                box-sizing: border-box;
            }



        .container {
            margin: 0 auto;
            max-width: 100%;
            padding: 4rem;
            box-sizing: border-box;
            width: auto;
        }

        .accordion .accordion-item {
            border-bottom: 1px solid #e5e5e5;
        }

            .accordion .accordion-item button[aria-expanded=true] {
                border-bottom: 1px solid #03b5d2;
            }

        .accordion button {
            position: relative;
            display: block;
            text-align: left;
            width: 100%;
            padding: 1em 0;
            color: #7288a2;
            font-size: 1.15rem;
            font-weight: 400;
            border: none;
            background: none;
            outline: none;
        }

            .accordion button:hover, .accordion button:focus {
                cursor: pointer;
                color: #03b5d2;
            }

                .accordion button:hover::after, .accordion button:focus::after {
                    cursor: pointer;
                    color: #03b5d2;
                    border: 1px solid #03b5d2;
                }

            .accordion button .accordion-title {
                padding: 1em 1.5em 1em 0;
            }

            .accordion button .icon {
                display: inline-block;
                position: absolute;
                top: 18px;
                right: 0;
                width: 22px;
                height: 22px;
                border: 1px solid;
                border-radius: 22px;
            }

                .accordion button .icon::before {
                    display: block;
                    position: absolute;
                    content: "";
                    top: 9px;
                    left: 5px;
                    width: 10px;
                    height: 2px;
                    background: currentColor;
                }

                .accordion button .icon::after {
                    display: block;
                    position: absolute;
                    content: "";
                    top: 5px;
                    left: 9px;
                    width: 2px;
                    height: 10px;
                    background: currentColor;
                }

            .accordion button[aria-expanded=true] {
                color: #03b5d2;
            }

                .accordion button[aria-expanded=true] .icon::after {
                    width: 0;
                }

                .accordion button[aria-expanded=true] + .accordion-content {
                    opacity: 1;
                    max-height: 9em;
                    transition: all 200ms linear;
                    will-change: opacity, max-height;
                }

        .accordion .accordion-content {
            opacity: 0;
            max-height: 0;
            overflow: hidden;
            transition: opacity 200ms linear, max-height 200ms linear;
            will-change: opacity, max-height;
        }

            .accordion .accordion-content p {
                font-size: 1rem;
                font-weight: 300;
                margin: 2em 0;
            }
    </style>

    <script>
        const items = document.querySelectorAll(".accordion button");

        function toggleAccordion() {
            const itemToggle = this.getAttribute('aria-expanded');

            for (i = 0; i < items.length; i++) {
                items[i].setAttribute('aria-expanded', 'false');
            }

            if (itemToggle == 'false') {
                this.setAttribute('aria-expanded', 'true');
            }
        }

        items.forEach(item => item.addEventListener('click', toggleAccordion));
    </script>

</asp:Content>
