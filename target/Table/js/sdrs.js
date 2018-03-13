function ondohome(ywlx)
{
	var url = "/pages/zcfg/zcfg_search.html?ywlx=" + ywlx;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.open(url,"_blank","");
}
function ondowsbs(chnum,ywfl)
{
	var url = "/pages/wsbs/search_wsbs.html?ywfl=" + ywfl+"&chnum="+chnum;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.open(url,"_blank","");
}
function ondowsbs_ywjb(chnum,sxfl)
{
	var url = "/pages/wsbs/search_wsbs_syywjb.html?sxfl=" + sxfl+"&chnum="+chnum;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.open(url,"_blank","");
}
function ondowsbs1(chnum,ywfl)
{
	var url = "/pages/wsbs/search_wsbs1.html?ywfl=" + ywfl+"&chnum="+chnum;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.open(url,"_blank","");
}
function ondowsbs2(chnum,sxfl)
{
	var url = "/pages/wsbs/search_wsbs.html?sxfl=" +sxfl+"&chnum="+chnum;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.open(url,"_blank","");
}
function ondoxxgk(ywlx)
{
	var url = "/pages/xxgk/xxgk_search.html?ywlx=" + ywlx;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.open(url,"_blank","");
}
function submitform(){ 	
	var fwrq = form1.fwrq.value;
	var ywlx = form1.zcfl.value;
	var wjfl=form1.wjfl.value;
	var bt=form1.title.value;
	var wh=form1.wh.value;
	var url ="/pages/zcfg/zcfg_search.html?wh="+wh+"&wjfl="+wjfl+"&fwrq="+fwrq+"&ywlx="+ywlx+"&bt="+bt;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.location.href=url;
}
function submitform2(){
	var fwrq = form2.fwrq.value;
	if(fwrq=='发文日期'){
	 fwrq ='';
  }
	var ywlx = form2.zcfl.value;
	var wjfl=form2.wjfl.value;
	var bt=form2.title.value;
	if(bt=='请输入标题进行搜索'){
	 bt= '';
	}
	var url ="/pages/zcfg/zcfg_search.html?wjfl="+wjfl+"&fwrq="+fwrq+"&ywlx="+ywlx+"&bt="+bt;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.location.href=url;
}
function submitform3(e){
	var url ="/pages/zcfg/zcfg_search.html?bt="+e;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.location.href=url;
}
function searchzcfg(e){
	var url ="/pages/zcfg/zcfg_search.html?wjfl="+e;
	url=encodeURI(url); 
	url=encodeURI(url); 
	window.open(url,"_blank","");
	
}
var ysize =new Array();
var ysize2 =new Array();
var tag=0;
    $(function(){
        $(".show_center a").click(function(){
            //获取para的字体大小    
            var thisEle2 = $(".show font"); 
             while($(".show font").length>1){
              	thisEle2 = $(".show font");
              for(var i=0;i<thisEle2.length;i++) {
               	var xx=$(thisEle2[i]).html();
            		$(thisEle2[i]).replaceWith(xx);
        		
            	}
            }
            var thisEle = $(".show p,.show span,.show div");           
            for(var i=0;i<thisEle.length;i++) {
            //parseFloat的第二个参数表示转化的进制，10就表示转为10进制
            var textFontSize = parseFloat($(thisEle[i]).css("font-size") , 10);
            if(tag==0)ysize[i]=textFontSize;     
             //alert(	ysize);
            //javascript自带方法
            var unit = $(thisEle[i]).css("font-size").slice(-2); //获取单位
            var cName = $(this).attr("class");
            if(cName == "bigger"){
                    textFontSize += 2;
            }else if(cName == "smaller"){
                    textFontSize -= 2;
            }
             else if(cName == "middle"){
              	
                    textFontSize=ysize[i];
            }
            //设置para的字体大小
             if(cName != "middle") {           
             		 $(thisEle[i]).css("font-size",  textFontSize + unit ); 								       	             	            	 	
            }else{
             		$(thisEle[i]).css("font-size",  textFontSize  );							              
            	}
            }
             
             
          
             tag =1;
        });
        
    });
