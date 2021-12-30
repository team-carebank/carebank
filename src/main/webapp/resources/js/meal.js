const NO_IMAGE = "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg";

$(function() {
	$(".category-list").slideDown("slow");

	$(".category-list-item")
		.click(
			function() {
				$(".category-list-item").not(this).parent()
					.children(".sub-category-list").slideUp();
				$(this).parent().children(".sub-category-list")
					.slideDown();
			});

	$(".sub-category-list li").click(function() {
		var subCategory = $(this).text();
		$(".sub-category-name").html(subCategory);
		$(".content-main").show("slow");
	})
});

function clickMenu(subcat_id) {
	$(".content-gallery").empty();
	selectMeal(subcat_id);
}

function selectMeal(subcat_id) {
	$.ajax({
		type: "post",
		url: "meallist.do",
		data: JSON.stringify(subcat_id),
		contentType: "application/json",
		success: function(res) {
			var meal = res.meal;
			var food = res.food;

			$(".sub-category-desc").html(food.join(', '));
			for (var i = 0; i < meal.length; i++) {
				createGallery(meal[i]);
			}
		},
		error: function() {
			alert("통신 실패");
		}
	});
}

function createGallery(element) {
	var meal_id = element.meal_id;
	var meal_name = element.meal_name.trim();
	var src;
	if (element.src != null) {
		src = element.src.trim();
	} else {
		src = NO_IMAGE;
	}

	var figure = createFigure(meal_name, src, meal_id);
	$(".content-gallery#default").append(figure);
}

function createFigure(name, src, meal_id) {
	var figure = '<figure onclick="clickFigure(' + meal_id + ');">';
	figure += '<img src="' + src + '" class ="content-gallery__img" alt="' + name + '">';
	figure += '<span class="content-gallery__caption">' + name + '</span>';
	figure += '</figure>';

	return figure;
}

function clickContinue() {
	$(".content-gallery-continue").hide();
	$(".content-gallery#continue").css("display", "grid");
}

function clickFigure(meal_id) {
	window.location.href = "mealinfo.do?id=" + meal_id;
}
