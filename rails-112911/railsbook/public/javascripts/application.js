$(document).ready( function(){

  /* Initialize dropdown menus */
  $('.dropdown-button').click( function(){
    $(this).closest('.dropdown-menu').toggleClass( 'open' );
  });

});
