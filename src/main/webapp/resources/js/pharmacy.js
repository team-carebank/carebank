const url = "resources/json/sdCd.json";
const ur2 = "resources/json/sggCd.json";

$(function() {
	$.getJSON(url, function(data) {
		$(".pagination").empty();
		$(".category-list").empty();
		$.each(data, function(key, model) {
			$(".category-list").append(
				"<li><a href='javascript:void(0);'onclick='clickSido(this)' class='category-list-item'>"
				+ model.시도코드명 + "</a></li>");
			$(".category-list").show("slow");
		});
	});
});

function clickSido(e) {
	$(".pagination").hide();
	$(".content-main").hide();
	var region = $(e).text();
	setSido(region);
}

function setSido(region) {
	$.getJSON(ur2, function(data) {
		$(".sub-category-list").empty();
		$.each(data, function(key, model) {
			if (model.시도코드명 == region) {
				$(".sub-category-list").append(
					"<li><a href='javascript:void(0);' onclick='clickSggu(this)'>"
					+ model.시군구코드명 + "</a></li>");
				$(".sub-category-list").show("slow");
			}
		});
	});
}

function clickSggu(e) {
	$(".pagination").hide();
	$(".content-main").hide();
	var sgguName = $(e).text();
	getPharmacyByPage(sgguName, 1);
	$(".content-main").show("slow");
	$(".pagination").show("slow");

	let stateObj = { sgguName: sgguName, pageno: 1 };

	let renewURL = location.href;
	renewURL = renewURL.replace(/\?page=([0-9]+)/ig, '');
	renewURL += '?page=' + 1;

	history.pushState(stateObj, null, renewURL);
}

function getSgguName(sgguName) {
	var currentSggu = $(".sub-category-name").text();

	if (currentSggu == '' || currentSggu == null) {
		currentSggu = sgguName;
	}

	return currentSggu;
}

function clickPage(pageno) {
	if (pageno < 0) {
		pageno = 1;
	}
	$(".pagination").hide();
	$(".content-main").hide();
	var sgguName = getSgguName();
	getPharmacyByPage(sgguName, pageno);
	$(".content-main").show("slow");
	$(".pagination").show("slow");

	let stateObj = { sgguName: sgguName, pageno: Number(pageno) };

	let renewURL = location.href;
	renewURL = renewURL.replace(/\?page=([0-9]+)/ig, '');
	renewURL += '?page=' + pageno;

	history.pushState(stateObj, null, renewURL);
}

function getPharmacyByPage(sgguName, pageno) {
	$(".sub-category-name").html(sgguName);
	$(".info-list").empty();
	$(".pagination").empty();
	$.getJSON(ur2, function(data) {
		$.each(data, function(key, model) {
			if (model.시군구코드명 == sgguName) {
				var sgguCd = model.시군구코드;
				$.ajax({
					type: "post",
					url: "pharmacypage.do",
					data: JSON.stringify({ sgguCd: sgguCd, pageno: pageno }),
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
									+ "<span><a href='pharmacyinfo.do?yadmNm=" + yadmNm + "&sgguCd=" + sgguCd + "'>지도 보기</a></span>";
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
				}).done(function() {
					$.ajax({
						type: "post",
						url: "getpages.do",
						data: JSON.stringify(sgguCd),
						contentType: "application/json",
						success: function(count) {
							var i = 0;
							var pageCnt = parseInt((count - 1) / 30);
							if (pageCnt - pageno + 1 <= 10) {
								for (i = pageno; i < pageCnt + 1; i++) {
									var page = "<li class='page'><a href='javascript:clickPage(" + i + ")'>" + i + "</a></li>";
									$(".pagination").append(page);
								}
							} else {
								for (i = pageno; i < pageno + 10; i++) {
									var page = "<li class='page'><a href='javascript:clickPage(" + i + ")'>" + i + "</a></li>";
									$(".pagination").append(page);
								}
								var next = "<li><a href='javascript:nextPage()'>다음</a></li>";
								$(".pagination").append(next);
							}
							if (pageno > 1) {
								var prev = "<li><a href='javascript:prevPage()'>이전</a></li>";
								$(".pagination").prepend(prev);
							}
						},
						error: function() {
							alert("통신 실패");
						}
					});
				});
			}
		});
	});
}

function nextPage() {
	var pageno = $(".page").last("a").text();
	clickPage(Number(pageno) + 1);
}

function prevPage() {
	var pageno = $(".page").first("a").text();
	clickPage(Number(pageno) - 10);
}

window.onpopstate = function(event) {
	var current = event.state;
	getPharmacyByPage(current.sgguName, current.pageno);
	$(".content-main").show("slow");
	$(".pagination").show("slow");
}