<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Fortuna project</title>

<link href="./css/main.css" rel="stylesheet">
<link rel="shortcut icon" href="#">

<link href="./css/style_test_css.css" rel="stylesheet">
<head>
<%@ include file="header.jsp"%>
</head>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<body>

	<div class="main_function_container">

		<div class="left_menu_container" style="text-align: center;">

			<h3>��ġ ����</h3>
			<nav class="location_nav">

				<ol id="location_tree">
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid1()">�뱸����</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid2()">���̰���</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid3()">�߾ӷγװŸ�</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid4()">�Ȱ�װŸ�</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid5()">�����װŸ�</button>

						</div>
					</li>


				</ol>

			</nav>

		</div>
		<video class="video" id="src.mp4" muted="muted" autoplay controls loop></video>

		<!--<canvas class="video_container" width=2000 height=2000 onclick="action_coords(event)"></canvas>-->
		<canvas class="line_container" width=1200 height=580
			onclick="action_coords(event)"></canvas>

		<div id="right_menu_container" class="right_menu_container"
			style="text-align: center;">
			<h3>���</h3>
			<nav class="location_nav">

				<ol id="location_tree">

					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="clear_canvas()">���� ����</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="window.open('popup.jsp','test','width=400, height=400')">������̺�</button>

						</div>
					</li>



				</ol>

			</nav>
		</div>

	</div>

	<div id="coordinate" class="coordinate" style="text-align: center;"></div>



</body>






<script>
	const canvas = document.querySelector('.line_container');
	const ctx = canvas.getContext("2d");
	var arr1= new Array();
	var videonum = 0;
	var video = document.getElementById("src.mp4");
	var b_video = document.getElementById("src.mp4");
	
	function playVid1() {
		const time = b_video.currentTime;
		videonum =1;
		video.src = './CCTV_Video/test/test1.mp4';
		video.currentTime = time;
		console.log(video.currentTime);
		video.load();
		video.play();
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		ctx.beginPath();
		draw();
	}
	function playVid2() {
		const time = b_video.currentTime;
		videonum =2;
		video.src = './CCTV_Video/test/test5.mp4';
		video.currentTime = time;
		video.load();
		video.play();
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		$.ajax({
		    url: ' ',
		    dataType: 'text',
		  }).done(successFunction);
		ctx.beginPath();
		draw();
	}
	function playVid3() {
		videonum =3;
		video.src = './CCTV_Video/CTV0002/CTV0002_20220530.230900.000.mp4';
		video.load();
		video.play();
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		ctx.beginPath();
		draw();
	}

	function playVid4() {
		videonum =4;
		video.src = './CCTV_Video/CTV0009/CTV0009_20220518.052730.000.mp4';
		video.load();
		video.play();
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		draw();
	}

	function playVid5() {
		videonum =5;
		ctx.clearRect(0, 0, canvas.width, canvas.height);	
		video.src = './CCTV_Video/CTV0032/CTV0032_20220518.022630.000.mp4';
		video.load();
		video.play();

	}
	
	function bird_eye_view(){
		const time = video.currentTime;
		if(videonum==1){
			b_video.src = './CCTV_Video/test3.mp4';
			b_video.currentTime = time;
			console.log(b_video.currentTime);
			ctx.clearRect(0, 0, canvas.width, canvas.height);	
			b_video.load();
			b_video.play();
		}else if(videonum==2){
			b_video.src = './CCTV_Video/test4.mp4';
			b_video.currentTime = time;
			console.log(b_video.currentTime);
			ctx.clearRect(0, 0, canvas.width, canvas.height);	
			b_video.load();
			b_video.play();
		}
		
		
	}
	
	
	
	function openWindowPop(url,name){
		var options = 'top10=10,left=10,width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
		window.open(url,name,options);
	}
	
	

	function clear_canvas() {

		ctx.clearRect(0, 0, canvas.width, canvas.height);

	}
	
	
	function successFunction(data) { /* csv���� ��ǥ �ҷ��ͼ� �׸��׸��� */
		ctx.beginPath();
		ctx.strokeStyle = 'red';
		ctx.lineWidth =5;  
		var allRows = data.split(/\r?\n|\r/);
		  
		  for (var singleRow = 0; singleRow < allRows.length; singleRow++) {
		    if (singleRow === 0) {
		      
		    } else {
		      
		    }
		    var rowCells = allRows[singleRow].split(',');
		    for (var rowCell = 0; rowCell < rowCells.length; rowCell++) {
		     
		    	if (singleRow === 0) {
		        
		      } else if(singleRow > 0 ){
		        
		    	 if(rowCell == 0){
		    		 
		    		 arr1[0] = rowCells[rowCell];
		    		 
		         }else if(rowCell == 1){
		        	 
		    		 arr1[1] = rowCells[rowCell];
		    		 
		    	 }else if(rowCell == 2){
		    		 
		    		 arr1[2] = rowCells[rowCell];
		    		 
		    	 }else if(rowCell == 3){
		    		 
		    		 arr1[3] = rowCells[rowCell];
		    	 }
		        
		        
		       
		      }
		    }
		    ctx.moveTo(arr1[0]*1200/320, arr1[1]*580/240);
			ctx.lineTo(arr1[2]*1200/320, arr1[3]*580/240);
			ctx.stroke();
		    
		    
		    if (singleRow === 0) {
		     
		    } else {
		      
		    }
		    
		  } 
		 
		    
			/*ctx.beginPath();
			ctx.strokeStyle = 'red';
			ctx.lineWidth =5;
			ctx.moveTo(arr1[0]*1200/320, arr1[1]*580/240);
			ctx.lineTo(arr1[2]*1200/320, arr1[3]*580/240);
			alert(arr1[0]);
			alert(arr1[1]);
			alert(arr1[2]);
			alert(arr1[3]);
			ctx.stroke();*/
		}
	
	
	
	
	
</script>


<script>
	/*const canvas = document.querySelector('.video_container');
	const ctx = canvas.getContext('2d');
	let canPlayState = false;

	ctx.textAlign = 'center';
	
	
	const videoElem = document.querySelector('.video');
	videoElem.addEventListener('canplaythrough', render);

	

	function render() {
		ctx.drawImage(videoElem, 0, 0, 800, 600);
			

		requestAnimationFrame(render);
		draw()

	}*/

	function draw() {
		var clickCnt = 0;

		var create_dot_arr = [];
		var ctx;
		var canvas = document.querySelector('.line_container');

		if (canvas.getContext) {
			ctx = canvas.getContext("2d");
		}

		$(canvas).on("click", function(e) {
			if (canvas.getContext) {
				var x = e.offsetX;
				var y = e.offsetY;
				var r = 5;
				var c = "rgba(29, 219, 22, 0.5)";

				dotDrawing(ctx, x, y, r, c);

				clickCnt++;
				if (clickCnt % 2 == 0) {
					var beforeDot = create_dot_arr[0];
					var beforeX = beforeDot.x;
					var beforeY = beforeDot.y;
					lineDrawing(ctx, beforeX, beforeY, x, y, 'red');
					arrowDrawing(ctx, beforeX, beforeY, x, y, 'red');
					create_dot_arr = [];
				} else {
					var obj = {};
					obj.color = c;
					obj.x = x;
					obj.y = y;
					obj.r = r;
					create_dot_arr.push(obj);
				}
			}
		});

		function dotDrawing(ctx, x, y, r, color) {
			if (ctx != null) {
				ctx.save();
				ctx.beginPath();
				ctx.fillStyle = color;
				ctx.arc(x, y, r, 0, Math.PI * 2, true);
				ctx.fill();
				ctx.restore();
			}
		}

		function lineDrawing(ctx, sx, sy, ex, ey, color) {
			if (ctx != null) {
				ctx.save();
				ctx.beginPath();
				ctx.strokeStyle = color;
				ctx.moveTo(sx, sy);
				ctx.lineTo(ex, ey);
				ctx.stroke();
				ctx.restore();
			}
		}

		function arrowDrawing(ctx, sx, sy, ex, ey, color) {
			if (ctx != null) {
				var aWidth = 5;
				var aLength = 12;
				var dx = ex - sx;
				var dy = ey - sy;
				var angle = Math.atan2(dy, dx);
				var length = Math.sqrt(dx * dx + dy * dy);

				//���� ���߱�
				ctx.translate(sx, sy);
				ctx.rotate(angle);
				ctx.fillStyle = color;
				ctx.beginPath();

				//ȭ��ǥ ��� �����
				ctx.moveTo(length - aLength, -aWidth);
				ctx.lineTo(length, 0);
				ctx.lineTo(length - aLength, aWidth);

				ctx.fill();
				ctx.setTransform(1, 0, 0, 1, 0, 0);
			}
		}
	}

	function action_coords(event) {
		var x1 = event.offsetX;
		var y1 = event.offsetY;

		var coords = "offsetX:" + x1 + ", offsetY:" + y1 + "<br/>";

		document.getElementById("coordinate").innerHTML = coords;
	}
	

	
</script>




</html>







