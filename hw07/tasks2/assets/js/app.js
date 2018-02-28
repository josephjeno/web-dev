// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html";
import $ from "jquery";

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

function on_click(ev) {
    let button = $(ev.target);
    let date = new Date().toISOString();

    if ($(button).text() == "start time") {
        $(button).text("end time");
        $(button).data('start-time', date);
        $(button).attr("data-start-time", date);
    } else {
        let task_id = button.data('task-id');
        let start_time = button.data('start-time');
        $(button).text("start time");
        $(button).attr("data-start-time", "");
        $.ajax(time_path, {
            method: "post",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({time_block: {task_id: task_id, start: start_time, end: date},}),
            success: (resp) => {
        $('#task-time' + task_id).append(
            '<p>Start Date: '+ resp.data.start.slice(0, 10) + '</p>' +
            '<p>Start Time: ' + resp.data.start.slice(11, 20) + '</p>' +
            '<p>End Date: '+ resp.data.end.slice(0, 10) + '</p>' +
            '<p>End Time: ' + resp.data.end.slice(11, 20) + '</p>');
    location.reload()},}); }
}

function on_delete(ev) {
    let button = $(ev.target);
    let del_id = button.data('del-id');

    $.ajax(time_path + "/" + del_id, {
        method: "delete",
        dataType: "json",
        contentType: "application/json; charset=UTF-8",
        data: "",
        success: () => {
            $('.time').each((_, div) => {
            if (("div" + del_id) == $(div).data('time-box')) {$(div).remove();}
            });
            },
    });
}

function init_buttons() {
    $(".btn_on").click(on_click);
    $(".btn_del").click(on_delete);
}

$(init_buttons);