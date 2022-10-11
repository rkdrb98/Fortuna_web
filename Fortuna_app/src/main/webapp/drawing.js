/**
 canvas 위 차선 그리기 함수
 */




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

function clear_canvas() {

	ctx.clearRect(0, 0, canvas.width, canvas.height);

}



function action_coords(event) {
	var x1 = event.offsetX;
	var y1 = event.offsetY;

	var coords = "offsetX:" + x1 + ", offsetY:" + y1 + "<br/>";

	document.getElementById("coordinate").innerHTML = coords;
}

