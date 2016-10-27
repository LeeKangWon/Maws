
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="author" content="likeLion" />
  <meta property="og:title" content="LIKELION::멋쟁이사자처럼" />
  <meta property="og:image" content="http://www.likelion.net/assets/emblem-cfe87567897b3b10f5d56c5412590bff7abd90878c0f144b9b8263bb8a66e2be.png" />
  <meta property="og:url" content="http://likelion.net" />
  <meta property="og:type" content="website" />
  <meta property="og:description" content="내 아이디어를 내 손으로 실현한다.">
  <link rel="shortcut icon" href="http://www.likelion.net/assets/favicon-0f6b2d49b06e2f932eec4795f2d0064b9ce73adbce539279a7dec2eccfa93739.ico" />

  <title>LIKELION :: 멋쟁이사자처럼</title>
  <link rel="stylesheet" media="all" href="/assets/application-2b7059e96282c3c64dad1cf620bfa5f8e6d93aa886994b93e0e669470360d975.css" />
  <script src="/assets/application-d70b17325ce36603fba92d711a118a3dd84d57b339cebbfd0a631c1d755c481c.js"></script>
  <meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="c2TZ59Q6HcefGlbImtU677IXJ83ITi0bN0lFd2Fhp3NI7Bk2j0zldY5opxK1Y6MoRzFRDCKhZrMwhHRGdq1ODA==" />

  <!-- Fonts -->
  <script src="https://npmcdn.com/imagesloaded@4.1/imagesloaded.pkgd.min.js"></script>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

	<style type="text/css">
	#counter1, #counter2, #counter3 { font-family: arial; font-size: 40px; font-weight: bold; }
	</style>
	
	
	<script type="text/javascript">
	function numberCounter(target_frame, target_number) {
		this.count = 0; this.diff = 0;
		this.target_count = parseInt(target_number);
		this.target_frame = document.getElementById(target_frame);
		this.timer = null;
		this.counter();
	};
	 numberCounter.prototype.counter = function() {
		 var self = this;
		 this.diff = this.target_count - this.count;
		 if(this.diff > 0) {
			 self.count += Math.ceil(this.diff / 50);
		 }
		 this.target_frame.innerHTML = this.formatNumber(this.count);
		 if(this.count < this.target_count) {
			 this.timer = setTimeout(function() { self.counter(); }, 20);
		 } else {
			 clearTimeout(this.timer);
		 }
	 };
	 numberCounter.prototype.formatNumber = function(num) {
		 num+= '';
		 x = num.split('.');
		 x1 = x[0];
		 x2 = x.length > 1 ? '.' + x[1] : '';
		 var rgx = /(d+)(d{3})/;
		 while (rgx.test(x1)) {
			 x1 = x1.replace(rgx, '$1' + ',' + '$2');
		  }
		 return x1 + x2;
	 };
	 window.onload =  function(){
	 new numberCounter("counter3", 99999);
	 new numberCounter("counter2", 1123456);
	 new numberCounter("counter1", 15);
	 }
	 </script>


</head>
<body>

	<p id="counter1"></p>
	<p id="counter2"></p>
	<p id="counter3"></p>
	

</body>
</html>