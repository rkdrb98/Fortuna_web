<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
#container {
	margin: 0px auto;
	width: 500px;
	height: 375px;
	border: 10px #333 solid;
}

#videoElement {
	width: 500px;
	height: 375px;
	background-color: #666;
}
</style>



</head>
<body>

	<div id="container">

		<video autoplay="true" id="videoElement"></video>

	</div>
	<script>

var video= document.querySelector("#videoElement");

if(navigator.mediaDevice.getUserMedia){
	naviator.mediaDevices.getUserMedia({video:true}).then(function(stream)){
		video.srcObject=stream;
	})
	.catch(function(err0r)){
		consol.log("something went wrong!");
	});
}
</script>


</body>
</html>