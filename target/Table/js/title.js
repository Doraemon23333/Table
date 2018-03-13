// JavaScript Document

function tab(id,curnum,tnum){
			for (var i = 0; i< tnum;i++ ){
				if(curnum == i){
					document.getElementById(id+"_title_"+curnum).className = "current";
					document.getElementById(id+"_main_"+curnum).style.display = "block";
				}else{
					if(document.getElementById(id+"_title_"+i)){
					document.getElementById(id+"_title_"+i).className = "";
					document.getElementById(id+"_main_"+i).style.display = "none";
					}
				}
			}
		}
		
		
$(document).ready(function() {
	
	
	//导航
	$(".mainProNav dl dt").click(function() {
		$(".mainProNav dl").removeClass("dlHover");
		$(this).parent().addClass("dlHover");
	})
	$(".mainProNav").hover(function() {
		$(this).addClass("mainProNavHover");
	},function() {
		$(this).removeClass("mainProNavHover");
		$(".mainProNav dl").removeClass("dlHover");
		$("#of_whole").removeClass("of_whole");
		$("#of_whole").addClass("of_whole2");
	})
	
});

function submitform1(){ 	
	//var ywfl = form2.ywfl.value;
	//var ywmc = form2.ywmc.value;
          var ywfl = document.getElementById("ywfl").value;
          var ywmc = document.getElementById("ywmc").value;
        // alert(ywmc);
	var url ="/pages/wsbs/search_wsbs1.html?chnum="+ywfl+"&ywmc="+ywmc;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.location.href=url;
}

function bsznsybszn(){ 	
  var ywmc = document.getElementById("bszn_sy_bszn").value; 
     if(ywmc=='请输入办事指南事项')ywmc="";    
	var url ="/pages/wsbs/search_wsbs1.html?ywmc="+ywmc;
	url=encodeURI(url); 
	url=encodeURI(url); 
	//window.location.href=url;
        window.open(url,"_blank","");
}