// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

$(document).on('turbolinks:load', function() {
  // ハンバーガーメニューをクリックしたら.hum-menu-contentのd-noneをつけたりはずしたりする。
  $('.hum-menu').click(function () {
    $('.hum-menu-content').toggleClass('d-none');
  })

  // ハンバーガーメニュー表示しているときの背景をクリックしたら.hum-menu-contentのd-noneをつけたりはずしたりする。
  $('.hum-menu-content').click(function () {
    $('.hum-menu-content').toggleClass('d-none');
  })
});

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require jquery
//= require rails-ujs
//= require simple_calendar