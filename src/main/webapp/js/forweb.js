/**
 * Created by Administrator on 2014/12/15.
 */

$(function() {

    //配置变量
    var config = {
        showNum: 6,    //设置滚动的显示个数
        autoScroll: false,    //是否自动滚动，默认为 false
        autoScrollInterval: 2000    //自动滚动间隔，默认为 3000 毫秒，autoScroll = true 时才有效
    }
    var showul = $('#friendScrollList')
    var scrollUlWidth = $('#friendScrollList li').outerWidth(true),    //单个 li 的宽度
        scrollUlLeft = 0,    //.show_p_ul:eq('+index+') 初使化时的 left 值为 0
        prevAllow = true,    //为了防止连续点击上一页按钮
        nextAllow = true;    //为了防止连续点击下一页按钮

    //计算父容量限宽
    //  $('.show_p').width(config.showNum * scrollUlWidth);

    //点击上一页
    $('#friendRightBtn').click(function() {
        if (prevAllow) {
            prevAllow = false;
            scrollUlLeft = scrollUlLeft - scrollUlWidth;
            showul.css('left', scrollUlLeft);
            //复制最后一个 li 并插入到 ul 的最前面
            $('#friendScrollList li:last').clone().prependTo('#friendScrollList');
            //删除最后一个 li
            $('#friendScrollList li:last').remove();
            $('#friendScrollList').animate({
                left: scrollUlLeft + scrollUlWidth
            }, 300, function() {
                scrollUlLeft = parseInt(showul.css('left'), 10);
                prevAllow = true;
            })
        }
    });

    //点击下一页
    $('#friendLeftBtn').click(function() {
        if (nextAllow) {
            nextAllow = false;
            showul.animate({
                left: scrollUlLeft - scrollUlWidth
            }, 300, function() {
                scrollUlLeft = parseInt(showul.css('left'), 10);
                scrollUlLeft = scrollUlLeft + scrollUlWidth;
                showul.css('left', scrollUlLeft);
                //复制第一个 li 并插入到 ul 的最后面
                $('#friendScrollList li:first').clone().appendTo('#friendScrollList');
                //删除第一个 li
                $('#friendScrollList li:first').remove();
                nextAllow = true;
            })
        }
    });
    //自动滚动
    if (config.autoScroll) {
        $('.friend-scroll-box').hover(function() {
            clearInterval(autoscro);
        }, function() {
            autoscro = setInterval(function() {
                $('#friendLeftBtn').trigger('click');
            }, config.autoScrollInterval)
        }).trigger("mouseleave");

    }

});
var topxxx=null;
$(function(){
    $('input').placehold();
    if($.ui.Switchable){
        (function(){
            var index= 0,time,times;
            var sc = new $.ui.Switchable( '#switchable', {
                effects : 'fade',
                nav : false,
                index:false,
                auto:false,
                interval : 5000
            });
            var list=$('#switchable').find('.list-box').find('li');
            list.hover(function(){
                 var that=this;
                clearTimeout(times);
                times=setTimeout(function(){
                    index=$(that).index();
                    $(that).addClass('active').siblings().removeClass('active');
		    if(index>0){
		    	$("#xw_top").find("a").attr("style","background:#b4b4b4");
		    }else{
		    	$("#xw_top").find("a").attr("style","background:#296b9b");
		    }
                    sc.change(index);
                },100);
            });
           $(".container").mouseleave(function(){		  
            	    clearTimeout(times);
		    var list2=$('#switchable').find('.list-box').find('li');
		    for(var i=0;i<list2.size();i++){
			$(list2[i]).removeClass('active');
		    }
		    $("#xw_top").find("a").attr("style","background:#296b9b");
                    times=setTimeout(function(){
                    index=0;	    
                    sc.change(0);
                },100);
                    
           
	  });

        })();
    }
});
function filesearchcon(e){
	if(e==1){
	$("#tjcx").attr("class","");
	$("#whcx").attr("class","active");
	$(".tjcx").attr("style","display:none");
	$(".whcx").attr("style","display:block");
	$("#search-btn2").attr("style","display:none");
	$("#search-btn1").attr("style","display:block");
	}else if(e==2){
	$("#whcx").attr("class","");
	$("#tjcx").attr("class","active");
	$(".tjcx").attr("style","display:block");
	$(".whcx").attr("style","display:none");
	$("#search-btn1").attr("style","display:none");
	$("#search-btn2").attr("style","display:block");
	}
}
function searchwjcx(e){ 
	//var content=$(".tjcx").attr("value");
	var searchtext=$(".whcx").attr("value");
	if(e==1)
	var url ="/pages/xxgk/index.html?searchtext="+searchtext;
	//if(e==2)
	//var url ="/pages/xxgk/index.html?btcx="+content;
	
	window.open(url,"_blank","");
}
$(".slider-text a[class='rdxw']").mouseover(function(){
	if($(this).attr("image")!="")
	$("#rdxw").attr("src",$(this).attr("image"));
});
$(".hot a[class='rdxw']").mouseover(function(){
	if($(this).attr("image")!="")
	$("#rdxw").attr("src",$(this).attr("image"));
});

$(".slider-text a[class='tzgg']").mouseover(function(){
	if($(this).attr("image")!="")
	$("#tzgg").attr("src",$(this).attr("image"));
});
$(".hot a[class='tzgg']").mouseover(function(){
	if($(this).attr("image")!="")
	$("#tzgg").attr("src",$(this).attr("image"));
});

$(".slider-text a[class='gzdt']").mouseover(function(){
	if($(this).attr("image")!="")
	$("#gzdt").attr("src",$(this).attr("image"));
});
$(".hot a[class='gzdt']").mouseover(function(){
	if($(this).attr("image")!="")
	$("#gzdt").attr("src",$(this).attr("image"));
});

$(".slider-text a[class='zthd']").mouseover(function(){
	if($(this).attr("image")!="")
	$("#zthd").attr("src",$(this).attr("image"));
});
$(".hot a[class='zthd']").mouseover(function(){
	if($(this).attr("image")!="")
	$("#zthd").attr("src",$(this).attr("image"));
});


$(function() {

    //配置变量
    var config = {
        showNum: 6,    //设置滚动的显示个数
        autoScroll: false,    //是否自动滚动，默认为 false
        autoScrollInterval: 2000    //自动滚动间隔，默认为 3000 毫秒，autoScroll = true 时才有效
    }
    var showul = $('#kjScrollList')
    var scrollUlWidth = $('#kjScrollList li').outerWidth(true),    //单个 li 的宽度
        scrollUlLeft = 0,    //.show_p_ul:eq('+index+') 初使化时的 left 值为 0
        prevAllow = true,    //为了防止连续点击上一页按钮
        nextAllow = true;    //为了防止连续点击下一页按钮

    //计算父容量限宽
    //  $('.show_p').width(config.showNum * scrollUlWidth);
    //点击上一页
    $('#kjRightBtn').click(function() {
        if (prevAllow) {
            prevAllow = false;
            scrollUlLeft = scrollUlLeft - scrollUlWidth;
            showul.css('left', scrollUlLeft);
            //复制最后一个 li 并插入到 ul 的最前面
            $('#kjScrollList li:last').clone().prependTo('#kjScrollList');
            //删除最后一个 li
            $('#kjScrollList li:last').remove();
            $('#kjScrollList').animate({
                left: scrollUlLeft + scrollUlWidth
            }, 300, function() {
                scrollUlLeft = parseInt(showul.css('left'), 10);
                prevAllow = true;
            })
        }
    });
    //点击下一页
    $('#kjLeftBtn').click(function() {
        if (nextAllow) {
            nextAllow = false;
            showul.animate({
                left: scrollUlLeft - scrollUlWidth
            }, 300, function() {
                scrollUlLeft = parseInt(showul.css('left'), 10);
                scrollUlLeft = scrollUlLeft + scrollUlWidth;
                showul.css('left', scrollUlLeft);
                //复制第一个 li 并插入到 ul 的最后面
                $('#kjScrollList li:first').clone().appendTo('#kjScrollList');
                //删除第一个 li
                $('#kjScrollList li:first').remove();
                nextAllow = true;
            })
        }
    });
   //自动滚动
    if (config.autoScroll) {
        $('.kj-scroll-box').hover(function() {
            clearInterval(autoscro);
        }, function() {
            autoscro = setInterval(function() {
                $('#kjLeftBtn').trigger('click');
            }, config.autoScrollInterval)
        }).trigger("mouseleave");

    }

});
