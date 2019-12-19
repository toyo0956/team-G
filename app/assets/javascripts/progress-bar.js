$(document).on('turbolinks:load', function() { 
      "use strict"
      $('.header-progress-bar-wrap span').each(function(){
        var $href = $(this).attr('href');
        var $dir = location.href.split("/");  
        var $dir2 = $dir[$dir.length -1];  
        
        var $s1 = 'radius-active_s1'
        var $s1_second = 'radius-active_s1_second'
        var ta = 'text-active'
        var ra = 'radius-active'
        if($dir2 === 'step1'){ 
        $('#step1').addClass($s1);
        $('#progress-bar_step1').addClass(ta);
        } else {
        $('#progress-bar_step1').removeClass(ta);
        }

        if($dir2 === 'step2'){ 
          $('#step1').addClass($s1_second);
          $('#step2').addClass(ra);
          $('#progress-bar_step2').addClass(ta);
          } else {
          $('#progress-bar_step2').removeClass(ta);
          }
        
        if($dir2 === 'step3'){ 
          $('#step1').addClass($s1_second);
          $('#step2').addClass($s1_second);
          $('#step3').addClass(ra);
          $('#progress-bar_step3').addClass(ta);
          } else {
          $('#progress-bar_step3').removeClass(ta);
          }
        
        if($dir2 === 'step4'){ 
          $('#step1').addClass($s1_second);
          $('#step2').addClass($s1_second);
          $('#step3').addClass($s1_second);
          $('#step4').addClass(ra);
          $('#progress-bar_step4').addClass(ta);
          } else {
          $('#progress-bar_step4').removeClass(ta);
          }

        if($dir2 === 'done'){ 
          $('#step1').addClass($s1_second);
          $('#step2').addClass($s1_second);
          $('#step3').addClass($s1_second);
          $('#step4').addClass($s1_second);
          $('#done').addClass($s1);
          $('#progress-bar_done').addClass(ta);
          } else {
          $('#progress-bar_done').removeClass(ta);
          }
      
   

      });

  
    });