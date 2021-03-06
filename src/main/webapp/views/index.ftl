<!doctype html>



<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1024" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>impress.js | presentation tool based on the power of CSS3 transforms and transitions in modern browsers | by Bartek Szopka @bartaz</title>
    
    <meta name="description" content="impress.js is a presentation tool based on the power of CSS3 transforms and transitions in modern browsers and inspired by the idea behind prezi.com." />
    <meta name="author" content="Bartek Szopka" />

    
    <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=47a77aca41bc2cb4162f008a0b5a98333d95e3a0"></script>
    <script type="text/javascript">
        function init() {
            var p = new daum.maps.LatLng(37.53729488297613, 127.00551022687515);
            var rc = new daum.maps.RoadviewClient();
            var rv = new daum.maps.Roadview(document.getElementById("roadview"));

            rc.getNearestPanoId(p, 50, function(panoid) {
                rv.setPanoId(panoid, p);
                rv.setViewpoint({ pan: 15, tilt: 40, zoom: 2 });
            });
        }
    </script>
   
    <link href="css/impress-demo.css" rel="stylesheet" />
    
    <link rel="shortcut icon" href="favicon.png" />
    <link rel="apple-touch-icon" href="apple-touch-icon.png" />
</head>

<body onload="init()" class="impress-not-supported">

<div class="fallback-message">
    <p>Your browser <b>doesn't support the features required</b> by impress.js, so you are presented with a simplified version of this presentation.</p>
    <p>For the best experience please use the latest <b>Chrome</b>, <b>Safari</b> or <b>Firefox</b> browser.</p>
</div>

<div id="impress">
	

    <div id="bored" class="step slide" data-x="-1000" data-y="-1500">
        <q><b>Hello *</b> how are u?</q>
    </div>

    <div class="step slide" data-x="0" data-y="-1500">
        <iframe src="http://m.daum.net/" width="400px" height="600px" style="float:left;margin-right:20px;"></iframe>
        <q style="padding-left:10px"><b>iFrame</b>을<br> 넣을 수 있고요.</q>
        <!--
        <q>Don't you think that presentations given <strong>in modern browsers</strong> shouldn't <strong>copy the limits</strong> of 'classic' slide decks?</q>
        -->
    </div>
    

    <div class="step slide" data-x="1000" data-y="-1500">
        <div id="mapId" style="width:400px;height:400px"></div>
        <q><strong>지도도 </strong> 넣을 수 있습니다.</q>
    </div>
    <script>

        var position = new daum.maps.LatLng(37.537123, 127.005523);

        var map = new daum.maps.Map(document.getElementById("mapId"), {
            center: position,
            level: 4
        });
    </script>
	<div class="step slide" data-x="2000" data-y="-1500">
        <div id="roadview" style="width:600px;height:400px;"></div>
        <q>당연히 <b>로드뷰*</b>도 넣을 수 있죠.ㅎ</q>
    </div>


    

    <!--
        
        This is an example of step element being scaled.
        
        Again, we use a `data-` attribute, this time it's `data-scale="4"`, so it means that this
        element will be 4 times larger than the others.
        From presentation and transitions point of view it means, that it will have to be scaled
        down (4 times) to make it back to it's correct size.
        
    -->
    <div id="title" class="step" data-x="0" data-y="0" data-scale="4">
        <span class="try">then you should try</span>
        <h1>impress.js<sup>*</sup></h1>
        <span class="footnote"><sup>*</sup> no rhyme intended</span>
    </div>

    <!--
        
        This element introduces rotation.
        
        Notation shouldn't be a surprise. We use `data-rotate="90"` attribute, meaning that this
        element should be rotated by 90 degrees clockwise.
        
    -->
    <div id="its" class="step" data-x="850" data-y="3000" data-rotate="90" data-scale="5">
        <p>It's a <strong>presentation tool</strong> <br/>
        inspired by the idea behind <a href="http://prezi.com">prezi.com</a> <br/>
        and based on the <strong>power of CSS3 transforms and transitions</strong> in modern browsers.</p>
    </div>

    <div id="big" class="step" data-x="3500" data-y="2100" data-rotate="180" data-scale="6">
        <p>visualize your <b>big</b> <span class="thoughts">thoughts</span></p>
    </div>

    <!--
        
        And now it gets really exciting! We move into third dimension!
        
        Along with `data-x` and `data-y`, you can define the position on third (Z) axis, with
        `data-z`. In the example below we use `data-z="-3000"` meaning that element should be
        positioned far away from us (by 3000px).
        
    -->
    <div id="tiny" class="step" data-x="2825" data-y="2325" data-z="-3000" data-rotate="300" data-scale="1">
        <p>and <b>tiny</b> ideas</p>
    </div>

    <!--
        
        This step here doesn't introduce anything new when it comes to data attributes, but you
        should notice in the demo that some words of this text are being animated.
        It's a very basic CSS transition that is applied to the elements when this step element is
        reached.
        
        At the very beginning of the presentation all step elements are given the class of `future`.
        It means that they haven't been visited yet.
        
        When the presentation moves to given step `future` is changed to `present` class name.
        That's how animation on this step works - text moves when the step has `present` class.
        
        Finally when the step is left the `present` class is removed from the element and `past`
        class is added.
        
        So basically every step element has one of three classes: `future`, `present` and `past`.
        Only one current step has the `present` class.
        
    -->
    <div id="ing" class="step" data-x="3500" data-y="-850" data-rotate="270" data-scale="6">
        <p>by <b class="positioning">positioning</b>, <b class="rotating">rotating</b> and <b class="scaling">scaling</b> them on an infinite canvas</p>
    </div>

    <div id="imagination" class="step" data-x="6700" data-y="-300" data-scale="6">
        <p>the only <b>limit</b> is your <b class="imagination">imagination</b></p>
    </div>

    <div id="source" class="step" data-x="6300" data-y="2000" data-rotate="20" data-scale="4">
        <p>want to know more?</p>
        <q><a href="http://github.com/bartaz/impress.js">use the source</a>, Luke!</q>
    </div>

    <div id="one-more-thing" class="step" data-x="6000" data-y="4000" data-scale="2">
        <p>one more thing...</p>
    </div>

    <!--
        
        And the last one shows full power and flexibility of impress.js.
        
        You can not only position element in 3D, but also rotate it around any axis.
        So this one here will get rotated by -40 degrees (40 degrees anticlockwise) around X axis and
        10 degrees (clockwise) around Y axis.
        
        You can of course rotate it around Z axis with `data-rotate-z` - it has exactly the same effect
        as `data-rotate` (these two are basically aliases).
        
    -->
    <div id="its-in-3d" class="step" data-x="6200" data-y="4300" data-z="-100" data-rotate-x="-40" data-rotate-y="10" data-scale="2">
        <p><span class="have">have</span> <span class="you">you</span> <span class="noticed">noticed</span> <span class="its">it's</span> <span class="in">in</span> <b>3D<sup>*</sup></b>?</p>
        <span class="footnote">* beat that, prezi ;)</span>
    </div>

    <!--
        
        So to make a summary of all the possible attributes used to position presentation steps, we have:
        
        * `data-x`, `data-y`, `data-z` - they define the position of **the center** of step element on
            the canvas in pixels; their default value is 0;
        * `data-rotate-x`, `data-rotate-y`, 'data-rotate-z`, `data-rotate` - they define the rotation of
            the element around given axis in degrees; their default value is 0; `data-rotate` and `data-rotate-z`
            are exactly the same;
        * `data-scale` - defines the scale of step element; default value is 1
        
        These values are used by impress.js in CSS transformation functions, so for more information consult
        CSS transfrom docs: https://developer.mozilla.org/en/CSS/transform
        
    -->
    <div id="overview" class="step" data-x="3000" data-y="1500" data-scale="10">
    </div>

</div>

<!--
    
    Hint is not related to impress.js in any way.
    
    But it can show you how to use impress.js features in creative way.
    
    When the presentation step is shown (selected) its element gets the class of "active" and the body element
    gets the class based on active step id `impress-on-ID` (where ID is the step's id)... It may not be
    so clear because of all these "ids" in previous sentence, so for example when the first step (the one with
    the id of `bored`) is active, body element gets a class of `impress-on-bored`.
    
    This class is used by this hint below. Check CSS file to see how it's shown with delayed CSS animation when
    the first step of presentation is visible for a couple of seconds.
    
    ...
    
    And when it comes to this piece of JavaScript below ... kids, don't do this at home ;)
    It's just a quick and dirty workaround to get different hint text for touch devices.
    In a real world it should be at least placed in separate JS file ... and the touch content should be
    probably just hidden somewhere in HTML - not hard-coded in the script.
    
    Just sayin' ;)
    
-->
<div class="hint">
    <p>Use a spacebar or arrow keys to navigate</p>
</div>
<script>
if ("ontouchstart" in document.documentElement) { 
    document.querySelector(".hint").innerHTML = "<p>Tap on the left or right to navigate</p>";
}
</script>

<!--
    
    Last, but not least.
    
    To make all described above really work, you need to include impress.js in the page.
    I strongly encourage to minify it first.
    
    In here I just include full source of the script to make it more readable.
    
    You also need to call a `impress().init()` function to initialize impress.js presentation.
    And you should do it in the end of your document. Not only because it's a good practice, but also
    because it should be done when the whole document is ready.
    Of course you can wrap it in any kind of "DOM ready" event, but I was too lazy to do so ;)
    
-->
<script src="js/impress.js"></script>
<script>impress().init();</script>

<!--
    
    The `impress()` function also gives you access to the API that controls the presentation.
    
    Just store the result of the call:
    
        var api = impress();
    
    and you will get three functions you can call:
    
        `api.init()` - initializes the presentation,
        `api.next()` - moves to next step of the presentation,
        `api.prev()` - moves to previous step of the presentation,
        `api.goto( idx | id | element, [duration] )` - moves the presentation to the step given by its index number
                id or the DOM element; second parameter can be used to define duration of the transition in ms,
                but it's optional - if not provided default transition duration for the presentation will be used.
    
    You can also simply call `impress()` again to get the API, so `impress().next()` is also allowed.
    Don't worry, it wont initialize the presentation again.
    
    For some example uses of this API check the last part of the source of impress.js where the API
    is used in event handlers.
    
-->

</body>
</html>

<!--
    
    Now you know more or less everything you need to build your first impress.js presentation, but before
    you start...
    
    Oh, you've already cloned the code from GitHub?
    
    You have it open in text editor?
    
    Stop right there!
    
    That's not how you create awesome presentations. This is only a code. Implementation of the idea that
    first needs to grow in your mind.
    
    So if you want to build great presentation take a pencil and piece of paper. And turn off the computer.
    
    Sketch, draw and write. Brainstorm your ideas on a paper. Try to build a mind-map of what you'd like
    to present. It will get you closer and closer to the layout you'll build later with impress.js.
    
    Get back to the code only when you have your presentation ready on a paper. It doesn't make sense to do
    it earlier, because you'll only waste your time fighting with positioning of useless points.
    
    If you think I'm crazy, please put your hands on a book called "Presentation Zen". It's all about 
    creating awesome and engaging presentations.
    
    Think about it. 'Cause impress.js may not help you, if you have nothing interesting to say.
    
-->

<!--
    
    Are you still reading this?
    
    For real?
    
    I'm impressed! Feel free to let me know that you got that far (I'm @bartaz on Twitter), 'cause I'd like
    to congratulate you personally :)
    
    But you don't have to do it now. Take my advice and take some time off. Make yourself a cup of coffee, tea,
    or anything you like to drink. And raise a glass for me ;)
    
    Cheers!
    
-->



<#--
<#include "/layout/head.ftl">
<div style="height:100px;"></div>
<span>my name is </span><input type="text" id="myName"><br>
<span>room name is </span><input type="text" id="myRoom"><input id="saveBtn" type="button" value="save"><br>
<input type="button" id="joinBtn" value="join">
<input type="button" id="leaveBtn" value="leave">
<input type="button" id="showPretalkBtn" value="showPretalk">
<div id="chat" style="overflow-y:scroll;width:400px;height:200px;border:1px solid black;"></div>
<form>
<input id="message" type="text" style="width:300px;">
<input type="submit" value="send">
</form>


<script src="http://localhost:8000/socket.io/socket.io.js"></script>
<script>
	var socket = io.connect('http://localhost:8000/chat');

	var chatWindow = $('#chat');
	var messageBox = $('#message');
	var myName = '';
	var myRoom = '';
	

	var showMessage = function(msg) {
		//console.log(msg);
		chatWindow.append($('<p>').text(msg));     
		chatWindow.scrollTop(chatWindow.height());
	}

	socket.on('connect', function() {
		//소캣 커낵션 이후 실행
		//socket.emit('join', {roomName:$('#roomName').text(), nickName:myName}); 
	});

	socket.on('joined', function(data) {
		if(data.isSuccess) {
			showMessage(data.nickName + '님이 입장하셨습니다.');
		}
	});

	socket.on('leaved', function(data) {
        showMessage(data.nickName + '님이 나가셨습니다.');
     });

	socket.on('message', function(data) {
		showMessage(data.nickName + ' : ' + data.msg); 
	});

	socket.on('preTalked', function(data) {
		console.log(data.preTalk);

		$.each(data.preTalk, function(index, value) {
		 	console.log(index + ': ' + value);
		 	showMessage(value);
		});
		//showMessage(data.nickName + ' : ' + data.msg); 
	});

	$('form').submit(function(e) {
		e.preventDefault();
		var msg = messageBox.val();
		if ($.trim(msg) !== '') {
			showMessage(myName + ' : ' + msg);
			socket.json.send({nickName:myName, msg:msg});
			messageBox.val('');
		}
	});
	$('#joinBtn').click(function(e) {
		//console.log(myRoom);
		socket.emit('join', {roomName:myRoom, nickName:myName});
		//location.href='/';
	});
	$('#leaveBtn').click(function(e) {
		socket.emit('leave', {nickName:myName});
		//location.href='/';
	});
	$('#saveBtn').click(function(e) {
		myRoom = $('#myRoom').val();
		myName = $('#myName').val();
		console.log(myRoom, myName);		
		//location.href='/';
	});
	$('#showPretalkBtn').click(function(e) {
		socket.emit('showPreTalk', {roomName:myRoom, nickName:myName});
		//location.href='/';
	});


</script>

-->