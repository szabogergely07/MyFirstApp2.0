var refreshRating = function() {
	$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
};

$(document).on('turbolinks:load', function(){
  refreshRating();

  // Zoom plugin for puroduct pictures
  $(".img-zoom").elevateZoom({
  	zoomType: "lens",
  	lensShape: "round",
  	lensSize: 200
  });  
});