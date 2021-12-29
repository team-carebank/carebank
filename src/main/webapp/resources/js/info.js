function clickContinue() {
	$(".content-gallery-continue").hide();
	$(".content-gallery#continue").css("display", "grid");
}

function clickFigure() {
	window.location.href = "#";
}

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

		$(".content-gallery#continue").hide();
		$(".content-gallery-continue").show();
		$(".content-main").show("slow");
	})
});

function clickMenu(subcat_id, info_type) {
	if (info_type == 1) {
		selectMeal(subcat_id);
	}
}

function selectMeal(subcat_id) {
	$.ajax({
		type: "post",
		url: "meallist.do",
		data: JSON.stringify(subcat_id),
		contentType: "application/json",
		success: function(res) {
			console.log(res);
		},
		error: function() {
			alert("통신 실패");
		}
	});
}