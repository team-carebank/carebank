const NO_IMAGE = "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg";
$(document).on("click", "figure", function(e) {
	var id = e.currentTarget.id;
	var link = "/carebank/suppleinfo.do?id=" + id;
	window.location.href = link;
});

function setImgHeight() {
	$(".content-gallery__img").css("height",
		$(".content-gallery__img").css("width"));

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
		$(".content-main").slideDown("slow");
	})
});

function clickMenu(subcat_id) {
	$(".content-gallery").empty();
	$(".content-gallery#default").hide();
	select(subcat_id);
}

function select(subcat_id) {
	$.ajax({
		type: "post",
		url: "supplelist.do",
		data: JSON.stringify(subcat_id),
		contentType: "application/json",
		success: function(res) {
			var supple = res.supple;

			for (var i = 0; i < supple.length; i++) {
				createGallery(supple[i]);
			}
			setImgHeight();
		},
		error: function() {
			alert("통신 실패");
		}
	}).done(function() {
		$(".content-gallery#default").slideDown("slow");
	});
}

function createGallery(element) {
	var supple_id = element.supple_id;
	var supple_name = element.supple_name.trim();
	var src;
	if (element.src != null) {
		src = element.src.trim();
	} else {
		src = NO_IMAGE;
	}

	var figure = createFigure(supple_name, src, supple_id);
	$(".content-gallery#default").append(figure);
}

function createFigure(name, src, id) {
	var figure = '<figure id="' + id + '">';
	figure += '<img src="' + src + '" class ="content-gallery__img" alt="' + name + '">';
	figure += '<span class="content-gallery__caption">' + name + '</span>';
	figure += '</figure>';

	return figure;
}

function clickFigure(supple_id) {
	window.location.href = "suppleinfo.do?id=" + supple_id;
}
