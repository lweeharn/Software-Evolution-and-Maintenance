<%@ Page Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Assignment.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <input id="scene-1" type="radio" name="scene" value="1" checked />
        <input id="scene-2" type="radio" name="scene" value="2" />
        <input id="scene-3" type="radio" name="scene" value="3" />
        <input id="scene-4" type="radio" name="scene" value="4" />

        <main class="site">
            <div class="landscape">
                <div class="landscape-text">
                    FOCS
                </div>
            </div>
            <div class="left-side">
                <div class="page-numbers" data-total='04'>
                    <div class="page-number page-number--tens">0</div>
                    <div class="page-number page-number--ones">
                        <div>1</div>
                        <div>2</div>
                        <div>3</div>
                        <div>4</div>
                    </div>
                </div>
            </div>
            <div class="hero">
                <div class="layer" data-scene="1">
                    <h1 class="heading">Programme
                    </h1>
                </div>
                <div class="layer" data-scene="2">
                    <h1 class="heading">Qualify
                    </h1>
                </div>
                <div class="layer" data-scene="3">
                    <h1 class="heading">Staff
                    </h1>
                </div>
                <div class="layer" data-scene="4">
                    <h1 class="heading">FAQ
                    </h1>
                </div>
                <nav class="slide-nav">
                    <div class="button-container">
                        <button class="nav-button">< Previous</button>
                        <button class="nav-button">Next ></button>
                    </div>
                    <div class="nav-button-container">
                        <label class="nav-button" for="scene-1" data-scene="1">1</label>
                        <label class="nav-button" for="scene-2" data-scene="2">2</label>
                        <label class="nav-button" for="scene-3" data-scene="3">3</label>
                        <label class="nav-button" for="scene-4" data-scene="4">4</label>
                    </div>
                </nav>
            </div>
            <div class="right-content">
                <div class="layer" data-scene="1">
                    <h2 class="heading">"Explore Our Programme"</h2>
                    <p class="paragraph">
                        Discover the comprehensive programme we offer, designed to empower and educate individuals in various fields of expertise. 
				Learn more about our courses and opportunities for personal and professional growth.		
                    </p>
                </div>
                <div class="layer" data-scene="2">
                    <h2 class="heading">"Your Path to Qualification"</h2>
                    <p class="paragraph">
                        Embark on your journey toward qualification with us. Explore the steps, requirements, and resources available to help you 
				achieve your goals and become certified in your chosen field.		
                    </p>
                </div>
                <div class="layer" data-scene="3">
                    <h2 class="heading">"Meet Our Dedicated Staff"</h2>
                    <p class="paragraph">
                        Get to know the talented and passionate individuals who make up our dedicated staff. Learn about their backgrounds, expertise, and commitment to 
				providing you with an exceptional educational experience.		
                    </p>
                </div>
                <div class="layer" data-scene="4">
                    <h2 class="heading">"Answers to Your Questions"</h2>
                    <p class="paragraph">
                        Have questions? Find answers in our FAQ section. We've compiled a list of frequently asked questions to provide you with quick and informative responses to common inquiries.		
                    </p>
                    <p class="paragraph">
                        More questions? Submit a ticket in our FAQ page. We can provide response as soons as for you.		
                    </p>
                </div>
            </div>
        </main>
    </div>

    <div class="faq-script">
        <!-- Chatbot symbol -->
        <div class="chatbot-symbol">
            <img src="images/FAQ right.png" alt="Chatbot Icon" id="chatbot-icon" style="width: 200px; height: 200px;">
        </div>

        <!-- Chatbot container -->
        <div id="chatbot-container" class="chatbot-container">
            <div id="chatbot-header" class="chatbot-header">
                <span class="chatbot-title">Frequently Asked Questions</span>
                <button class="close-button" id="close-button">&times;</button>
            </div>
            <div id="chatbot-body" class="chatbot-body">

                <!-- Add more FAQs as needed -->
            </div>
            <div class="chatbot-footer">
                <input type="text" id="chatbot-input" placeholder="Type your question">
                <button id="search-button">Search</button>
            </div>
        </div>
    </div>

    <style>
        /* slide */
        @import url("https://fonts.googleapis.com/css?family=Josefin+Sans:400,700");
        @import url("https://fonts.googleapis.com/css?family=Oswald");

        .site {
            display: grid;
            grid-template-rows: 3fr 2fr;
            grid-template-columns: 5rem 1fr 1fr 5rem;
            box-shadow: 0 0.5rem 2rem rgba(0, 0, 0, 0.1);
            width: 90vw;
            height: 90vh;
            background-color: white;
            font-family: "Josefin Sans", sans-serif;
        }

            .site * {
                transition: all 0.5s ease;
            }

        .site {
            --total: 4;
            --percentage: calc( var(--scene)/var(--total));
        }

        input[value="1"]:checked ~ .site {
            --scene: 1;
        }

        input[value="2"]:checked ~ .site {
            --scene: 2;
        }

        input[value="3"]:checked ~ .site {
            --scene: 3;
        }

        input[value="4"]:checked ~ .site {
            --scene: 4;
        }

        input[name=scene] {
            display: none;
        }

        input[value="1"]:checked ~ * label[data-scene="1"],
        input[value="2"]:checked ~ * label[data-scene="2"],
        input[value="3"]:checked ~ * label[data-scene="3"],
        input[value="4"]:checked ~ * label[data-scene="4"] {
            display: none;
        }

        input[value="1"]:checked ~ * [data-scene]:not([data-scene="1"]) .heading,
        input[value="1"]:checked ~ * [data-scene]:not([data-scene="1"]) .paragraph,
        input[value="2"]:checked ~ * [data-scene]:not([data-scene="2"]) .heading,
        input[value="2"]:checked ~ * [data-scene]:not([data-scene="2"]) .paragraph,
        input[value="3"]:checked ~ * [data-scene]:not([data-scene="3"]) .heading,
        input[value="3"]:checked ~ * [data-scene]:not([data-scene="3"]) .paragraph,
        input[value="4"]:checked ~ * [data-scene]:not([data-scene="4"]) .heading,
        input[value="4"]:checked ~ * [data-scene]:not([data-scene="4"]) .paragraph {
            transform: translateX(-25%);
            opacity: 0;
        }

        input[value="1"]:checked ~ * [data-scene="1"] + [data-scene],
        input[value="2"]:checked ~ * [data-scene="2"] + [data-scene],
        input[value="3"]:checked ~ * [data-scene="3"] + [data-scene],
        input[value="4"]:checked ~ * [data-scene="4"] + [data-scene] {
            tranform: translateX(25%);
        }

        .layer {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            top: 0;
            width: 100%;
            height: 100%;
            margin: auto;
        }

        .landscape {
            display: flex;
            align-items: center;
            grid-row: 1/2;
            grid-column: 1/-1;
            background-color: #141610;
            background-image: url('/images/INDEX WALL.png');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center 20%;
            overflow: hidden;
        }

        .landscape-text {
            display: inline-block;
            font-size: 40vh;
            font-weight: bold;
            background: inherit;
            background-image: url("https://picsum.photos/5615/2907?image=974");
            background-clip: text;
            -webkit-background-clip: text;
            background-size: 160% auto;
            background-position: calc(80% + ( -70% * var(--percentage))) 0;
            color: transparent;
            transform: translateX(calc( 40% + (-100% * var(--percentage)) ));
        }

        .left-side {
            grid-row: 1/2;
            grid-column: 2/3;
            font-family: "Oswald";
            align-self: end;
        }

        .page-numbers {
            color: white;
            overflow: hidden;
        }

            .page-numbers:after {
                content: "/" attr(data-total);
                font-size: 1rem;
                position: absolute;
                top: 0;
                left: 4rem;
            }

        .page-number {
            font-size: 4rem;
            line-height: 4.2rem;
        }

        .page-number--tens {
            align-self: flex-end;
        }

        .page-number--ones {
            position: absolute;
            top: 0;
            left: 0.5em;
            transform: translateY(calc((-100% * (var(--percentage) - 1/var(--total) ) ) ));
        }

        .left-content {
            grid-row: 2/4;
            grid-column: 1/3;
        }

        .right-content {
            color: black;
            grid-row: 2/4;
            grid-column: 3/-1;
            overflow: auto;
        }

            .right-content > .layer {
                padding: 30px;
            }

        .slide-nav {
            position: absolute;
            right: 0;
            bottom: 0;
            overflow: hidden;
        }

        .nav-button-container {
            display: flex;
            position: absolute;
            top: 0;
            transition: none;
            transform: translateX(calc(100% + (-1 * 5rem * (var(--scene) + 1))));
            opacity: 0;
        }

        .button-container {
            display: flex;
            outline: none;
            right: 0;
        }

        .nav-button {
            display: inline-block;
            padding: 0.5em;
            width: 5rem;
            background: rgba(0, 0, 0, 0.8);
            color: white;
            cursor: pointer;
            font-family: inherit;
            height: 2rem;
            border: none;
            padding: 0.5rem;
            outline: none;
        }

        .hero {
            color: white;
            grid-row: 1/2;
            grid-column: 3/-1;
        }

            .hero > .layer {
                display: flex;
                height: 40%;
            }

        *,
        *:before,
        *:after {
            box-sizing: border-box;
            position: relative;
        }


        /* Chatbot symbol */
        .chatbot-symbol {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 999;
        }

        /* Chatbot container */
        .chatbot-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 350px;
            height: 400px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            z-index: 999;
            display: none;
        }

        .chatbot-header {
            background-color: #f5f5f5;
            padding: 10px;
            border-radius: 10px 10px 0 0;
        }

        .chatbot-title {
            font-weight: bold;
        }

        .close-button {
            float: right;
            border: none;
            background: none;
            cursor: pointer;
        }

        .chatbot-body {
            max-height: 300px; /* Set a maximum height for chatbot-body */
            overflow-y: auto; /* Enable scrolling if content exceeds max-height */
            padding: 10px;
        }

        .chatbot-footer {
            padding: 10px;
            background-color: #f5f5f5;
            border-radius: 0 0 10px 10px;
            display: flex;
            align-items: center;
        }

            .chatbot-footer input[type="text"] {
                flex: 1;
                padding: 5px;
                border: none;
                border-radius: 5px;
            }

            .chatbot-footer button {
                width: 25%;
                padding: 5px;
                border: none;
                border-radius: 5px;
                background-color: #4CAF50;
                color: #fff;
                cursor: pointer;
            }

        .message {
            margin-bottom: 10px;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const chatbotSymbol = document.getElementById('chatbot-icon');
            const chatbotContainer = document.getElementById('chatbot-container');
            const closeButton = document.getElementById('close-button');
            const chatbotInput = document.getElementById('chatbot-input');
            const chatbotOutput = document.getElementById('chatbot-body');
            const searchButton = document.getElementById('search-button');

            chatbotSymbol.addEventListener('click', function () {
                chatbotContainer.style.display = 'block';
            });

            closeButton.addEventListener('click', function () {
                chatbotContainer.style.display = 'none';
            });

            chatbotInput.addEventListener('keydown', function (event) {
                if (event.key === 'Enter') {
                    processUserInput(chatbotInput.value);
                    chatbotInput.value = '';
                }
            });

            searchButton.addEventListener('click', function () {
                event.preventDefault(); // Prevent the form from submitting
                processUserInput(chatbotInput.value);
                chatbotInput.value = '';
            });

            function processUserInput(userInput) {
                const keywords = [
                    { keyword: 'enrollment', response: 'To enroll in our programs, please visit our website and complete the online qualification form. Make sure to provide all relevant informations. Once your application is accepted, you will receive enrollment instructions.' },
                    { keyword: 'registration', response: 'You can register for classes through our online student portal. Log in to your account, browse available courses, and add them to your schedule. Be mindful of registration deadlines and course prerequisites.' },
                    { keyword: 'office hours', response: 'Our office hours are from Monday to Friday, 9:00 AM to 5:00 PM. You can visit our office during these hours, or you may contact us via email for any enquiries. "tarc.edu.my"' },
                    { keyword: 'admission requirements', response: 'Admission requirements vary depending on the program. Please check our website for detailed information on the admission requirements for the specific program you are interested in.' },                    
                    { keyword: 'courses offered', response: 'We offer a wide range of courses in computer science and software engineering.You can view the list of courses on our website and access course descriptions and prerequisites.' },
                ];

                let matchedResponse = '';

                keywords.forEach(function (keyword) {
                    if (userInput.toLowerCase().includes(keyword.keyword)) {
                        matchedResponse = keyword.response;
                    }
                });

                if (matchedResponse !== '') {
                    displayMessage('Question: ' + userInput);
                    displayMessage('Answer: ' + matchedResponse);
                } else {
                    displayMessage('Sorry, I couldn\'t find a relevant answer. Please contact us at tarc.edu.my.');
                }
            }

            function displayMessage(message) {
                const messageElement = document.createElement('div');
                messageElement.className = 'message';
                messageElement.innerHTML = '<p>' + message + '</p>';
                chatbotOutput.appendChild(messageElement);
                chatbotOutput.scrollTop = chatbotOutput.scrollHeight;
            }
        });

        /*
        slide
        */
        var $slider = $(".slideshow .slider"),
            maxItems = $(".item", $slider).length,
            dragging = false,
            tracking,
            rightTracking;

        $sliderRight = $(".slideshow")
            .clone()
            .addClass("slideshow-right")
            .appendTo($(".split-slideshow"));

        rightItems = $(".item", $sliderRight).toArray();
        reverseItems = rightItems.reverse();
        $(".slider", $sliderRight).html("");
        for (i = 0; i < maxItems; i++) {
            $(reverseItems[i]).appendTo($(".slider", $sliderRight));
        }

        $slider.addClass("slideshow-left");
        $(".slideshow-left")
            .slick({
                vertical: true,
                verticalSwiping: true,
                arrows: false,
                infinite: true,
                dots: true,
                speed: 1000,
                cssEase: "cubic-bezier(0.7, 0, 0.3, 1)"
            })
            .on("beforeChange", function (event, slick, currentSlide, nextSlide) {
                if (
                    currentSlide > nextSlide &&
                    nextSlide == 0 &&
                    currentSlide == maxItems - 1
                ) {
                    $(".slideshow-right .slider").slick("slickGoTo", -1);
                    $(".slideshow-text").slick("slickGoTo", maxItems);
                } else if (
                    currentSlide < nextSlide &&
                    currentSlide == 0 &&
                    nextSlide == maxItems - 1
                ) {
                    $(".slideshow-right .slider").slick("slickGoTo", maxItems);
                    $(".slideshow-text").slick("slickGoTo", -1);
                } else {
                    $(".slideshow-right .slider").slick(
                        "slickGoTo",
                        maxItems - 1 - nextSlide
                    );
                    $(".slideshow-text").slick("slickGoTo", nextSlide);
                }
            })
            .on("mousewheel", function (event) {
                event.preventDefault();
                if (event.deltaX > 0 || event.deltaY < 0) {
                    $(this).slick("slickNext");
                } else if (event.deltaX < 0 || event.deltaY > 0) {
                    $(this).slick("slickPrev");
                }
            })
            .on("mousedown touchstart", function () {
                dragging = true;
                tracking = $(".slick-track", $slider).css("transform");
                tracking = parseInt(tracking.split(",")[5]);
                rightTracking = $(".slideshow-right .slick-track").css("transform");
                rightTracking = parseInt(rightTracking.split(",")[5]);
            })
            .on("mousemove touchmove", function () {
                if (dragging) {
                    newTracking = $(".slideshow-left .slick-track").css("transform");
                    newTracking = parseInt(newTracking.split(",")[5]);
                    diffTracking = newTracking - tracking;
                    $(".slideshow-right .slick-track").css({
                        transform:
                            "matrix(1, 0, 0, 1, 0, " + (rightTracking - diffTracking) + ")"
                    });
                }
            })
            .on("mouseleave touchend mouseup", function () {
                dragging = false;
            });

        $(".slideshow-right .slider").slick({
            swipe: false,
            vertical: true,
            arrows: false,
            infinite: true,
            speed: 950,
            cssEase: "cubic-bezier(0.7, 0, 0.3, 1)",
            initialSlide: maxItems - 1
        });
        $(".slideshow-text").slick({
            swipe: false,
            vertical: true,
            arrows: false,
            infinite: true,
            speed: 900,
            cssEase: "cubic-bezier(0.7, 0, 0.3, 1)"
        });
    </script>
</asp:Content>
