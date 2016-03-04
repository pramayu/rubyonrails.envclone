//= require jquery
//= require bootstrap-sprockets
//= require jquery.nicescroll
//= require jquery_ujs
//= require turbolinks
//= require jquery.raty.min.js
//= require jquery.turbolinks
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

// $('#star').raty({
//  readOnly: true,
//  score: <%= @theme.average_rating %>,
//  path: '/assets'
// });

// $('#user_star').raty({
//   score: <%= @rating.score %>,
//   path: '/assets',
//   click: function(score, evt){
//     $.ajax({
//       url: '/ratings/' + <%= @rating.id %>,
//       type: 'PATCH',
//       data: { score: score }
//     });
//   }
// });

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


/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: http://creative-tim.com
 * 
 */
function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Create Your Free Account');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}
function showLoginForm(){
    $('#myModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');    
        });
        
        $('.modal-title').html('Login with');
    });       
     $('.error').removeClass('alert alert-danger').html(''); 
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#myModal').modal('show');    
    }, 230);
    
}
function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#myModal').modal('show');    
    }, 230);
    
}

function loginAjax(){
/*   Simulate error message from the server   */
     shakeModal();
}

function shakeModal(){
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html("Invalid email/password combination");
             $('input[type="password"]').val('');
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}

$(document).ready(function () {
	$(".one").hover(
		function () {
			$('ul.wp_drp').slideDown('medium');
		}, 
		function () {
			$('ul.wp_drp').slideUp('medium');
		}
	);

	$(".two").hover(
		function () {
			$('ul.ht_drp').slideDown('medium');
		}, 
		function () {
			$('ul.ht_drp').slideUp('medium');
		}
	);

	$(".three").hover(
		function () {
			$('ul.mark_drp').slideDown('medium');
		}, 
		function () {
			$('ul.mark_drp').slideUp('medium');
		}
	);

	$(".four").hover(
		function () {
			$('ul.cms_drp').slideDown('medium');
		}, 
		function () {
			$('ul.cms_drp').slideUp('medium');
		}
	);

	$(".five").hover(
		function () {
			$('ul.com_drp').slideDown('medium');
		}, 
		function () {
			$('ul.com_drp').slideUp('medium');
		}
	);

	$(".six").hover(
		function () {
			$('ul.layer_drp').slideDown('medium');
		}, 
		function () {
			$('ul.layer_drp').slideUp('medium');
		}
	);

	$(".seven").hover(
		function () {
			$('ul.muse_drp').slideDown('medium');
		}, 
		function () {
			$('ul.muse_drp').slideUp('medium');
		}
	);

	$(".eight").hover(
		function () {
			$('ul.design').slideDown('medium');
		}, 
		function () {
			$('ul.design').slideUp('medium');
		}
	);

	$(".nine").hover(
		function () {
			$('ul.more_drp').slideDown('medium');
		}, 
		function () {
			$('ul.more_drp').slideUp('medium');
		}
	);

	$(".zero").hover(
		function () {
			$('ul.all_drp').slideDown('medium');
		}, 
		function () {
			$('ul.all_drp').slideUp('medium');
		}
	);

	$(".bout").hover(
		function () {
			$('ul.koukou').slideDown('medium');
		}, 
		function () {
			$('ul.koukou').slideUp('medium');
		}
	);

});



