var limiter = function(){
  var limit = 200;
  var post_text = $('post_text');
  var post_subm = $('post_submit')
  var text = post_text.value;
  var length = text.length;
  if(length > limit){ 
    post_subm.setProperty('disabled', true);
  }else{
    post_subm.setProperty('disabled', false);
  }
  $('limit_count').value = limit - length;
};

window.addEvent('domready', function() {
  $('post_text').addEvent('keyup', limiter);
  $('limit_count').value = '200';
});
