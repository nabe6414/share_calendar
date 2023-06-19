// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import {Calendar} from '@fullcalendar/core';
import interactionPlugin from "@fullcalendar/interaction";
import dayGridPlugin from '@fullcalendar/daygrid';

document.addEventListener('turbolinks:load', function () {
    const calendarEl = document.getElementById('calendar');

    var group_id = document.getElementById('group_id');
    var url = '/groups/' + group_id.innerHTML;
    url += '/plans.json';
    console.log("url:" + url);
    const calendar = new Calendar(calendarEl, {
        plugins: [dayGridPlugin, interactionPlugin],
        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        selectable: true,
        
        events: url//'/groups/' + group_id + '/plans.json'
    });

    calendar.render();
});