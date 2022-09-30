<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<style>
video {
	width: 600px;
	height: 400px;
}
</style>


<body>

	<video class="video" id="src.mp4" muted="muted" autoplay controls loop></video>

	<script>
	var bird = new bird_eye_view();
		/*opener.location.href = "javascript:bird_eye_view()"*/
	


		var b_video = document.getElementById("src.mp4");
		function bird_eye_view() {
			const time = opener.video.currentTime;
			if (opener.videonum == 1) {
				b_video.src = './CCTV_Video/test3.mp4';
				b_video.currentTime = time;
				console.log(b_video.currentTime);
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				b_video.load();
				b_video.play();
			} else if (opener.videonum == 2) {
				b_video.src = './CCTV_Video/test3.mp4';
				b_video.currentTime = time;
				console.log(b_video.currentTime);
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				b_video.load();
				b_video.play();
			}

		}
	</script>





</body>
</html>