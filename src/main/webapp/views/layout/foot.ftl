
<!-- Footer
================================================== -->
<footer class="footer" style="background:#0096e1;">
<div class="container">
	<div class="row">
		<div class="span3">
			
		</div>
		<div class="span3">
			
		</div>
		<div class="span3">
			
		</div>
		<div class="span3">
			
		</div>
	</div>
</div>
<div class="verybottom">
	<div class="container">
		<div class="row">
			<div class="span6">
				<p>
					hello NamYangJuPresentation <i class=" icon-asterisk icon-white"></i>
				</p>
			</div>
			<div class="span6">
				<p class="pull-right">
					
				</p>
			</div>
		</div>
	</div>
</div>
</footer>
<script>
(function(){
// Append a close trigger for each block
$('.box-tile .content').append('<span class="close">x</span>');
// Show window
function showContent(elem){
hideContent();
elem.find('.content').addClass('expanded');
elem.addClass('cover');
}
// Reset all
function hideContent(){
$('.box-tile  .content').removeClass('expanded');
$('.box-tile  li').removeClass('cover');
}
// When a li is clicked, show its content window and position it above all
$('.box-tile  li').click(function() {
showContent($(this));
});
// When tabbing, show its content window using ENTER key
$('.box-tile  li').keypress(function(e) {
if (e.keyCode == 13) {
showContent($(this));
}
});
// When right upper close element is clicked  - reset all
$('.box-tile  .close').click(function(e) {
e.stopPropagation();
hideContent();
});
// Also, when ESC key is pressed - reset all
$(document).keyup(function(e) {
if (e.keyCode == 27) {
hideContent();
}
});
})();
</script>
</body>
</html>