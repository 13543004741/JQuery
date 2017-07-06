<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<title>Megashop</title>

<!--js-->

    <script src="js/jquery-1.9.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/ddsmoothmenu.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.elastislide.js"></script>
<script src="js/jquery.accordion.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/orange.css">
<link rel="stylesheet" href="css/skeleton.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/ddsmoothmenu.css"/>
<link rel="stylesheet" href="css/elastislide.css"/>
<link rel="stylesheet" href="css/home_flexslider.css"/>
    <link rel="stylesheet" href="css/dd.css"/>
<link rel="stylesheet" href="css/light_box.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/dd.js"></script>
<script src="js/html5.js"></script>

    <link rel="stylesheet" type="text/css" href="im/css/style.css">

    <script type="text/javascript" src="im/js/koala.min.1.5.js"></script>
    <script type="text/javascript">
        Qfast.add('widgets', { path: "im/js/terminator2.2.min.js", type: "js", requires: ['fx'] });
        Qfast(false, 'widgets', function () {
            K.tabs({
                id: 'decoroll2',//焦点图包裹id
                conId: "decoimg_a2",//大图域包裹id
                tabId:"deconum2",//小圆点数字提示id
                tabTn:"a",
                conCn: '.decoimg_b2',//大图域配置class
                auto: 1,//自动播放 1或0
                effect: 'fade',//效果配置
                eType: 'mouseover',// 鼠标事件
                pageBt:true,//是否有按钮切换页码
                bns: ['.prev', '.next'],//前后按钮配置class
                interval: 3000// 停顿时间
            })
        })
        
        
        
        $(function(){
		$.post("selectjxmenu",function(result){
			addTable(result);
		});
		
		$.post("selectmenu",function(result){		
			addTable2(result);
		})
		
		
		$("#menu").on("click",function(){
			location.href="menu.html?id=1";
		});

	});
	
        $(function(){
        	$.get("getName",function(result){
        		if(result==null){		
        		$(".log-in").show();
        		$(".contact-us").show();
        		$("#tuichu").hide();
        		}else{
        			$("#huanying").html("欢迎你，"+result);
        			$(".log-in").hide();
        			$(".contact-us").hide();
        			
        		}
        		
        	
        	});
        $("#tuichu").on("click",function(){
        	$.get("xiaohui",function(result){
        		alert(result);
        		location.reload();
        	});
        });
            });  
        
	function addTable(result){
		 $.each(result,function(index,obj){
				$(".feature-block").append('<div class=" mupe" ><a href="javascript:void(0)" class="lck" id='+obj.m_id+'><div class="borderbox" style="height: 100px">'+
						'<img alt="" src="cai/'+ obj.m_img + '" width="96%" style="display: inline;margin-left:2%;margin-top: 2.5%">'+
						'</div></a><div class="contentbox"><div class="header clearfix" > <a href="javascript:void(0)" class="lck">'+
						'<h4 class="title">【'+obj.m_name+'】</h4></a><div class="collected">精选  </div></div>  <br/>'+
						'<p>'+obj.m_description+'</p></div>'+
						'<div class="pinfo clearfix"><span class="price"><span class="moneyico">¥</span>'+obj.m_price+'</span>'+
						' <span class="ori-price">价值<span class="price-line">¥<span>'+obj.m_price+'</span></span></span></div>'+
						'<div class="footer clearfix"><span class="comment">4.5分</span><span class="sold">已售4478</span>'+
						'<div class="bottom-border"></div></div></div>');
		}); 
		 
		 $(".lck").on("click",function(){
			 var id=$(this).attr("id");
			 $.post("findJxByid",{"id":id},function(obj){
				 $("#qty").val("1");
				 addTable3(obj);
	             $("#myModal").modal("toggle");
	            $("html,body").animate({scrollTop:$(".lck").offset().top});
			 });
         });
	}
	
	function addTable2(result){
		 $.each(result,function(index,obj){
				$(".new-product-block").append('<div class=" mupe" ><a href="javascript:void(0)" class="lck2" id='+obj.m_id+'><div class="borderbox" style="height: 100px">'+
						'<img alt="" src="cai/'+ obj.m_img + '" width="96%" style="display: inline;margin-left:2%;margin-top: 2.5%">'+
						'</div></a><div class="contentbox" ><div class="header clearfix" > <a href="#" class="lck">'+
						'<h4 class="title">【'+obj.m_name+'】</h4></a><div class="collected">精选  </div></div>  <br/>'+
						'<p >'+obj.m_description+'</p></div>'+
						'<div class="pinfo clearfix"><span class="price"><span class="moneyico">¥</span>'+obj.m_price+'</span>'+
						' <span class="ori-price">价值<span class="price-line">¥<span>'+obj.m_price+'</span></span></span></div>'+
						'<div class="footer clearfix"><span class="comment">4.5分</span><span class="sold">已售4478</span>'+
						'<div class="bottom-border"></div></div></div>');
		}); 
		 
		 $(".lck2").click(function(){
			 var id=$(this).attr("id");
			 $.post("findJxByid",{"id":id},function(obj){
				 $("#qty").val("1");
				 addTable3(obj);
	             $("#myModal").modal("toggle");
	            $("html,body").animate({scrollTop:$(".lck2").offset().top});
			 });
        });
	}
	
	
	
	function addTable3(obj){
			$("#myModal").empty();
			$("#myModal").append('<form id="form" action="selectById" method="post"> <div class="modal-dialog"><div class="modal-content"><div class="modal-header" style="border: none;">'+
			'<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button><h4>'+obj.m_name+'</h4></div>'+
			'<div class="modal-body" style="margin-top: -20px;"><div class="quick-view-container">'+
			'<a href="#" title="Image"><img src="cai/'+ obj.m_image + '" width="230px" title="'+obj.m_name+'" /></a><div class="quick-view-right tabs" style="">'+
			'<img src="images/sale_icon_img.png" style="float: right" class="sale-img" /><div id="tabDetail" class="tabDetail">'+
			'<div class="first-review" style="width: 80%;margin-top: -50px">描述：'+obj.tecont+'</div><div class="price-box" style="margin-top: -10px">'+
			'<span class="price">￥'+obj.price+'</span></div><div class="availability">原价(￥100)</div><div class="color-size-block">'+
			'</div><div class="add-to-cart-box"><span class="qty-box"><label for="qty">数量:</label>'+
			'<input type="number" min="1" name="num" class="input-text qty" id="qty" maxlength="12" value="1"><input type="hidden"  name="id" value="'+obj.id+'"><br/></span>'+
			' </div></div></div><div class="clearfix"></div>'+
			'</div></div><div class="modal-footer" style="border: none;"><input type="submit" class="form-button add" style="width: 100px;margin-left: 35%" value="立即购买">'+
			'<input type="buttom"  class="form-button guw" style="width: 100px; padding-left: 20px;" value="加入购物车"></div>'+
			'</div></div></form>');
			
			$(".guw").on("click",function(){
				var date=$("#form").serialize();
			//	alert(date)
				$.post("addcar",date,function(result){
					if(result==0){
						location.href="log/index.html";
					}
					$("#myModal").modal("hide");
				})
			});
		
	}
        
    </script>
<body>

<div id="banner" style="display: block">

	<div class="mainContainer sixteen container">
            <!--Header Block-->
            <div class="header-wrapper">
                <header class="container">
                    <div class="head-right">
                        <ul class="top-nav">
                        	 <li id="huanying" style="margin-right:20px;margin-top:2px;border-left-width: 0px;border-right-width: 0px;">欢迎你，${sessionScope.User.uname }</li>
                            <li class=""><a href="my_order2.html" title="我的订单">我的订单</a></li>
                            <li class="my-wishlist"><a href="selectcar" title="我的购物车">我的购物车</a></li>
                            <li class="checkout"><a href="common_problem.html" title="常见问题">常见问题</a></li>
                            <li class="log-in"><a href="log/index.html" title="登录">登录</a></li>
                            <li class="contact-us"><a href="register/index.html" title="注册">注册</a></li>
                            <li id="tuichu"><a>退出</a></li>
                        </ul>
                        <section class="header-bottom">

                            <!-- <div class="search-block" style="margin-left: -130px;width: 420px;">
                                <input type="text" placeholder="输入你要搜索的商品" style="width:350px;"/>
                                <input type="submit" value="搜索" title="输入你要搜索的商品" />
                            </div> -->
                        </section>
                    </div>
                    <h1 class="logo" style="margin-top: 0px;"><a href="index.html" title="Logo">
                        <img title="Logo" alt="Logo" src="images/MyLogin.gif" />
                    </a></h1>
                    <nav id="smoothmenu1" class="ddsmoothmenu mainMenu">
                        <ul id="nav">
                            <li class="active"><a href="index.html" title="首页">首页</a></li>
                            <li class=""><a href="menu.html" title="Shop by">菜谱</a></li>
                          <!--   <li class=""><a href="about_us.html" title="关于我们">关于我们</a></li>
                            <li class=""><a href="#" title="小游戏">小游戏</a></li> -->
                        </ul>
                    </nav>
                </header>
            </div>
            <!--Banner Block-->
            <section class="banner-wrapper">
                <div style="border: 1px solid #e6e6e6;width: 686px;float: left;height: 435px;margin-left: 87px;">
                    <div id="decoroll2" class="imgfocus">

                        <div id="decoimg_a2" class="imgbox">
                            <div class="decoimg_b2"><img src="im/img/fs.jpg"></div>
                            <div class="decoimg_b2"><img src="im/img/k.jpg"></div>
                            <div class="decoimg_b2"><img src="im/img/ss.jpg"></div>
                        </div>

                        <ul id="deconum2" class="num_a2">
                            <li><a href="javascript:void(0)" hidefocus="true" target="_self" style="color:red">时疏牛肉</a></li>
                            <li><a href="javascript:void(0)" hidefocus="true" target="_self"  style="color:red">红烧鱼块</a></li>
                            <li><a href="javascript:void(0)" hidefocus="true" target="_self"  style="color:red">清蒸鱼</a></li>
                        </ul>

                    </div>

                    </div>
              <div class="banner-block container"style="right: 70px;" >
                  <ul class="banner-add">
                  <li class="add1"><a href="#" title=""><img title="add1" alt="add1" src="images/banner_add1.jpg" /></a></li>
                  <li class="add2"><a href="#" title=""><img title="add2" alt="add2" src="images/banner_add2.jpg" /></a></li>
                </ul>
              </div>
            </section>
            <!--Content Block-->
            <section class="content-wrapper">
              <div class="content-container container">
                <div class="heading-block">
                  <h1 style="float: left" style="font-size:30px;">精选菜品</h1>
                    <a href="#"><h1 style="float: right;color: #ff6600" ><a href="javascript:void(0)"  id="menu">查看更多</a></h1></a>
                </div>
                <div class="feature-block" >

                    
                </div>
                <div class="heading-block ">
                  <h1 style="margin-left: 10px;float: left;">所有的菜品</h1>
                    <a href="#"><h1 style="float: right;color: #ff6600"><a href="menu.html">查看更多</a></h1></a>
                </div>
                <div class="new-product-block">
                </div>
                <div class="news-letter-container">
                  <div class="free-shipping-block">
                    <h1>享受免费送货</h1>
                    <p>消费到一千金额既可成为会员</p>
                  </div>
                  <div class="news-letter-block">
                    <h2>填写你需要送货的地址</h2>
                    <input type="text"  title="" placeholder="输入送货地址"/>
                    <input type="submit" value="配送修改" title="送货地址" />
                  </div>
                </div>
              </div>
            </section>
    </div> 
    <!--Quick view Block-->

    <!--购买的弹框-->
<!-- <article style="display:none;">
	<section id="quick-view-container" class="quick-view-wrapper"> -->

</section>
</article>
    <!--Quick view Block-->
            <!--Footer Block-->
    <section class="footer-wrapper">
        <footer class="container">
            <div class="link-block">
                <ul>
                    <li class="link-title"><a href="about_us.html" title="关于我们">关于我们</a></li>
                    <li><a href="about_us.html" title="关于我们">关于我们</a></li>
                </ul>
                <ul>
                    <li class="link-title"><a href="#" title="用户">用户</a></li>
                    <li><a href="myuser.html" title="用户信息">用户信息</a></li>
                </ul>
                <ul>
                    <li class="link-title"><a href="faq.html" title="常见问题">常见问题</a></li>
                    <li><a href="common_problem.html" title="常见问题">常见问题</a></li>
                </ul>
                <ul>
                    <li class="link-title">客服电话:4006-888-887</li>
                    <li>周一到周五&nbsp;9:00-22:00</li>
                    <li>客服电话&nbsp;免费长途</li>
                </ul>
                <ul class="stay-connected-blcok">
                    <li>

                        <div class="payment-block"><img src="images/payment.png" alt="payment"></div>
                    </li>
                </ul>
            </div>
            <div class="footer-bottom-block">
                <p class="copyright-block"> 菜府点餐网成立已2016年9月份的项目小组作品</p>
            </div>
        </footer>
    </section>
    <div id="leftsead">
        <ul class="list-unstyled">
            <li><a><img src="images/ll04.png" width="131" height="49" class="hides"/><img src="images/l04.png" width="47" height="49" class="shows"/></a></li>
            <li><a id="top_btn"><img src="images/ll06.png" width="131" height="49" class="hides"/><img src="images/l06.png" width="47" height="49" class="shows" /></a></li>
        </ul>
    </div>
    
    
    
    
    
<!--购买模态框-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="border: none;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4>三明治</h4>
                </div>
                <div class="modal-body" style="margin-top: -20px;">
                    <div class="quick-view-container">
                        <a href="#" title="Image"><img src="images/0.jpg" width="230px" title="三明治" /></a>
                        <div class="quick-view-right tabs" style="">
                            <img src="images/sale_icon_img.png" style="float: right" class="sale-img" />
                            <div id="tabDetail" class="tabDetail">
                                <div class="first-review" style="width: 80%;margin-top: -50px">描述</div>
                                <div class="price-box" style="margin-top: -10px">
                                    <span class="price">￥99</span>			</div>
                                <div class="availability">原价(￥100)</div>
                                <div class="color-size-block">

                                </div>
                                <div class="add-to-cart-box">
				<span class="qty-box">
					<label for="qty">数量:</label>
					<input type="number" min="1" name="qty" class="input-text qty" id="qty" maxlength="12" value="1"><br/>
                </span>
                                </div>
                            </div>
                            <div id="tabDes" class="tabDes">
                                <p>描述信息：</p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="modal-footer" style="border: none;">
                    <button title="购买" class="form-button" style="width: 100px;margin-left: 35%"><span>立即购买</span></button>
                    <button title="加入购物车" class="form-button" style="width: 100px;"><span>加入购物车</span></button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    </div>
</body>
</html>