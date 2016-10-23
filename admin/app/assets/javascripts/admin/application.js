// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require moment
//= require moment/sv
//= require godmin
//= require godmin-tags
//= require clippy
//= require_tree .

$(function() {
  clippy.load('Clippy', function(agent) {
    if ($('#login').length > 0) {
      var loginButton = $('input[type=submit]');
      var loginButtonOffset = loginButton.offset();
      agent.show();
      agent.moveTo(loginButtonOffset.left - 0, loginButtonOffset.top - 30);
      agent.speak('Howdy! It looks like you need to login. Please allow me to point at the button you need to click.');
      agent.play('GestureLeft');

      var adminUserEmail = $('#admin_user_email');
      var adminUserEmailOffset = adminUserEmail.offset();
      adminUserEmail.on('focus', function() {
        console.log('focus email');
        agent.stopCurrent();
        agent.moveTo(adminUserEmailOffset.left + 40, adminUserEmailOffset.top - 30);
        agent.speak('Please let me assist you. You need to enter your e-mail address right here!');
        agent.play('GestureRight');
      })
    }

    if ($('.breadcrumb li.active:contains("Personer")').length > 0) {
    }
  });
})


// agent.play('GestureRight');
// agent.play('Save');
// agent.speak('Why hello there! It looks like you are trying to match some folks. Would you like some assistance?');
