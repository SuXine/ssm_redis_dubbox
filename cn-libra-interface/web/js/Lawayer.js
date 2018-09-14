var LawyerName;
var LawyerPhone;
var LawyerEmail;
var LawyerManifesto;
var LawyerNumber;
var LawyerExperience;
var LawyerId;
var StorageFileName;
var EmailCode;
var ConsultType;
var classifypagina;
var ConsultSize;
var Pagination;
var PeopleEamil;
var PeopleCode;
var LawyerType;
// 计时器
function myClose4() {
	var n = parseInt(Peopletext.innerHTML);
	n--;
	if (n > 0) {
		Peopletext.innerHTML = n + "秒后可从新发送验证码";
		timer = setTimeout(myClose4, 1000);
		$("#UPPeopleEmali").attr("disabled", true);
	} else {
		$("#UPPeopleEmali").removeAttr("disabled");
		$("#Peopletext").css("display", "none");
		$("#Peopletext2").css("display", "none");
	}
}
function myClose8() {
	var n = parseInt(register2text.innerHTML);
	n--;
	if (n > 0) {
		register2text.innerHTML = n + "秒后可从新发送验证码";
		timer = setTimeout(myClose8, 1000);
		$("#VerificationLawyerEmail").attr("disabled", true);
	} else {
		$("#VerificationLawyerEmail").removeAttr("disabled");
		$("#register2text").css("display", "none");
		$("#register2text2").css("display", "none");
	}
}
function goldLawyer() {
	$.ajax({
		async : false,
		url : "goldLawyer.action",
		success : function(result) {
			var html = template('goldLawyer', result);
			ClassifyConsultSize = result.consultSize;
			$('[ide = goldLawyer]').html(html);
			$('[ide=goldLawyerPhone] img').width(
					$('[ide=goldLawyerPhone]').width());
			$('[ide=goldLawyerPhone] img').height(
					$('[ide=goldLawyerPhone] img').width() / 0.7);
			$('[ide = goldLawyerText2]').height(
					$('[ide=goldLawyerPhone] img').height() * 0.5);

		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});
}
function ShowLawyer() {
	$.ajax({
		async : false,
		url : "ShowLawyer.action",
		data : {
			'classifypagina' : classifypagina,
		},
		success : function(result) {
			var html = template('ShowLawyer', result);
			ClassifyConsultSize = result.consultSize;
			$('[ide = body]').html(html);
			$(".thumbnail img").width($(".thumbnail").width() * 0.7);
			$(".thumbnail img").height($(".thumbnail img").width() / 0.7);
			$("[ide=ShowLawyerText]").height($(".thumbnail").height() * 0.2);
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});
}

function AddLawyer() {
	$("#register").on("click", function() {
		$.ajax({
			async : false,
			url : "VerificationLayerEmailStatus.action",
			data : {
				'EmailCode' : EmailCode,
			},
			success : function(result) {
				$("#VerificationLawyerEmailInput").html(result.status);
				if ($("#VerificationLawyerEmailInput").html() == "注册成功") {
					$.ajax({
						async : false,
						url : "Lawyer.action",
						data : {
							'EmailCode' : EmailCode,
						},
						success : function(result) {
							alert(result.status);
							$("#register").attr("data-dismiss", 'modal');
							window.location.replace("index.jsp");
						},
						error : function(xhr, status, error) {
							alert(xhr.responseText);
						}
					});

				} else
					alert("请先验证邮箱");
			},
			error : function(xhr, status, error) {
				alert(xhr.responseText);
			}
		});
	});
	$("#VerificationLawyerEmail").on("click",function() {
						if ($('#agreement2').prop('checked') == true) {
							if ($("#lawyerImg").val() != "") {
									LawyerName = $("#LawyerName").val();
									LawyerPhone = $("#LawyerPhone").val();
									LawyerEmail = $("#LawyerEmail").val();
									LawyerManifesto = $("#LawyerManifesto")
											.val();
									LawyerNumber = $("#LawyerNumber").val();
									LawyerExperience = $("#LawyerExperience")
											.val();
									LawyerType = $("#LawyerType").val();
									$
											.ajaxFileUpload({
												url : 'uploadLawyerImg.action',// 用于文件上传的服务器端请求地址
												type : "post",
												dataType : "json",
												data : {
													'LawyerEmail' : LawyerEmail,
													'LawyerName' : LawyerName,
													'LawyerNumber' : LawyerNumber,
												},
												timeout : 1000,
												secureuri : false,// 一般设置为false
												fileElementId : 'lawyerImg',// 文件上传空间的id属性
																			// <input
												// type="file" id="uploadId" />
												error : function(
														XMLHttpRequest,
														textStatus, errorThrown) {
												},
												success : function(data) {
													StorageFileName = data.storageFileName;
													if (data.sts == "OK") {
														$.ajax({async : false,
																	url : "AddLawyer.action",
																	data : {
																		'LawyerName' : LawyerName,
																		'LawyerPhone' : LawyerPhone,
																		'LawyerEmail' : LawyerEmail,
																		'LawyerManifesto' : LawyerManifesto,
																		'LawyerNumber' : LawyerNumber,
																		'LawyerExperience' : LawyerExperience,
																		'StorageFileName' : StorageFileName,
																		'LawyerType' : LawyerType
																	},
																	success : function(result) {
																		EmailCode = result.code
																		if(result.status=="OK"){
																			alert("邮件已发送请登录邮箱验证");
																			$("#register2text").html("60秒后可重新发送验证码");
																			$("#register2text").css("display", "block");
																			$("#register2text2").css("display", "block");
																			var timer = null;
																			timer = setTimeout(myClose8, 1000);
																			$("#VerificationLawyerEmailInput").html("验证完成请点击提交按钮");
																		}else{
																			alert(result.status);
																			$("#VerificationLawyerEmailInput").html(result.status);
																		}
																	},
																	error : function(
																			xhr,
																			status,
																			error) {
																		alert(xhr.responseText);
																	}
																});

													} else
														alert("文件上传失败,请更换浏览器操作或者检查文件大小");
												}
											});
							} else
								alert("上传文件不能为空");
						} else
							alert("请阅读用户协议");
					});
}

$(document).ready(function() {
	AddLawyer();

	$("[ide = ShowLawyer] a").on("click", function() {
		$("#txt").css("display", "inline-block");
		$("#index").css("display", "none");
		$("#txt_header").html($(this).html());
		classifypagina = "1";
		ConsultType = $(this).html();
		ShowLawyer();
		$(".pagination").css("display", "inline-block");
		classifypag();
	})
	goldLawyer();

	$("[ide = body]").on("click", "[onk=People]", function() {
		LawyerId = $(this).attr("ide");
		$.ajax({
			async : false,
			url : "People.action",
			data : {
				'LawyerId' : LawyerId,
			},
			success : function(result) {
				$("#PeopleTitle").html(result.law.lawyerName + "的信息如下");
				$("#PeopleName").val(result.law.lawyerName);
				$("#PeopleManifesto").val(result.law.lawyerManifesto);
				$("#PeopleEamil").html(result.law.lawyerEmail);
				$("#PeopleText").val(result.law.lawyerExperience);
				$("#PeopleType").val(result.law.lawyerType);
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});
	})

	$("[ide = goldLawyer]").on("click", "[onk=People]", function() {
		LawyerId = $(this).attr("ide");
		$.ajax({
			async : false,
			url : "People.action",
			data : {
				'LawyerId' : LawyerId,
			},
			success : function(result) {
				$("#PeopleTitle").html(result.law.lawyerName + "的信息如下");
				$("#PeopleName").val(result.law.lawyerName);
				$("#PeopleManifesto").val(result.law.lawyerManifesto);
				$("#PeopleEamil").html(result.law.lawyerEmail);
				$("#PeopleText").val(result.law.lawyerExperience);
				$("#PeopleType").val(result.law.lawyerType);
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});
	})

	$("#UPPeopleEmali").on("click", function() {
		PeopleEamil = $("#PeopleEamil").html();
		$.ajax({
			async : false,
			url : "UPPeopleEmali.action",
			data : {
				'PeopleEamil' : PeopleEamil,
				'LawyerId' : LawyerId,
			},
			success : function(result) {
				if (result.status != "OK") {
					alert(result.status)
				} else {
					PeopleCode = result.code;
					$("#UPPeopleEmali").attr("disabled", true);
					$("#Peopletext").html("60秒后可从新发送验证码");
					$("#Peopletext").css("display", "block");
					$("#Peopletext2").css("display", "block");
					var timer = null;
					timer = setTimeout(myClose4, 1000);
				}
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});
	})

	$("#PeopleDelete").on("click", function() {
		if (PeopleCode == $("#PeopleCodeInput").val()) {
			$.ajax({
				async : false,
				url : "PeopleDelete.action",
				data : {
					'LawyerId' : LawyerId,
				},
				success : function(result) {
					alert("删除成功");
					window.location.replace("index.jsp");
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
			$("#consult").attr("data-dismiss", 'modal');
		} else
			alert("验证码错误");
	})

	$("#PeopleUpdate").on("click", function() {
		if (PeopleCode == $("#PeopleCodeInput").val()) {
			LawyerName = $("#PeopleName").val();
			LawyerManifesto = $("#PeopleManifesto").val();
			LawyerExperience = $("#PeopleText").val();
			LawyerType = $("#PeopleType").val();
			$.ajax({
				async : false,
				url : "PeopleUpdate.action",
				data : {
					'LawyerId' : LawyerId,
					'LawyerName' : LawyerName,
					'LawyerManifesto' : LawyerManifesto,
					'LawyerExperience' : LawyerExperience,
					'LawyerType':LawyerType
				},
				success : function(result) {
					alert("修改成功");
					window.location.replace("index.jsp");
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
			$("#consult").attr("data-dismiss", 'modal');
		} else
			alert("验证码错误");
	})

});