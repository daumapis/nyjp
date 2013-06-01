<#include "/layout/head.ftl">


<#--
<#list userList as item>
	<#list item?keys as key>
		<#assign hValue = (item[key])!''>
		${key} = ${hValue}<br>
	</#list>
</#list>
-->
<div class="container" style="padding-top:100px;">
	<div class="row" style="margin-top:20px;">
		<div class="span12">
			<div class="row">
				<div class="page-header">
				  	<h1><small><label class="control-label"><i class="icon-th-list"></i> NYJP</label></small> My Presentation List</h1>
				</div>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th style="width:35%">Title</th>
							<th style="width:30%">Description</th>
							<th>Evernote</th>
							<th>Mypeople</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tbody>
						<#list presentationList as item>
						<tr>
							<td>${item_index+1}</td>
							<td>${(item.title)!""}</td>
							<td>
								${(item.description)!""}
								<#--
								<button onclick="sendMypeopleMsg();" type="button" class="btn btn-primary">mypeople</button>
								-->
							</td>
							<td><button type="button" onclick="window.open('${jsHost}?title=${item.title}&content=여기에 프레젠테이션의 내용이 문서로 들어갑니다.')" class="btn btn-success">Send</button></td>
							<td><button type="button" class="btn btn-primary">Send</button></td>
							<td>
								<button data-pid="${item.pid}" onclick="showPresentation(this);" type="button" class="btn btn-success">Show</button>
							  	<button data-pid="${item.pid}" onclick="editPresentation();" type="button" class="btn btn-danger">Edit</button>
							  	<button data-pid="${item.pid}" onclick="deletePresentation();" type="button" class="btn btn-inverse">Delete</button>
							</td>
						</tr>
						</#list>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<#--
<script>
function sendMyPeople(apikey, buddyId, content){
	this.apikey  = "a67ab24cdf3dc2274e4f1cae3fe5391d477b1e54";
	this.buddyId = "BU_1Q1lWzW-OszvLWScTnTN9Q00";
	this.content = "http://127.0.0.1/test.txt";
}
</script>

<form method='post' action="http://211.43.193.114/BotAPI/PHP/callback.php">
	<input type='hidden' name='action' value='sendFromMessage' onclick="sendMyPeople(apikey, buddyId, content)">
	<input type="submit">
</form>
-->




<#--
<form method="post" action="http://211.43.193.114/BotAPI/PHP/callback.php">
<input type="hidden" name="action" value="sendFromMessage">
apikey : <input type="text" name="apikey" value="[API KEY를 입력하세요]"><br>
buddyId : <input type="text" name="buddyId" value="[buudyId를 입력하세요]"><br>
content : <input type="text" name="content" value="hello"><br> 
<input type="submit" value="메시지 전송 실행">
</form>
-->
<script>
function sendMypeopleMsg(){
	$.getJSON( "http://211.43.193.114/BotAPI/PHP/callback.php?action=sendFromMessage&callback=?", function( json ) {
	   console.log( json );
	});

/*
	$.ajax({
    	type: "POST",
    	url: "http://211.43.193.114/BotAPI/PHP/callback.php?action=sendFromMessage&callback=?",
    	dataType: "jsonp",
    	crossDomain: true,
    	data: { 
	        'apikey': 'a67ab24cdf3dc2274e4f1cae3fe5391d477b1e54',
	        'buddyId': 'BU_1Q1lWzW-OszvLWScTnTN9Q00',
	        'content': 'helllhello'
	    },
   	 	success: function(msg){
     		console.log(msg);
     		alert(msg);
   		}
	});
*/	
}
//sendMypeopleMsg();

function showPresentation(el){
	console.log(el.dataset.pid);
	var pId = el.dataset.pid;
	window.open("view?file="+pId);
	//window.location.href="view?file="+pId;
	//$('body').load("view?file="+pId);
}
function editPresentation(el){
	alert("수정하시겠습니까?")
}
function deletePresentation(el){
	alert("삭제하시겠습니까?")
}
</script>


<#include "/layout/foot.ftl">