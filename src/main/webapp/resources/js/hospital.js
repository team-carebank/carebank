const url = "resources/json/sdCd.json";
const ur2 = "resources/json/sggCd.json";

$(function() {
	$.getJSON(url, function(data) {
		$(".category-list").empty();
		$.each(data, function(key, model) {
			$(".category-list").append(
				"<li><a href='#none' class='category-list-item' onclick='clickRegion(this)'>"
				+ model.시도코드명 + "</a></li>");
			$(".category-list").show("slow");
		});
	});
});

function clickRegion(e) {
	$(".content-main").hide();
	var region = $(e).text();
	$.getJSON(ur2, function(data) {
		$(".sub-category-list").empty();
		$.each(data, function(key, model) {
			if (model.시도코드명 == region) {
				$(".sub-category-list").append(
					"<li><a href='#none' onclick='clickDistrict(this)'>"
					+ model.시군구코드명 + "</a></li>");
				$(".sub-category-list").show("slow");
			}
		});
	});

}

function clickDistrict(e) {
	$(".content-main").hide();
	var subCategory = $(e).text();
	$(".sub-category-name").html(subCategory);
	$(".info-list").empty();
	$.getJSON(ur2, function(data) {
		$.each(data, function(key, model) {
			if (model.시군구코드명 == subCategory) {
				var sgguCd = model.시군구코드;
				$.ajax({
					type: "post",
					url: "hospitallist.do",
					data: JSON.stringify(sgguCd),
					contentType: "application/json",
					success: function(map) {
						if (map != null) {
							var res = map.res.myArrayList;
							$.each(res, function(key, model) {
								var yadmNm = model.map.yadmNm;
								var addr = model.map.addr;
								var hospUrl = model.map.hospUrl;
								var telno = model.map.telno;

								var clinicInfo = "<div class='clinic-info'><div>"
									+ "<span style='font-size: large; font-weight: bold;'>"
									+ yadmNm
									+ "</span>"
									+ "<span>" + addr + "</span>";
								if (telno != null) {
									clinicInfo += "<span>" + telno + "</span>"
								}
								clinicInfo = clinicInfo
									+ "</div>"
									+ "<div>"
									+ "<span><a href='hospitalinfo.do?yadmNm=" + yadmNm + "&sgguCd=" + sgguCd + "'>상세정보 보기</a></span>";
								if (hospUrl != null) {
									clinicInfo += "<span><a href='" + hospUrl + "' target='_blank'>공식 홈페이지</a></span>";
								}
								clinicInfo += "</div></div>";

								$(".info-list").append(clinicInfo);
							});
						}
					},
					error: function() {
						alert("통신 실패");
					}
				});

			}
		});
	});
	$(".content-main").show("slow");
}
