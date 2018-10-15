$(document).ready(function() {
	$(".size-detect").on("click", function() {
		$(".size-detect").toggleClass("pos-bottom-right").toggleClass("bounceInDown");
	});

	// Menu FX
	$(".navigation--primary .navigation__header").hover(function() {
		$(".navigation--primary .navigation__header").addClass("navigation--fx");
		$(this).removeClass("navigation--fx");
	}, function() {
		$(".navigation--primary .navigation__header").removeClass("navigation--fx");
	});

	// Toggle Menu Item
	$(".navigation__header").on("click", function() {
		var navTarget = $(this).attr("data-target") + "--panel";
		$(".navigation__panel").each(function(){
			if($(this).attr('data-target') == navTarget) {


				//$(".navigation--secondary").addClass("--active");
				$(this).addClass("navigation__panel--show");
				$("body").addClass("navigation--secondary--is-active");
				/*$(".navigation__menu-mobile--is-arrow").show();


				console.log("adding --active");
				console.log(navTarget);
				console.log($(this));*/
			} else {

				//$(".navigation--secondary").removeClass("--active");







				$(this).removeClass("navigation__panel--show");
				//$("body").removeClass("navigation--secondary--is-active");

				/*console.log("removing --active");
				console.log(navTarget);
				console.log($(this));*/
			}
		});
	});

	// These click events control the navigation panels

	$(".navigation__menu-mobile--is-hamburger").on("click", function() {
		$("body").addClass("navigation--primary--is-active");
	});

	$(".navigation__menu-mobile--is-close").on("click", function() {
		$("body").removeClass("navigation--primary--is-active");
	});

	$(".navigation__menu-mobile--is-arrow").on("click", function() {
		$("body").removeClass("navigation--secondary--is-active");
	});

	$(".navigation__widget").on("click", function() {
		$("body").removeClass("navigation--primary--is-active").removeClass("navigation--secondary--is-active");

	});

	/* Old Code that may be useful later so I'm not deleting it for now */

	/*$(".navigation--secondary .navigation__widget").on("click", function() {
		$(".navigation__brick").toggleClass("hidden-md-down");
	});

	$(".navigation__menu-mobile--is-arrow, .navigation--secondary .navigation__widget").on("click", function() {
		$(".navigation--secondary").removeClass("--active");
		$(".navigation__panel--show").removeClass("navigation__panel--show");
		$(".navigation__menu-mobile--is-arrow").hide();
	});


	// Toggle Hamburger Menu
	$(".navigation__menu-mobile--is-hamburger").on("click", function() {
		$(".navigation__brick").toggleClass("hidden-md-down");
		$(".navigation__menu-mobile.navigation__menu-mobile--is-hamburger, .navigation__menu-mobile.navigation__menu-mobile--is-close").toggle();
	});

	$(".navigation__menu-mobile--is-close").on("click", function() {
		$(".navigation__brick").toggleClass("hidden-md-down");
		$(".navigation__menu-mobile.navigation__menu-mobile--is-hamburger, .navigation__menu-mobile.navigation__menu-mobile--is-close").toggle();
	});*/



});