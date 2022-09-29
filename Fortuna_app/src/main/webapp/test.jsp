<link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.0.0/magnific-popup.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="popup-video.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.0.0/jquery.magnific-popup.min.js"></script>

<html>

<body>
<a href="javascript:openWindowPop('./test5.mp4','popup');">팝업창 열기</a>
</body>
</html>
   


<script>
function openWindowPop(url,name){
	var options = 'top10=10,left=10,width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
	window.open(url,name,options);
}


</script>