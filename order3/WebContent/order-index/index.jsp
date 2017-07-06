<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <meta charset="UTF-8">
    <title>index</title>
    <script src="js/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery.spinner.css">
    <link rel="stylesheet" href="html/css/login.css">
    <link rel="stylesheet" href="html/css/addUser.css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/index.js"></script>
    <script src="js/jquery.spinner.js"></script>
    <script src="js/select.js"></script>
    <script src="js/selectsy.js"></script>
    <script src="js/jquery.pagination.js"></script>
    <link rel="stylesheet" href="css/pagination.css">
    <script src="html/js/addUser.js"></script>
</head>
 <script>
    	$(function () {
            //注册请求
            $("#submit1").on("click",function () {
                var params=$("#f1").serialize();
                $.post("register",params,function (result) {
                	if($.trim(result) == "注册成功"){
                		alert(result);
                		$("#mymoda2").modal("hide");
					}
                });
            });
            $("#submit2").on("click",function () {
                var params=$("#f2").serialize();
                //alert(params);
                $.post("login",params,function (result) {
                    if($.trim(result)=="用户名或密码输入错误！")
                        {
                        alert(result);
                        }else {
                        $("#mymoda3").modal("hide");
                        $("#un").html("欢迎," + result);
                        $(".login-login").html("退出");
                    }
                });
            });
            //页面开始加载的内容
            select("selectallmenu");
           
            //所有菜
            $("#selectsy").on("click",function(){
            	$("html,body").animate(
						{scrollTop : $(".lck")
									.offset().top
						});
            	select("selectallmenu");
        	});
            
             //精选菜单
            $("#selectjx").on("click",function(){
            	$("html,body").animate(
						{scrollTop : $(".lck")
									.offset().top
						});
            	select("findJingxuan");
        	}); 
          
            
        });
    	function findPageList(pageNum){
			$.get("selectallmenu",{"pageNum":++pageNum},function(result){
				addTable(result);
			});
		}
    	
    	
    	
    	function select(url){
    		 $.get(url,{"pageNum":1},function(result){
       			//填充数据
       			addTable(result);
       			//分页
       			$("#page").pagination(result.rowCount,{
       				callback:findPageList,//点击页码发起的分页查询请求
       				items_per_page:result.maxResult,//每页显示多少条记录
       				next_text:">",//下一页图标
       				prev_text:"<",//上一页图标
       				num_display_entries:2,//中间的主体显示页数
       				num_edge_entries:1//边缘显示页数
       			});
       			
       		});
    	}
    </script>
<body class="hidden-md">
<div class="container-fluid" id="login" >
   <p class="row">
        <div class="pull-right right"  >
            <a href="#" class="login-login">登录</a>
            &nbsp;&nbsp;
            <a href="#" class="zhuc" >注册</a>
        </div>
        <div class="pull-right right">
            <a href="filter/myform.jsp">我的订单</a>&nbsp;&nbsp;&nbsp;
            <a href="filter/shopping.jsp">我的购物车</a>&nbsp;&nbsp;&nbsp;
            <a href="bangz.html">常见的问题</a>
        </div>
        <div class="col-lg-3" id="colx">
           <div class="input-group">
               <input type="text" class="form-control" placeholder="输入搜索的商品">
                     <span class="input-group-btn">
                    <button  class="btn btn-default" type="button" style="color: #aaaaaa">搜索</button>
                    </span>
           </div><!-- /input-group -->
        </div>
    <div class="pull-right right"><span id="un">欢迎，${User }</span></div>
   </p>
</div>
<div class="container-fluid" style="margin-top: 4.5%;width: 90%;margin-left: 7%">
    <div class="pull-left">
        <img src="img/MyLogin.gif">
        </div>
</div>
<div class="container-fluid" id="cont">
    <div class="row" >
    <div class="pull-left" style="width: 17%;height:296px;border: solid 1px #f8f8f8; border-right:0px;margin-left: 2%">
        <div class="div-type">&nbsp;&nbsp;全部分类</div>
          <div class="navbar" role="navigation" >
            <ul class="nav ">
                <li id="father">
                    <a href="javascript:void(0)">
                        <h4 class="h">美食<small class="sam">&nbsp;  精品推送 </small>
                        <small class="sam"> 折扣美食</small></h4>
                        <div id="son">全部类型的框<div class="dishes">全部菜单</div>
                        </div>
                    </a></li>
                <li><a href="javascript:void(0)"><h4 class="h" id="selectsy">所有菜品</h4></a></li>
                <li><a href="javascript:void(0)"><h4 class="h">活动打折</h4></a></li>
                <li><a href="javascript:void(0)" id="selectjx"><h4 class="h">精选菜单</h4></a></li>
                <li><a href="javascript:void(0)"><h4 class="h">悠闲玩乐</h4></a></li>
            </ul> 
        </div>
    </div>
<div class="pull-left zhong">
    <!-- 美食的分类框-->

        <div id="banner">
            <div id="banner_bg"></div><!--标题背景-->
            <div id="banner_info"></div><!--标题-->
            <ul>
                <li class="on">1</li>
                <li>2</li>
                <li>3</li>
                <li style="border-right: 0px;">4</li>
            </ul>
            <div id="banner_list">
                <a href="#" target="_blank"><img src="img/2.jpg"  title="今天中秋有5折优惠" alt="今天中秋有5折优惠"/></a>
                <a href="#" target="_blank"><img src="img/Log(4).jpg" title="新推出菜品喔" alt="新推出菜品喔"/></a>
                <a href="#" target="_blank"><img src="img/2.jpg" title="选菜选累了就来玩游戏吧" alt="选菜选累了就来玩游戏吧"/></a>
                <a href="#" target="_blank"><img src="img/1.jpg" title="有那些意见点击我吧" alt="有那些意见点击我吧"/></a>
            </div>
        </div>
</div>
      <div class="pull-left " style="width: 18%;">
          <br/>
    <img class="img-thumbnail" src="img/11.JPG">
          <center>
        <p class="">扫描以上官方二维码</p>
        <p>关注公众号有更多折扣喔</p>
              </center>
        </div>
    </div>
 <div class="row" id="document">
        <div class="container" style="width: 100%;background-color: #f7f7f7;-webkit-border-radius: 2px 2px 0px 0px ;" >
            <div class="pull-left">
                <h3 class="page-header" style="color: #f60;">菜谱
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <small>网络点餐让生活变得更方便，精彩生活每一天</small>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </h3>
            </div>
            <div class="pull-left">
                <h2 class="page-header" style="border-bottom: 0px;font-family: 方正兰亭超细黑简体 ">健康美食</h2>
            </div>
           <div class="pull-right">
               <img  src="img/xd_jx.png" width="200">
            </div>
        </div>
  
  
    <div class="container-fluid" id="cai" >
       <!-- <div class="mupe">
            <a href="#" class="lck">
               <div class="borderbox">
                   <img alt="" src="img/Log(4).jpg" width="96%" style="display: inline;margin-left:2%;margin-top: 2.5%">
               </div>
             </a>
           <div class="contentbox">
           <div class="header clearfix">
               <a href="#" class="lck">
           <h4 class="title">【鸭头】</h4>
                 </a>
               <div class="collected">精选</div>
           </div>  <br/>
           <p>
            fsa
           </p>
               <div class="add-info"><span class="promo">立减10元</span></div>
           </div>
           <div class="pinfo clearfix">
               <span class="price">
                   <span class="moneyico">¥</span>99.9</span>
               <span class="ori-price">价值<span class="price-line">
                   ¥<span>100</span></span></span>
           </div>
           <div class="footer clearfix">
               <span class="comment">4.5分</span><span class="sold">已售4478</span>
               <div class="bottom-border"></div></div>
             </div>-->
       </div> 
       <!-- 分页控件 -->
       <div id="page" align="right" ></div>
       
       
     <div class="container-fluid" style="text-align: center;margin-top: 2%">
     </div>

    </div>
  </div>
<div class="row" style="border: solid 1px #dfdfdf;width: 101.5%;margin-top: 3%;background-color: #fafafa">
    <div class="footer2" >
        <div class="footer-size">
            <h4 class="footer-h4">用户帮助</h4>
            <ul class="list-unstyled">
                <li><a href="bangz.html">常见问题</a></li>
            </ul>
        </div>
    </div>
    <div class="footer2"  >
        <div class="footer-size">
            <h4 class="footer-h4">我的</h4>
            <ul class="list-unstyled">
                <li><a href="#">互动评论</a></li>
                <li><a href="#">会员积分</a></li>
                <li><a href="filter/myuser.jsp">我的信息</a></li>
            </ul>
        </div>
    </div>
    <div class="footer2" >
        <div class="footer-size">
            <h4 class="footer-h4">游戏</h4>
            <ul class="list-unstyled">
                <li><a href="#">打地鼠</a></li>
            </ul>
        </div>
    </div>
    <div class="footer2" >
        <div class="footer-size">
            <h4 class="footer-h4">客服电话:4006-888-887</h4>
            <ul class="list-unstyled">
                <li><a href="#">周一到周五&nbsp;9:00-22:00</a></li>
                <li><a href="#">客服电话&nbsp;免费长途</a></li>
            </ul>
        </div>
    </div>
    </div>
</div>
<div class="site-info">
    <span class="copyright">©</span>2016&nbsp;nuomi.com            &nbsp;<a href="#" class="link" target="_blank">京ICP证030173号</a>
    &nbsp;京公网安备11010802014106号
    &nbsp;<a href="#">营业执照信息</a>
    <div style="width:300px;margin:0 auto; padding:20px 0;">
        <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11000002000001" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="img/a.png" style="float:left;">
            <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#939393;">京公网安备 11000002000001号</p></a>
    </div>
</div>
<div id="leftsead">
    <ul class="list-unstyled">
        <li><a><img src="img/ll01.png" width="131" height="49" class="hides"/><img src="img/l01.png" width="47" height="49" class="shows"/></a></li>
        <li><a id="top_btn"><img src="img/ll06.png" width="131" height="49" class="hides"/><img src="img/l06.png" width="47" height="49" class="shows" /></a></li>
    </ul>
</div>
<!-- 购买模态框-->
<div class="modal fade" id="mymodal"  style="margin-top: 10%">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: none;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <img src="img/Log(4).jpg" width="200px;">
                <div style="float: right ;width: 60%;" >
                    <h4 class="title"  id="title"></h4>
                    <br/>
                    <br/>
                    <div class="container-fluid">
                        仅售66元，价值94元井岸店双人餐！品质层层把关，
                        营养健康，口感醇厚，味道鲜美，每道菜都精心制作，令你回味无穷，唇齿留香！
                    </div>
                    <div class="pinfo clearfix">
               <span class="price">
                   <span class="moneyico">¥</span>99.9</span>
               <span class="ori-price">价值<span class="price-line">
                   ¥<span>100</span></span></span>
                    </div>
                   <!--购买数量--><input  type="text" class="spinner" />
                </div>
            </div>
            <div class="modal-footer" style="border-top:none;text-align: center">
                <button type="button" class="btn btn-default" id="btn1">购买</button>
                <button type="button" class="btn btn-default" id="btn">加入购物车</button>
            </div>
        </div>
    </div>
</div>

<!-- 注册模态框-->
<div class="modal fade" id="mymoda2"  >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="height: 20px;">
                <button type="button" style="margin-top: -10px;" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body" id="count">
                <div class="zhuce_body">
                    <div class="zhuce_kong">
                        <div class="zc">
                            <div class="bj_bai">
                                <h3>欢迎注册</h3>
                                <form id="f1">
                                    <input name="uname" id="nameInput" type="text" class="kuang_txt user" placeholder="用户名">
                                    <input name="uemail" id="emailInput" type="text" class="kuang_txt email" placeholder="邮箱">
                                    <input name="upwd" id="pwdInput" type="password" class="kuang_txt possword" placeholder="密码">
                                    <input name="uaddr" id="addressInput" type="text" class="kuang_txt addre" placeholder="地址">
                                    <input name="utel" id="phoneInput" type="text" class="kuang_txt phone" placeholder="手机号码">
                                    <select name="usex" id="sexInput" class="kuang_txt sex">
                                        <option>女</option>
                                        <option>男</option>
                                    </select>
                                    <input id="yz" name="yzm" type="text" class="kuang_txt yanzm" placeholder="验证码">

                                    <div>
                                        <div class="hui_kuang"><img id="yzm" src="html/yzm.jsp" style="margin-bottom:15px;width:95px;height:30px"></div>
                                        <div class="shuaxin"><a href="javascript:changeYzm()"><img src="img/zc_25.jpg" width="13" height="14"></a></div>
                                    </div>
                                    <div>
                                        <input name="" type="checkbox" value="" checked><span>已阅读并同意<a href="#" target="_blank"><span class="lan">《XXXXX使用协议》</span></a></span>
                                    </div>
                                    <input id="submit1" type="button" class="btn_zhuce" value="注册" onclick="return checkForm()">

                                </form>
                            </div>
                            <div class="bj_right">
                                <p>使用以下账号直接登录</p>
                                <ul class="list-unstyled">
                                    <li class="zhuce_qq"><a href="#" >QQ注册</a></li>
                                    <li><a href="#" class="zhuce_wx">微信注册</a></li>
                                </ul>
                                <p style="float: left">已有账号？<a href="#" class="login-login">立即登录</a></p>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <div class="modal-footer" style="border-top:none;text-align: center">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--登录模态框-->
<div class="modal fade" id="mymoda3">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="height: 20px;">
                <button type="button" style="margin-top: -10px;" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <div class="zhuce_body" style="height:270px;">
                    <div class="zhuce_kong login_kuang">
                        <div class="zc">
                            <div class="bj_bai">
                                <h3>登录</h3>
                                <form id="f2">
                                    <input name="userName" type="text" class="kuang_txt" placeholder="手机号">
                                    <input name="userPwd" type="password" class="kuang_txt" placeholder="密码">
                                    <div>
                                        <a href="#">忘记密码？</a><input name="checkbox" type="checkbox" value="" checked><span>记住我</span>
                                    </div>
                                    <input id="submit2" type="button" class="btn_zhuce" value="登录" onclick="return subcheck();">
                                </form>
                            </div>
                            <div class="bj_right">
                                <p>使用以下账号直接登录</p>
                                <ul>
                                    <li class="zhuce_qq" style="margin-left: -35px;"><a href="#" >QQ注册</a></li>
                                    <li class="zhuce_wx" style="margin-left: -35px;"><a href="#" >微信注册</a></li>
                                </ul>
                                <p style="float: left">没有账号？<a href="#" class="zhuc">立即注册</a></p>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
            <div class="modal-footer" style="border-top:none;text-align: center">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 
<script>
//注册和登录模态框的
$(function(){
    $(".zhuc").on("click",function () {
        $("#mymoda3").modal("hide");
        $("#mymoda2").modal("toggle");
    })
    $(".login-login").on("click",function () {
        $("#mymoda2").modal("hide");
        $("#mymoda3").modal("toggle");
    })
});
    
    /* $(function(){
        $(".lck").on("click",function(){
        	//默认数量框是1如果数量大于1重新加载模态框数量框的值则变回1
        	$(".spinner").val("1");
            $("#mymodal").modal("toggle");
            $("html,body").animate({scrollTop:$(".lck").offset().top});
        });
    }); */

</script> -->
<script>
    //注册和登录模态框的
    $(function(){
    	//注册
        $(".zhuc").on("click",function () {
            $("#mymoda3").modal("hide");
            $("#mymoda2").modal("toggle");
            emptyData();
        });
        //登录
        $(".login-login").on("click",function () {
            $("#mymoda2").modal("hide");
            $("#mymoda3").modal("toggle");
            if($(".login-login").html()=="退出"){
                $("#mymoda3").empty();
                alert("确认退出？");
                $.get("cancelto",function () {
                    location.reload();
                });
            }
        })
    });
</script>
</body>
</html>