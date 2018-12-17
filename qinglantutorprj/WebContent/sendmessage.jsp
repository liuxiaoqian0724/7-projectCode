<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<!--css引入-->
		<link rel="stylesheet" href="dist/css/zui-theme.css" />
		<link rel="stylesheet" href="dist/css/zui-theme.min.css" />
		<link rel="stylesheet" href="dist/css/zui.css" />
		<link rel="stylesheet" href="dist/css/zui.lite.css" />
		<link rel="stylesheet" href="dist/css/zui.lite.min.css" />
		<link rel="stylesheet" href="dist/css/zui.min.css" />
		<link rel="stylesheet" href="dist/lib/board/zui.board.css" />
		<link rel="stylesheet" href="dist/lib/board/zui.board.min.css" />
		<link rel="stylesheet" href="dist/lib/bootbox/bootbox.css" />
		<link rel="stylesheet" href="dist/lib/bootbox/bootbox.min.css" />
		<link rel="stylesheet" href="dist/lib/datetimepicker/datetimepicker.css" />
		<link rel="stylesheet" href="dist/lib/datetimepicker/datetimepicker.min.css" />
		<link rel="stylesheet" href="css/cityLayout.css" />
		<link rel="stylesheet" href="css/header.css" />
		<link rel="stylesheet" href="css/footer.css" />
		<!--js引入-->
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="dist/js/zui.js"></script>
		<script type="text/javascript" src="dist/js/zui.lite.js"></script>
		<script type="text/javascript" src="dist/js/zui.lite.min.js"></script>
		<script type="text/javascript" src="dist/js/zui.min.js"></script>
		<script type="text/javascript" src="dist/lib/datetimepicker/datetimepicker.js"></script>
		<script type="text/javascript" src="dist/lib/datetimepicker/datetimepicker.min.js"></script>
		<script type="text/javascript" src="js/cityselect.js"></script>
		<script>
			//表单信息检测
			function check(){
				var subject = $("#subject").val();
				var place = $("#citySelect").val();
				var min = $("#min").val();
				var max = $("#max").val();
				var error = $("#error-msg");
				var rules = $("#rules");
				var principle = $("#principle");
				if(subject==""||place==""||min==""||max==""){
					error.html("请仔细检查您的信息是否填写完整！！")
					return false;
				}else if(!(principle.prop('checked')&&rules.prop('checked'))){
					error.html("发布信息前您必须同意此网站相关规定！！");
					return false;
				}
				else{
					error.html("");
					return true;
				}
			}
		</script>
		<title>求职信息发布</title>
	</head>

	<body>
		<!--导航栏开始-->
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
						<li><a href="personal-center-evaluation.html">个人中心</a></li>
					</ul>
					<!-- 搜索框 -->
					<div class="input-group">
						<div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
							<input id="inputSearchExample3" type="search" class="form-control search-input" placeholder="搜索">
							<label for="inputSearchExample3" class="input-control-icon-left search-icon"><i class="icon icon-search"></i></label>
						</div>
						<span class="input-group-btn">
							<button class="btn btn-primary" type="button">搜索</button>
						</span>
					</div>
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
		<!--导航栏结束-->
		
		<!--面板开始-->
		<div class="container-fixed-md">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h2>求职信息发布</h2>
				</div>
				<form method="post" action="" onsubmit="return check()">
					<div class="panel-body">
						<ul class="list-group">
							<!--科目选择-->
							<li class="list-group-item">
								<label>科目（点击加号即可添加）*</label><br/>
								<label>
									<button class="btn btn-primary" onclick="addSub(this)">语文 <span class="label label-badge">+</span></button>
									<button class="btn btn-primary" onclick="addSub(this)">数学 <span class="label label-badge">+</span></button>
									<button class="btn btn-primary" onclick="addSub(this)">英语 <span class="label label-badge">+</span></button>
									<button class="btn btn-primary" onclick="addSub(this)">历史 <span class="label label-badge">+</span></button>
									<button class="btn btn-primary" onclick="addSub(this)">地理 <span class="label label-badge">+</span></button>
									<button class="btn btn-primary" onclick="addSub(this)">化学<span class="label label-badge">+</span></button>
									<button class="btn btn-primary" onclick="addSub(this)">生物<span class="label label-badge">+</span></button>
									<button class="btn btn-primary" onclick="addSub(this)">音乐<span class="label label-badge">+</span></button>
								</label>
								<input type="text" class="form-control" id="subject" placeholder="例如数学，多个科目用;隔开">
							</li>
							<!--授课年级-->
							<li class="list-group-item">
								<label>授课年级（点击加号即可添加）*</label><br/>
								<label>
									<span>小学：</span>
									<button class="btn  btn-primary" onclick="addGra(this)">一年级 <span class="label label-badge">+</span></button>
									<button class="btn  btn-primary" onclick="addGra(this)">二年级 <span class="label label-badge">+</span></button>
									<button class="btn  btn-primary" onclick="addGra(this)">三年级 <span class="label label-badge">+</span></button>
									<button class="btn  btn-primary" onclick="addGra(this)">四年级 <span class="label label-badge">+</span></button>
									<button class="btn  btn-primary" onclick="addGra(this)">五年级 <span class="label label-badge">+</span></button>
									<button class="btn  btn-primary" onclick="addGra(this)">六年级<span class="label label-badge">+</span></button>
								</label>
								<br/>
								<label>
									<span>初中：</span>
									<button class="btn btn-primary" onclick="addGra(this)">初一 <span class="label label-badge">+</span></button>
									<button class="btn btn-primary btn-primary" onclick="addGra(this)">初二 <span class="label label-badge">+</span></button>
									<button class="btn btn-primary" onclick="addGra(this)">初三 <span class="label label-badge">+</span></button>
								</label>
								<br/>
								<label>
									<span>高中：</span>
									<button class="btn btn-primary" onclick="addGra(this)">高一 <span class="label label-badge">+</span></button>
									<button class="btn btn-primary" onclick="addGra(this)">高二 <span class="label label-badge">+</span></button>
									<button class="btn btn-primary" onclick="addGra(this)">高三 <span class="label label-badge">+</span></button>
								</label>
								<input type="text" class="form-control" id="grade" placeholder="例如初三，多个年级用;隔开">
							</li>
							<!--授课时间表格-->
							<li class="list-group-item">
								<label>授课时间（点击表格选择）*</label>
								<table class="time_table png_img table table-bordered" style="width:675px;">
									<thead>
										<tr>
											<th></th>
											<th>周一</th>
											<th>周二</th>
											<th>周三</th>
											<th>周四</th>
											<th>周五</th>
											<th>周六</th>
											<th>周日</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>上午</th>
											<td data-id="1">
												<a href="javascript:void(0)">
													<img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="4 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="7 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="10 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="13 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="16 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="19 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
										</tr>
										<tr>
											<th>下午</th>
											<td data-id="2 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a></td> <td data-id="5 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="8 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="11 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="14 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a></td> <td data-id="17 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="20 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
										</tr>
										<tr>
											<th>晚上</th>
											<td data-id="3 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="6 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="9 "><img src="images/icon/error.png " alt=" "></td>
											<td data-id="12 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a></td> <td data-id="15 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="18 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
											<td data-id="21 ">
												<a href="javascript:void(0)"><img src="images/icon/error.png" alt=" "></a>
											</td>
										</tr>
									</tbody>
								</table>
							</li>
							<!--工作经历-->
							<li class="list-group-item ">
								<label>工作经历*</label>
								<textarea class="form-control" rows="3" placeholder="请输入您的工作经历"></textarea>
							</li>
							<!--成功案例-->
							<li class="list-group-item ">
								<label>成功案例*</label>
								<textarea class="form-control" rows="3" placeholder="请输入您的成功案例"></textarea>
							</li>
							<!--教龄-->
							<li class="list-group-item ">
								<label>教龄*</label>
								<select class="form-control">
									<option value="">请选择教龄区间</option>
									<option value="zerotwo">0-2年</option>
									<option value="twofive">2-5年</option>
									<option value="fiveten">5-10年</option>
									<option value="tenmore">10年以上</option>
								</select>
							</li>
							<!--课时价格选择-->
							<li class="list-group-item ">
								<label>课时价格*</label>
								<div class="row">
									<div class="col-xs-2">
										<input type="text" id="min" class="form-control" placeholder="最低价格">
									</div>
									<div class="col-xs-3">
										每课时（具体价格可以商量）
									</div>
								</div>
							</li>
							<!--地点选择框-->
							<li class="list-group-item ">
								<label>地点*</label>
								<input name=" " id="citySelect" type="text" class="city_input" readonly="readonly">
							</li>
							<!--同意框-->
							<li class="list-group-item ">
								<div class="checkbox">
									<label>
										<input type="checkbox" id="principle"> 我同意求职信息发布准则
									</label>
								</div>
								<div class="checkbox">
									<label>
										<input type="checkbox" id="rules"> 我同意网站相关规定
									</label>
								</div>
							</li>
							<!--提示框-->
							<li class="list-group-item" id="error-msg" style="color: red;font-size: 18px;">
								带*标的为必填项，请您认真如实填写。
							</li>
						</ul>
					</div>
					<div class="panel-footer ">
						<input type="submit" value="保存发布信息" class="btn btn-block btn-primary" />
					</div>
				</form>
			</div>
		</div>
		
		<!-- footer开始 -->
		<div class="footer">
			<!-- 关于网页 -->
			<div class="footer-font">
				<div id="footer-font-about">
					<div id="about-title">
						<h3 class="font-h3">关于青蓝</h3>
					</div>
					<div id="about-font">
						<p class="footer-words">
							青蓝家教旨在为大学生和家长提供真实可靠的家教信息发布、家教过程约束和学情分析平台。大学生家教在平台上注册并发布家教信息，家教在线上记录孩子的每次学习情况用于记录分析，并且可以给孩子提供线上辅导功能，家长可即时查看情况，更加了解孩子的学情。同时平台还为家长和家教提供论坛交流区，用于资料交流和分享。
						</p>
					</div>
				</div>
				<div id="footer-font-a">
					<div id="a-title">
						<h3 class="font-h3">链接</h3>
					</div>
					<div id="a-font">
						<a href="#" class="footer-words">加入我们</a>
						<a href="#" class="footer-words">网站须知</a>
						<a href="#" class="footer-words">意见反馈</a>
						<a href="#" class="footer-words">免责声明</a>
					</div>
				</div>
				<div id="footer-font-friend">
					<div id="friend-title">
						<h3 class="font-h3">鸣谢伙伴</h3>
					</div>
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
						<h3>扫码关注我们了解更多</h3>
					</div>
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
		<!-- footer结束 -->
	</body>
	<script>
		//点击更换图片
		$(".time_table td").click(function() {
			var $this = $(this);
			if ($this.find("img").attr("src") == "images/icon/ok.png") {
				$this.find("img").attr("src", "images/icon/error.png");
			} else {
				$this.find("img").attr("src", "images/icon/ok.png");
			}
			var ids = '';
			$("td img[src='images/icon/ok.png']").each(function() {
				ids += $(this).closest("td").data('id') + ",";
			});
			$("#TimeListId").val(ids);
		});
		
		//地点选择
		init_city_select($("#citySelect"));
		
		//学科添加
		function addSub(obj) {
			var str = $(obj);
			var sub = str.html().substr(0, 2);
			var allSub = $('#subject').val();
			allSub = allSub + sub + ';';
			$('#subject').val(allSub);
		}
		

		//年级添加
		function addGra(obj){
			var str = $(obj);
			var sub = str.html().substr(0, 3);
			var allSub = $('#grade').val();
			allSub = allSub + sub + ';';
			$('#grade').val(allSub);
		}
	</script>

</html>
