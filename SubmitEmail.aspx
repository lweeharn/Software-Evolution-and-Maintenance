<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="SubmitEmail.aspx.cs" Inherits="Assignment.SubmitEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
            <div style="margin: 0 auto; max-width: 100%; padding: 4rem; box-sizing: border-box; width: auto; margin-bottom: 300px;">

            <table style="width: 100%;">
        <tr>
            <td style=" background-color: #D6EEEE;"><a href="SubmitEmail.aspx" style="text-decoration: none; color: black; margin-bottom: 50px;">
                <h1 style="text-align: center;">Submit Response</h1>
            </a>
            </td>
            <td style="margin-bottom: 50px;"><a href="ViewTicket.aspx" style="text-decoration: none; color: black;">
                <h1 style="text-align: center;"">View Response</h1>
                </a>
            </td>
        </tr>
    </table>


    <span style="margin-left: 8%; margin-right: 8%;">Please submit an email to submit ticket</span>
    <hr style="border-top: 1px solid gray; margin-left: 8%; margin-right: 8%;" />

<div class="containerSubmitEmail" style="margin-left: 8%; margin-right: 8%;">
    <div class="emailInput" style="margin-left: 30%; margin-right: 30%;">
        <label class="containerSubmitEmailLabel1">Email address</label>
        <input class="containerSubmitEmailInput" id="txtEmailSubmit" type="email" runat="server" required /> 
        <asp:Button ID="btnEmailSubmit" runat="server" Text="Submit" OnClick="btnEmailSubmit_Click" class="button1" style="padding: 5px 20px;"/>
        <asp:Label ID="lblEmailSubmit" runat="server" Text=""></asp:Label>
    </div>

    <div class="accordion">
        <div class="accordion-item">
            <button id="accordion-button-1" aria-expanded="false" type="button">
                <span class="accordion-title">Click to Expand</span><span class="icon" aria-hidden="true"></span>
            </button>
            <div class="accordion-content" >
            
                <asp:FormView ID="fvSubmitTicket" runat="server" DataKeyNames="ticketID" OnItemInserting="FormView1_ItemInserting" defaultMode="Insert" style="margin: 20px 40% 20px;">
                    <InsertItemTemplate>
                        <table style="width: 100%; ">
                            <tr>
                                <td>Email: </td>
                                <td>
                                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("userEmail") %>' /></td>

                            </tr>
                            <tr>
                                <td>Subject:</td>
                                <td>
                                    <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' /></td>

                            </tr>
                            <tr>
                                <td>Content:</td>
                                <td>
                                    <asp:TextBox ID="contentTextBox" runat="server" Text='<%# Bind("content") %>' /></td>

                            </tr>
                            <tr>
                                <td>
                                    <br />
                                </td>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr style="text-align: center;">
                                <td ></td>
                                <td style="vertical-align: middle;">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Submit" class="button1" Style="padding: 5px 15px;" />
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" class="button2" Style="padding: 5px 15px;" />

                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>

    <div class="btnTrackResp">
        <a href="ViewTicket.aspx"></a>
    </div>
</div>
    </div>
   

    <style>
        @import url("https://fonts.googleapis.com/css?family=Hind:300,400&display=swap");


        .containerSubmitEmail {
            position: relative;
        }

        .containerSubmitEmailInput {
            font: inherit;
            color: black;
            padding: 10px;
            border: none;
            border-radius: 4px;
            outline: 2px solid black;
            background-color: transparent;
            transition: outline-color 500ms;
        }

            .containerSubmitEmailInput:is(:focus, :valid) {
                outline-color: #3c50eb;
            }

        .containerSubmitEmailLabel {
            position: absolute;
            top: -8px;
            left: 317px;
            transform: translateX(-50%) translateY(10px);
            color: black;
            transition: transform 500ms, background-color 500ms, padding-inline 500ms, scale 500ms;
            pointer-events: none;
            z-index: 1;
        }

        .containerSubmitEmailInput:focus +
        .containerSubmitEmailLabel,
        .containerSubmitEmailInput:valid +
        .containerSubmitEmailLabel {
            padding-inline: 5px;
            transform: translateX(-50%) translateY(-14px) scale(0.8); /* Final translation and scale */
            background-color: #000;
        }

        .button1:link, a:visited {
            background-color: white;
            color: black;
            text-decoration: none;
            padding: 10px 25px;
        }

        .button1:hover, a:active {
            background-color: #77dd77;
            color: white;
            text-decoration: none;
        }

        .button2:link, a:visited {
            background-color: white;
            color: black;
            text-decoration: none;
            padding: 10px 25px;
        }

        .button2:hover, a:active {
            background-color: #f1807e;
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
            border-style: none;
            border-color: inherit;
            border-width: medium;
            position: relative;
            display: block;
            text-align: left;
            width: 100%;
            padding: 1em 0;
            color: #7288a2;
            font-size: 1.15rem;
            font-weight: 400;
            background: none;
            outline: none;
            top: 0px;
            left: 0px;
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
                    max-height: 15em;
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
    </form>
</asp:Content>
