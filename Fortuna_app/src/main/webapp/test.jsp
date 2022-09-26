<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>

	<style>
body {
	font: 14px "Open Sans", "Arial", sans-serif;
}

h2 {
	margin-bottom: 4px;
}

.left {
	margin-right: 10px;
	float: left;
	width: 160px;
	padding: 0px;
}

.right {
	margin-left: 10px;
	float: left;
	width: 160px;
	padding: 0px;
}

.button {
	cursor: pointer;
	display: block;
	width: 160px;
	border: 1px solid black;
	font-size: 16px;
	text-align: center;
	padding-top: 2px;
	padding-bottom: 4px;
	color: white;
	background-color: darkgreen;
	text-decoration: none;
}

video {
	margin-top: 2px;
	border: 1px solid black;
}

pre {
	display: block;
	font-family: monospace;
	white-space: pre;
	margin: 1em 0px;
}

.bottom {
	clear: both;
	padding-top: 10px;
}
</style>


	<div class="left">
		<div id="startButton" class="button">Start Recording</div>
		<h2>Preview</h2>
		<video id="preview" width="160" height="120" autoplay muted></video>
	</div>
	<div class="right">
		<div id="stopButton" class="button">Stop Recording</div>
		<h2>Recording</h2>
		<video id="recording" width="160" height="120" controls></video>
		<a id="downloadButton" class="button"> Download </a>
	</div>

	<div class="bottom">
		<pre id="log"></pre>
	</div>


	<script>
let preview = document.getElementById("preview");
let recording = document.getElementById("recording");
let startButton = document.getElementById("startButton");
let stopButton = document.getElementById("stopButton");
let downloadButton = document.getElementById("downloadButton");
let logElement = document.getElementById("log");

let recordingTimeMS = 5000;


function log(msg) {
	  logElement.innerHTML += `${msg}\n`;
	}
	
	
function wait(delayInMS) {
	  return new Promise((resolve) => setTimeout(resolve, delayInMS));
	}
	
	
	
function startRecording(stream, lengthInMS) {
	  let recorder = new MediaRecorder(stream);
	  let data = [];

	  recorder.ondataavailable = (event) => data.push(event.data);
	  recorder.start();
	  log(`${recorder.state} for ${lengthInMS / 1000} seconds��`);

	  let stopped = new Promise((resolve, reject) => {
	    recorder.onstop = resolve;
	    recorder.onerror = (event) => reject(event.name);
	  });

	  let recorded = wait(lengthInMS).then(
	    () => {
	      if (recorder.state === "recording") {
	        recorder.stop();
	      }
	    },
	  );

	  return Promise.all([
	    stopped,
	    recorded
	  ])
	  .then(() => data);
	}
	
function stop(stream) {
	  stream.getTracks().forEach((track) => track.stop());
	}



startButton.addEventListener("click", () => {
	  navigator.mediaDevices.getUserMedia({
	    video: true,
	    audio: true
	  }).then((stream) => {
	    preview.srcObject = stream;
	    downloadButton.href = stream;
	    preview.captureStream = preview.captureStream || preview.mozCaptureStream;
	    return new Promise((resolve) => preview.onplaying = resolve);
	  }).then(() => startRecording(preview.captureStream(), recordingTimeMS))
	  .then ((recordedChunks) => {
	    let recordedBlob = new Blob(recordedChunks, { type: "video/webm" });
	    recording.src = URL.createObjectURL(recordedBlob);
	    downloadButton.href = recording.src;
	    downloadButton.download = "RecordedVideo.webm";

	    log(`Successfully recorded ${recordedBlob.size} bytes of ${recordedBlob.type} media.`);
	  })
	  .catch((error) => {
	    if (error.name === "NotFoundError") {
	      log("Camera or microphone not found. Can't record.");
	    } else {
	      log(error);
	    }
	  });
	}, false);
	
	
stopButton.addEventListener("click", () => {
	  stop(preview.srcObject);
	}, false);
</script>
</body>
</html>