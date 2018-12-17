<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>个人信息修改页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta name="format-detectison" content="telephone=no">
	<!-- ZUI 标准版压缩后的 CSS 文件 -->
	<link rel="stylesheet" href="dist/css/zui.min.css">
	<link rel="stylesheet" href="dist/css/zui.css" />
	<link rel="stylesheet" type="text/css" href="css/personal-teacher-information-edit.css">
	<link rel="stylesheet" type="text/css" href="css/header.css" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
	<link rel="stylesheet" href="css/cropper.min.css">
	<link rel="stylesheet" href="css/ImgCropping.css">
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/jquery-school-seletor.css">	
	<!-- ZUI Javascript 依赖 jQuery -->
	<script src="js/jquery-3.2.1.js"></script>
	<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
	<script src="dist/js/zui.min.js"></script>
	<script type="text/javascript" src="dist/js/zui.js"></script>
	<script src="js/cropper.min.js"></script>
	<script src="js/jquery-school-seletor.min.js"></script>
	<script>
		$(function() {
			$("#schoolName").proschool();
		})
		$(function() {    
			$('#choosePhoto').change(function() {    
				$filePath = URL.createObjectURL(this.files[0]);    
				$('#photo').attr('src', $filePath);    
			})  
		})
	</script>
</head>

<body>
	<!-- 头部 -->
	<div id="header-box">
   		<div id="big-box">
   			<!-- logo -->
   			<div id="top-box">
   				<div id="top-box-logo">
   					<img src="images/headerlogo.png" alt="logo" id="logoPic">
   					<div id="name-pic"><img src="images/nameTop.png" alt="namePic" style="width: 263.3px;height:66px;"></div>
   				</div>
   			</div>
   		</div>
   			<!-- 下拉菜单 -->
   			<div id="bottom-box">
   				<div id="topBox2">
   					<ul id="navFont">
   					<li class="navFont1"><a href="indexedbeat.html">首页</a></li>
   					<li><a href="tutorlisted.html">家教</a>
   						<ul>
   							<li><a href="tutorlisted.html">小学</a></li>
   							<li><a href="tutorlisted.html">初中</a></li>
   							<li><a href="tutorlisted.html">高中</a></li>
   						</ul>
   					</li>
   					<li><a href="#">论坛社区</a>
   						<ul>
   							<li><a href="#">学霸说</a></li>
   							<li><a href="#">资料库</a></li>
   							<li><a href="#">家长岛</a></li>
   						</ul>
   					</li>
   					<li><a href="#">我要提问</a>
   						<ul>
   							<li><a href="#">心理困惑</a></li>
   							<li><a href="#">情感问题</a></li>
   							<li><a href="#">学习障碍</a></li>
   						</ul>
   					</li>
   					<li><a href="personal-center-mycourse.html">个人中心</a></li>
   				</ul>
   			<!-- 搜索框 -->
   			<!-- <div class="input-group">
 					<div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
   					<input id="inputSearchExample3" type="search" class="form-control search-input" placeholder="搜索">
   					<label for="inputSearchExample3" class="input-control-icon-left search-icon"><i class="icon icon-search"></i></label>
 					</div>
 				<span class="input-group-btn">
   				<button class="btn btn-primary" type="button">搜索</button>
 				</span>
		</div> -->
   				<!-- 登录注册 -->
   				<div id="header-login">
   					<div class="btn-group">
                 <button class="btn" id="login_button" onclick="loginDis()">登录</button>
                 <button class="btn" id="register_button" onclick="registDis()">注册</button>
             </div>
   				</div>
   			</div>
   			</div>
   	</div>
	<!-- 中部 -->
	<div id="content">
		<div id="c1">
			<div>
				<a href="#"><i class="icon icon-arrow-left icon-1x"></i>返回个人中心</a>
			</div><br>
			<span class="c1-item">个人信息</span>
		</div>
		<form action="#" method="post" class="form-horizontal" onsubmit="return checkAll()">
			<div id="c2">
				<div id="c2-left">
					<span>个人信息验证</span>
					<div id="c2-left-left" class="c2-left-item">
						<div class="form-group">
							<label for="exampleInputPassword4" class="col-sm-2" >真实姓名</label>
							<div class="col-md-6 col-sm-10">
								<input type="text" class="form-control" id="personName" placeholder="姓名需与学生证一致" onblur="checkName()">
								<span id="personNameError" style="color: red;"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputAccount4" class="col-sm-2" >身份证号</label>
							<div class="col-md-6 col-sm-10">
								<input type="text" class="form-control" id="personId" placeholder="18位身份证号" onblur="checkPersonId()">
								<span id="personIdError" style="color: red;"></span>
							</div>
						</div>

						<div style="margin-left: 30px;">
							<span class="photo">学生证</span>

							<div style="width: 200px;height: 200px;border:1px solid #c0c0c0;padding: 5px;margin-top: 10px;margin-left: 70px;">
								<img id="finalImg" src="" width="100%">
							</div>
							<!--<button id="replaceImg" class="l-btn">上传学生证</button>-->
							<input type="button" name="上传头像" value="上传学生证" id="replaceImg" class="my-btn" onblur="checkStudentId()">
							<span id="studentIdError" style="color: red;"></span>
						</div>
					</div>
					<div id="c2-left-right" class="c2-left-item">
						<img src="images/default.jpg" width="150px" height="150px" class="img-circle" alt="圆形图片" id="photo"><br>
						<span>我的头像</span>
						<input type="file" id="choosePhoto" name="file" accept="image/*">
						<input type="button" name="上传头像" value="上传头像">
					</div>
				</div>
				<div id="c2-right">
					<img src="images/code.png">
					<p>扫描二维码获取更多信息</p>
				</div>
			</div>
			<div id="c3">
				<span>完善个人信息</span>
				<div class="form-group">
					<label class="col-sm-2">我的学校</label>
					<div class="col-md-6 col-sm-10">
						<input type="text" id="schoolName" class="form-control" placeholder="点击选择学校" onblur="checkSchoolName()"/>
						<span id="schoolError" style="color: red;"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword4" class="col-sm-2">选择年级</label>
					<select class="form-control" style="margin-left: 103px;">
						<option value="">大一</option>
						<option value="apple">大二</option>
						<option value="banana">大三</option>
						<option value="orange">大四</option>
					</select>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword4" class="col-sm-2">手机号</label>
					<div class="col-md-6 col-sm-10">
						<input type="text" class="form-control" id="phoneNum" placeholder="11位手机号" onblur="checkPhoneNum()">
						<span id="phoneNumError" style="color: red;"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword4" class="col-sm-2">我的地址</label>
					<div class="col-md-6 col-sm-10">
						<input type="text" class="form-control" id="address" placeholder="请输入地址" onblur="checkAddress()">
						<span id="addressError" style="color: red;"></span>
					</div>
				</div>
				<div class="form-group" > 
					<label for="exampleInputPassword4" class="col-sm-2">我的专业</label>
					<div class="col-md-6 col-sm-10" id="major">
						<select name="selectMajor"  placeholder="我的专业" style="height: 30px;width: 80px;">  
							  <option value="空白" selected="selected" disabled="disabled">选择专业</option> 
					        <option value="1">理科</option>   
					        <option value="2">文科</option>
					      </select>   
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword4" class="col-sm-2">个人简介</label>
					<div class="col-md-6 col-sm-10">
						<textarea id="intro" class="form-control" style="resize:none;height: 75px;" placeholder="请输入个人简介(非必须)"  onfocus="isEmpty()"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-6 col-sm-10">
						<span id="error" style="color: red;"></span>
					</div>
				</div>
				
				<input type="submit" name="保存信息" value="保存信息">
			</div>
		</form>


		<!--图片裁剪框 start-->
		<div style="display: none" class="tailoring-container">
			<div class="black-cloth" onclick="closeTailor(this)"></div>
			<div class="tailoring-content">
				<div class="tailoring-content-one">
					<label title="上传图片" for="chooseImg" class="l-btn choose-btn">
                   <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden" onchange="selectImg(this)">
                   选择图片
               </label>
					<div class="close-tailoring" onclick="closeTailor(this)">×</div>
				</div>
				<div class="tailoring-content-two">
					<div class="tailoring-box-parcel">
						<img id="tailoringImg">
					</div>
					<div class="preview-box-parcel">
						<p>图片预览：</p>
						<div class="square previewImg"></div>
						<div class="circular previewImg"></div>
					</div>
				</div>
				<div class="tailoring-content-three">
					<button class="l-btn cropper-reset-btn">复位</button>
					<button class="l-btn cropper-rotate-btn">旋转</button>
					<button class="l-btn cropper-scaleX-btn">换向</button>
					<button class="l-btn sureCut" id="sureCut">确定</button>
				</div>
			</div>
		</div>
		<!--图片裁剪框 end-->
	</div>
	
	<!-- 底部 -->
	<div class="footer" style="margin-top: 150px;">
		<!-- 关于网页 -->
		<div class="footer-font">
			<div id="footer-font-about">
				<div id="about-title">
					<h3 class="font-h3">关于青蓝</h3></div>
				<div id="about-font">
					<p class="footer-words">
						青蓝家教旨在为大学生和家长提供真实可靠的家教信息发布、家教过程约束和学情分析平台。大学生家教在平台上注册并发布家教信息，家教在线上记录孩子的每次学习情况用于记录分析，并且可以给孩子提供线上辅导功能，家长可即时查看情况，更加了解孩子的学情。同时平台还为家长和家教提供论坛交流区，用于资料交流和分享。
					</p>
				</div>
			</div>
			<div id="footer-font-a">
				<div id="a-title">
					<h3 class="font-h3">链接</h3></div>
				<div id="a-font">
					<a href="#" class="footer-words">加入我们</a>
					<a href="#" class="footer-words">网站须知</a>
					<a href="#" class="footer-words">意见反馈</a>
					<a href="#" class="footer-words">免责声明</a>
				</div>
			</div>
			<div id="footer-font-friend">
				<div id="friend-title">
					<h3 class="font-h3">鸣谢伙伴</h3></div>
				<div id="friend-logo">
					<div id="friend-logo-div1">
						<i class="icon icon-github icon-3x"></i>
						<i class="icon icon-qq icon-3x"></i>
						<i class="icon icon-wechat icon-3x"></i>
					</div>
				</div>
			</div>
			<div id="footer-font-img">
				<div id="footer-font-img-font">
					<h3>扫码关注我们了解更多</h3></div>
				<img src="images/code.png" id="QRcode">
			</div>
		</div>

		<!-- 权利归属 -->
		<div id="footer-right">
			<div id="footer-right-font">
				<p>
					<br>
					<a href="#" id="footer-right-font-a1">Copyright 2018-2020&nbsp;&nbsp;&nbsp;青蓝家教</a>
					<a href="#" id="footer-right-font-a1">Copyright 2018-2020&nbsp;&nbsp;&nbsp;青蓝家教</a>
					<a href="#" id="footer-right-font-a2">冀ICP备05067795号 冀公网安备110402440008号 </a>
				</p>
			</div>
		</div>
	</div>
	
	<script src="js/personal-information-check.js"></script>
</body>
</html>