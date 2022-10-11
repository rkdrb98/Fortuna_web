function playVid1() {

	videonum = 1;
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
	videonum = 2;
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
	videonum = 3;
	video.src = './CCTV_Video/original/30.mp4';
	video.load();
	video.play();
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	ctx.beginPath();
	draw();
}

function playVid4() {
	videonum = 4;
	video.src = './CCTV_Video/original/50_90.mp4';
	video.load();
	video.play();
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	draw();
}

function playVid5() {
	videonum = 5;
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	video.src = './CCTV_Video/original/70.mp4';
	video.load();
	video.play();

}

function playVid6() {
	videonum = 6;
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	video.src = './CCTV_Video/original/85.mp4';
	video.load();
	video.play();

}

function playVid7() {
	videonum = 7;
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	video.src = './CCTV_Video/original/110_120.mp4';
	video.load();
	video.play();

}

function playVid8() {
	videonum = 8;
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	video.src = './CCTV_Video/original/lane_change.mp4';
	video.load();
	video.play();

}