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
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import $ from "jquery";

function update_buttons() {

  $('.time-button').each( (_, bb) => {
    let task_id = $(bb).data('task-id');
    let time = $(bb).data('time');
    if (time != "") {
      $(bb).text("Stop Working");
    }
    else {
      $(bb).text("Start Working");
    }
  });
}

function set_button(task_id, value) {
  $('.time-button').each( (_, bb) => {
  //  console.log($(bb).data('task-id'));
    if (task_id == $(bb).data('task-id')) {
      $(bb).data('time', value);
    }
  });
  update_buttons();
}


function start(task_id) {
  let time= new Date();
  let date= new Date(time.getTime()+(-300)*60*1000);
  let text = JSON.stringify({
      time_block: {
        task_id: task_id,
        start_time: date,
          end_time: date
        },
    });
  $.ajax(time_block_path , {
    method: "post",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: text,
    success: (resp) => { set_button(task_id, resp.data.id); },
    error: (resp) => {console.log(resp);},
  });
}

function stop(task_id, time_id) {
  let time= new Date();
  let date= new Date(time.getTime()+(-300)*60*1000);
  let text = JSON.stringify({
      time_block: {
          end_time: date
        },
    });

  $.ajax(time_block_path + "/" + time_id, {
    method: "patch",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: text,
    success: () => { set_button(task_id, ""); },
  });
}


function time_click(ev) {
  let btn = $(ev.target);
  let time_id = btn.data('time');
  let task_id = btn.data('task-id');

  if (time_id != "") {
    stop(task_id, time_id);
  }
  else {
    start(task_id);
  }
}

function init_follow() {
  if (!$('.time-button')) {
    return;
  }

  $(".time-button").click(time_click);

  update_buttons();
}

$(init_follow);
