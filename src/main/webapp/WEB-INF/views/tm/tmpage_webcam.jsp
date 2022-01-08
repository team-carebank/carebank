<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div>Teachable Machine Image Model</div>
<div id="webcam-container"></div>
<div id="label-container"></div>
<div><button id="stop-button" onclick="stop();">stop</button></div>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<script type="text/javascript">
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

    // the link to your model provided by Teachable Machine export panel
    const URL = "https://teachablemachine.withgoogle.com/models/ylIMQTgiV/";

    let model, webcam, labelContainer, maxPredictions;
    
    var requestId;
    
    // Load the image model and setup the webcam
    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // or files from your local hard drive
        // Note: the pose library adds "tmImage" object to your window (window.tmImage)
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // Convenience function to setup a webcam
        const flip = true; // whether to flip the webcam
        webcam = new tmImage.Webcam(200, 200, flip); // width, height, flip
        await webcam.setup(); // request access to the webcam
        await webcam.play();
        requestId = window.requestAnimationFrame(loop);

        // append elements to the DOM
        document.getElementById("webcam-container").appendChild(webcam.canvas);
        labelContainer = document.getElementById("label-container");
        labelContainer.appendChild(document.createElement("div"));
    }

    async function loop() {
        webcam.update(); // update the webcam frame
        await predict();
        requestId = window.requestAnimationFrame(loop);
    }

    // run the webcam image through the image model
    async function predict() {
        // predict can take in an image, video or canvas html element
        const prediction = await model.predict(webcam.canvas);
        
        let fitName;
        let fitProbability = 0;
        
        for(var i=0; i<maxPredictions; i++){
        	if(prediction[i].probability > fitProbability){
        		fitName = prediction[i].className;
        		fitProbability = prediction[i].probability;
        	}
        }
        
        labelContainer.childNodes[0].innerHTML = fitName;
    }
    
    async function stop(){
        await webcam.stop();
        await window.cancelAnimationFrame(requestId);
    }
</script>
<script type="text/javascript">
	$(function(){
		init();
	});
</script>
</body>
</html>