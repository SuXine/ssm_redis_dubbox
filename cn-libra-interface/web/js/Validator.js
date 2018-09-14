$(function() {/* 文档加载，执行一个函数 */

	$('#validator')
	.bootstrapValidator(
					{
						feedbackIcons : {
							valid : 'glyphicon glyphicon-ok',
							invalid : 'glyphicon glyphicon-remove',
							validating : 'glyphicon glyphicon-refresh'
						},
						/**
						 * 生效规则（三选一） enabled 字段值有变化就触发验证 disabled,submitted
						 * 当点击提交时验证并展示错误信息
						 */
						live : 'enabled',
						/**
						 * 为每个字段指定通用错误提示语
						 */
						message : 'This value is not valid',
						/**
						 * 表单域配置
						 */
						fields : {
							// 多个重复
							Email : {
								// 隐藏或显示 该字段的验证
								enabled : true,
								// 错误提示信息
								message : '邮箱无效',
								validators : {
									notEmpty : {// 非空验证：提示消息
										message : '邮箱不能为空'
									},
									regexp : {
										regexp : /^[a-z0-9_]+([._\\-]*[a-z0-9_])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/,
										message : '请输入正确格式'
									}
								}
							},
							NotNull : {
								// 隐藏或显示 该字段的验证
								enabled : true,
								// 错误提示信息
								message : '输入无效',
								validators : {
									notEmpty : {// 非空验证：提示消息
										message : '不能为空'
									}
								}
							},
							Phone : {
								// 隐藏或显示 该字段的验证
								enabled : true,
								// 错误提示信息
								message : '输入无效',
								validators : {
									notEmpty : {// 非空验证：提示消息
										message : '不能为空'
									},
								 regexp : {
								 regexp : /[0-9-()（）]{7,18}/,
								 message : '请输入正确格式'
								 }
								}
							},

							text : {
								// 隐藏或显示 该字段的验证
								enabled : true,
								// 错误提示信息
								message : '文本无效',
								validators : {
									notEmpty : {// 非空验证：提示消息
										message : '文本内容不能为空'
									},
									stringLength : {
										min : 1,
										max : 200,
										message : '长度应小于200个字'
									}
								}
							},
							ConsultTitle : {
								// 隐藏或显示 该字段的验证
								enabled : true,
								// 错误提示信息
								message : '咨询名无效',
								validators : {
									notEmpty : {// 非空验证：提示消息
										message : '咨询名不能为空'
									},
									stringLength : {
										min : 1,
										max : 15,
										message : '长度应小于15个字'
									}
								}
							},
							upload : {
								// 隐藏或显示 该字段的验证
								enabled : true,
								// 错误提示信息
								message : '文件无效',
								validators : {
									notEmpty : {// 非空验证：提示消息
										message : '文件不能为空'
									},
									file : {
										extension : 'rar,zip',
										message : '请重新选择文件,文件应为压缩包格式为：rar，zip'
									}

								}
							},
							PeopleManifesto : {
								// 隐藏或显示 该字段的验证
								enabled : true,
								// 错误提示信息
								message : '个人宣言无效',
								validators : {
									notEmpty : {// 非空验证：提示消息
										message : '个人宣言不能为空'
									},
									stringLength : {
										min : 1,
										max : 50,
										message : '长度应小于50个字'
									}
								}
							},
							lawyerImg : {
								validators : {
									notEmpty : {
										message : '上传图片不能为空'
									},
									file : {
										extension : 'png,jpg,jpeg',
										type : 'image/png,image/jpg,image/jpeg',
										message : '请重新选择图片,图片格式为png，jpg，jpeg(后缀名区分大小写)'
									}
								}
							},
							finishPleadScoreInput : {
								validators : {
									notEmpty : {
										message : '不能为空'
									},
									regexp : {
										regexp : /^[1-3]{1}$/,
										message : '请输入:1或者2或者3'
									}
								}
							},
							LawyerNumber : {
								validators: {
				                    notEmpty: {
				                        message: '不能为空'
				                    },
				                    regexp : {
										regexp : /^[1-2]{1}(\d{3})([1-2]{1})(\d{9})$/,
										message : '正确格式'
									}
				                }
							},
							LawyerType : {
								validators: {
				                    notEmpty: {
				                        message: '不能为空'
				                    },
				                    regexp : {
										regexp : /^[\u4e00-\u9fa5]{4}$/,
										message : '正确格式为4个汉字'
									}
				                }
							}
							

						}
					});
	$("#validator").submit(function(ev){ev.preventDefault();});
	$('#VerificationEmail').click(function() {
		$('#validator').bootstrapValidator('validate');
	});
	$("#VerificationEmail").on("click", function(){
		   var bootstrapValidator = $("#validator").data('bootstrapValidator');
		   bootstrapValidator.validate();
		   if(bootstrapValidator.isValid())
		     $("#validator").submit();
		   else return;

		});
	$('#UPPeopleEmali').click(function() {
		 $('#validator').bootstrapValidator('validate');
	});
	$("#UPPeopleEmali").on("click", function(){
		   var bootstrapValidator = $("#validator").data('bootstrapValidator');
		   bootstrapValidator.validate();
		   if(bootstrapValidator.isValid())
		     $("#validator").submit();
		   else return;

		});
	$('#VerificationLawyerEmail').click(function() {
		 $('#validator').bootstrapValidator('validate');
	});
	$("#VerificationLawyerEmail").on("click", function(){
		   var bootstrapValidator = $("#validator").data('bootstrapValidator');
		   bootstrapValidator.validate();
		   if(bootstrapValidator.isValid())
		     $("#validator").submit();
		   else return;

		});
	$('#UPapplyPleadEmali').click(function() {
		 $('#validator').bootstrapValidator('validate');
	});
	$("#UPapplyPleadEmali").on("click", function(){
		   var bootstrapValidator = $("#validator").data('bootstrapValidator');
		   bootstrapValidator.validate();
		   if(bootstrapValidator.isValid())
		     $("#validator").submit();
		   else return;

		});
	$('#UPfinishPleadEmali').click(function() {
		 $('#validator').bootstrapValidator('validate');
	});
	$("#UPfinishPleadEmali").on("click", function(){
		   var bootstrapValidator = $("#validator").data('bootstrapValidator');
		   bootstrapValidator.validate();
		   if(bootstrapValidator.isValid())
		     $("#validator").submit();
		   else return;

		});
	$('#UPdeletePleadEmali').click(function() {
		 $('#validator').bootstrapValidator('validate');
	});
	$("#UPdeletePleadEmali").on("click", function(){
		   var bootstrapValidator = $("#validator").data('bootstrapValidator');
		   bootstrapValidator.validate();
		   if(bootstrapValidator.isValid())
		     $("#validator").submit();
		   else return;

		});
	$('#UPdeleteLawyerEmali').click(function() {
		 $('#validator').bootstrapValidator('validate');
	});
	$("#UPdeleteLawyerEmali").on("click", function(){
		   var bootstrapValidator = $("#validator").data('bootstrapValidator');
		   bootstrapValidator.validate();
		   if(bootstrapValidator.isValid())
		     $("#validator").submit();
		   else return;

		});
	$('#UPdownEmali').click(function() {
		 $('#validator').bootstrapValidator('validate');
	});
	$("#UPdownEmali").on("click", function(){
		   var bootstrapValidator = $("#validator").data('bootstrapValidator');
		   bootstrapValidator.validate();
		   if(bootstrapValidator.isValid())
		     $("#validator").submit();
		   else return;

		});

});
