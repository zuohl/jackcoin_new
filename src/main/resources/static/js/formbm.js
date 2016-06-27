$(function(){
	$.formValidator.initConfig({formid:"commform",autotip:false,onerror:function(msg){alert(msg)}});


$("#nickName").formValidator({onshow:"请输入昵称",onfocus:"请输入昵称",oncorrect:"输入正确",tipid:"nic_tip"}).inputValidator({min:3,max:10,onerror:"请输入昵称3-10字符"});


$("#realName").formValidator({onshow:"请输入您的真实姓名",onfocus:"请输入您的真实姓名",oncorrect:"输入正确",tipid:"xm_tip"}).inputValidator({min:1,max:8,onerror:"请输入您的真实姓名"});

$("#jjlxr").formValidator({onshow:"请设置6位数字的交易密码",onfocus:"请设置6位数字的交易密码",oncorrect:"设置正确",tipid:"jjlxr_tip"}).inputValidator({min:6,max:6,onerror:"请设置6位数字的交易密码"});
	$("#tradingAccount").formValidator({onshow:"请输入您的交易账号",onfocus:"请输入您的交易账号",oncorrect:"输入正确",tipid:"sfz_tip"}).inputValidator({min:10,max:12,onerror:"请输入10到12位交易账号"}).regexValidator({datatype:"enum",regexp:"intege1",onerror:"交易账号必须为数字"});
	$("#jgbh").formValidator({onshow:"请选择银行",onfocus:"请选择银行",oncorrect:"银行",tipid:"jgbh_tip"}).inputValidator({min:1,max:200,onerror:"请选择银行"});
	
	$("#mobileNumber").formValidator({onshow:"请输入手机号码",onfocus:"请输入手机号码",oncorrect:"输入正确",tipid:"sj_tip"}).inputValidator({min:11,max:11,onerror:"请输入11位手机号"}).regexValidator({datatype:"enum",regexp:"intege1",onerror:"手机号必须为数字"});

});

//添加数据到数据库，同时更新显示，注意escape编码后提交
function addComments(){
//var a=document.commform.mcontent.value;


	if($.formValidator.pageIsValid()){
		$("#commform").ajaxSubmit({
			type: 'post',
			url: "/registration/addMatchRegistration" ,
			success: function(data){
				if (data.code == RESULT_SUCCESS) {
					alert(data.msg);
					window.location = "index.html";
				}
				else if(data.code == RESULT_BUSINESS_ERROR){
					alert(data.msg);
					return;
				}
				else {
					alert("添加失败,请重试");
					return;
				}
			},
			error: function(){
				alert("添加失败,请重试");
				return;
			}
		});
	}
}