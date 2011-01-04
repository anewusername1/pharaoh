window.addEvent('domready', function() {
  var denySlide = new Fx.Slide('deny_message', {
    duration 1000,
    transition : Fx.Transitions.Pow.easeOut
  });
  denySlide.slideOut();
  $('toggleDeny').addEvent('click', function(){
    denySlide.slideIn();
  });
});
