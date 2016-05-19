$(function(){
	$.formValidator.initConfig({formid:"commform",autotip:false,onerror:function(msg){alert(msg)}});


$("#nic").formValidator({onshow:"请输入昵称",onfocus:"请输入昵称",oncorrect:"输入正确",tipid:"nic_tip"}).inputValidator({min:3,max:10,onerror:"请输入昵称3-10字符"});


	$("#xm").formValidator({onshow:"请输入您的真实姓名",onfocus:"请输入您的真实姓名",oncorrect:"输入正确",tipid:"xm_tip"}).inputValidator({min:1,max:8,onerror:"请输入您的真实姓名"});

$("#jjlxr").formValidator({onshow:"请设置6位数字的交易密码",onfocus:"请设置6位数字的交易密码",oncorrect:"设置正确",tipid:"jjlxr_tip"}).inputValidator({min:6,max:6,onerror:"请设置6位数字的交易密码"});
	$("#sfz").formValidator({onshow:"请输入您的交易账号",onfocus:"请输入您的交易账号",oncorrect:"输入正确",tipid:"sfz_tip"}).inputValidator({min:1,max:100,onerror:"请输入您的交易账号"});
	$("#jgbh").formValidator({onshow:"请选择银行",onfocus:"请选择银行",oncorrect:"银行",tipid:"jgbh_tip"}).inputValidator({min:1,max:200,onerror:"请选择银行"});
	
	$("#sj").formValidator({onshow:"请输入手机号码",onfocus:"请输入手机号码",oncorrect:"输入正确",tipid:"sj_tip"}).inputValidator({min:11,max:11,onerror:"请手机号位数11位"})

});

//添加数据到数据库，同时更新显示，注意escape编码后提交
function addComments(){
//var a=document.commform.mcontent.value;


	if($.formValidator.pageIsValid()){
		$.ajax({
			type:"POST",
			url:"CommentLib.asp?action=addcomments",
			data:"jgbh="+escape($("#jgbh").val())+"&qq="+escape($("#qq").val())+"&xm="+escape($("#xm").val())+"&sfz="+escape($("#sfz").val())+"&yhk="+escape($("#yhk").val())+"&sj="+escape($("#sj").val())+"&pic="+escape($("#pic").val())+"&khpt="+escape($("#khpt").val())+"&jjlxr="+escape($("#jjlxr").val())+"&jjtel="+escape($("#jjtel").val())+"&nic="+escape($("#nic").val()),
			success:function(data){
				if(unescape(data)=="OK"){
				  alert('^_^恭喜您报名提交成功，我们将根据报名规则进行审核并统计收排名！');
				   window.location.href='../';
					//提交评论后清除表单内容
					
					$("#sj").val("");
					$("#xm").val("");
$("#sfz").val("");
$("#pic").val("");
$("#jgbh").val("");
				}else{
					alert(unescape(data));
				}
				$("#comm_code").val("");
			}
		});
	}
}