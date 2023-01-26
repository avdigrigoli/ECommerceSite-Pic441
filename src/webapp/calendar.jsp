<%@ page import="java.util.ArrayList" %>
<%@ page import="com.picturehouse.picturehouse441.daos.CalendarEventDAO" %>
<%@ page import="com.picturehouse.picturehouse441.models.CalendarEvent" %>
<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<html>
<head>
    <title>My Evo Calendar</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Mono&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/evo-calendar@1.1.2/evo-calendar/css/evo-calendar.min.css"/>
    <%@include file="head.jsp"%>
</head>
<style>

    /* Evo Calendar - Theme: Royal Navy */
    .royal-navy .calendar-sidebar {
        background-color: #1F0D40;
        -webkit-box-shadow: 5px 0 18px -3px #1F0D40;
        box-shadow: 5px 0 18px -3px #1F0D40;
    }
    .royal-navy.sidebar-hide .calendar-sidebar {
        -webkit-box-shadow: none;
        box-shadow: none;
    }
    .royal-navy .calendar-sidebar > .month-list::-webkit-scrollbar-thumb:hover {
        background: #fff7e1;
    }
    .royal-navy .calendar-sidebar > .month-list > .calendar-months {
        padding: 0 15px 0 0;
    }
    .royal-navy .calendar-sidebar > .month-list > .calendar-months > li {
        padding: 9px 30px;
        border-radius: 0 25px 25px 0;
    }
    .royal-navy .calendar-sidebar > .month-list > .calendar-months > li:hover {
        background-color: rgba(0, 0, 0, 0.20);
    }
    .royal-navy .calendar-sidebar > .month-list > .calendar-months > li.active-month {
        background-color: rgba(0, 0, 0, 0.35);
    }
    .royal-navy .calendar-sidebar > span#sidebarToggler {
        width: 35px;
        height: 35px;
        top: 10px;
        right: 0;
        background-color: #f7cb91;
        border-radius: 50%;
        padding: 8px;
        -webkit-transform: translate(50%, 0);
        -ms-transform: translate(50%, 0);
        transform: translate(50%, 0);
        -webkit-box-shadow: 0 5px 10px -3px #f7cb91;
        box-shadow: 0 5px 10px -3px #f7cb91;
        -webkit-transition: all .3s ease;
        -o-transition: all .3s ease;
        transition: all .3s ease;
    }
    .royal-navy.sidebar-hide .calendar-sidebar > span#sidebarToggler {
        -webkit-transform: translate(calc(100% + 10px), 0);
        -ms-transform: translate(calc(100% + 10px), 0);
        transform: translate(calc(100% + 10px), 0);
    }
    .royal-navy button.icon-button > span.bars,
    .royal-navy button.icon-button > span.bars::before,
    .royal-navy button.icon-button > span.bars::after {
        height: 3px;
    }
    .royal-navy button.icon-button > span.bars::before {
        top: -6px;
    }
    .royal-navy button.icon-button > span.bars::after {
        bottom: -6px;
    }
    .royal-navy .calendar-inner {
        color: #164255;
    }
    .royal-navy th[colspan="7"] {
        color: #1F0D40;
    }
    .royal-navy th[colspan="7"]::after {
        background-color: rgba(33, 101, 131, 0.15);
    }
    .royal-navy tr.calendar-body .calendar-day .day:hover {
        background-color: rgba(48, 152, 197, 0.25);
        color: #164255;
    }
    .royal-navy tr.calendar-body .calendar-day .day.calendar-active,
    .royal-navy tr.calendar-body .calendar-day .day.calendar-active:hover {
        border-color: #164255;
    }
    .royal-navy tr.calendar-body .calendar-day .day.calendar-today {
        background-color: #1F0D40;
        color: #fff;
        -webkit-box-shadow: 0 5px 10px -3px #1F0D40;
        box-shadow: 0 5px 10px -3px #1F0D40;
    }
    .royal-navy #eventListToggler {
        width: 35px;
        height: 35px;
        top: 10px;
        background-color: #f7cb91;
        border-radius: 50%;
        padding: 6px;
        -webkit-box-shadow: 0 5px 10px -3px #f7cb91;
        box-shadow: 0 5px 10px -3px #f7cb91;
        -webkit-transform: translateX(-10px);
        -ms-transform: translateX(-10px);
        transform: translateX(-10px);
        -webkit-transition: all .3s ease;
        -o-transition: all .3s ease;
        transition: all .3s ease;
    }
    .royal-navy .calendar-events {
        padding-top: 50px;
        padding-bottom: 40px;
        background-color: #1F0D40;
        color: #fff;
    }
    .royal-navy .calendar-events::-webkit-scrollbar-thumb {
        background: #fff;
        border-radius: 5px;
    }
    .royal-navy .calendar-events::-webkit-scrollbar-thumb:hover {
        background: #fff7e1;
    }
    .royal-navy .calendar-events > .event-header > p {
        text-transform: uppercase;
        padding-bottom: 10px;
        border-bottom: 1px solid #fff;
        color: #fff;
    }
    /* .royal-navy .event-container {
        border-radius: 30px;
    } */
    .royal-navy .event-container:hover {
        background-color: #fff;
    }
    .royal-navy .event-container > .event-info > p {
        color: #fff;
    }
    .royal-navy .event-container:hover > .event-info >  p {
        color: #164255;
    }
    .royal-navy .event-container > .event-info > p.event-title > span {
        color: #fff;
        border: 1px solid #164255;
        border-radius: 15px;
        background-color: rgb(22 66 85);
    }
    .royal-navy .event-list > .event-empty {
        background-color: rgba(255, 255, 255, 0.15);
        border: 1px solid #fff;
    }
    .royal-navy .event-list > .event-empty > p {
        color: #ffff;
    }
    @media screen and (max-width: 768px) {
        .royal-navy .calendar-sidebar > .month-list > .calendar-months > li {
            padding: 6px 26px;
        }
        .royal-navy button.icon-button > span.bars,
        .royal-navy button.icon-button > span.bars::before,
        .royal-navy button.icon-button > span.bars::after {
            height: 4px;
        }
        .royal-navy .calendar-inner::after {
            background-color: rgba(44, 81, 97, 0.5);
        }
        .royal-navy .calendar-sidebar > span#sidebarToggler,
        .royal-navy #eventListToggler {
            width: 50px;
            height: 50px;
            padding: 15px 12px;
        }
        .royal-navy button.icon-button > span.bars::before {
            top: -8px;
        }
        .royal-navy button.icon-button > span.bars::after {
            bottom: -8px;
        }
        .royal-navy .calendar-events {
            -webkit-box-shadow: -5px 0 18px -3px #1F0D40;
            box-shadow: -5px 0 18px -3px #1F0D40;
        }
        .royal-navy.event-hide .calendar-events {
            -webkit-transform: translateX(calc(100% + 1px));
            -ms-transform: translateX(calc(100% + 1px));
            transform: translateX(calc(100% + 1px));
            -webkit-box-shadow: none;
            box-shadow: none;
        }
        .royal-navy #eventListToggler {
            -webkit-transform: translateX(50%);
            -ms-transform: translateX(50%);
            transform: translateX(50%);
        }
        .royal-navy.event-hide #eventListToggler {
            right: 10px;
            -webkit-transform: translateX(0);
            -ms-transform: translateX(0);
            transform: translateX(0);
        }
        .royal-navy.event-hide .calendar-events #eventListToggler {
            -webkit-transform: translateX(calc(-100% - 10px));
            -ms-transform: translateX(calc(-100% - 10px));
            transform: translateX(calc(-100% - 10px));
        }
    }
    /* sm only */
    @media screen and (max-width: 768px) and (min-width: 426px) {
        .royal-navy .calendar-events {
            padding-top: 60px;
        }
    }
    @media screen and (max-width: 425px) {
        .royal-navy .calendar-sidebar > .calendar-year {
            background-color: #1F0D40;
            -webkit-box-shadow: 0 5px 8px -3px rgba(12, 37, 47, 0.65);
            box-shadow: 0 5px 8px -3px rgba(12, 37, 47, 0.65);
        }
        .royal-navy .calendar-sidebar > .month-list {
            background-color: #174d65;
        }
        .royal-navy .calendar-sidebar > .month-list > .calendar-months {
            padding: 10px;
        }
        .royal-navy .calendar-sidebar > .month-list > .calendar-months > li {
            width: 100%;
            padding: 10px 20px;
            border-radius: 25px;
            float: unset;
        }
        .royal-navy.sidebar-hide .calendar-sidebar > span#sidebarToggler {
            -webkit-transform: translate(-5px, 10px) scale(0.9);
            -ms-transform: translate(-5px, 10px) scale(0.9);
            transform: translate(-5px, 10px) scale(0.9);
        }
        .royal-navy .calendar-sidebar > span#sidebarToggler {
            -webkit-transform: translate(-5px, 10px) scale(0.9);
            -ms-transform: translate(-5px, 10px) scale(0.9);
            transform: translate(-5px, 10px) scale(0.9);
        }
        .royal-navy .calendar-inner {
            padding: 63px 0 40px 0;
            -webkit-box-shadow: 0 5px 8px -3px rgba(12, 37, 47, 0.65);
            box-shadow: 0 5px 8px -3px rgba(12, 37, 47, 0.65);
        }
        .royal-navy.event-hide .calendar-events,
        .royal-navy .calendar-events {
            padding: 20px 15px;
            -webkit-transform: translateX(0);
            -ms-transform: translateX(0);
            transform: translateX(0);
        }
        .royal-navy.event-hide .calendar-events {
            padding: 0 15px;
        }
        .royal-navy.event-hide #eventListToggler,
        .royal-navy #eventListToggler {
            top: calc(100% - 185px);
            right: 0;
            -webkit-transform: translate(-5px, -50%) scale(0.9);
            -ms-transform: translate(-5px, -50%) scale(0.9);
            transform: translate(-5px, -50%) scale(0.9);
        }
        .royal-navy.event-hide #eventListToggler {
            top: 100%;
            -webkit-transform: translate(0, -100%) scale(0.8);
            -ms-transform: translate(0, -100%) scale(0.8);
            transform: translate(0, -100%) scale(0.8);
        }
        p{
            color: white;
        }
    }
</style>
<body>

<div id="calendar"></div>

<!-- Add jQuery library (required) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"></script>

<!-- Add the evo-calendar.js for.. obviously, functionality! -->
<!--<script src="https://cdn.jsdelivr.net/npm/evo-calendar@1.1.2/evo-calendar/js/evo-calendar.min.js"></script>-->
<script src="js/evo-calendar.js"></script>


<script>
    $("#calendar").evoCalendar({

        //THIS IS WHERE THEY ARE BEING STORED
        calendarEvents: [

        ],
        theme:'Royal Navy',
        toggleEventList: true
    })
</script>
<script>
    //THIS IS WHERE THE LOOP WOULD GO
    <%
        ArrayList<Integer> idlist = CalendarEventDAO.getIDs();
        for(int id : idlist){
            String name = CalendarEventDAO.getName(id);
            String description = CalendarEventDAO.getDescription(id);
            String date = CalendarEventDAO.getDate(id);
            String type = CalendarEventDAO.getType(id);
            String color = CalendarEventDAO.getColor(id);
            String time = CalendarEventDAO.getTime(id);


        %>

    $("#calendar").evoCalendar('addCalendarEvent', [
        {
            id: "<%=id%>",
            name: "<%=name%>",
            date: "<%=date%>",
            type: "<%=type%>",
            description: "<%=description%>",
            eventtime: "<%=time%>",
            color: "<%=color%>"
        }
    ]);
    <%
    }
    %>
</script>

</body>
</html>