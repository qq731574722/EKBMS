<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="java.util.ArrayList"
	import="com.ultimate.ekbms.util.FileModel" 
	import="java.util.regex.*"
	import="com.ultimate.ekbms.util.RegexHtml"
	import="java.util.Iterator"%>
<%
	String path = request.getContextPath();//获取工程根目录
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                  + ":" + request.getServerPort()+ path + "/";
	String regEx_html = "<[^>]+>";
	// 创建 Pattern 对象
	Pattern r = Pattern.compile(regEx_html);
	// 现在创建 matcher 对象
	RegexHtml regexHtml = new RegexHtml();
	ArrayList<FileModel> hitsList = (ArrayList<FileModel>) request.getAttribute("hitsList");
	String queryback = (String) request.getAttribute("queryback");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索</title>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<script type="text/javascript" src="js/search.js"></script>
<link href="css/home.css" rel="stylesheet" />
<link href="css/search.css" rel="stylesheet" />
</head>
<body>
	<!-- 顶部导航栏 -->
	<nav class="navbar navbar-inverse" role="navigation"
		style="border-radius: 0px; background-color: rgba(63, 63, 63, 1);">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><img src="img/loo.png"
					style="height: 30px; width: auto;"></a>
			</div>
			<div>
				<ul class="nav navbar-nav" style="min-height: 100%;">
					<li><a href="#">首页</a></li>
					<li><a href="#">我的知识库</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> 企业知识库 <b class="caret"></b>
					</a>
						<ul class="dropdown-menu"
							style="min-width: 100%; background-color: rgba(63, 63, 63, 1);">
							<li><a href="#">企业文档</a></li>
							<li><a href="#">知识结构</a></li>
						</ul></li>
					<li><a href="#">学习路径</a></li>
				</ul>

				<!-- 向右对齐 -->
				<ul class="nav navbar-nav navbar-right">
					<!-- 搜索框  -->
					<form class="navbar-form navbar-left" role="search" action="searchAction" method="post">
						<div class="input-group">
							<input name="query" type="text" class="form-control"
								style="border-radius: 0px;" placeholder="输入关键字搜索..." /> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit"
									style="border-radius: 0px;">
									<span class="glyphicon glyphicon-search"
										style="color: dodgerblue;"></span>
								</button>
							</span>
						</div>
					</form>
					<li style="margin-top: 10px;">
						<!-- 头像 --> <img src="img/滑稽.jpg" class="img-circle"
						style="height: 30px; width: 30px;" />
					</li>
					<li><a href="#"
						style="font-size: 14px; color: darkgray; padding-left: 10px;"
						class="dropdown-toggle" data-toggle="dropdown"> 曾祥<b
							class="caret"></b>
					</a>
						<ul class="dropdown-menu" style="min-width: 100%;">
							<li><a href="#" style="color: black;"><span
									class="glyphicon glyphicon-user"></span> 个人中心</a></li>
							<li><a href="#" style="color: black;"><span
									class="badge">3</span>消息</a></li>
							<li><a href="#" style="color: black;"><span
									class="glyphicon glyphicon-log-out"></span> 注销</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 搜索主体 -->
	<div class="container-fluid">
		<div class="row clearfix">
			<div class="col-md-3 column">
				<div class="row clearfix">
					<div class="col-md-4 column"></div>
					<!-- 分类筛选块 -->
					<div class="col-md-8 column">
					<div class="pull-right"><span class="fenge-all"></span></div>
								<div class="tree">
									<br>
									<h3>分类筛选</h3>
									<br>
									<ul class="list-unstyled">
										<li><input type="checkbox" value=""> <span><i
												class="icon-folder-open"></i><big>顶级节点</big></span>
											<ul class="search-list">
												<li class="search-list-li"><span><i
														class="icon-minus-sign"></i> <big>一级节点</big></span> <a href=""></a>
													<ul class="search-list">
														<li class="search-list-li"><span><i
																class="icon-leaf"></i> <big>二级节点</big></span> <a href=""></a></li>
													</ul></li>
												<li class="search-list-li"><span><i
														class="icon-minus-sign"></i> <big>一级节点</big></span> <a href=""></a>
													<ul class="search-list">
														<li class="search-list-li"><span><i
																class="icon-leaf"></i><big>二级节点</big></span> <a href=""></a></li>
														<li class="search-list-li"><span><i
																class="icon-minus-sign"></i> <big>二级节点</big></span> <a href=""></a></li>
														<li class="search-list-li"><span><i
																class="icon-leaf"></i><big>二级节点</big></span> <a href=""></a></li>
													</ul></li>
											</ul></li>
											<br>
										<li><input type="checkbox" value=""><span><i
												class="icon-folder-open"></i> <big>顶级节点</big></span>
											<ul class="search-list">
												<li class="search-list-li"><span><i
														class="icon-leaf"></i> <big>一级节点</big></span> <a href=""></a></li>
											</ul></li><br>
										<li><input type="checkbox" value=""><span><i
												class="icon-folder-open"></i> <big>顶级节点</big></span>
											<ul class="search-list">
												<li class="search-list-li"><span><i
														class="icon-leaf"></i> <big>一级节点</big></span> <a href=""></a></li>
											</ul></li><br>
										<li><input type="checkbox" value=""><span><i
												class="icon-folder-open"></i> <big>顶级节点</big></span></li><br>
										<li><input type="checkbox" value=""><span><i
												class="icon-folder-open"></i> <big>顶级节点</big></span></li>
									</ul>
								</div>
							</div>
					</div>
				</div>
				<!-- 搜索结果块 -->
				<div class="col-md-9 column">
					<div class="container-fluid">
						<div class="row clearfix">
							<div class="col-md-6 column white">
								根据 <b><%=queryback%></b> 共为你找到<%=hitsList.size()%>条相关结果
								<button class="btn btn-default btn-sm" type="submit">
									<i class="fas fa-filter"></i>筛选
								</button>
							</div>
							<div class="col-md-2 column white"></div>
							<!-- 中部搜索区 -->
							<div class="col-md-4 column white">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <span
										class="input-group-btn">
										<button class="btn btn-primary" type="button">搜索</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<br>
					<!-- 高级筛选块 -->
					<div class="container-fluid">
						<div class="row clearfix">
							<!-- 资源类型筛选块 -->
							<div class="col-md-6 column">
								<div class="btn-group btn-group-sm" role="group"
									aria-label="...">
									<button type="button" class="btn btn-default">所有资源</button>
									<button type="button" class="btn btn-default">相关文档</button>
									<button type="button" class="btn btn-default">知识结构</button>
									<button type="button" class="btn btn-default">学习路径</button>
								</div>
								<div class="column btn-group">
									<button type="button"
										class="btn btn-default btn-sm dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false">
										所有时间 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">一天内</a></li>
										<li><a href="#">一周内</a></li>
										<li><a href="#">一月内</a></li>
										<li><a href="#">一年内</a></li>
									</ul>
								</div>
							</div>
							<!-- 文件格式筛选块 -->
							<div class="col-md-6 column">
								文档格式：<label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="inlineRadio1" value="option1">
									<small>DOC</small>
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="inlineRadio2" value="option2">
									<small>XLS</small>
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="inlineRadio3" value="option3">
									<small>PPT</small>
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="inlineRadio3" value="option3">
									<small>PDF</small>
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="inlineRadio3" value="option3">
									<small>TXT</small>
								</label> <label class="radio-inline"> <input type="radio"
									name="inlineRadioOptions" id="inlineRadio3" value="option3">
									<small>视频</small>
								</label>
							</div>
						</div>
					</div>
					<br>
					<!-- 结果显示栏 -->
					<div class="container-fluid">
						<div class="row clearfix">
					<div class="col-md-10 column">
					<div class="list-group">
					<%
						if (hitsList.size() > 0) {
							Iterator<FileModel> iter = hitsList.iterator();
							FileModel fm;
						while (iter.hasNext()) {
							fm = iter.next();
					%>
						<a href="#" class="list-group-item"> <i class="far fa-file-pdf fa-lg"></i>&nbsp;&nbsp;<big><b><%=fm.getTitle().split("\\.")[0]%></b></big>
						<%=fm.getContent().length() > 210 ? fm.getContent().substring(0, 210): fm.getContent()%>...	
							<br>
							<div class="container-fluid">
								<div class="row clearfix gray-word">
									<div class="col-md-3 column">2018-2-27 00:00:00</div>
									<div class="col-md-1 column">
										<span class="fenge"></span>
									</div>
									<div class="col-md-2 column">99下载</div>
									<div class="col-md-1 column">
										<span class="fenge"></span>
									</div>
									<div class="col-md-2 column">贡献者：曾祥</div>
									<div class="col-md-3 column"></div>
								</div>
							</div>
						</a>
						<%
						}
						} 
						%>
						</div>
						</div>
						<div class="col-md-2 column"></div>
						</div>
						</div>
						<!-- 底部分页块 -->
						<div class="col-md-1 column"></div>
						<div class="col-md-6 column">
							<ul class="pagination">
								<li><a href="#">&laquo;</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">6</a></li>
								<li><a href="#">7</a></li>
								<li><a href="#">8</a></li>
								<li><a href="#">9</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
						</div>
						<div class="col-md-4 column">
							<br>
							<form class="form-inline" role="form">
								<select class="form-control" style="width: 100px;">
									<option>10条/页</option>
									<option>20条/页</option>
									<option>30条/页</option>
									<option>40条/页</option>
									<option>50条/页</option>
								</select> 跳至 <input type="text" class="form-control" placeholder="5"
									style="width: 40px;"> 页
							</form>
						</div>
						<div class="col-md-1 column"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>