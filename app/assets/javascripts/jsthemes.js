//= require jquery
//= require bootstrap-sprockets
//= require jquery.nicescroll
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require form

$(function(){
	jQuery("html").niceScroll({cursorcolor:"#BDC3C7"});
	jQuery("#frw").niceScroll({cursorcolor:"#BDC3C7"});
	$("#carousel").carousel({
		interval: 10000000
	})
});


// $(function(){
// 	$('#myForm').ajaxForm({
// 		beforeSend:function(){
// 			$("#prog1").show();
// 		},
// 		uploadProgress:function(event,position,total,percentComplete){
// 			$("#progbar1").width(percentComplete+'%');
// 			$("#sr-only1").html(percentComplete+'%');
// 		},
// 		success:function(){

// 		},
// 		complete:function(){

// 		}
// 	});
// 	$("#prog1").hide();
// });
$(document).ready(function(){
	$("#theme_thumb").on("change", function(e){
		var files = $(this)[0].files;

		if(files.length >= 2){
			$("#em_lbl").text(files.length + " file ready to upload");
		} else {
			var filename = e.target.value.split('\\').pop();
			$("#em_lbl").text(filename);
		}
	});

	$("#previews_").on("change", function(e){
		var files = $(this)[0].files;

		if(files.length >= 2){
			$("#span_lbl").text(files.length + " Files ready to Upload");
		} else {
			var filename = e.target.value.split('\\').pop();
			$("#span_lbl").text(filename);
		}
	});

	$("#theme_clip").on("change", function(e){
		var files = $(this)[0].files;

		if(files.length >= 2){
			$("#clip-lbl").text(files.length + " Files ready to Upload");
		} else {
			var filename = e.target.value.split('\\').pop();
			$("#clip-lbl").text(filename);
		}
	});
});