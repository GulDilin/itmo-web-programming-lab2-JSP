<%@ page import="servlet.ResultHolder" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 09.10.2019
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lab work one</title>
    <meta charset="utf-8">
    <!-- <meta name="viewport" content="width=device-width"> -->
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="table-style.css">
    <link rel="stylesheet" type="text/css" href="checkbox-style.css">
    <link rel="stylesheet" type="text/css" href="form-style.css">
    <link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet">


</head>
<body>
<%
    ResultHolder resultHolder;
    if (session.getAttribute("result") != null) {
        resultHolder = (ResultHolder) session.getAttribute("result");
    } else {
        resultHolder = new ResultHolder();
    }
        if (request.getParameter("refresh") != null) resultHolder.refresh();
%>
<header class="header">
    <span class="name">Гурин Евгений Иванович</span>
    <span class="variant">Вариант 212006</span>
    <span class="group">Группа P3212</span>
</header>
<div class="content">
    <div class="plot">
        <svg version="1.1"
             baseProfile="full"
             width="300" height="300"
             xmlns="http://www.w3.org/2000/svg"
             id="svg-plot">
            <line x1="0" y1="150" x2="300" y2="150" stroke-width="1" stroke="#000720"/>
            <line x1="150" y1="0" x2="150" y2="300" stroke-width="1" stroke="#000720"/>
            <!-- стрелочки -->
            <line x1="300" y1="150" x2="296" y2="146" stroke-width="1" stroke="#000720"/>
            <line x1="300" y1="150" x2="296" y2="154" stroke-width="1" stroke="#000720"/>
            <line x1="150" y1="0" x2="146" y2="4" stroke-width="1" stroke="#000720"/>
            <line x1="150" y1="0" x2="154" y2="4" stroke-width="1" stroke="#000720"/>
            <!-- разметка размера -->
            <line x1="270" y1="148" x2="270" y2="152" stroke="#000720"/>
            <text x="265" y="140">R</text>
            <line x1="210" y1="148" x2="210" y2="152" stroke="#000720"/>
            <text x="200" y="140">R/2</text>
            <line x1="90" y1="148" x2="90" y2="152" stroke="#000720"/>
            <text x="75" y="140">-R/2</text>
            <line x1="30" y1="148" x2="30" y2="152" stroke="#000720"/>
            <text x="20" y="140">-R</text>
            <line x1="148" y1="30" x2="152" y2="30" stroke="#000720"/>
            <text x="156" y="35">R</text>
            <line x1="148" y1="90" x2="152" y2="90" stroke="#000720"/>
            <text x="156" y="95">R/2</text>
            <line x1="148" y1="210" x2="152" y2="210" stroke="#000720"/>
            <text x="156" y="215">-R/2</text>
            <line x1="148" y1="270" x2="152" y2="270" stroke="#000720"/>
            <text x="156" y="275">-R</text>
            <!-- фигуры в центре -->
            <rect x="90" y="30" width="60" height="120" fill="#75A9D5" fill-opacity="0.4" stroke="#986E6E"/>
            <polygon points="150,150 150,210 90,150" fill="#75A9D5" fill-opacity="0.4" stroke="#986E6E"/>
            <path d="M150 150
            L 150 270
            A 120 120, 0, 0, 0, 270 150 Z" fill="#75A9D5" fill-opacity="0.4" stroke="#986E6E"></path>
            <%   if (resultHolder != null) { %>
            <%=resultHolder.getDot()%>
            <%}
            %>
        </svg>
    </div>

    <form class="sender-form" action="controller" method="get" name="form">
        <div class="x-controls">
            <p>Y value:</p>
            <table>
                <tbody>

                <tr>
                    <td>
                        <input type="checkbox" class="checkbox" id="1" name="y" value="-3"/>
                        <label for="1"></label>
                    </td>
                    <td>
                        <input type="checkbox" class="checkbox" id="2" name="y" value="-2"/>
                        <label for="2"></label>
                    </td>
                    <td>
                        <input type="checkbox" class="checkbox" id="3" name="y" value="-1"/>
                        <label for="3"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" class="checkbox" id="4" name="y" value="-3"/>
                        <label for="4"></label>
                    </td>
                    <td>
                        <input type="checkbox" class="checkbox" id="5" name="y" value="-2"/>
                        <label for="5"></label>
                    </td>
                    <td>
                        <input type="checkbox" class="checkbox" id="6" name="y" value="-1"/>
                        <label for="6"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" class="checkbox" id="7" name="y" value="-3"/>
                        <label for="7"></label>
                    </td>
                    <td>
                        <input type="checkbox" class="checkbox" id="8" name="y" value="-2"/>
                        <label for="8"></label>
                    </td>
                    <td>
                        <input type="checkbox" class="checkbox" id="9" name="y" value="-1"/>
                        <label for="9"></label>
                    </td>
                </tr>
                </tbody>
            </table>

        </div>
        <div class="YZ-controls">
            <p>X value:</p>
            <input type="text" class="text-field" id="X" placeholder="-5 ... 3" oninput="valid(this)" name="x">
            <p>R value:</p>
            <input type="text" class="text-field" id="R" placeholder="1 ... 4" oninput="valid(this)" name="r">
        </div>
        <p>
            <span id="error-message">
                <!-- Error -->
            </span>
        </p>
        <div class="form-buttons ">
            <button class="submit-button" type='submit' id="submit-btn" disabled="true">Отправить</button>
            <a href=index.jsp?refresh= ><button class="clear-button" type='button' id="clear-btn">Очистить</button></a>
        </div>
    </form>


</div>

<%   if (resultHolder != null) { %>
<%=resultHolder.toString()%>
<%} else {%>
aaaaaa
<%}%>

<footer class="footer">
    <p>aa</p>
</footer>
</body>


<script type="text/javascript">
    const R_field = document.getElementById("R");
    const X_field = document.getElementById("X");


    function valid(element) {
        check_length(element)
        const errmsg = document.getElementById("error-message");
        const submit_btn = document.getElementById("submit-btn");
        var R = R_field.value.replace(/,/, '.');
        var X = X_field.value.replace(/,/, '.');
        // X.replace(/-/, '');

        var isValid = isNumber(R) && isNumber(X);
        var isValid = isValid && (R < 4) && (R > 1) && (X < 3) && (X > -5);
        if (!isNumber(R)) {
            R_field.style.borderColor = "red";
        } else {
            R_field.style.borderColor = "green";
        }
        if (!isNumber(X)) {
            X_field.style.borderColor = "red";
        } else {
            X_field.style.borderColor = "green";
        }
        // alert(isValid);
        if (!isValid) {
            errmsg.textContent = "Error";
            submit_btn.disabled = true;

        } else {
            submit_btn.disabled = false;
            errmsg.textContent = "";
        }

    }

    function isNumber(n) {
        return !isNaN(parseFloat(n)) && !isNaN(n - 0)
    }

    function check_length(element) {
        const MAX = 8;
        if (element.value.length > MAX) {
            element.value = element.value.substr(0, MAX);
        }
    }

    function clear() {
        document.forms["form"].reset();
        table.delete();
    }

    document.getElementById("clear-btn").onclick = clear;
    // alert(isNumber(-3));
    var isDot = false;
    var y_dot;
    var x_dot;
    var y;
    var x;
    var isDotDraw = false;

    function getDotCoor() {
        const plot_container = document.getElementById("svg-plot");
        let rect = plot_container.getBoundingClientRect();
        let R = R_field.value.replace(/,/, '.');
        y_dot = (event.clientY - rect.top);
        x_dot = (event.clientX - rect.left);
        y = (150 - y_dot);
        x = (-150 + x_dot);

        let isDotAllowed = isNumber(R) && (R < 4) && (R > 1);
        if (isDotAllowed) {
            y = y/120*R;
            x = x/120*R;
            isDotDraw = true;
            isDot = (document.getElementById("dot")!=null);
            if (!isDot) {
                let dot = document.createElementNS("http://www.w3.org/2000/svg", "circle");
                dot.setAttribute("r", "3");
                dot.setAttribute("cx", Math.round(x_dot));
                dot.setAttribute("cy", Math.round(y_dot));
                dot.setAttribute("id", "dot");
                // isDot = true;
                document.getElementById("svg-plot").appendChild(dot);
                dot.setAttribute("stroke", "#AD2D2D");
                dot.setAttribute("fill", "#AD2D2D");
            } else {
                let dot = document.getElementById("dot");
                dot.setAttribute("r", "3");
                dot.setAttribute("cx", Math.round(x_dot));
                dot.setAttribute("cy", Math.round(y_dot));
                dot.setAttribute("stroke", "#AD2D2D");
                dot.setAttribute("fill", "#AD2D2D");
            }
            console.log("0");

            sendRequest(x, y, R);
        } else {
            document.getElementById("error-message").innerHTML = "R IS NEEDED";
        }
    }

    function changeDotPos() {
        if (isDotDraw){
            let isDotAllowed = isNumber(R) && (R < 4) && (R > 1);
            if (isDotAllowed) {
                x = 1;
            }
        }
    }

    document.getElementById("svg-plot").onclick = getDotCoor;

    function sendRequest(x, y, r) {
        console.log("1");
        let http = new XMLHttpRequest();
        console.log("2");
        let url = "controller";
        let params = "x=" + x + "&y=" + y + "&r=" + r;

        http.open('GET', url + '?' + params);

        console.log("3");
        http.onload = function () {
            document.location.href = 'index.jsp';
        };
        http.send(null);
        console.log("4");
    }


</script>
</html>
