var ConsultType;
var ConsultTitle;
var ConsultText;
var ConsultEmail;
var ConsultName;
var StorageFileName;
var EmailCode;
var myDate = new Date();
var Pagination;
var ConsultTime;
var ConsultSize;
var classifypagina;
var ClassifyConsultSize;
var ConsultId;
var ApplyPleadEmali;
var ApplyPleadCode;
var FinishPleadEmali;
var FinishPleadCode;
var FinishPleadScoreInput;
var LawyerId;
var DeletePleadEmali;
var DeletePleadCode;
var sca;
var Keyword;
var kkkk;
var PhoneEmail;
var deleteLawyerEmali;
var deleteLawyerCode;
var downEmali;
var downCode;
var herf;

// 计时器
function myClose() {
	var n = parseInt(applyPleadtext.innerHTML);
	n--;
	if (n > 0) {
		applyPleadtext.innerHTML = n + "秒后可从新发送验证码";
		timer = setTimeout(myClose, 1000);
		$("#UPapplyPleadEmali").attr("disabled", true);
	} else {
		$("#UPapplyPleadEmali").removeAttr("disabled");
		$("#applyPleadtext").css("display", "none");
		$("#applyPleadtext2").css("display", "none");
	}
}
function myClose2() {
	var n = parseInt(finishPleadtext.innerHTML);
	n--;
	if (n > 0) {
		finishPleadtext.innerHTML = n + "秒后可从新发送验证码";
		timer = setTimeout(myClose2, 1000);

		$("#UPfinishPleadEmali").attr("disabled", true);
	} else {
		$("#UPfinishPleadEmali").removeAttr("disabled");
		$("#finishPleadtext").css("display", "none");
		$("#finishPleadtext2").css("display", "none");
	}
}
function myClose3() {
	var n = parseInt(deletePleadtext.innerHTML);
	n--;
	if (n > 0) {
		deletePleadtext.innerHTML = n + "秒后可从新发送验证码";
		timer = setTimeout(myClose3, 1000);
		$("#UPdeletePleadEmali").attr("disabled", true);
	} else {
		$("#UPdeletePleadEmali").removeAttr("disabled");
		$("#deletePleadtext").css("display", "none");
		$("#deletePleadtext2").css("display", "none");
	}
}
function myClose5() {
	var n = parseInt(deleteLawyertext.innerHTML);
	n--;
	if (n > 0) {
		deleteLawyertext.innerHTML = n + "秒后可从新发送验证码";
		timer = setTimeout(myClose5, 1000);
		$("#UPdeleteLawyerEmali").attr("disabled", true);
	} else {
		$("#UPdeleteLawyerEmali").removeAttr("disabled");
		$("#deleteLawyertext").css("display", "none");
		$("#deleteLawyertext2").css("display", "none");
	}
}
function myClose6() {
	var n = parseInt(downtext.innerHTML);
	n--;
	if (n > 0) {
		downtext.innerHTML = n + "秒后可从新发送验证码";
		timer = setTimeout(myClose6, 1000);
		$("#UPdownEmali").attr("disabled", true);
	} else {
		$("#UPdownEmali").removeAttr("disabled");
		$("#downtext").css("display", "none");
		$("#downtext2").css("display", "none");
	}
}
function myClose7() {
	var n = parseInt(registertext.innerHTML);
	n--;
	if (n > 0) {
		registertext.innerHTML = n + "秒后可从新发送验证码";
		timer = setTimeout(myClose7, 1000);
		$("#VerificationEmail").attr("disabled", true);
	} else {
		$("#VerificationEmail").removeAttr("disabled");
		$("#registertext").css("display", "none");
		$("#registertext2").css("display", "none");
	}
}

// 申请辩护
function ApplyPlead() {
	$("[ide = body]").on("click", "[onk='applyPlead']", function() {
		ConsultId = $(this).attr("ide");
	})
	$("[ide = ShowAllConsult]").on("click", "[onk='applyPlead']", function() {
		ConsultId = $(this).attr("ide");
	})
	$("#UPapplyPleadEmali").on("click", function() {
		ApplyPleadEmali = $("#applyPleadEmaliInput").val();
		$.ajax({
			async : false,
			url : "UPapplyPleadEmali.action",
			data : {
				'ApplyPleadEmali' : ApplyPleadEmali,
			},
			success : function(result) {
				if (result.status != "OK") {
					alert(result.status)
				} else {
					ApplyPleadCode = result.code;
					$("#UPapplyPleadEmali").attr("disabled", true);
					$("#applyPleadtext").html("60秒后可重新发送验证码");
					$("#applyPleadtext").css("display", "block");
					$("#applyPleadtext2").css("display", "block");
					var timer = null;
					timer = setTimeout(myClose, 1000);
				}
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});
	})

	$("#applyPlead").on("click", function() {
		if (ApplyPleadCode == $("#applyPleadCodeInput").val()) {
			$.ajax({
				async : false,
				url : "GoToEamil.action",
				data : {
					'ConsultId' : ConsultId,
					'ApplyPleadEmali' : ApplyPleadEmali,
				},
				success : function(result) {
					alert("申请成功，已将信息发送给对方");
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
}
// 提交完成
function FinishPlead() {
	$("[ide = body]").on("click", "[onk='finishPlead']", function() {
		ConsultId = $(this).attr("ide");
		LawyerId = $(this).attr("idk");
	})
	$("[ide = ShowAllConsult]").on("click", "[onk='finishPlead']", function() {
		ConsultId = $(this).attr("ide");
		LawyerId = $(this).attr("idk");
	})
	$("#UPfinishPleadEmali").on("click", function() {
		FinishPleadEmali = $("#finishPleadEmaliInput").val();
		$.ajax({
			async : false,
			url : "UPfinishPleadEmali.action",
			data : {
				'FinishPleadEmali' : FinishPleadEmali,
				'ConsultId' : ConsultId,
			},
			success : function(result) {
				if (result.status != "OK") {
					alert(result.status)
				} else {
					FinishPleadCode = result.code;
					$("#UPfinishPleadEmali").attr("disabled", true);
					$("#finishPleadtext").html("60秒后可重新发送验证码");
					$("#finishPleadtext").css("display", "block");
					$("#finishPleadtext2").css("display", "block");
					var timer = null;
					timer = setTimeout(myClose2, 1000);
				}
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});
	})
	$("#finishPlead").on("click", function() {
		if (FinishPleadCode == $("#finishPleadCodeInput").val()) {
			FinishPleadScoreInput = $("#finishPleadScoreInput").val();
			$.ajax({
				async : false,
				url : "UpadteConsultState.action",
				data : {
					'ConsultId' : ConsultId,
					'FinishPleadScoreInput' : FinishPleadScoreInput,
					'LawyerId' : LawyerId,
				},
				success : function(result) {
					alert("提交完成");
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
}
// 删除辩护
function DeletePlead() {
	$("[ide='body']").on("click", "[onk='deletePlead']", function() {
		ConsultId = $(this).attr("ide");
	})
	$("[ide='ShowAllConsult']").on("click", "[onk='deletePlead']", function() {
		ConsultId = $(this).attr("ide");
	})
	$("#UPdeletePleadEmali").on("click", function() {

		DeletePleadEmali = $("#deletePleadEmaliInput").val();
		$.ajax({
			async : false,
			url : "UPdeletePleadEmali.action",
			data : {
				'DeletePleadEmali' : DeletePleadEmali,
				'ConsultId' : ConsultId,
			},
			success : function(result) {
				if (result.status != "OK") {
					alert(result.status)
				} else {
					DeletePleadCode = result.code;
					$("#UPdeletePleadEmali").attr("disabled", true);
					$("#deletePleadtext").html("60秒后可重新发送验证码");
					$("#deletePleadtext").css("display", "block");
					$("#deletePleadtext2").css("display", "block");
					var timer = null;
					timer = setTimeout(myClose3, 1000);
				}
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});

	})
	$("#deletePlead").on("click", function() {
		if (DeletePleadCode == $("#deletePleadCodeInput").val()) {
			$.ajax({
				async : false,
				url : "DeleteConsult.action",
				data : {
					'ConsultId' : ConsultId,
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
}
// 取消辩护
function deleteLawyer() {
	$("[ide='body']").on("click", "[onk='deleteLawyer']", function() {
		ConsultId = $(this).attr("ide");
		LawyerId = $(this).attr("idk");
	})
	$("[ide='ShowAllConsult']").on("click", "[onk='deleteLawyer']", function() {
		ConsultId = $(this).attr("ide");
		LawyerId = $(this).attr("idk");
	})
	$("#UPdeleteLawyerEmali").on("click", function() {

		deleteLawyerEmali = $("#deleteLawyerEmaliInput").val();
		$.ajax({
			async : false,
			url : "UPdeleteLawyerEmali.action",
			data : {
				'deleteLawyerEmali' : deleteLawyerEmali,
				'LawyerId' : LawyerId,
			},
			success : function(result) {
				if (result.status != "OK") {
					alert(result.status)
				} else {
					deleteLawyerCode = result.code;
					$("#UPdeleteLawyerEmali").attr("disabled", true);
					$("#deleteLawyertext").html("60秒后可重新发送验证码");
					$("#deleteLawyertext").css("display", "block");
					$("#deleteLawyertext2").css("display", "block");
					var timer = null;
					timer = setTimeout(myClose5, 1000);
				}
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});

	})
	$("#deleteLawyer").on("click", function() {
		if (deleteLawyerCode == $("#deleteLawyerCodeInput").val()) {
			$.ajax({
				async : false,
				url : "deleteLawyer.action",
				data : {
					'ConsultId' : ConsultId,
					'LawyerId' : LawyerId
				},
				success : function(result) {
					alert("取消成功");
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
}
// 下载文件
function downLawyer() {
	$("[ide='body']").on("click", "[onk='down']", function() {
		LawyerId = $(this).attr("idk");
		ConsultId = $(this).attr("ide");
		herf = $(this).attr("lock");
	})
	$("[ide='ShowAllConsult']").on("click", "[onk='down']", function() {
		LawyerId = $(this).attr("idk");
		ConsultId = $(this).attr("ide");
		herf = $(this).attr("lock");
	})
	$("#UPdownEmali").on("click", function() {

		downEmali = $("#downEmaliInput").val();
		$.ajax({
			async : false,
			url : "UPdownEmali.action",
			data : {
				'downEmali' : downEmali,
				'ConsultId' : ConsultId,
			},
			success : function(result) {
				if (result.status != "OK") {
					alert(result.status)
				} else {
					downCode = result.code;
					$("#UPdownEmali").attr("disabled", true);
					$("#downtext").html("60秒后可重新发送验证码");
					$("#downtext").css("display", "block");
					$("#downtext2").css("display", "block");
					var timer = null;
					timer = setTimeout(myClose6, 1000);
				}
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});

	})
	$("#down").on("click", function() {
		if (downCode == $("#downCodeInput").val()) {
			window.location.replace(herf);
		} else
			alert("验证码错误");
	})
}
function ShowAllConsult() {
	$.ajax({
		async : false,
		url : "ShowAllConsult.action",
		data : {
			'Pagination' : Pagination,
		},
		success : function(result) {
			var html = template('ShowConsult', result);
			ConsultSize = result.consultSize;
			$('[ide = ShowAllConsult]').html(html);
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});
}



function ShowAllTypeConsult() {
	$.ajax({
		async : false,
		url : "ShowAllTypeConsult.action",
		data : {
			'classifypagina' : classifypagina,
		},
		success : function(result) {
			var html = template('ShowAllTypeConsult', result)
			ClassifyConsultSize = result.consultSize;
			$("[ide = body]").html(html);
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});
}
function LookUpConsult() {
	$.ajax({
		async : false,
		url : "LookUpConsult.action",
		data : {
			'classifypagina' : classifypagina,
			'Keyword' : Keyword,
		},
		success : function(result) {
			var html = template('LookUpConsult', result)
			ClassifyConsultSize = result.consultSize;
			$("[ide = body]").html(html);
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});
}
function ShowOneTypeConsult() {
	$.ajax({
		async : false,
		url : "ShowOneTypeConsult.action",
		data : {
			'classifypagina' : classifypagina,
			'ConsultType' : ConsultType,
		},
		success : function(result) {
			var html = template('ShowOneTypeConsult', result)
			ClassifyConsultSize = result.consultSize;
			$("[ide = body]").html(html);
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});
}
function ShowOneTypeCase() {
	$.ajax({
		async : false,
		url : "ShowOneTypeCase.action",
		data : {
			'classifypagina' : classifypagina,
			'ConsultType' : ConsultType,
		},
		success : function(result) {
			var html = template('ShowOneTypeConsult', result)
			ClassifyConsultSize = result.consultSize;
			$("[ide = body]").html(html);
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});
}
// 分页页码格式
function ClassifypagNL() {
	$("#classifylast")
			.on(
					"click",
					function() {
						if (classifypagina != "1") {
							classifypagina = Number(classifypagina) - 1;
						}
						if (Number(ClassifyConsultSize) > 5) {
							var data = classifypagina
							if (Number(data) > 1) {
								var verdict = Number($(".classifypagina").length - 2)
										+ Number(data)
								if (Number(verdict) < Number($(
										".classifypagina:eq(4)").html())) {
									for (var i = 0; i < $(".classifypagina").length - 2; i++) {
										$(".classifypagina:eq(" + i + ")")
												.html(Number(data) - 1);
										data++
									}
									$(".classifypagina:eq(3)").html("……");
								}
								if (Number(verdict) == Number($(
										".classifypagina:eq(4)").html())) {
									for (var i = 0; i < $(".classifypagina").length - 1; i++) {
										$(".classifypagina:eq(" + i + ")")
												.html(Number(data) - 1);
										data++
									}
								}
								if (Number(verdict) > Number($(
										".classifypagina:eq(4)").html())) {
									for (var i = 0; i < $(".classifypagina").length - 1; i++) {
										$(".classifypagina:eq(" + i + ")")
												.html(
														Number(ClassifyConsultSize)
																- $(".classifypagina").length
																+ 1 + i);
									}
								}
							}
						}
						for (var i = 0; i < $(".classifypagina").length - 1; i++) {
							if ($(".classifypagina:eq(" + i + ")").html() == classifypagina) {
								$(".classifypagina:eq(" + i + ")").css(
										"background-color", "#f5f5f5");
							} else {
								$(".classifypagina:eq(" + i + ")").css(
										"background-color", "#ffffff");
							}
						}

						if (ConsultType != "案件大全") {
							if (ConsultType != "搜索") {
								if (ConsultType != "律师展示") {
									if (sca != "1") {
										ShowOneTypeConsult();
									} else
										ShowOneTypeCase();
								} else
									ShowLawyer();
							} else
								LookUpConsult();
						} else
							ShowAllTypeConsult();
					})
	$("#classifynext")
			.on(
					"click",
					function() {
						if (classifypagina != ClassifyConsultSize) {
							classifypagina = Number(classifypagina) + 1;
						}
						if (Number(ClassifyConsultSize) > 5) {
							var data = classifypagina
							if (Number(data) > 1) {
								var verdict = Number($(".classifypagina").length - 2)
										+ Number(data)
								if (Number(verdict) < Number($(
										".classifypagina:eq(4)").html())) {
									for (var i = 0; i < $(".classifypagina").length - 2; i++) {
										$(".classifypagina:eq(" + i + ")")
												.html(Number(data) - 1);
										data++
									}
									$(".classifypagina:eq(3)").html("……");
								}
								if (Number(verdict) == Number($(
										".classifypagina:eq(4)").html())) {
									for (var i = 0; i < $(".classifypagina").length - 1; i++) {
										$(".classifypagina:eq(" + i + ")")
												.html(Number(data) - 1);
										data++
									}
								}
								if (Number(verdict) > Number($(
										".classifypagina:eq(4)").html())) {
									for (var i = 0; i < $(".classifypagina").length - 1; i++) {
										$(".classifypagina:eq(" + i + ")")
												.html(
														Number(ClassifyConsultSize)
																- $(".classifypagina").length
																+ 1 + i);
									}
								}
							}
						}
						for (var i = 0; i < $(".classifypagina").length - 1; i++) {
							if ($(".classifypagina:eq(" + i + ")").html() == classifypagina) {
								$(".classifypagina:eq(" + i + ")").css(
										"background-color", "#f5f5f5");
							} else {
								$(".classifypagina:eq(" + i + ")").css(
										"background-color", "#ffffff");
							}
						}
						if (ConsultType != "案件大全") {
							if (ConsultType != "搜索") {
								if (ConsultType != "律师展示") {
									if (sca != "1") {
										ShowOneTypeConsult();
									} else
										ShowOneTypeCase();
								} else
									ShowLawyer();
							} else
								LookUpConsult();
						} else
							ShowAllTypeConsult();
					})
}
function classifypag() {
	if (ClassifyConsultSize == "1") {
		$(".classifyclassifypagina:eq(0)").html(ClassifyConsultSize);
		$(".classifypagina:eq(1)").css("display", "none");
		$(".classifypagina:eq(2)").css("display", "none");
		$(".classifypagina:eq(3)").css("display", "none");
		$(".classifypagina:eq(4)").css("display", "none");
	}
	if (ClassifyConsultSize == "2") {
		$(".classifypagina:eq(0)").html("1");
		$(".classifypagina:eq(0)").css("display", "inline-block");
		$(".classifypagina:eq(1)").css("display", "inline-block");
		$(".classifypagina:eq(1)").html(ClassifyConsultSize);
		$(".classifypagina:eq(2)").css("display", "none");
		$(".classifypagina:eq(3)").css("display", "none");
		$(".classifypagina:eq(4)").css("display", "none");
	}
	if (ClassifyConsultSize == "3") {
		$(".classifypagina:eq(0)").html("1");
		$(".classifypagina:eq(0)").css("display", "inline-block");
		$(".classifypagina:eq(1)").html("2");
		$(".classifypagina:eq(1)").css("display", "inline-block");
		$(".classifypagina:eq(2)").css("display", "inline-block");
		$(".classifypagina:eq(2)").html(ClassifyConsultSize);
		$(".classifypagina:eq(3)").css("display", "none");
		$(".classifypagina:eq(4)").css("display", "none");
	}
	if (ClassifyConsultSize == "4") {
		$(".classifypagina:eq(0)").html("1");
		$(".classifypagina:eq(0)").css("display", "inline-block");
		$(".classifypagina:eq(1)").html("2");
		$(".classifypagina:eq(1)").css("display", "inline-block");
		$(".classifypagina:eq(2)").html("3");
		$(".classifypagina:eq(2)").css("display", "inline-block");
		$(".classifypagina:eq(3)").css("display", "inline-block");
		$(".classifypagina:eq(3)").html(ClassifyConsultSize);
		$(".classifypagina:eq(4)").css("display", "none");
	}
	if (ClassifyConsultSize == "5") {
		$(".classifypagina:eq(0)").html("1");
		$(".classifypagina:eq(0)").css("display", "inline-block");
		$(".classifypagina:eq(1)").html("2");
		$(".classifypagina:eq(1)").css("display", "inline-block");
		$(".classifypagina:eq(2)").html("3");
		$(".classifypagina:eq(2)").css("display", "inline-block");
		$(".classifypagina:eq(3)").css("display", "inline-block");
		$(".classifypagina:eq(3)").html(Number(ClassifyConsultSize) - 1);
		$(".classifypagina:eq(4)").css("display", "inline-block");
		$(".classifypagina:eq(4)").html(ClassifyConsultSize);
	}
	if (Number(ClassifyConsultSize) > 5) {
		$(".classifypagina:eq(0)").html("1");
		$(".classifypagina:eq(0)").css("display", "inline-block");
		$(".classifypagina:eq(1)").html("2");
		$(".classifypagina:eq(1)").css("display", "inline-block");
		$(".classifypagina:eq(2)").html("3");
		$(".classifypagina:eq(2)").css("display", "inline-block");
		$(".classifypagina:eq(3)").html("……");
		$(".classifypagina:eq(3)").css("display", "inline-block");
		$(".classifypagina:eq(4)").css("display", "inline-block");
		$(".classifypagina:eq(4)").html(ClassifyConsultSize);
	}
	for (var i = 0; i < $(".classifypagina").length - 1; i++) {
		if ($(".classifypagina:eq(" + i + ")").html() == classifypagina) {
			$(".classifypagina:eq(" + i + ")").css("background-color",
					"#f5f5f5");
		} else {
			$(".classifypagina:eq(" + i + ")").css("background-color",
					"#ffffff");
		}
	}
	$(".classifypagina")
			.on(
					"click",
					function() {
						classifypagina = $(this).html();
						if (ConsultType != "案件大全") {
							if (ConsultType != "搜索") {
								if (ConsultType != "律师展示") {
									if (sca != "1") {
										ShowOneTypeConsult();
									} else
										ShowOneTypeCase();
								} else
									ShowLawyer();
							} else
								LookUpConsult();
						} else
							ShowAllTypeConsult();
						if (Number(ClassifyConsultSize) > 5){
							var data = $(this).html();
							if (Number(data) > 1) {
								var verdict = Number($(".classifypagina").length - 2)
										+ Number(data)
								if (Number(verdict) < Number($(
										".classifypagina:eq(4)").html())) {
									for (var i = 0; i < $(".classifypagina").length - 2; i++) {
										$(".classifypagina:eq(" + i + ")")
												.html(Number(data) - 1);
										data++
									}
									$(".classifypagina:eq(3)").html("……");
								}
								if (Number(verdict) == Number($(
										".classifypagina:eq(4)").html())) {
									for (var i = 0; i < $(".classifypagina").length - 1; i++) {
										$(".classifypagina:eq(" + i + ")")
												.html(Number(data) - 1);
										data++
									}
								}
								if (Number(verdict) > Number($(
										".classifypagina:eq(4)").html())) {
									for (var i = 0; i < $(".classifypagina").length - 1; i++) {
										$(".classifypagina:eq(" + i + ")")
												.html(
														Number(ClassifyConsultSize)
																- $(".classifypagina").length
																+ 1 + i);
									}
								}
							}
							
							
						}
						for (var i = 0; i < $(".classifypagina").length - 1; i++) {
							if ($(".classifypagina:eq(" + i + ")").html() == classifypagina) {
								$(".classifypagina:eq(" + i + ")").css(
										"background-color", "#f5f5f5");
							} else {
								$(".classifypagina:eq(" + i + ")").css(
										"background-color", "#ffffff");
							}
						}
					})

}
// 页码模板
function paginaNL() {
	$("#last")
			.on(
					"click",
					function() {
						if (Pagination != "1") {
							Pagination = Number(Pagination) - 1;
						}
						if (Number(ConsultSize) > 5) {
							var data = Pagination
							if (Number(data) > 1) {
								var verdict = Number($(".pagina").length - 2)
										+ Number(data)
								if (Number(verdict) < Number($(".pagina:eq(4)")
										.html())) {
									for (var i = 0; i < $(".pagina").length - 2; i++) {
										$(".pagina:eq(" + i + ")").html(
												Number(data) - 1);
										data++
									}
									$(".pagina:eq(3)").html("……");
								}
								if (Number(verdict) == Number($(".pagina:eq(4)")
										.html())) {
									for (var i = 0; i < $(".pagina").length - 1; i++) {
										$(".pagina:eq(" + i + ")").html(
												Number(data) - 1);
										data++
									}
								}
								if (Number(verdict) > Number($(".pagina:eq(4)")
										.html())) {
									for (var i = 0; i < $(".pagina").length - 1; i++) {
										$(".pagina:eq(" + i + ")").html(
												Number(ConsultSize)
														- $(".pagina").length
														+ 1 + i);
									}
								}
							}
						}
						for (var i = 0; i < $(".pagina").length - 1; i++) {
							if ($(".pagina:eq(" + i + ")").html() == Pagination) {
								$(".pagina:eq(" + i + ")").css(
										"background-color", "#f5f5f5");
							} else {
								$(".pagina:eq(" + i + ")").css(
										"background-color", "#ffffff");
							}
						}
						ShowAllConsult();
					})
	$("#next")
			.on(
					"click",
					function() {
						if (Pagination != ConsultSize) {
							Pagination = Number(Pagination) + 1;
						}
						if (Number(ConsultSize) > 5) {
							var data = Pagination
							if (Number(data) > 1) {
								var verdict = Number($(".pagina").length - 2)
										+ Number(data)
								if (Number(verdict) < Number($(".pagina:eq(4)")
										.html())) {
									for (var i = 0; i < $(".pagina").length - 2; i++) {
										$(".pagina:eq(" + i + ")").html(
												Number(data) - 1);
										data++
									}
									$(".pagina:eq(3)").html("……");
								}
								if (Number(verdict) == Number($(".pagina:eq(4)")
										.html())) {
									for (var i = 0; i < $(".pagina").length - 1; i++) {
										$(".pagina:eq(" + i + ")").html(
												Number(data) - 1);
										data++
									}
								}
								if (Number(verdict) > Number($(".pagina:eq(4)")
										.html())) {
									for (var i = 0; i < $(".pagina").length - 1; i++) {
										$(".pagina:eq(" + i + ")").html(
												Number(ConsultSize)
														- $(".pagina").length
														+ 1 + i);
									}
								}
							}
						}
						for (var i = 0; i < $(".pagina").length - 1; i++) {
							if ($(".pagina:eq(" + i + ")").html() == Pagination) {
								$(".pagina:eq(" + i + ")").css(
										"background-color", "#f5f5f5");
							} else {
								$(".pagina:eq(" + i + ")").css(
										"background-color", "#ffffff");
							}
						}
						ShowAllConsult();
					})
}
function pagina() {
	if (ConsultSize == "1") {
		$(".pagina:eq(0)").html(ConsultSize);
		$(".pagina:eq(1)").css("display", "none");
		$(".pagina:eq(2)").css("display", "none");
		$(".pagina:eq(3)").css("display", "none");
		$(".pagina:eq(4)").css("display", "none");
	}
	if (ConsultSize == "2") {
		$(".pagina:eq(0)").html("1");
		$(".pagina:eq(0)").css("display", "inline-block");
		$(".pagina:eq(1)").css("display", "inline-block");
		$(".pagina:eq(1)").html(ConsultSize);
		$(".pagina:eq(2)").css("display", "none");
		$(".pagina:eq(3)").css("display", "none");
		$(".pagina:eq(4)").css("display", "none");
	}
	if (ConsultSize == "3") {
		$(".pagina:eq(0)").html("1");
		$(".pagina:eq(0)").css("display", "inline-block");
		$(".pagina:eq(1)").html("2");
		$(".pagina:eq(1)").css("display", "inline-block");
		$(".pagina:eq(2)").css("display", "inline-block");
		$(".pagina:eq(2)").html(ConsultSize);
		$(".pagina:eq(3)").css("display", "none");
		$(".pagina:eq(4)").css("display", "none");
	}
	if (ConsultSize == "4") {
		$(".pagina:eq(0)").html("1");
		$(".pagina:eq(0)").css("display", "inline-block");
		$(".pagina:eq(1)").html("2");
		$(".pagina:eq(1)").css("display", "inline-block");
		$(".pagina:eq(2)").html("3");
		$(".pagina:eq(2)").css("display", "inline-block");
		$(".pagina:eq(3)").css("display", "inline-block");
		$(".pagina:eq(3)").html(ConsultSize);
		$(".pagina:eq(4)").css("display", "none");
	}
	if (ConsultSize == "5") {
		$(".pagina:eq(0)").html("1");
		$(".pagina:eq(0)").css("display", "inline-block");
		$(".pagina:eq(1)").html("2");
		$(".pagina:eq(1)").css("display", "inline-block");
		$(".pagina:eq(2)").html("3");
		$(".pagina:eq(2)").css("display", "inline-block");
		$(".pagina:eq(3)").html(Number(ConsultSize) - 1);
		$(".pagina:eq(3)").css("display", "inline-block");
		$(".pagina:eq(4)").html(ConsultSize);
		$(".pagina:eq(4)").css("display", "inline-block");
	}
	if (Number(ConsultSize) > 5) {
		$(".pagina:eq(0)").html("1");
		$(".pagina:eq(0)").css("display", "inline-block");
		$(".pagina:eq(1)").html("2");
		$(".pagina:eq(1)").css("display", "inline-block");
		$(".pagina:eq(2)").html("3");
		$(".pagina:eq(2)").css("display", "inline-block");
		$(".pagina:eq(3)").html("……");
		$(".pagina:eq(3)").css("display", "inline-block");
		$(".pagina:eq(4)").html(ConsultSize);
		$(".pagina:eq(4)").css("display", "inline-block");
	}
	for (var i = 0; i < $(".pagina").length - 1; i++) {
		if ($(".pagina:eq(" + i + ")").html() == Pagination) {
			$(".pagina:eq(" + i + ")").css("background-color", "#f5f5f5");
		} else {
			$(".pagina:eq(" + i + ")").css("background-color", "#ffffff");
		}
	}
	$(".pagina").on("click", function() {
		Pagination = $(this).html();
		ShowAllConsult();
		if (Number(ConsultSize) > 5){
			var data = $(this).html();
			if (Number(data) > 1) {
				var verdict = Number($(".pagina").length - 2)
						+ Number(data)
				if (Number(verdict) < Number($(".pagina:eq(4)")
						.html())) {
					for (var i = 0; i < $(".pagina").length - 2; i++) {
						$(".pagina:eq(" + i + ")").html(
								Number(data) - 1);
						data++
					}
					$(".pagina:eq(3)").html("……");
				}
				if (Number(verdict) == Number($(".pagina:eq(4)")
						.html())) {
					for (var i = 0; i < $(".pagina").length - 1; i++) {
						$(".pagina:eq(" + i + ")").html(
								Number(data) - 1);
						data++
					}
				}
				if (Number(verdict) > Number($(".pagina:eq(4)")
						.html())) {
					for (var i = 0; i < $(".pagina").length - 1; i++) {
						$(".pagina:eq(" + i + ")").html(
								Number(ConsultSize)
										- $(".pagina").length
										+ 1 + i);
					}
				}
			}
			
		}
		for (var i = 0; i < $(".pagina").length - 1; i++) {
			if ($(".pagina:eq(" + i + ")").html() == Pagination) {
				$(".pagina:eq(" + i + ")").css("background-color", "#f5f5f5");
			} else {
				$(".pagina:eq(" + i + ")").css("background-color", "#ffffff");
			}
		}
	})

}

function AddConsultAll() {
	$("#consult").on("click", function() {
		$.ajax({
			async : false,
			url : "VerificationEmailStatus.action",
			data : {
				'EmailCode' : EmailCode,
			},
			success : function(result) {
				$("#VerificationEmailInput").html(result.status);
				if ($("#VerificationEmailInput").html() == "验证成功") {
					if (kkkk != "1") {
						$.ajax({
							async : false,
							url : "Consult.action",
							data : {
								'EmailCode' : EmailCode,
							},
							success : function(result) {
								alert(result.status);
								$("#consult").attr("data-dismiss", 'modal');
								window.location.replace("index.jsp");
							},
							error : function(xhr, status, error) {
								alert(xhr.responseText);
							}
						});
					} else {
						$.ajax({
							async : false,
							url : "Consult.action",
							data : {
								'EmailCode' : EmailCode,
							},
							success : function(result) {
							},
							error : function(xhr, status, error) {
								alert(xhr.responseText);
							}
						});
						$.ajax({
							async : false,
							url : "GoToEamil.action",
							data : {
								'ApplyPleadEmali' : PhoneEmail,
								'ConsultId' : ConsultId,
							},
							success : function(result) {
								alert("邮件已发送到双方邮箱，注意查收");
								$("#consult").attr("data-dismiss", 'modal');
								window.location.replace("index.jsp");
							},
							error : function(xhr, status, error) {
								alert(xhr.responseText);
							}
						});
						kkkk = 0;
					}
				} else
					alert("请先验证邮箱");
			},
			error : function(xhr, status, error) {
				alert(xhr.responseText);
			}
		});

	});
	$("#VerificationEmail")
			.on(

					"click",
					function() {
						if ($('#agreement1').prop('checked') == true) {
							if ($("#upload").val() != "") {
								ConsultType = $(".filter-option").html();
								ConsultTitle = $("#ConsultTitle").val();
								ConsultText = $("#ConsultText").val();
								ConsultEmail = $("#ConsultEmail").val();
								ConsultName = $("#ConsultName").val();
								$
										.ajaxFileUpload({
											url : 'upload.action',// 用于文件上传的服务器端请求地址
											type : "post",
											dataType : "json",
											data : {
												'ConsultEmail' : ConsultEmail,
												'ConsultName' : ConsultName,
												'ConsultTitle' : ConsultTitle,
											},
											timeout : 10000,
											secureuri : false,// 一般设置为false
											fileElementId : 'upload',
											error : function(XMLHttpRequest,
													textStatus, errorThrown) {
											},
											success : function(data) {
												StorageFileName = data.storageFileName;
												if (data.sts == "OK") {
													ConsultTime = myDate
															.getFullYear()
															+ "年";
													ConsultTime += (myDate
															.getMonth() + 1)
															+ "月";
													ConsultTime += myDate
															.getDate()
															+ "日";
													ConsultTime += myDate
															.getHours()
															+ ":";
													ConsultTime += myDate
															.getMinutes();
													$
															.ajax({
																async : false,
																url : "AddConsultAll.action",
																data : {
																	'ConsultType' : ConsultType,
																	'ConsultTitle' : ConsultTitle,
																	'ConsultText' : ConsultText,
																	'ConsultEmail' : ConsultEmail,
																	'ConsultName' : ConsultName,
																	'StorageFileName' : StorageFileName,
																	'ConsultTime' : ConsultTime,
																},
																success : function(
																		result) {
																	EmailCode = result.code;
																	ConsultId = result.consultId;
																	if (result.status == "OK") {
																		alert("邮件已发送请登录邮箱验证");
																		$(
																				"#registertext")
																				.html(
																						"60秒后可重新发送验证码");
																		$(
																				"#registertext")
																				.css(
																						"display",
																						"block");
																		$(
																				"#registertext2")
																				.css(
																						"display",
																						"block");
																		$(
																				"#VerificationEmailInput")
																				.html(
																						"验证完成请点击提交按钮");
																		var timer = null;
																		timer = setTimeout(
																				myClose7,
																				1000);
																	} else {
																		alert(result.status);
																		$(
																				"#VerificationEmailInput")
																				.html(
																						result.status);
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

	$(".foot-middle-img img").height($(".foot-middle-img").height() * 0.8);
	$(".foot-tel img").height($(".foot-tel").height() * 0.6);
	$("[ide=text]").height($(window).height() * 0.15);
	// 轮播.JS
	$(document).ready(function() {
		$('#circleContent').carousel({
			interval : 5000
		}); // 每隔5秒自动轮播
	});
	// 返回主页
	$("#gotoIndex").on("click", function() {
		window.location.replace("index.jsp");
	})
	Pagination = "1";
	ShowAllConsult();
	pagina();
	paginaNL();
	ApplyPlead();
	FinishPlead();
	DeletePlead();
	deleteLawyer();
	downLawyer();
	ClassifypagNL();
	// 咨询查询
	$("[ide = classify] li a").on("click", function() {
		$("#txt").css("display", "inline-block");
		$("#index").css("display", "none");
		$("#txt_header").html($(this).html());
		classifypagina = "1";
		sca = "0";
		ConsultType = $(this).html();
		ShowOneTypeConsult();
		classifypag();
		$(".pagination").css("display", "inline-block");

	})
	// 案例展示
	$("[ide = case] li a").on("click", function() {
		$("#txt").css("display", "inline-block");
		$("#index").css("display", "none");
		$("#txt_header").html($(this).html());
		classifypagina = "1";
		sca = "1";
		ConsultType = $(this).html();
		ShowOneTypeCase();
		classifypag();
		$(".pagination").css("display", "inline-block");
	})
	// 案件大全
	$("#law_case").on("click", function() {
		$("#txt").css("display", "inline-block");
		$("#index").css("display", "none");
		$("#txt_header").html($(this).html());
		classifypagina = "1";
		ConsultType = $(this).html();
		ShowAllTypeConsult();
		classifypag();
		$(".pagination").css("display", "inline-block");

	})
	$("#law_case2").on("click", function() {
		$("#txt").css("display", "inline-block");
		$("#index").css("display", "none");
		$("#txt_header").html($(this).html());
		classifypagina = "1";
		ConsultType = $(this).html();
		ShowAllTypeConsult();
		classifypag();
		$(".pagination").css("display", "inline-block");

	})
	// 关键字查询
	$("#LookUp").on("click", function() {
		$("#txt").css("display", "inline-block");
		$("#index").css("display", "none");
		$("#txt_header").html("查询结果");
		classifypagina = "1";
		ConsultType = "搜索";
		Keyword = $("#Keyword").val();
		LookUpConsult();
		classifypag();
		$(".pagination").css("display", "inline-block");
	})
	// 关于我们
	$("[ide = aboutUs]").on("click", function() {
		$("#txt").css("display", "inline-block");
		$("[ide = body]").html($("[ide=aboutUsTxt]").html());
		$("#index").css("display", "none");
		$(".pagination").css("display", "none");
		$("#txt_header").html($(this).html());

	})
	$("[ide = contactUs]").on("click", function() {
		$("#txt").css("display", "inline-block");
		$("[ide = body]").html($("[ide=contactUsTxt]").html());
		$("#index").css("display", "none");
		$(".pagination").css("display", "none");
		$("#txt_header").html($(this).html());
	})

	// 用户协议
	$("#read").on("click", function() {
		$('#agreement1').prop('checked', 'true');
		$("#VerificationEmail").removeAttr("disabled");
		$("#read").attr("data-dismiss", 'modal');
	})
	$("#read2").on("click", function() {
		$("#VerificationLawyerEmail").removeAttr("disabled");
		$('#agreement2').prop('checked', 'true');
		$("#read2").attr("data-dismiss", 'modal');
	})

	$("[ide = body]").on("click", "[onk=ConsultPeople]", function() {
		kkkk = "1";
		PhoneEmail = $(this).attr("ide");
	});
	$("[ide = goldLawyer]").on("click", "[onk=ConsultPeople]", function() {
		kkkk = "1";
		PhoneEmail = $(this).attr("ide");
	});

	AddConsultAll();
});