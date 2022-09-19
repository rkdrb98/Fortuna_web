<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="./css/main.css" rel="stylesheet">
</head>
<body>
     <body>
    <h1>Video</h1>
    <video class="video" src="./CCTV_Video/CTV0009/CTV0009_20220518.052730.000.mp4" autoplay muted loop></video>
// �츮 ���� ������ �ʰ� �ִ� ���� �±�!
    <canvas class="canvas" width="600" height="400">�� �������� ĵ������ �������� �ʽ��ϴ�.</canvas>

    <script>
      const canvas = document.querySelector('.canvas');
      const ctx = canvas.getContext('2d');
      let canPlayState = false;

      ctx.textAlign = 'center';
      ctx.fillText('���� �ε� ��..', 300, 200);

      const videoElem = document.querySelector('.video');
      videoElem.addEventListener('canplaythrough', render);

      function render() {
        ctx.drawImage(videoElem, 0, 0, 600, 400);
        // ù ��° ���ڷ� ������ �־��ش�.
        requestAnimationFrame(render);
      }
    </script>
  </body>
  </body>
</html>