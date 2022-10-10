<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bird_eye_view</title>
</head>

<style>
body {
	margin: 0px;
}

video {
	pointer-events: none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<body>

	<video class="video" id="src2.mp4" muted="muted" width="500px" autoplay controls loop></video>

</body>
<script>
	var bird = new bird_eye_view();
	/*opener.location.href = "javascript:bird_eye_view()"*/

	function bird_eye_view() {
		const time = opener.video.currentTime;
		if (opener.videonum == 1) {
			var b_video = document.getElementById("src2.mp4");
			b_video.src = './CCTV_Video/bird_eye_view/daegu_bird_eye_view.mp4';
			b_video.currentTime = opener.video.currentTime;
			console.log(b_video.currentTime);

			b_video.load();
			b_video.play();
		} else if (opener.videonum == 2) {
			var b_video = document.getElementById("src2.mp4");
			console.log(open.videonum);
			b_video.src = './CCTV_Video/bird_eye_view/gumi_bird_eye_view.mp4';
			b_video.currentTime = time;
			console.log(b_video.currentTime);

			b_video.load();
			b_video.play();
		}

	}
</script>


</html>