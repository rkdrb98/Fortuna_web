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


<script type="text/javascript" src="./drawing.js"></script>
<script type="text/javascript" src="./video_start.js"></script>




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
	
	var arr1= new Array();
	const canvas = document.querySelector('.line_container');
	const ctx = canvas.getContext("2d");
	var videonum = 0;
	var video = document.getElementById("src.mp4");


	function openWindowPop(url,name){ /* 팝업창 오픈 */
		var options = 'top10=10,left=10,width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
		window.open(url,name,options);
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
		 
		   
		}
	
	
	
	
	




	

	
</script>




</html>







