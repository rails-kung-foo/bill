// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  $('body').addClass('jsInitial');

  // Toggle slide effect. Reusable mini mehtod to toggle slide on element.
  // Wrapper has the class toggleSlideEffect and the target has toggleSlideTarget.
  // Easy to reuse for content development.
  var toggleSlideEffect = $('.toggleSlideEffect');

  toggleSlideEffect.on('click', function(){
    var $this = $(this);
    $this.children('.toggleSlideTarget').stop().slideToggle()
    .end.blur();
  });
});
