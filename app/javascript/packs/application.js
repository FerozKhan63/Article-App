// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"

// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
import $ from 'jquery';
global.$ = jQuery;

$(document).ready(function(){
$("#new-comment").on('click',function(){
    $("#addC").fadeToggle();
  });
});

$(document).ready(function(){
    $("#new-comment").on('click',function(){      
        $("#addC").fadeIn();
        $("#new-comment").hide();
    });
});


// $(window).on('load', function(){
  
//     $("#ArtTable").on("click", "#Delete", function() {
//         alert("asaaa");
//     });
// });