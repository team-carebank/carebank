<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css">
<style type="text/css">
html {
	display: grid;
}

body {
	background-color: #eeeeee;
	width: 80vh;
	height: 80vh;
	justify-self: center;
	align-self: center;
}

.file-upload {
	background-color: #ffffff;
	margin: 0 auto;
	padding: 20px;
}

.file-upload-btn {
	width: 100%;
	margin: 0;
	color: #fff;
	background: #1FB264;
	border: none;
	padding: 10px;
	border-radius: 4px;
	border-bottom: 4px solid #15824B;
	transition: all .2s ease;
	outline: none;
	text-transform: uppercase;
	font-weight: 700;
}

.file-upload-btn:hover {
	background: #1AA059;
	color: #ffffff;
	transition: all .2s ease;
	cursor: pointer;
}

.file-upload-btn:active {
	border: 0;
	transition: all .2s ease;
}

.file-upload-content {
	display: none;
	text-align: center;
}

.file-upload-input {
	position: absolute;
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	outline: none;
	opacity: 0;
	cursor: pointer;
}

.image-upload-wrap {
	margin-top: 20px;
	border: 4px dashed #1FB264;
	position: relative;
}

.image-dropping, .image-upload-wrap:hover {
	background-color: #1FB264;
	border: 4px dashed #ffffff;
}

.image-title-wrap {
	padding: 0 15px 15px 15px;
	color: #222;
}

.drag-text {
	text-align: center;
}

.drag-text h3 {
	font-weight: 100;
	text-transform: uppercase;
	color: #15824B;
	padding: 60px 0;
}

.file-upload-image {
	max-height: 200px;
	max-width: 200px;
	margin: auto;
	padding: 20px;
}

.remove-image {
	width: 200px;
	margin: 0;
	color: #fff;
	background: #cd4535;
	border: none;
	padding: 10px;
	border-radius: 4px;
	border-bottom: 4px solid #b02818;
	transition: all .2s ease;
	outline: none;
	text-transform: uppercase;
	font-weight: 700;
}

.remove-image:hover {
	background: #c13b2a;
	color: #ffffff;
	transition: all .2s ease;
	cursor: pointer;
}

.remove-image:active {
	border: 0;
	transition: all .2s ease;
}

#start-predict {
	display: none;
}

.teachable-machine-description {
	display: grid;
	justify-items: center;
	align-items: center;
	margin-bottom: 30px;
	margin-top: 30px;
}

#label-container {
	width: 100%;
	display: grid;
	justify-items: center;
	align-items: center;
}

#add-meal {
	margin-top: 30px;
}
</style>
</head>
<body>
	<script class="jsbin"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<div class="teachable-machine-description">
		<span></span>
	</div>
	<div class="file-upload">
		<button class="file-upload-btn" type="button"
			onclick="$('.file-upload-input').trigger( 'click' )">이미지 업로드하기</button>

		<div class="image-upload-wrap">
			<input class="file-upload-input" type="file"
				onchange="readURL(this);" accept="image/*" />
			<div class="drag-text">
				<h3>파일을 드래그하거나 파일 탐색기에서 선택하여 업로드해주세요.</h3>
			</div>
		</div>
		<div class="file-upload-content">
			<img class="file-upload-image" id="upload-image" src="#"
				alt="your image" />
			<div class="image-title-wrap">
				<button type="button" onclick="removeUpload()" class="remove-image">
					이미지 지우기</button>
				<button class="remove-image" onclick="predict()" id="start-predict">확인하기</button>
			</div>
		</div>
		<div id="label-container">
			<span id="label-predict-result"></span>
		</div>
		<div>
			<button class="file-upload-btn" type="button" id="add-meal">식단에 추가하기</button>		
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				$("#start-predict").hide();
				$("#label-container").children("#info-container").empty();
				$("#label-predict-result").empty();

				reader.onload = function(e) {
					$('.image-upload-wrap').hide();

					$('.file-upload-image').attr('src', e.target.result);
					$('.file-upload-content').show();

					//$('.image-title').html(input.files[0].name);
				};

				reader.readAsDataURL(input.files[0]);
				$("#start-predict").show();
			} else {
				removeUpload();
			}
		}

		function removeUpload() {
			$('.file-upload-input')
					.replaceWith($('.file-upload-input').clone());
			$('.file-upload-content').hide();
			$('.image-upload-wrap').show();
			
			$("#label-predict-result").empty();
			$("#label-container").children("#info-container").empty();
			$("#start-predict").hide();
		}
		$('.image-upload-wrap').bind('dragover', function() {
			$('.image-upload-wrap').addClass('image-dropping');
		});
		$('.image-upload-wrap').bind('dragleave', function() {
			$('.image-upload-wrap').removeClass('image-dropping');
		});
	</script>

	<script type="text/javascript">
		// More API functions here:
		// https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

		// the link to your model provided by Teachable Machine export panel
		const URL = 'https://teachablemachine.withgoogle.com/models/gRKXU7fwD/';

		let model, labelContainer, maxPredictions;

		// Load the image model and setup the webcam
		async function init() {
			const modelURL = URL + 'model.json';
			const metadataURL = URL + 'metadata.json';
			
			$(".file-upload").hide();
			$(".teachable-machine-description span").text("Teachable Machine을 불러오는 중입니다...");

			// load the model and metadata
			// Refer to tmImage.loadFromFiles() in the API to support files from a file picker
			// or files from your local hard drive
			// Note: the pose library adds "tmImage" object to your window (window.tmImage)
			model = await tmImage.load(modelURL, metadataURL);
			maxPredictions = model.getTotalClasses();

			labelContainer = document.getElementById('label-container');

			setTimeout($(".teachable-machine-description span").text("Teachable Machine을 불러오는데 성공하였습니다!\n사진을 업로드하여 영양소 정보를 확인하세요!"), 5000);
			
			$(".teachable-machine-description").hide();
			$(".file-upload").show();
		}

		// run the webcam image through the image model
		async function predict() {
			// predict can take in an image, video or canvas html element
			var image = document.getElementById('upload-image');
			const prediction = await model.predict(image, false);
			
	        let fitName;
	        let fitProbability = 0;

			for (let i = 0; i < maxPredictions; i++) {
	        	if(prediction[i].probability > fitProbability){
	        		fitName = prediction[i].className;
	        		fitProbability = prediction[i].probability;
	        	}
			}
	        
	        document.getElementById("label-predict-result").innerHTML = fitName;
			$("#start-predict").hide();
	        getInfo(fitName.trim());
		}
		
		function getInfo(className) {
			$.ajax({
				url : "getinfo.do",
				method : 'post',
				data : JSON.stringify({
					food : className
				}),
				contentType : "application/json",
				success : function(res) {
					$("#label-container").children("#info-container").empty();
					setInfo(res.res);
					alert("영양소 정보를 불러오는데 성공하였습니다.");
				},
				error : function() {
					alert("통신 실패");
				}
			});
		}

		function setInfo(res) {
			let calories = res.calories;
			let carbo = res.carbo;
			let fat = res.fat;
			let protein = res.protein;

			let info_container = "<div id='info-container'>";

			info_container += "<span>칼로리: " + calories + "kcal</span>"
					+ "<br/><span>탄수화물: " + carbo + "g</span>"
					+ "<br/><span>단백질: " + protein + "g</span>"
					+ "<br/><span>지방: " + fat + "g</span>" + "</div>"

			$(labelContainer).append(info_container);
		}
	</script>
	<script type="text/javascript">
		$(function() {
			init();
		});

		$(document).on("click", "#add-meal", function(e) {
			let meal_name = $("#label-predict-result").text();

			$(opener.document).find("input[name='meal_name']").val(meal_name);
			self.close();
		});
	</script>
</body>
</html>