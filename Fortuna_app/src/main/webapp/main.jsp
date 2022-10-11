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

			<h3>위치 선택</h3>
			<nav class="location_nav">

				<ol id="location_tree">
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid1()">대구육교</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid2()">구미공단</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid3()">속도테스트1</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid4()">속도테스트2</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid5()">속도테스트3</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid6()">속도테스트4</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid7()">속도테스트5</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="playVid8()">속도테스트6</button>

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
			<h3>기능</h3>
			<nav class="location_nav">

				<ol id="location_tree">

					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn" onclick="clear_canvas()">차선 제거</button>

						</div>
					</li>
					<li id="list_01" class="depth_0">
						<div class="label">
							<button class="btn"
								onclick="window.open('popup.jsp','test','width=500, height=280, top=500, left=1600')">버드아이뷰</button>

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
	
	
	function playVid1() {
		
		videonum =1;
		video.src = './CCTV_Video/original/daegu_original.mp4';
		
		console.log(video.currentTime);
		video.load();
		video.play();
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		ctx.beginPath();
		draw();
	}
	function playVid2() {
		/*const time = b_video.currentTime;*/
		videonum =2;
		video.src = './CCTV_Video/original/gumi_original.mp4';
		/*video.currentTime = time;*/
		video.load();
		video.play();
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		/*$.ajax({
		    url: ' ',
		    dataType: 'text',
		  }).done(successFunction);*/
		ctx.beginPath();
		draw();
	}
	function playVid3() {
		videonum =3;
		video.src = './CCTV_Video/original/30.mp4';
		video.load();
		video.play();
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		ctx.beginPath();
		draw();
	}

	function playVid4() {
		videonum =4;
		video.src = './CCTV_Video/original/50_90.mp4';
		video.load();
		video.play();
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		draw();
	}

	function playVid5() {
		videonum =5;
		ctx.clearRect(0, 0, canvas.width, canvas.height);	
		video.src = './CCTV_Video/original/70.mp4';
		video.load();
		video.play();

	}
	
	function playVid6() {
		videonum =6;
		ctx.clearRect(0, 0, canvas.width, canvas.height);	
		video.src = './CCTV_Video/original/85.mp4';
		video.load();
		video.play();

	}
	
	function playVid7() {
		videonum =7;
		ctx.clearRect(0, 0, canvas.width, canvas.height);	
		video.src = './CCTV_Video/original/110_120.mp4';
		video.load();
		video.play();

	}
	
	function playVid8() {
		videonum =8;
		ctx.clearRect(0, 0, canvas.width, canvas.height);	
		video.src = './CCTV_Video/original/lane_change.mp4';
		video.load();
		video.play();

	}
	
	
	

	
	
	
	function openWindowPop(url,name){
		var options = 'top10=10,left=10,width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
		window.open(url,name,options);
	}
	
	

	function clear_canvas() {

		ctx.clearRect(0, 0, canvas.width, canvas.height);

	}
	
	
	function successFunction(data) { /* csv에서 좌표 불러와서 그림그리기 */
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

				//두점 선긋기
				ctx.translate(sx, sy);
				ctx.rotate(angle);
				ctx.fillStyle = color;
				ctx.beginPath();

				//화살표 모양 만들기
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







