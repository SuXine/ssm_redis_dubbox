<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<title>Libra天秤座</title>

<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/foot.css" />
<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="css/homtop.css" />
<link rel="stylesheet" type="text/css" href="css/new_com.css" />
<link rel="stylesheet" type="text/css" href="css/newindex.css" />

<script type="text/javascript"
	src="bootstrap-3.3.7-dist/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="bootstrap-3.3.7-dist/js/bootstrap-select.js"></script>
<script type="text/javascript"
	src="bootstrap-3.3.7-dist/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/template.js"></script>
<script type="text/javascript"
	src="bootstrap-3.3.7-dist/js/bootstrapValidator.min.js"></script>

<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="bootstrap-3.3.7-dist/css/bootstrapValidator.min.css" />
<link rel="stylesheet"
	href="bootstrap-3.3.7-dist/css/bootstrap-select.css" />

<script type="text/javascript" src="js/Consult.js"></script>
<script type="text/javascript" src="js/frontend.js"></script>
<script type="text/javascript" src="js/Lawayer.js"></script>
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript" src="js/wind.js"></script>
<script type="text/javascript" src="js/Validator.js"></script>

</head>

<body>
	<div id="validator">
		<!-- 模态框（咨询） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div ide="motai" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">咨询信息如下：</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="basic" class="col-lg-2 control-label">咨询类型</label>
							<div class="col-lg-10">
								<select id="basic" class="selectpicker show-tick">
									<option>拆迁问题</option>
									<option>医疗纠纷</option>
									<option>房产纠纷</option>
									<option>行政诉讼</option>
									<option>刑事辩护</option>
									<option>婚姻纠纷</option>
									<option>诉讼与仲裁</option>
									<option>企业法律外包</option>
									<option>其他</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">咨询题目</label> <input type="text"
								class="form-control" id="ConsultTitle" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">案件描述（填写可公开问题，其他内容通过文件上传）</label>
							<textarea name="text" ide="text" class="form-control" id="ConsultText"></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">联系邮箱</label> <input type="text"
								class="form-control" id="ConsultEmail" name="Email" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">姓名</label> <input type="text"
								class="form-control" id="ConsultName" name="NotNull" />
						</div>
						<div class="form-group" id="inputfile">
							<label for="exampleInputFile">辩护文件(为保证上传成功请控制文件在40M以下)</label> <input
								type="file" id="upload" name="upload" />
						</div>
						<div class="form-group">
						<input type="checkbox" id ="agreement1"/>请阅读以下后方可咨询<a data-toggle="modal" data-target="#myModal9" >《用户协议》</a>
						</div>
						<div id="VerificationEmailInput"></div>
						<div id="registertext2" style="padding: 2px; display: none;">验证邮件已发送</div>
						<div id="registertext" style="padding: 2px; display: none;"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-default"
								id="VerificationEmail">验证邮箱</button>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="consult">提交咨询</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 模态框（个人信息） -->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div ide="motai" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="PeopleTitle">***信息如下：</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">姓名</label> <input type="text"
								class="form-control" id="PeopleName" name="NotNull" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">个人宣言</label> <input type="text"
								class="form-control" id="PeopleManifesto" name="PeopleManifesto" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">个人邮箱</label>
							<div class="form-control" id="PeopleEamil"></div>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">擅长类型</label>
							<input type="text" class="form-control" id="PeopleType" name="LawyerType" ></input>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">工作经验</label>
							<textarea name="text" ide="text" class="form-control" id="PeopleText"></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">验证码</label> <input type="text"
								class="form-control" id="PeopleCodeInput" name="Code" />
						</div>
						<div id="Peopletext2" style="padding: 2px; display: none;">验证码已发送</div>
						<div id="Peopletext" style="padding: 2px; display: none;"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-default" id="UPPeopleEmali">发送验证码</button>
							<button type="button" class="btn btn-primary" id="PeopleDelete">删除信息</button>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="PeopleUpdate">提交更改</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 模态框（注册律师） -->
		<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div ide="motai" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">请填写如下信息：</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">姓名</label> <input type="text"
								class="form-control" id="LawyerName" name="NotNull" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">联系电话</label> <input type="text"
								class="form-control" id="LawyerPhone" name="Phone" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">个人邮箱</label> <input type="text"
								class="form-control" id="LawyerEmail" name="Email" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">擅长案件(填写类型)</label> <input type="text"
								class="form-control" id="LawyerType" name="LawyerType" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">个人宣言</label> <input type="text"
								class="form-control" id="LawyerManifesto" name="PeopleManifesto" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">律师证件号</label> <input type="text"
								class="form-control" id="LawyerNumber" name="LawyerNumber" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">工作经验</label>
							<textarea name="text" ide="text" class="form-control" ide="text"
								id="LawyerExperience"></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputFile">选择照片(照片大小应小于5m)</label> <input
								type="file" id="lawyerImg" name="lawyerImg" />
						</div>
						<div class="form-group">
						<input type="checkbox" id = "agreement2"/>请阅读以下后方可注册<a data-toggle="modal" data-target="#myModal10" >《用户协议》</a>
						</div>
						<div id="VerificationLawyerEmailInput"></div>
						<div id="register2text2" style="padding: 2px; display: none;">验证邮件已发送</div>
						<div id="register2text" style="padding: 2px; display: none;"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-default"
								id="VerificationLawyerEmail">验证邮箱</button>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="register">提交注册</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 模态框（验证码验证邮箱->申请辩护） -->
		<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div ide="motai" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">验证码验证邮箱：</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">请输入律师邮箱</label> <input
								type="text" class="form-control" id="applyPleadEmaliInput"
								name="Email" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">验证码</label> <input type="text"
								class="form-control" id="applyPleadCodeInput" name="Code" />
						</div>
						<div id="applyPleadtext2" style="padding: 2px; display: none;">验证码已发送</div>
						<div id="applyPleadtext" style="padding: 2px; display: none;"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-default"
								id="UPapplyPleadEmali">发送验证码</button>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="applyPlead">申请咨询</button>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
		<!-- 模态框（验证码验证邮箱->辩护完成） -->
		<div class="modal fade" id="myModal5" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div ide="motai" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">验证码验证邮箱：</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">请给律师打分(1:不满意，2：一般，3：很棒)</label> <input
								type="text" class="form-control" id="finishPleadScoreInput"
								name="finishPleadScoreInput" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">请输入咨询人邮箱</label> <input
								type="text" class="form-control" id="finishPleadEmaliInput"
								name="Email" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">验证码</label> <input type="text"
								class="form-control" id="finishPleadCodeInput" name="Code" />
						</div>
						<div id="finishPleadtext2" style="padding: 2px; display: none;">验证码已发送</div>
						<div id="finishPleadtext" style="padding: 2px; display: none;"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-default"
								id="UPfinishPleadEmali">发送验证码</button>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="finishPlead">完成咨询</button>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
		<!-- 模态框（验证码验证邮箱->删除辩护） -->
		<div class="modal fade" id="myModal6" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div ide="motai" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">验证码验证邮箱：</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">请输入咨询者邮箱（如有注册律师，律师未处理，案件将在案件大全展示）</label> <input
								type="text" class="form-control" id="deletePleadEmaliInput"
								name="Email" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">验证码</label> <input type="text"
								class="form-control" id="deletePleadCodeInput" Name="Code" />
						</div>
						<div id="deletePleadtext2" style="padding: 2px; display: none;">验证码已发送</div>
						<div id="deletePleadtext" style="padding: 2px; display: none;"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-default"
								id="UPdeletePleadEmali">发送验证码</button>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="deletePlead">删除咨询</button>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
		<!-- 模态框（验证码验证邮箱->取消辩护） -->
		<div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div ide="motai" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">验证码验证邮箱：</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">请输入律师邮箱</label> <input
								type="text" class="form-control" id="deleteLawyerEmaliInput"
								name="Email" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">验证码</label> <input type="text"
								class="form-control" id="deleteLawyerCodeInput" Name="Code" />
						</div>
						<div id="deleteLawyertext2" style="padding: 2px; display: none;">验证码已发送</div>
						<div id="deleteLawyertext" style="padding: 2px; display: none;"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-default"
								id="UPdeleteLawyerEmali">发送验证码</button>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="deleteLawyer">取消辩护</button>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
		<!-- 模态框（验证码验证邮箱->下载文件） -->
		<div class="modal fade" id="myModal8" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div ide="motai" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">验证码验证邮箱：</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">请输入律师邮箱</label> <input
								type="text" class="form-control" id="downEmaliInput"
								name="Email" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">验证码</label> <input type="text"
								class="form-control" id="downCodeInput" name="Code" />
						</div>
						<div id="downtext2" style="padding: 2px; display: none;">验证码已发送</div>
						<div id="downtext" style="padding: 2px; display: none;"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-default"
								id="UPdownEmali">发送验证码</button>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="down">下载文件</button>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div><!-- 模态框（验证码验证邮箱->下载文件） -->
		<!-- 模态框（用户协议） -->
		<div class="modal fade" id="myModal9" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div ide="motai" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">用户协议：</h4>
					</div>
					<div class="modal-body">
						<p>Libra协议<p>
						Libra许可及服务协议<br />
欢迎您使用Libra网（www.libraone.cn）及服务！<br />
您在使用Libra网和服务前，应充分阅读、理解并接受本服务协议的内容，一旦您注册或使用本软件和服务，即表示您同意并接受本协议之约束。<br />
特别提醒：<br />
<br />
本协议中字体加黑部分以及其中的免责或限制条款，将影响到您的权利和义务，请您务必仔细阅读。<br />
如果您是无民事行为能力人或限制行为能力人，请在法定监护人的陪同下阅读本协议及相关协议，并在法定监护人的陪同下使用本软件及接受本服务。<br />
1. 协议的适用<br />
<br />
1.1 本协议是您与甘肃庆阳陇东学院《中国大学生计算机设计大赛》天秤座网站项目设计团队（以下简称“天秤”）之间关于您使用本网站和本服务所订立的协议。<br />
1.2 本协议是Libra系统的主体协议，是Libra所有服务协议及其规则中不可分割的组成部分，与其构成统一整体。除本协议外，天秤可能不断发布关于本服务的相关协议、业务规则等内容。上述内容一经正式发布，即为本协议不可分割的组成部分。<br />
1.3 为更好地为您服务，本协议可能会不时更新，相关更新通知将会在本服务网站上公布，请您留意本网站上的通知消息。如果您不同意更新后的本协议之条款内容，请您立即停止使用本网站或本服务。如您继续使用本网站或接受本服务，则视为您同意并接受本协议更新后的相关条款之内容。<br />
2. 关于本服务<br />
<br />
2.1 本服务是指天秤向用户提供的法律服务交流工具（以下简称“Libra”）。它支持单人、多人参与，及发送电子邮件、压缩包等通讯服务，并在此基础上同时为用户提供包括但不限于法律服务、关系链拓展、便捷工具、开放平台等功能或内容的许可及服务（以下简称“本服务”）。<br />
2.2您可以直接利用浏览器搜索本网站，以接受本服务。<br />
2.3天秤给予您使用本网站或本服务之一项个人的、不可转让及非排他性的许可，您仅可为访问或使用本服务的目的而使用这些网站及服务。<br />
2.4 本协议未明示授权您的其他一切权利仍由天秤保留，您在行使本协议非明确授权的其他权利前，须取得天秤的书面许可；否则，天秤将保留追究您相关责任的权利。<br />
<br />
<br />
<br />
<br />
<br />
<br />
3. 网站的更新<br />
<br />
3.1 为了改善用户体验、完善服务内容，天秤将不断努力开发新的服务，并为您不时提供网站的更新，这些更新可能会采取网站替换、修改、功能强化、版本升级等形式。<br />
3.2 天秤有权不经向您特别通知而对网站进行更新，或者对网站的部分功能效果进行改变或限制，以保证本网站和服务在安全性及功能性上的一致性。<br />
3.3 本网站更新后，网站可能自动更新，请您根据天秤的提示消息使用最新网站。<br />
4. 个人信息保护<br />
<br />
4.1 您在注册帐号或使用本服务的过程中，需要根据服务提示提供一些必要的信息，例如：为向您提供帐号注册服务或进行用户身份识别，需要您填写电子邮箱；律师注册时需要您提供您真实的律师身份信息等。若您提供的信息不真实或不完整，则您将无法使用本服务或在使用过程中会受到限制。<br />
4.2 一般情况下，您可随时浏览、修改自己提交的信息，但出于安全性和身份识别（如号码申诉服务）的考虑，您可能无法修改注册时提供的初始注册信息及其他验证信息，如您必须修改前述不可修改的信息，请您与天秤联系以便寻找解决方案。<br />
4.3 天秤将运用各种安全技术手段，建立完善的都制度来保护您的个人信息。除法律法规和本协议另有规定的情形外，未经您许可，天秤不会向第三方公开、透露您的个人未公开信息。<br />
4.3 在不透露您单个隐私资料的前提下，天秤有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。<br />
5.&nbsp; 帐号使用规范<br />
<br />
5.1 如果您是律师，您在使用本服务前需要使用您的可用电子邮箱注册一个Libra帐号，该邮箱将是您在本网站进行操作的身份验证凭证。如果您是案件咨询发布人，您在使用本服务时也需要使用邮箱进行验证，但不需要提前在本网站注册。<br />
5.2 Libra帐号通过电子邮箱号码进行注册,注册成功后自动绑定邮箱帐号。同一个邮箱只对应一个账号，天秤有权根据用户需求或产品需要，对帐号注册和绑定的方式进行变更。<br />
5.3 Libra帐号的所有权归天秤所有，您完成申请注册手续后，仅获得Libra帐号的使用权，且该使用权仅属于初始申请注册人。同时，初始申请注册人不得赠与、借用、租用、转让或售卖律伴帐号或者以其他方式许可非初始申请注册人使用Libra帐号。非初始申请注册人不得通过受赠、继承、承租、受让或者其他任何方式使用Libra帐号。<br />
5.4 您有责任妥善保管注册帐户信息及验证密码的安全，您需要对注册帐户以及验证密码下的行为承担法律责任。您同意在任何情况下不向他人透露帐户及验证密码信息，当您怀疑他人在使用您的帐号时，请您立即通知天秤。<br />
5.5 您注册Libra帐号后如果长期不登录该帐号，天秤有权回收该帐号，以免造成资源浪费，由此带来的任何损失均由您自行承担。<br />
6. 用户行为规范<br />
<br />
6.1 信息内容规范<br />
<br />
6.1.1 本条所述信息内容是指您使用本网站及服务过程中所制作、复制、发布、传播的任何内容，包括但不限于Libra帐号头像、名字、身份信息、用户说明等注册信息，或文字、语音、图片等发送、回复和相关链接页面，以及其他使用Libra帐号或本网站及服务所产生的内容。<br />
6.1.2 您理解并同意，天秤一直致力于为用户提供文明、健康、规范有序的网络环境，您不得利用Libra帐号或本网站及服务制作、复制、发布、传播以下干扰本网站及服务的正常运营，以及侵犯其他用户或第三方合法权益的内容，包括但不限于：<br />
6.1.2.1 发布、传送、传播、储存违反国家法律法规禁止的内容；<br />
6.1.2.2 发布、传送、传播、储存侵害他人名誉权、肖像权、知识产权、商业秘密等合法权利的内容；<br />
6.1.2.3 涉及他人隐私、个人信息或资料的内容；<br />
6.1.2.4 发布、传送、传播骚扰、广告信息及垃圾信息或含有任何性或性暗示的内容；<br />
6.1.2.5 其他违反法律法规、政策及公序良俗、社会公德或干扰本软件正常运营和侵犯其他用户或第三方合法权益的内容等。<br />
6.2 网站使用规范<br />
<br />
除非法律允许或天秤书面许可，您使用本网站及服务过程中不得从事下列行为：<br />
6.2.1 删除本网站上关于本网站之著作权的任何信息；<br />
6.2.2 对本网站进行反向工程、反向汇编、反向编译，或者以其他方式尝试发现本网站的源代码；<br />
6.2.3 对天秤拥有知识产权的内容进行使用、出租、出借、复制、修改、链接、转载、汇编、发表、出版、建立镜像站点等；<br />
6.2.4 对本网站或者本网站运行过程中释放到任何终端内存中的数据、网站运行过程中客户端与服务器端的交互数据，以及本网站运行所必需的系统数据，进行复制、修改、增加、删除、挂接运行或创作任何衍生作品，包括但不限于使用插件、外挂或非天秤经授权的第三方工具/服务接入本软件、网站和相关系统；<br />
6.2.5 通过修改或伪造网站运行中的指令、数据，增加、删减、变动网站的功能或运行效果，或者将用于上述用途的网站、方法进行运营或向公众传播，无论这些行为是否为商业目的；<br />
6.2.6 通过非天秤开发、授权的第三方软件、插件、外挂、系统，登录或使用本网站及服务，或制作、发布、传播上述工具；<br />
6.2.7 自行或者授权他人、第三方软件对本网站及其组件、模块、数据进行干扰；<br />
6.2.8 其他未经天秤明确授权的行为。<br />
6.3 服务运营规范<br />
<br />
除非法律允许或天秤书面许可，您使用本服务过程中不得从事下列行为：<br />
6.3.1 提交、发布虚假信息，或冒充、利用他人名义的；<br />
6.3.2 诱导其他用户点击链接页面或分享信息的；<br />
6.3.3 虚构事实、隐瞒真相以误导、欺骗他人的；<br />
6.3.4 未经天秤书面许可利用律伴帐号和任何功能，以及第三方运营平台进行推广或互相推广的；<br />
6.3.5制作、发布、使用、传播用于窃取律伴帐号及他人个人信息、财产的恶意程序；<br />
6.3.6 利用Libra帐号或本网站及服务从事任何违法犯罪活动的；<br />
6.3.7 其他违反法律法规规定、侵犯其他用户合法权益、干扰律伴服务正常运营或天秤未明确授权的行为。<br />
6.4 违规处理<br />
<br />
6.4.1 如果天秤发现或收到他人举报或投诉您违反本协议约定的，天秤有权不经通知随时对相关内容进行删除、屏蔽，并视您行为情节的轻重，对该违规帐号处以包括但不限于警告、限制或禁止使用部分或全部功能、帐号封禁直至注销的处罚，并公告处理结果。<br />
6.4.2 您理解并同意，天秤有权依合理判断对违反有关法律法规或本协议规定的行为进行处罚，对违法违规的任何用户采取适当的法律行动，并依据法律法规保存有关信息向有关部门报告等，您应独自承担由此而产生的一切法律责任。<br />
6.4.3 您理解并同意，因您违反本协议或相关服务条款的规定，导致或产生第三方主张的任何索赔、要求或损失，您应当独立承担责任；天秤因此遭受损失的，您应当一并赔偿。<br />
7. 其它注意事项<br />
<br />
7.1 您理解并同意，为了向您提供有效的服务，本网站会利用您终端设备的处理器和带宽等资源。本软件使用过程中产生的数据流量费用，您需自行向运营商了解相关资费信息，并自行承担相关费用。<br />
7.2 您理解并同意，本网站的某些功能可能会让第三方知晓您的个人信息，该等信息不属于本协议第5条之个人信息的保护范畴。例如：用户中的律师信息（头像、名字、电子邮箱号或其他可公开的个人资料）均可被网站或其他注册律师查看；您发布在网站的公开咨询信息，您填写的案件名，案件描述，联系邮箱均可在网站中展示，供第三方查阅；您上传在案件咨询中的压缩包内容将会在律师申请辩护时开放下载给该辩护律师。。您在此免费并独家的授权法天对您发布的相关内容予以使用、复制、修订、改写、翻译、发布、展示等。<br />
7.3 您在使用本网站某一特定服务时，该服务可能会另有单独的协议、相关业务规则等（以下统称为“单独协议”），请您仔细阅读并同意相关的单独协议，否则，您将无法使用该特定的服务。<br />
7.4 您理解并同意，天秤将会尽其商业上的合理努力保障您在本网站及服务中的数据存储安全，但是，天秤并不能就此提供完全保证，包括但不限于以下情形：<br />
7.4.1 天秤不对您在使用本网站及服务中相关数据的删除或储存失败负责；<br />
7.4.2 天秤有权根据实际情况自行决定单个用户在本网站及服务中数据的最长储存期限，并在服务器上为其分配数据最大存储空间等。您可根据自己的需要自行备份本网站及服务中的相关数据；<br />
7.4.3 如果您停止使用本网站及服务或服务被终止或取消，天秤可以从服务器上永久地删除您的数据；服务停止、终止或取消后，天秤没有义务向您返还任何数据。<br />
7.5 您理解并同意，您在使用本网站及服务时，须自行承担如下来自天秤不可掌控的风险内容，包括但不限于：<br />
7.5.1 由于不可抗拒因素可能引起的个人信息丢失、泄漏等风险；<br />
7.5.2 用户在使用本网站访问第三方产品或服务时，因第三方产品或服务及相关内容所可能导致的风险，由用户自行承担；<br />
7.5.3 用户发布的内容被他人转发、分享，因此等传播可能带来的风险和责任；<br />
7.5.4 由于无线网络信号不稳定、无线网络带宽小等原因，所引起的本网站登录失败、资料同步不完整、页面打开速度慢等风险。<br />
7.6 您理解并同意，本网站同大多数互联网网站一样，可能会受多种因素影响，包括但不限于用户原因、网络服务质量、社会环境等；也可能会受各种安全问题的侵扰，包括但不限于他人非法利用用户资料，进行现实中的骚扰；用户访问的其他网站中可能含有病毒、木马程序或其他恶意程序，威胁您的终端设备信息和数据安全，继而影响本网站的正常使用等。因此，您应加强信息安全及个人信息的保护意识，注意密码保护，以免遭受损失。<br />
7.7 在任何情况下，您不应轻信借款、索要密码或其他涉及财产的网络信息。涉及财产操作的，请您一定要先核实对方身份，并请经常留意法天有关防范诈骗犯罪的提示。<br />
8. 知识产权声明<br />
<br />
8.1 天秤是本网页的知识产权权利人。本网站的一切著作权、商标权、专利权、商业秘密等知识产权，以及与本网站相关的所有信息内容（包括但不限于文字、图片、音频、视频、图表、界面设计、版面框架、有关数据或电子文档等）均受中华人民共和国法律法规和相应的国际条约保护，天秤享有上述知识产权，但相关权利人依照法律规定或本协议约定而享有的权利除外。<br />
8.2 未经天秤书面同意，您不得为任何商业或非商业目的自行或许可任何第三方实施、利用、转让或以其他任何方式使用上述知识产权。<br />
9. 第三方软件或技术<br />
<br />
9.1 本网站可能会使用第三方软件或技术（包括本网站可能使用的开源代码和公共领域代码等，下同），这种使用已经获得合法授权。<br />
9.2 本网站如果使用了第三方的软件或技术，天秤将按照相关法规或约定，对相关的协议或其他文件，可能通过本协议附件或通过开源软件页面等形式进行展示，它们可能会以“软件使用许可协议”、“授权协议”、“开源代码许可证”或其他形式来表达。前述通过各种形式展现的相关协议、其他文件及网页，均是本协议不可分割的组成部分，与本协议具有同等的法律效力，您应当遵守这些要求。如果您没有遵守这些要求，该第三方或者国家机关可能会对您提起诉讼、罚款或采取其他制裁措施，并要求天秤给予协助，您应当自行承担法律责任。<br />
9.3 如因本网站使用的第三方软件或技术引发的任何纠纷，应由该第三方负责解决，天秤不承担任何责任。天秤不对第三方软件或技术提供客服支持，若您需要获取支持，请与第三方联系。<br />
10、其他<br />
<br />
10.1 本协议签订地为中华人民共和国甘肃省庆阳市西峰区。<br />
10.2 本协议的成立、生效、履行、解释及纠纷解决，适用中华人民共和国大陆地区法律（不包括冲突法）。<br />
10.3 若您和天秤之间发生任何纠纷或争议，首先应友好协商解决；协商不成的，您同意将纠纷或争议提交本协议签订地有管辖权的人民法院管辖。<br />
10.4 本协议所有条款的标题仅为阅读方便，不能作为本协议涵义解释的依据。<br />
10.5 本协议条款无论因何种原因部分无效或不可执行，其余条款仍有效，对双方具有约束力。<br />
10.6 您明确知悉并同意，有关使用本网站及服务而产生的任何客诉，您可以向【suyuxuan0401@163.com】邮箱进行反馈，天秤承诺将在三个工作日内予以核查，并在初步核查判断后，依法对被客诉内容进行包括但不限于删除或断开连接等方式予以处理。<br />
（正文完）<br />
<br />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="read">阅读完成</button>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
		<!-- 模态框（用户协议2） -->
		<div class="modal fade" id="myModal10" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div ide="motai" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">用户协议：</h4>
					</div>
					<div class="modal-body">
						<p>Libra协议<p>
						Libra许可及服务协议<br />
欢迎您使用Libra网（www.libraone.cn）及服务！<br />
您在使用Libra网和服务前，应充分阅读、理解并接受本服务协议的内容，一旦您注册或使用本软件和服务，即表示您同意并接受本协议之约束。<br />
特别提醒：<br />
<br />
本协议中字体加黑部分以及其中的免责或限制条款，将影响到您的权利和义务，请您务必仔细阅读。<br />
如果您是无民事行为能力人或限制行为能力人，请在法定监护人的陪同下阅读本协议及相关协议，并在法定监护人的陪同下使用本软件及接受本服务。<br />
1. 协议的适用<br />
<br />
1.1 本协议是您与甘肃庆阳陇东学院《中国大学生计算机设计大赛》天秤座网站项目设计团队（以下简称“天秤”）之间关于您使用本网站和本服务所订立的协议。<br />
1.2 本协议是Libra系统的主体协议，是Libra所有服务协议及其规则中不可分割的组成部分，与其构成统一整体。除本协议外，天秤可能不断发布关于本服务的相关协议、业务规则等内容。上述内容一经正式发布，即为本协议不可分割的组成部分。<br />
1.3 为更好地为您服务，本协议可能会不时更新，相关更新通知将会在本服务网站上公布，请您留意本网站上的通知消息。如果您不同意更新后的本协议之条款内容，请您立即停止使用本网站或本服务。如您继续使用本网站或接受本服务，则视为您同意并接受本协议更新后的相关条款之内容。<br />
2. 关于本服务<br />
<br />
2.1 本服务是指天秤向用户提供的法律服务交流工具（以下简称“Libra”）。它支持单人、多人参与，及发送电子邮件、压缩包等通讯服务，并在此基础上同时为用户提供包括但不限于法律服务、关系链拓展、便捷工具、开放平台等功能或内容的许可及服务（以下简称“本服务”）。<br />
2.2您可以直接利用浏览器搜索本网站，以接受本服务。<br />
2.3天秤给予您使用本网站或本服务之一项个人的、不可转让及非排他性的许可，您仅可为访问或使用本服务的目的而使用这些网站及服务。<br />
2.4 本协议未明示授权您的其他一切权利仍由天秤保留，您在行使本协议非明确授权的其他权利前，须取得天秤的书面许可；否则，天秤将保留追究您相关责任的权利。<br />
<br />
<br />
<br />
<br />
<br />
<br />
3. 网站的更新<br />
<br />
3.1 为了改善用户体验、完善服务内容，天秤将不断努力开发新的服务，并为您不时提供网站的更新，这些更新可能会采取网站替换、修改、功能强化、版本升级等形式。<br />
3.2 天秤有权不经向您特别通知而对网站进行更新，或者对网站的部分功能效果进行改变或限制，以保证本网站和服务在安全性及功能性上的一致性。<br />
3.3 本网站更新后，网站可能自动更新，请您根据天秤的提示消息使用最新网站。<br />
4. 个人信息保护<br />
<br />
4.1 您在注册帐号或使用本服务的过程中，需要根据服务提示提供一些必要的信息，例如：为向您提供帐号注册服务或进行用户身份识别，需要您填写电子邮箱；律师注册时需要您提供您真实的律师身份信息等。若您提供的信息不真实或不完整，则您将无法使用本服务或在使用过程中会受到限制。<br />
4.2 一般情况下，您可随时浏览、修改自己提交的信息，但出于安全性和身份识别（如号码申诉服务）的考虑，您可能无法修改注册时提供的初始注册信息及其他验证信息，如您必须修改前述不可修改的信息，请您与天秤联系以便寻找解决方案。<br />
4.3 天秤将运用各种安全技术手段，建立完善的都制度来保护您的个人信息。除法律法规和本协议另有规定的情形外，未经您许可，天秤不会向第三方公开、透露您的个人未公开信息。<br />
4.3 在不透露您单个隐私资料的前提下，天秤有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。<br />
5.&nbsp; 帐号使用规范<br />
<br />
5.1 如果您是律师，您在使用本服务前需要使用您的可用电子邮箱注册一个Libra帐号，该邮箱将是您在本网站进行操作的身份验证凭证。如果您是案件咨询发布人，您在使用本服务时也需要使用邮箱进行验证，但不需要提前在本网站注册。<br />
5.2 Libra帐号通过电子邮箱号码进行注册,注册成功后自动绑定邮箱帐号。同一个邮箱只对应一个账号，天秤有权根据用户需求或产品需要，对帐号注册和绑定的方式进行变更。<br />
5.3 Libra帐号的所有权归天秤所有，您完成申请注册手续后，仅获得Libra帐号的使用权，且该使用权仅属于初始申请注册人。同时，初始申请注册人不得赠与、借用、租用、转让或售卖律伴帐号或者以其他方式许可非初始申请注册人使用Libra帐号。非初始申请注册人不得通过受赠、继承、承租、受让或者其他任何方式使用Libra帐号。<br />
5.4 您有责任妥善保管注册帐户信息及验证密码的安全，您需要对注册帐户以及验证密码下的行为承担法律责任。您同意在任何情况下不向他人透露帐户及验证密码信息，当您怀疑他人在使用您的帐号时，请您立即通知天秤。<br />
5.5 您注册Libra帐号后如果长期不登录该帐号，天秤有权回收该帐号，以免造成资源浪费，由此带来的任何损失均由您自行承担。<br />
6. 用户行为规范<br />
<br />
6.1 信息内容规范<br />
<br />
6.1.1 本条所述信息内容是指您使用本网站及服务过程中所制作、复制、发布、传播的任何内容，包括但不限于Libra帐号头像、名字、身份信息、用户说明等注册信息，或文字、语音、图片等发送、回复和相关链接页面，以及其他使用Libra帐号或本网站及服务所产生的内容。<br />
6.1.2 您理解并同意，天秤一直致力于为用户提供文明、健康、规范有序的网络环境，您不得利用Libra帐号或本网站及服务制作、复制、发布、传播以下干扰本网站及服务的正常运营，以及侵犯其他用户或第三方合法权益的内容，包括但不限于：<br />
6.1.2.1 发布、传送、传播、储存违反国家法律法规禁止的内容；<br />
6.1.2.2 发布、传送、传播、储存侵害他人名誉权、肖像权、知识产权、商业秘密等合法权利的内容；<br />
6.1.2.3 涉及他人隐私、个人信息或资料的内容；<br />
6.1.2.4 发布、传送、传播骚扰、广告信息及垃圾信息或含有任何性或性暗示的内容；<br />
6.1.2.5 其他违反法律法规、政策及公序良俗、社会公德或干扰本软件正常运营和侵犯其他用户或第三方合法权益的内容等。<br />
6.2 网站使用规范<br />
<br />
除非法律允许或天秤书面许可，您使用本网站及服务过程中不得从事下列行为：<br />
6.2.1 删除本网站上关于本网站之著作权的任何信息；<br />
6.2.2 对本网站进行反向工程、反向汇编、反向编译，或者以其他方式尝试发现本网站的源代码；<br />
6.2.3 对天秤拥有知识产权的内容进行使用、出租、出借、复制、修改、链接、转载、汇编、发表、出版、建立镜像站点等；<br />
6.2.4 对本网站或者本网站运行过程中释放到任何终端内存中的数据、网站运行过程中客户端与服务器端的交互数据，以及本网站运行所必需的系统数据，进行复制、修改、增加、删除、挂接运行或创作任何衍生作品，包括但不限于使用插件、外挂或非天秤经授权的第三方工具/服务接入本软件、网站和相关系统；<br />
6.2.5 通过修改或伪造网站运行中的指令、数据，增加、删减、变动网站的功能或运行效果，或者将用于上述用途的网站、方法进行运营或向公众传播，无论这些行为是否为商业目的；<br />
6.2.6 通过非天秤开发、授权的第三方软件、插件、外挂、系统，登录或使用本网站及服务，或制作、发布、传播上述工具；<br />
6.2.7 自行或者授权他人、第三方软件对本网站及其组件、模块、数据进行干扰；<br />
6.2.8 其他未经天秤明确授权的行为。<br />
6.3 服务运营规范<br />
<br />
除非法律允许或天秤书面许可，您使用本服务过程中不得从事下列行为：<br />
6.3.1 提交、发布虚假信息，或冒充、利用他人名义的；<br />
6.3.2 诱导其他用户点击链接页面或分享信息的；<br />
6.3.3 虚构事实、隐瞒真相以误导、欺骗他人的；<br />
6.3.4 未经天秤书面许可利用律伴帐号和任何功能，以及第三方运营平台进行推广或互相推广的；<br />
6.3.5制作、发布、使用、传播用于窃取律伴帐号及他人个人信息、财产的恶意程序；<br />
6.3.6 利用Libra帐号或本网站及服务从事任何违法犯罪活动的；<br />
6.3.7 其他违反法律法规规定、侵犯其他用户合法权益、干扰律伴服务正常运营或天秤未明确授权的行为。<br />
6.4 违规处理<br />
<br />
6.4.1 如果天秤发现或收到他人举报或投诉您违反本协议约定的，天秤有权不经通知随时对相关内容进行删除、屏蔽，并视您行为情节的轻重，对该违规帐号处以包括但不限于警告、限制或禁止使用部分或全部功能、帐号封禁直至注销的处罚，并公告处理结果。<br />
6.4.2 您理解并同意，天秤有权依合理判断对违反有关法律法规或本协议规定的行为进行处罚，对违法违规的任何用户采取适当的法律行动，并依据法律法规保存有关信息向有关部门报告等，您应独自承担由此而产生的一切法律责任。<br />
6.4.3 您理解并同意，因您违反本协议或相关服务条款的规定，导致或产生第三方主张的任何索赔、要求或损失，您应当独立承担责任；天秤因此遭受损失的，您应当一并赔偿。<br />
7. 其它注意事项<br />
<br />
7.1 您理解并同意，为了向您提供有效的服务，本网站会利用您终端设备的处理器和带宽等资源。本软件使用过程中产生的数据流量费用，您需自行向运营商了解相关资费信息，并自行承担相关费用。<br />
7.2 您理解并同意，本网站的某些功能可能会让第三方知晓您的个人信息，该等信息不属于本协议第5条之个人信息的保护范畴。例如：用户中的律师信息（头像、名字、电子邮箱号或其他可公开的个人资料）均可被网站或其他注册律师查看；您发布在网站的公开咨询信息，您填写的案件名，案件描述，联系邮箱均可在网站中展示，供第三方查阅；您上传在案件咨询中的压缩包内容将会在律师申请辩护时开放下载给该辩护律师。。您在此免费并独家的授权法天对您发布的相关内容予以使用、复制、修订、改写、翻译、发布、展示等。<br />
7.3 您在使用本网站某一特定服务时，该服务可能会另有单独的协议、相关业务规则等（以下统称为“单独协议”），请您仔细阅读并同意相关的单独协议，否则，您将无法使用该特定的服务。<br />
7.4 您理解并同意，天秤将会尽其商业上的合理努力保障您在本网站及服务中的数据存储安全，但是，天秤并不能就此提供完全保证，包括但不限于以下情形：<br />
7.4.1 天秤不对您在使用本网站及服务中相关数据的删除或储存失败负责；<br />
7.4.2 天秤有权根据实际情况自行决定单个用户在本网站及服务中数据的最长储存期限，并在服务器上为其分配数据最大存储空间等。您可根据自己的需要自行备份本网站及服务中的相关数据；<br />
7.4.3 如果您停止使用本网站及服务或服务被终止或取消，天秤可以从服务器上永久地删除您的数据；服务停止、终止或取消后，天秤没有义务向您返还任何数据。<br />
7.5 您理解并同意，您在使用本网站及服务时，须自行承担如下来自天秤不可掌控的风险内容，包括但不限于：<br />
7.5.1 由于不可抗拒因素可能引起的个人信息丢失、泄漏等风险；<br />
7.5.2 用户在使用本网站访问第三方产品或服务时，因第三方产品或服务及相关内容所可能导致的风险，由用户自行承担；<br />
7.5.3 用户发布的内容被他人转发、分享，因此等传播可能带来的风险和责任；<br />
7.5.4 由于无线网络信号不稳定、无线网络带宽小等原因，所引起的本网站登录失败、资料同步不完整、页面打开速度慢等风险。<br />
7.6 您理解并同意，本网站同大多数互联网网站一样，可能会受多种因素影响，包括但不限于用户原因、网络服务质量、社会环境等；也可能会受各种安全问题的侵扰，包括但不限于他人非法利用用户资料，进行现实中的骚扰；用户访问的其他网站中可能含有病毒、木马程序或其他恶意程序，威胁您的终端设备信息和数据安全，继而影响本网站的正常使用等。因此，您应加强信息安全及个人信息的保护意识，注意密码保护，以免遭受损失。<br />
7.7 在任何情况下，您不应轻信借款、索要密码或其他涉及财产的网络信息。涉及财产操作的，请您一定要先核实对方身份，并请经常留意法天有关防范诈骗犯罪的提示。<br />
8. 知识产权声明<br />
<br />
8.1 天秤是本网页的知识产权权利人。本网站的一切著作权、商标权、专利权、商业秘密等知识产权，以及与本网站相关的所有信息内容（包括但不限于文字、图片、音频、视频、图表、界面设计、版面框架、有关数据或电子文档等）均受中华人民共和国法律法规和相应的国际条约保护，天秤享有上述知识产权，但相关权利人依照法律规定或本协议约定而享有的权利除外。<br />
8.2 未经天秤书面同意，您不得为任何商业或非商业目的自行或许可任何第三方实施、利用、转让或以其他任何方式使用上述知识产权。<br />
9. 第三方软件或技术<br />
<br />
9.1 本网站可能会使用第三方软件或技术（包括本网站可能使用的开源代码和公共领域代码等，下同），这种使用已经获得合法授权。<br />
9.2 本网站如果使用了第三方的软件或技术，天秤将按照相关法规或约定，对相关的协议或其他文件，可能通过本协议附件或通过开源软件页面等形式进行展示，它们可能会以“软件使用许可协议”、“授权协议”、“开源代码许可证”或其他形式来表达。前述通过各种形式展现的相关协议、其他文件及网页，均是本协议不可分割的组成部分，与本协议具有同等的法律效力，您应当遵守这些要求。如果您没有遵守这些要求，该第三方或者国家机关可能会对您提起诉讼、罚款或采取其他制裁措施，并要求天秤给予协助，您应当自行承担法律责任。<br />
9.3 如因本网站使用的第三方软件或技术引发的任何纠纷，应由该第三方负责解决，天秤不承担任何责任。天秤不对第三方软件或技术提供客服支持，若您需要获取支持，请与第三方联系。<br />
10、其他<br />
<br />
10.1 本协议签订地为中华人民共和国甘肃省庆阳市西峰区。<br />
10.2 本协议的成立、生效、履行、解释及纠纷解决，适用中华人民共和国大陆地区法律（不包括冲突法）。<br />
10.3 若您和天秤之间发生任何纠纷或争议，首先应友好协商解决；协商不成的，您同意将纠纷或争议提交本协议签订地有管辖权的人民法院管辖。<br />
10.4 本协议所有条款的标题仅为阅读方便，不能作为本协议涵义解释的依据。<br />
10.5 本协议条款无论因何种原因部分无效或不可执行，其余条款仍有效，对双方具有约束力。<br />
10.6 您明确知悉并同意，有关使用本网站及服务而产生的任何客诉，您可以向【suyuxuan0401@163.com】邮箱进行反馈，天秤承诺将在三个工作日内予以核查，并在初步核查判断后，依法对被客诉内容进行包括但不限于删除或断开连接等方式予以处理。<br />
（正文完）<br />
<br />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="read2">阅读完成</button>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
	</div>

	<div class="container"
		style="border-right: 2px solid #DDDDDD; border-left: 2px solid #DDDDDD; border-radius: 5px;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<!--标题-->
				<div class="page-header" style="display: inline-block">
					<img src="img/icon.PNG"
						style="width: 100px; height: 100px; background-position: 0 50px"></img>
					<div style="display: inline-block">
						<h1>
							Libra 天秤座 <small>你的权利我为你守候</small>
						</h1>
					</div>
				</div>
				<!--轮播图-->
				<div id="circleContent" class="carousel slide">
					<ol class="carousel-indicators">
						<li data-target="#circleContent" data-slide-to="0" class="active"></li>
						<li data-target="#circleContent" data-slide-to="1"></li>
						<li data-target="#circleContent" data-slide-to="2"></li>
						<li data-target="#circleContent" data-slide-to="3"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="img/tab1.jpg" style="width: 100%;" class="lunboImg">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img src="img/tab2.jpg" style="width: 100%;" class="lunboImg">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img src="img/tab3.jpg" style="width: 100%;" class="lunboImg">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img src="img/tab4.jpg" style="width: 100%;" class="lunboImg">
							<div class="carousel-caption"></div>
						</div>
					</div>
				</div>
				<!--导航栏-->
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" id="gotoIndex">网站首页</a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown">咨询查询<strong class="caret"></strong></a>
							<ul class="dropdown-menu" ide="classify">
								<li style="text-align: center;"><a>拆迁问题</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>医疗纠纷</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>房产纠纷</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>行政诉讼</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>刑事辩护</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>婚姻纠纷</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>诉讼与仲裁</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>企业法律外包</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>其他</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown">案例展示<strong class="caret"></strong></a>
							<ul class="dropdown-menu" ide="case">
								<li style="text-align: center;"><a>拆迁问题</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>医疗纠纷</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>房产纠纷</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>行政诉讼</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>刑事辩护</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>婚姻纠纷</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>诉讼与仲裁</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>企业法律外包</a></li>
								<li class="divider" />
								<li style="text-align: center;"><a>其他</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">金牌律师<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li style="text-align: center;" ide="ShowLawyer"><a>律师展示</a>
								</li>
								<li class="divider" />
								<li style="text-align: center;"><a class="btn"
									data-toggle="modal" data-target="#myModal3" ide="zixun">注册律师</a>
								</li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown">关于我们<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li style="text-align: center;"><a ide="contactUs">联系我们</a>
								</li>
								<li class="divider" />
								<li style="text-align: center;"><a ide="aboutUs">联盟介绍</a></li>
							</ul></li>
						<li class="dropdown"><a style="display: inline-block;"
							data-toggle="modal" data-target="#myModal" ide="zixun2"
							class="dropdown-toggle" data-toggle="dropdown">在线咨询</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" id="law_case">案件大全</a></li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="acla_data_time">
							<div class="acla-global-seach">
								<input id="Keyword" type="text" placeholder="请输入关键字"> <img
									src="img/search-btn.png" id="LookUp">
							</div>
						</div>
					</form>
				</div>
				</nav>
				<!--分页面模板-->
				<div class="col-md-12 column"
					style="background-color: #FFFFFF; border-radius: 5px; display: none;"
					id="txt">
					<h3 class="text-center" id="txt_header">h3. 这是一套可视化布局系统.</h3>
					<div ide="body" id="panel-762487"></div>
					<ul class="pagination" style="text-align: right; width: 100%;">
						<li style="display: inline-block;"><a id="classifylast">上一页</a>
						</li>
						<li style="display: inline-block;"><a class="classifypagina">1</a>
						</li>
						<li style="display: inline-block;"><a class="classifypagina">2</a>
						</li>
						<li style="display: inline-block;"><a class="classifypagina">3</a>
						</li>
						<li style="display: inline-block;"><a class="classifypagina">……</a>
						</li>
						<li style="display: inline-block;"><a class="classifypagina">5</a>
						</li>
						<li style="display: inline-block;"><a id="classifynext">下一页</a>
						</li>
						<li style="display: inline-block;" data-toggle="modal"
							data-target="#myModal" ide="zixun2"><a href="#">免费咨询</a></li>
					</ul>
				</div>
				<!-- 关于我们 -->
				<div ide="aboutUsTxt" style="display: none">
					<div class="header-row center-block" style="padding: 20px">
						<div class="col-sm-7 col-xs-12 text-left xs-text-center">
							<h4>
								天秤座（Libra），公益性在线律师咨询法律服务平台，2018年3月创立于互联网平台。深耕设计领域一个月，天秤座汇聚了3+优秀设计师，创意人，法律工作爱好者，每日会员接受法律咨询0条！覆盖个人Tomcat服务器，在互联网律师咨询群体中具有强大的向应力与号召力。
							</h4>
							<h4>
								天秤座在创立之初，以“守护每一位公民的权利”为自身使命，一个月来，一直致力于打造以委托人与律师为核心的“公益性在线律师咨询法律服务平台”，目前天秤座除能够提供公开的法律咨询求助服务外，还重点提供了委托人与律师一对一私密交流的空间，天秤座这一设计，都是为了给用户交流，学习，交易，借鉴各个环节提供更好的服务，为律师的成长之路提供更广阔的视野，为委托人提供更多更好的事务解决方案。
							</h4>
							<h3>
								感谢无数关注、爱护我们的朋友，天秤座愿与您彼此陪伴，共同成长！<br class="hidden-xs">
								天秤座，让法律更有力量，与法律工作者一同进步。加入天秤座（Libra），和大家一起交流经验，共建法治社会！
							</h3>
						</div>
						<div class="col-sm-5 col-xs-12 text-right xs-text-center">
							<img src="img/Libra2.jpg" alt="Talla scheme"
								style="width: 100%; margin-top: 60px;">
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
				<!-- 联系我们 -->
				<div ide="contactUsTxt" style="display: none">
					<div class="contacts">
						<div class="row">
							<div class="col-md-6" style="margin-left: 25%">
								<div class="center-block"
									style="width: 70%; margin-buttom: 10px">
									<img src="img/line.PNG" width=100%>
								</div>
								<a href="http://j.map.baidu.com/VDdhP"><img
									src="img/map.png" alt="成都艺术中心" width="100%"></a>
								<h4 class="text-center">庆阳</h4>
							</div>
							<div class="col-md-8 col-sm-offset-2 text-align-center"
								style="margin-bottom: 20px; margin-top: 20px">
								<ul
									class="list-unstyled who cm-content-center text-align-center pull-right text-muted">
									<div style=""></div>
									<li style="display: inline; font-size: 20px"><i> <img
											src="img/phone.jpg" width="32" height="32"></i> 168****0401</li>
									<li style="display: inline; font-size: 20px">|</li>
									<li style="display: inline; font-size: 20px"><i><img
											src="img/qq.png" width="32" height="32"></i> 3528624921</li>
									<li style="display: inline; font-size: 20px">|</li>
									<li style="margin-top: 6px"><a class="text-muted"
										href="mailto:suyuxuan@168.com" style="font-size: 20px"> <i
											class="fa fa-envelope"></i> 反馈与投稿邮箱
									</a>
										<p style="display: inline; font-size: 16px">suyuxuan@168.com</p></li>
									<li style="margin-top: 6px"><a
										href="mailto:1284620312@qq.com" style="font-size: 20px"
										class="text-muted"> <i class="fa fa-qq"></i> 商务合作邮箱
									</a>
										<p style="display: inline; font-size: 16px">1284620312@qq.com</p></li>
									<li style="margin-top: 6px;"><i class="fa fa-home"></i> <a
										href="http://j.map.baidu.com/VDdhP"
										class="margin-right-5 text-muted" target="_bank"
										style="font-size: 16px;"> 庆阳西峰区兰州路45号</a> <a
										class="text-muted" href="http://j.map.baidu.com/kAMJ1"
										target="_blank" style="font-size: 16px;"> 西峰区八里庙大学</a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>
				<div id="index">
					<!--金牌律师-->
					<h3>金牌律师</h3>
					<div class="row" style="overflow: hidden;" ide="goldLawyer"></div>
					<!--热门咨询-->
					<h3>热门咨询</h3>
					<!--咨询详细-->
					<div class="panel-group" id="panel-762488" ide="ShowAllConsult"></div>
					<!--页码-->
					<ul class="pagination" style="text-align: right; width: 100%;">
						<li style="display: inline-block;"><a id="last">上一页</a></li>
						<li style="display: inline-block;"><a class="pagina">1</a></li>
						<li style="display: inline-block;"><a class="pagina">2</a></li>
						<li style="display: inline-block;"><a class="pagina">3</a></li>
						<li style="display: inline-block;"><a class="pagina">……</a></li>
						<li style="display: inline-block;"><a class="pagina">5</a></li>
						<li style="display: inline-block;"><a id="next">下一页</a></li>
						<li style="display: inline-block;" data-toggle="modal"
							data-target="#myModal" ide="zixun2"><a href="#">免费咨询</a></li>
					</ul>
				</div>
				<!--页脚-->
				<div class="section page-foot">
					<div class="section-box">
						<div class="foot-title" style="padding-bottom: 23px;border-bottom: 1px double;">天秤座律师网致力于打造中国最大的公益性在线律师事务管理平台</div>
						<div class="foot-bottom">
							<ul class="clearfix">
								<li>
									<div class="foot-nav clearfix" id="foot-nav-bar">
										<a href="index.jsp">首 页</a> <span ide="ShowLawyer"><a>律师展示</a></span>
										<a id="law_case2">案件大全</a> <a ide="contactUs">联系我们</a> <a
											data-toggle="modal" data-target="#myModal3" ide="zixun">注册律师</a>
										<a data-toggle="modal" data-target="#myModal" ide="zixun2"
											class="dropdown-toggle" data-toggle="dropdown">在线咨询</a> <a
											ide="aboutUs">联盟介绍</a> <a href="http://j.map.baidu.com/VDdhP">地理坐标</a>
									</div>
								</li>
								<li>
									<div class="foot-code">
										<span><img src="img/erweima.jpg"><br>公众平台</span> <span><img
											src="img/erweima.jpg"><br>律师端</span>
									</div>
								</li>
								<li>
									<div class="foot-tel clearfix">
										<div class="tel-img pull-left">
											<img src="img/foot_img_4.png"><br> 客服电话
										</div>
										<div class="tel-text pull-left">
											<span class="orange">153-4674-0401</span><br> 服务时间：09:00
											- 17:00
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>

	<script id="ShowConsult" type="text/html">

			{{each list2 as value i}}
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-762488" href="#panel-element-44964{{i}}">【{{value.consultState}}】{{value.consultType}}:{{value.consultTitle}}</a>
				</div>
				<div id="panel-element-44964{{i}}" class="panel-collapse collapse">
					<div class="panel-body"></div>
					<p style="padding-left: 20px;">辩护内容:{{value.consultText}}</p>
					<p style="padding-left: 20px;">联系人邮箱:{{value.consultEmail}}</p>
					<p style="padding-left: 20px;">联系人姓名:{{value.consultName}}</p>
					<p style="padding-left: 20px;">咨询时间:{{value.consultTime}}</p>
					<p style="padding-left: 20px;">辩护律师:{{value.consultAttorney}}</p>
					<p style="text-align: right;">
						
						{{if value.consultState=="未完成"||value.consultState=="处理中"}} 
							{{if value.consultAttorney=="无"}}
							<button class="btn btn-default" type="button" ide="{{value.id}}" onk="applyPlead" data-toggle="modal" data-target="#myModal4">申请辩护</button> {{/if}} 
						{{if value.consultAttorney!="无"}}
							<a class="btn" ide="{{value.id}}" lock="download.action?filePath={{value.storageFileName}}" onk="down" idk="{{value.consultAttorneyId}}" data-toggle="modal" data-target="#myModal8"}>下载辩护文件</a>
							<button class="btn btn-default" type="button" ide="{{value.id}}" idk="{{value.consultAttorneyId}}" onk="finishPlead" data-toggle="modal" data-target="#myModal5">辩护完成</button>
							<button class="btn btn-default" type="button" ide="{{value.id}}" idk="{{value.consultAttorneyId}}" onk="deleteLawyer" data-toggle="modal" data-target="#myModal7">取消辩护</button>
						{{/if}}
						{{/if}}

						<button class="btn btn-default" type="button" style="margin-right: 20px;" ide="{{value.id}}" onk="deletePlead" data-toggle="modal" data-target="#myModal6">删除信息</button>
					</p>
				</div>
			</div>
			{{/each}}
		</script>

	<script id="ShowOneTypeConsult" type="text/html">
			{{each list2 as value i}}
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-762487" href="#panel-element-44962{{i}}">【{{value.consultState}}】{{value.consultType}}:{{value.consultTitle}}</a>
				</div>
				<div id="panel-element-44962{{i}}" class="panel-collapse collapse">
					<div class="panel-body"></div>
					<p style="padding-left: 20px;">辩护内容:{{value.consultText}}</p>
					<p style="padding-left: 20px;">联系人邮箱:{{value.consultEmail}}</p>
					<p style="padding-left: 20px;">联系人姓名:{{value.consultName}}</p>
					<p style="padding-left: 20px;">咨询时间:{{value.consultTime}}</p>
					<p style="padding-left: 20px;">辩护律师:{{value.consultAttorney}}</p>
					<p style="text-align: right;">
						{{if value.consultState=="未完成"||value.consultState=="处理中"}} {{if value.consultAttorney=="无"}}
						<button class="btn btn-default" type="button" ide="{{value.id}}" onk="applyPlead" data-toggle="modal" data-target="#myModal4">申请辩护</button> {{/if}} {{if value.consultAttorney!="无"}}
						<a class="btn" ide="{{value.id}}" lock="download.action?filePath={{value.storageFileName}}" onk="down" idk="{{value.consultAttorneyId}}" data-toggle="modal" data-target="#myModal8"}>下载辩护文件</a>
						<button class="btn btn-default" type="button" ide="{{value.id}}" idk="{{value.consultAttorneyId}}" onk="finishPlead" data-toggle="modal" data-target="#myModal5">辩护完成</button> 
						<button class="btn btn-default" type="button" ide="{{value.id}}" idk="{{value.consultAttorneyId}}" onk="deleteLawyer" data-toggle="modal" data-target="#myModal7">取消辩护</button>
						{{/if}} {{/if}}
						<button class="btn btn-default" type="button" style="margin-right: 20px;" ide="{{value.id}}" onk="deletePlead" data-toggle="modal" data-target="#myModal6">删除信息</button>
					</p>
				</div>
			</div>
			{{/each}}
		</script>

	<script id="LookUpConsult" type="text/html">
			{{each list2 as value i}} {{if value.state=="1"}}
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-762487" href="#panel-element-44963{{i}}">【{{value.consultState}}】{{value.consultType}}:{{value.consultTitle}}</a>
				</div>
				<div id="panel-element-44963{{i}}" class="panel-collapse collapse">
					<div class="panel-body"></div>
					<p style="padding-left: 20px;">辩护内容:{{value.consultText}}</p>
					<p style="padding-left: 20px;">联系人邮箱:{{value.consultEmail}}</p>
					<p style="padding-left: 20px;">联系人姓名:{{value.consultName}}</p>
					<p style="padding-left: 20px;">咨询时间:{{value.consultTime}}</p>
					<p style="padding-left: 20px;">辩护律师:{{value.consultAttorney}}</p>
					<p style="text-align: right;">
						{{if value.consultState=="未完成"||value.consultState=="处理中"}} {{if value.consultAttorney=="无"}}
						<button class="btn btn-default" type="button" ide="{{value.id}}" onk="applyPlead" data-toggle="modal" data-target="#myModal4">申请辩护</button> {{/if}} {{if value.consultAttorney!="无"}}
						<a class="btn" ide="{{value.id}}" lock="download.action?filePath={{value.storageFileName}}" onk="down" idk="{{value.consultAttorneyId}}" data-toggle="modal" data-target="#myModal8"}>下载辩护文件</a>
						<button class="btn btn-default" type="button" ide="{{value.id}}" idk="{{value.consultAttorneyId}}" onk="finishPlead" data-toggle="modal" data-target="#myModal5">辩护完成</button> 
						<button class="btn btn-default" type="button" ide="{{value.id}}" idk="{{value.consultAttorneyId}}" onk="deleteLawyer" data-toggle="modal" data-target="#myModal7">取消辩护</button>
						{{/if}} 
						{{/if}}
						<button class="btn btn-default" type="button" style="margin-right: 20px;" ide="{{value.id}}" onk="deletePlead" data-toggle="modal" data-target="#myModal6">删除信息</button>
					</p>
				</div>
			</div>
			{{/if}} {{/each}}
		</script>

	<script id="ShowAllTypeConsult" type="text/html">
			{{each list2 as value i}}
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-762487" href="#panel-element-44961{{i}}">【{{value.consultState}}】{{value.consultType}}:{{value.consultTitle}}</a>
				</div>
				<div id="panel-element-44961{{i}}" class="panel-collapse collapse">
					<div class="panel-body"></div>
					<p style="padding-left: 20px;">辩护内容:{{value.consultText}}</p>
					<p style="padding-left: 20px;">联系人邮箱:{{value.consultEmail}}</p>
					<p style="padding-left: 20px;">联系人姓名:{{value.consultName}}</p>
					<p style="padding-left: 20px;">咨询时间:{{value.consultTime}}</p>
					<p style="padding-left: 20px;">辩护律师:{{value.consultAttorney}}</p>
					<p style="text-align: right;">
						{{if value.consultState=="未完成"||value.consultState=="处理中"}} {{if value.consultAttorney=="无"}}
						<button class="btn btn-default" type="button" ide="{{value.id}}" onk="applyPlead" data-toggle="modal" data-target="#myModal4">申请辩护</button> {{/if}} {{if value.consultAttorney!="无"}}
						<a class="btn" ide="{{value.id}}" lock="download.action?filePath={{value.storageFileName}}" onk="down" idk="{{value.consultAttorneyId}}" data-toggle="modal" data-target="#myModal8"}>下载辩护文件</a>
						<button class="btn btn-default" type="button" ide="{{value.id}}" idk="{{value.consultAttorneyId}}" onk="finishPlead" data-toggle="modal" data-target="#myModal5">辩护完成</button> 
						<button class="btn btn-default" type="button" ide="{{value.id}}" idk="{{value.consultAttorneyId}}" onk="deleteLawyer" data-toggle="modal" data-target="#myModal7">取消辩护</button>
						{{/if}} {{/if}}
						<button class="btn btn-default" type="button" style="margin-right: 20px;" ide="{{value.id}}" onk="deletePlead" data-toggle="modal" data-target="#myModal6">删除信息</button>
					</p>
				</div>
			</div>
			{{/each}}
		</script>

	<script id="ShowLawyer" type="text/html">
			{{each list2 as value i}}
			<div class="col-xs-3">
				<div class="thumbnail">
					<img src="{{value.lawyerImgName}}" />
					<div class="caption">
						<h3>姓名：{{value.lawyerName}}</h3>
						<p>
							处理案件数：{{value.consultSize}}
						</p>
						<p>
							处理积分：{{value.score}}
						</p>
						<p>
							擅长类型：{{value.lawyerType}}
						</p>
						<p ide="ShowLawyerText" style="overflow: hidden;">
							个人宣言：{{value.lawyerManifesto}}
						</p>
						
						<p>
							<a class="btn btn-primary" data-toggle="modal" data-target="#myModal" ide="{{value.lawyerEmail}}" onk="ConsultPeople">咨询</a>
							<a class="btn" data-toggle="modal" data-target="#myModal2" ide="{{value.id}}" onk="People">个人简介</a>
						</p>
					</div>
				</div>
			</div>
			{{/each}}
		</script>

	<script id="goldLawyer" type="text/html">
			{{each list2 as value i}}
			<div class="col-xs-4">
				<div class="rank" style="margin-bottom: 50px">
					<img src="img/ranking_no{{i+1}}.gif" style="position: relative; left: 40%" />
				</div>
				<span class="rank_img col-xs-6" ide="goldLawyerPhone">
					<img src="{{value.lawyerImgName}}" style="border-radius: 2.5%" />
				</span>
				<span class="thumbnail col-xs-6" ide="goldLawyerText">
					<h4> 姓名：{{value.lawyerName}} </h4>
					<p>
							处理案件数：{{value.consultSize}}
						</p>
						<p>
							处理积分：{{value.score}}
						</p>
						<p>
							擅长类型：{{value.lawyerType}}
						</p>
					<p ide="goldLawyerText2" style="overflow: hidden;">
						个人宣言：{{value.lawyerManifesto}}
					</p>
					<p>
						<a class="btn btn-primary" data-toggle="modal" data-target="#myModal" ide="{{value.lawyerEmail}}" onk="ConsultPeople">咨询</a>
						<a class="btn" data-toggle="modal" data-target="#myModal2" ide="{{value.id}}" onk="People">个人简介</a>
					</p>
				</span>
			</div>
			{{/each}}
		</script>

</body>

</html>