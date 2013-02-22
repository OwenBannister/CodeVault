
$(function() {
	$('.rating_star').click(function() {
		var star = $(this);
		var stars = $(this).attr('data-stars');
		for(i=1; i<=5; i++){
			if (i <= stars){
				$('#star_'+i).attr('src', 'assets/star.png');
			}
			else {
				$('#star_'+i).attr('src', 'assets/grey_star.png');
			}
		}
		$('#crowdmembers_star_form').val(stars);
		$('#managers_star_form').val(stars);
	});
});
