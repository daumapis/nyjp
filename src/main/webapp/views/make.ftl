<#include "/layout/head.ftl">
<style type="text/css">
.modal.fade.in {top: 40%;}

#fillContentModal.modal.fade {top: -60%;}
#fillContentModal.modal.fade.in {top: 40%;}
</style>
<div class="container navbar navbar-fixed-top" style="margin-top:40px;z-index:10;">
	<div class="row">
		<div class="span12">
			<div class="tagline">
				<div class="row" style="margin-bottom:-10px;">
					<div class="span3">
						<div class="tagline_text">
							<h2>Make your <span style="color:#009cea;" class="text-primary">presentation</span>!</h2>
							<#--
							<div class="tag_list">
								<ul>
									<li><span><i class="icon-fire"></i> Hottest price on the net</span></li>
									<li><span><i class="icon-gift"></i> More than expected</span></li>
									<li><span><i class="icon-plane"></i> Flying out of the crowd</span></li>
								</ul>
							</div>
							-->
						</div>
					</div>
					<div class="span9">
						<div class="btn-toolbar cta">
							<a id="newPage" class="btn btn-large btn-primary" href="#"><i class="m-icon-big-swapright m-icon-white"></i> New page</a>
							<a id="fillContent" class="btn btn-large btn-danger" href="#"><i class="m-icon-big-swapright m-icon-white"></i> Fill content</a>
							<#--
							<a id="setPosition" class="btn btn-large btn-success" href="#"><i class="m-icon-big-swapdown m-icon-white"></i> Set position</a>
							-->
							<a id="saveFile" class="btn btn-large btn-inverse" href="#"><i class="m-icon-big-swapdown m-icon-white"></i> Save</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="height:215px;"></div>
<div id="newPageModal" class="modal fade">
	<div class="modal-header">
	    <h2>Select Page Type!</h2>
	</div>
	<div class="modal-body">
		<form class="form-horizontal">
			<div class="control-group">
				<label class="control-label"><i class="icon-asterisk"></i> No Border</label>
				<input type="radio" checked name="pageTypeRadioBtn" value="noborder" class="controls" style="margin-left:20px">
			</div>
			<div class="control-group">
				<label class="control-label"><i class="icon-stop"></i> With Border</label>
				<input type="radio" name="pageTypeRadioBtn" value="border" class="controls" style="margin-left:20px">
			</div>	
		</form>
	</div>
	<div class="modal-footer">
	    <a id="addNewPageModal" href="#" class="btn btn-primary">Add</a>
	    <a id="cancelNewPageModal" href="#" class="btn btn-danger">Cancel</a>
	</div>
</div>

<div id="fillContentModal" class="modal fade" style="width:700px;">
	<div class="modal-header">
	    <h2>Fill Content Modal</h2>
	</div>
	<div class="modal-body">
		<div id="contentBox1" class="madal-wrap">
			<h2>Text</h2>
		    <form class="form-horizontal">
			    <div class="control-group">
			    	<label class="control-label"><i class="icon-stop"></i> Nomal</label>
					<input type="radio" name="textRadioBtn" value="nomal" class="controls" style="margin-left:20px">
				</div>
				<div class="control-group">
					<label class="control-label"><i class="icon-asterisk"></i> Big</label>
					<input type="radio" name="textRadioBtn" value="big" class="controls" style="margin-left:20px">
				</div>
				<div class="control-group">
					<label class="control-label"><i class="icon-asterisk"></i> Small</label>
					<input type="radio" name="textRadioBtn" value="small" class="controls" style="margin-left:20px">
				</div>
				<div class="control-group">
					<label class="control-label"><i class="icon-certificate"></i> Text</label>
					<div class="controls input-append" style="display:block;">
						<input class="span5" id="textContent" type="text" placeholder="Write down!">
					</div>
				</div>
			</form>
		</div>
		<div id="contentBox2" class="madal-wrap hide">
			<h2>Image</h2>
		    <form class="form-horizontal">
			    <div class="control-group">
					<label class="control-label"><i class="icon-certificate"></i> Image url</label>
					<div class="controls input-append" style="display:block;">
						<input class="span5" id="imageUrl" type="text" placeholder="image url">
					</div>
				</div>
			</form>
		</div>
		<div id="contentBox3" class="madal-wrap hide">
			<h2>Map</h2>
		    <form class="form-horizontal">
			    <div class="control-group">
					<label class="control-label"><i class="icon-certificate"></i> Map width</label>
					<div class="controls input-append" style="display:block;">
						<input class="span5" id="mapWidth" type="text" placeholder="width!">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"><i class="icon-certificate"></i> Map height</label>
					<div class="controls input-append" style="display:block;">
						<input class="span5" id="mapHeight" type="text" placeholder="height!">
					</div>
				</div>
			</form>
		</div>
		<div id="contentBox4" class="madal-wrap hide">
			<h2>Movie</h2>
		    <form class="form-horizontal">
			    <div class="control-group">
					<label class="control-label"><i class="icon-certificate"></i> Movie url</label>
					<div class="controls input-append" style="display:block;">
						<input class="span5" id="movieUrl" type="text" placeholder="movie url!">
					</div>
				</div>
			</form>
		</div>
		<div id="contentBox5" class="madal-wrap hide">
			<h2>Iframe</h2>
		    <form class="form-horizontal">
			    <div class="control-group">
					<label class="control-label"><i class="icon-certificate"></i> iFrame url</label>
					<div class="controls input-append" style="display:block;">
						<input class="span5" id="iframeUrl" type="text" placeholder="iframe url!">
					</div>
				</div>
			</form>
		</div>
		    
	</div>
	
	<div class="modal-footer">
		<div class="pagination">
          <ul>
            <li><a href="#">«</a></li>
            <li><a class="contentBtn" href="#none">1</a></li>
            <li><a class="contentBtn" href="#none">2</a></li>
            <li><a class="contentBtn" href="#none">3</a></li>
            <li><a class="contentBtn" href="#none">4</a></li>
            <li><a class="contentBtn" href="#none">5</a></li>
            <li><a class="contentBtn" href="#none">»</a></li>
         </ul>
        </div>
	    <a id="addFillContentModal" href="#" class="btn btn-primary">Enter</a>
	    <a id="cancelFillContentModal" href="#" class="btn btn-danger">Cancel</a>
	</div>
</div>
		
		
<div id="saveFileModal" class="modal fade">
	<div class="modal-header">
	    <h2>Save File</h2>
	</div>
	<div class="modal-body">
		<form class="form-horizontal">
			<div class="control-group">
				<label class="control-label"><i class="icon-certificate"></i> Title</label>
				<div class="controls input-append" style="display:block;">
					<input id="fileTitle" type="text" placeholder="File Title">
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label"><i class="icon-certificate"></i> Description</label>
				<div class="controls input-append" style="display:block;">
					<input class="span3" id="fileDescription" type="text" placeholder="Description">
				</div>
			</div>	
			
		</form>
	</div>
	<div class="modal-footer">
	    <a id="addSaveFileModal" href="#" class="btn btn-primary">Save</a>
	    <a id="cancelSaveFileModal" href="#" class="btn btn-danger">Cancel</a>
	</div>
</div>		



<link href="css/impress-demo.css" rel="stylesheet" />   

<div id="impress">
</div>
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=47a77aca41bc2cb4162f008a0b5a98333d95e3a0"></script>
<style type="text/css">

#map { width: 100%; height: 100% }
</style>



</div>

<script>

var selectedLayer = '';
var mapIdx = 0;
function toggleNewPageModal(){
	if( $('#newPageModal').hasClass("in") ){
		$('#newPageModal').removeClass("in");
	}else{
		$('#newPageModal').addClass("in");	
	}
}
function toggleFillContent(){
	if( $('#fillContentModal').hasClass("in") ){
		$('#fillContentModal').removeClass("in");
	}else{
		$('#fillContentModal').addClass("in");	
	}
}
function toggleSaveFile(){
	if( $('#saveFileModal').hasClass("in") ){
		$('#saveFileModal').removeClass("in");
	}else{
		$('#saveFileModal').addClass("in");	
	}
}


$(".contentBtn").each(function(index){
	
	$(this).click(function(){
		$(".madal-wrap").each(function(){
			$(this).addClass("hide");
		});
		
		var el = $(".madal-wrap")[index];
		$(el).removeClass('hide');
	});
});

$("#newPage").click(function(e) {
	toggleNewPageModal();
});

var data_x = -1000

$("#addNewPageModal").click(function(e) {
	var chkBorder = $(":input:radio[name=pageTypeRadioBtn]:checked").val();
	if(chkBorder == 'border'){
		var startId = ( data_x == -1000 ) ? "bored" : ""
		var el = '<div id="' + startId + '" class="step slide" data-x="' + data_x + '" data-y="-1500"></div>'
	}else if(chkBorder == 'noborder'){
		var el = '<div id="' + startId + '" class="step" data-x="' + data_x + '" data-y="-1500" style="border:1px solid rgba(0, 0, 0, .3)"></div>'
	}
	if(chkBorder){	
		$('#impress').append(el);
		data_x = data_x + 1000;
	}
	toggleNewPageModal();
});
$("#cancelNewPageModal").click(function(e) {
	toggleNewPageModal();
});

document.addEventListener("click", function ( event ) {
	
	
	var target = event.target;
	while ( !(target.classList.contains("step") && !target.classList.contains("active")) &&
            (target !== document.documentElement) ) {
        target = target.parentNode;
    }
    
    
    if( $(target).hasClass("step") ){
    	$("div.step").each(function( index ) {
			if( $(this).hasClass("slide") ){
				$(this).css("border-color","rgba(0, 0, 0, .3)");
		    	$(this).css("border-width","1px");
		    }else{
		    	$(this).css("border","none");
		    }
		});
    	
    	if( $(target).hasClass("slide") ){
    		$(target).css("border-color","#0096e1");
    		$(target).css("border-width","4px");
    		selectedLayer = $(target);
	
    	}else{
    		$(target).css("border-color","#0096e1");
    		$(target).css("border-width","4px");
    		$(target).css("border-style","solid");
    		selectedLayer = $(target);
    	}
    }
}, false);

$("#fillContent").click(function(e) {
	toggleFillContent();
});
$("#addFillContentModal").click(function(e) {
	var chkText = $(":input:radio[name=textRadioBtn]:checked").val();

	if(chkText != undefined){
		var textContent = $("#textContent").val();
		
		if(chkText && textContent && selectedLayer){
			if(chkText == "nomal"){
				selectedLayer.append("<p>"+textContent+"</p>");
			}else if(chkText == "big"){
				selectedLayer.append("<div id='big'><p>"+textContent+"</p></div>");
			}else if(chkText == "small"){
				selectedLayer.append("<div id='tiny'><p>"+textContent+"</p></div>");
			}
		}else{
			alert("값을 입력하거나 페이지를 선택해주세요!")
		}
	}
	var len = $("input[name=textRadioBtn]").length;
	for (var i=0; i<len; i++){
		$("input[name=textRadioBtn]").eq(i).attr('checked', false);
	}
	$("#textContent").val("");
	
	var mapWidth = $('#mapWidth').val();
	var mapHeight = $('#mapHeight').val();
	if(mapWidth != '' && mapHeight != ''){
		var mapId = "map_"+mapIdx;
		selectedLayer.append("<div id='"+mapId+"' style='width:"+mapWidth+"px;height:"+mapHeight+"px;'></div>");
		mapIdx++;
		var position = new daum.maps.LatLng(37.537123, 127.005523);

		var map = new daum.maps.Map(document.getElementById(mapId), {
			center: position,
			level: 4
		});
	
		var marker = new daum.maps.Marker({
			position: position
		});
		marker.setMap(map);
	
		var infowindow = new daum.maps.InfoWindow({
			content: 'Hello, World!'
		});
		infowindow.open(map, marker);
		$('#mapWidth').val("");
		$('#mapHeight').val("");
	}
	
	var imageUrl = $('#imageUrl').val();
	if(imageUrl != ''){
		selectedLayer.append("<img src='"+imageUrl+"'>");
		$('#imageUrl').val("");	
	}
	
	var iframeUrl = $('#iframeUrl').val();
	if(iframeUrl != ''){
		 
		selectedLayer.append("<iframe style='float:left;margin-right:10px;' width='400px' height='600px' src='"+iframeUrl+"'></iframe>");
		$('#iframeUrl').val("");	
	}
	
	
	
	toggleFillContent();	
});
$("#cancelFillContentModal").click(function(e) {
	toggleFillContent();
});


$("#saveFile").click(function(e) {
	$("div.step").each(function( index ) {
		if( $(this).hasClass("slide") ){
			$(this).css("border-color","rgba(0, 0, 0, .3)");
	    	$(this).css("border-width","1px");
	    }else{
	    	$(this).css("border","none");
	    }
	});
	
	toggleSaveFile();
});

$("#addSaveFileModal").click(function(e) {
	

	var html = $("#impress").html();
	var title = $("#fileTitle").val();
	var description = $("#fileDescription").val();
	if(title != '' && title != null){
		$.ajax({
	    	type: "POST",
	    	url: "make",
	    	data: { 
		        'html': html,
		        'title': title,
		        'description': description
		    },
	   	 	success: function(msg){
	     		console.log(msg);
	   		}
		});
	}else{
		alert('제목을 입력해주세요!');
	}
	//toggleSaveFile();
	window.location.href="show";
});

$("#cancelSaveFileModal").click(function(e) {
	toggleSaveFile();
});

</script>

<#include "/layout/foot.ftl">