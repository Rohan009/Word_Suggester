<%-- 
    Document   : Chatbot
    Created on : 22 Feb, 2017, 11:42:06 PM
    Author     : RohAn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Word Suggester </title>
        <script src="js/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css"/>

        <style>

            .main{
                width: 300px;
                bottom: 0;
                right: 210px;
                position: fixed;
            }
            .textarea{
                max-width: 296px;
                resize: none;

            }
            .inputbox{
                min-width: 300px;
                max-width: 300px;
                padding: 0px;
                margin-top: -5px;
            }

            .div0 {

                height: 30px;
                width: 300px;
                margin-top: -7px;
                background-color: white;
            }
            .div1 {
                float: left;
                width: 98px;
                height: 28px;
                margin: 0px;
                border: 1px solid black;
            }

            .div2 {
                float: left;
                width: 97px;
                height: 28px;
                margin: 0px;
                border: 1px solid black;
            }

            .div3 {
                float: left;
                width: 99px;
                height: 28px;
                margin: 0px;
                border: 1px solid black;
            }

            .inputbox input{
                min-width: 294px;
                max-width: 300px;
                padding: 2px;   
            }
            .head{
                background: #099ad1 -webkit-linear-gradient(top,rgba(255,255,255,.2) 0%,rgba(0,0,0,.2) 100%);
                max-width: 300px;
                padding: 5px;
                font-weight: 400;
                cursor: pointer;
            }

            button{
                font-size: 18px;
                position: absolute;
                top: 275px;//286px;
                left: 88%;
                background-color: white;
                border: none;
                cursor: pointer;
            }
            body {
                background-image: url(wall.png);
                background-size: cover;
                background-position: top center !important;
                background-repeat: no-repeat !important;
                background-attachment: fixed;
            }

        </style>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>

        <div class="main">
            <div class="head" id="head">
                <span >Word Suggester</span>
            </div>
            <div class="textarea" id="ta">
                <textarea class="textarea" rows="14" cols="40"  id="TA" readonly></textarea>
            </div>
            <div class="div0" id="pre">
                <div class="div1" id="pre1"></div>
                <div class="div2" id="pre2"></div>

                <div class="div3" id="pre3"></div>
            </div>
            <div class="inputbox" id="tb">
                <input type="text" id="TB" name="tx" placeholder="Type your query here..">
            </div>
        </div>

        <script>



            var word;
            var arr;
            $('#TB').keyup(function (e) {

                function test(words) {
                    var n = words.split(" ");
                    return n[n.length - 1];
                }
                var response = "";

                word = $("#TB").val();
                word = test(word);

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        response = this.responseText;
                        arr = response.split(",");

                        document.getElementById("pre2").innerHTML = arr[0];
                        document.getElementById("pre1").innerHTML = arr[1];
                        document.getElementById("pre3").innerHTML = arr[2];
                        var $textarea = $('#TA');
                        $textarea.scrollTop($textarea[0].scrollHeight);

                    }
                };
                xhttp.open("GET", "word_suggest?w=" + word, true);
                xhttp.send();

            });
            $('#TB').keydown(function (e) {
                if (e.ctrlKey && e.keyCode === 32) {
                    var cur = document.getElementById('TB').value;
                    cur = cur.replace(word, arr[0]);
                    $('#TB').val(cur);
                    document.getElementById('TB').innerHTML = "";
                    $("#TB").focus();
                }
            });


            $(document).ready(function (e) {
                var $textarea = $('#TA');
                $textarea.scrollTop($textarea[0].scrollHeight);


                $('#pre2').click(function ()
                {
                    var cur = document.getElementById('TB').value;
                    cur = cur.replace(word, arr[0]);
                    $('#TB').val(cur);
                    document.getElementById('TB').innerHTML = "";
                    $("#TB").focus();

                });

                $('#pre1').click(function ()
                {
                    var cur = document.getElementById('TB').value;
                    cur = cur.replace(word, arr[1]);
                    $('#TB').val(cur);
                    document.getElementById('TB').innerHTML = "";
                    $("#TB").focus();

                });

                $('#pre3').click(function ()
                {
                    var cur = document.getElementById('TB').value;
                    cur = cur.replace(word, arr[2]);
                    $('#TB').val(cur);
                    document.getElementById('TB').innerHTML = "";
                    $("#TB").focus();

                });

            });




            $('#tb').keypress(function (e) {
                var key = e.which;
                var value = "";
                if (key === 13)  // Enter key code
                {
                    value = $("#TB").val();
                    $("#TB").val("");
                    $("#TA").append("You: " + value + "\n");

                }
            });
            var x = false;
            $(document).ready(function () {
                $("#tb").hide();
                $("#ta").hide();
                $("#pre").hide();

            });
            $('#head').click(function () {
                if (x === true)
                {
                    $("#tb").hide();
                    $("#ta").hide();
                    $("#pre").hide();

                    x = false;

                }
                else {
                    $("#tb").show();
                    $("#ta").show();
                    $("#TB").focus();
                    $("#pre").show();

                    x = true;
                }
            }
            );

        </script>
    </body>
</html>
