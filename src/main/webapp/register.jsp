<!DOCTYPE html>
<html class="no-js">
<head>
<title>注册页面</title>
<meta charset="utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link href="/SelfOpenAccount/mobile/css/layout.css"rel="stylesheet" type="text/css" />
<link href="/SelfOpenAccount/mobile/css/layout_mobile.css"rel="stylesheet" type="text/css" />

<script src="/SelfOpenAccount/mobile/js/jquery-1.6.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/SelfOpenAccount/js/authentication.js"></script>
<script type='text/javascript' src='/SelfOpenAccount/dwr/engine.js'></script>
<script type='text/javascript' src='/SelfOpenAccount/dwr/FirmManager.js'></script>
<meta name="viewport"
    content="width=device-width,target-densitydpi=medium-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script type="text/javascript">

</script>
<script>

function Subm()
{   
    var now  = new Date();
    now.toLocaleDateString();
    var sum = document.getElementById("sub");
    if(ckall()){
        //prepareImage();
        //sum.disabled = true;
        fm.submit();
    }
}

function checkAccountNum(){
    if(fm.bankAccount.value=="" ){
      document.getElementById("bankMessage").innerHTML="<font color='red' size='-1'>银行卡号码不能为空</font>";
        return false;
    }else{
        document.getElementById("bankMessage").innerHTML="<font size='-1'>请输入您本人名下的银行账号信息，不得使用信用卡。</font>";
    }
FirmManager.checkAccountNum(fm.bankAccount.value,function(data){
            if(!data){
                //fm.bankAccount.value="";
                document.getElementById("bankMessage").innerHTML="<font color='red' size='-1'>银行卡号已被使用</font>";                 
            }else{
                document.getElementById("bankMessage").innerHTML="<font size='-1'>请输入您本人名下的银行账号信息，不得使用信用卡。</font>";
            }
        })
}

function checkCardNum(){
if(fm.cardNumber.value=="" ){

  document.getElementById("cardMessage").innerHTML="<font color='red' size='-1'>证件号码不能为空</font>";
        return false;
    }
if(fm.cardType.value=="1"){//证件类型为身份证
    var cardMsg = yanzheng(fm.cardNumber.value);
    if(cardMsg!="验证通过!"){
    document.getElementById("cardMessage").innerHTML="<font color='red' size='-1'>身份证号不正确</font>";

        return false;
    }else{

        document.getElementById("cardMessage").innerHTML="<em>*</em>";

       // document.getElementById("cardMessage").innerHTML="<span>*</span>请输入您身份证上注明的18位证件号码";
        }


    FirmManager.checkedCardNumberBycardType(fm.cardNumber.value,fm.cardType.value,function(data){
            if(!data){
                fm.cardNumber.value="";
                document.getElementById("cardMessage").innerHTML="<font color='red' size='-1'>身份证号已被使用</font>";                 
            }else{

    document.getElementById("cardMessage").innerHTML="<em>*</em>";

   // document.getElementById("cardMessage").innerHTML="<span>*</span>请输入您身份证上注明的18位证件号码";
    }
        })
}else{
    FirmManager.checkedCardNumberBycardType(fm.cardNumber.value,fm.cardType.value,function(data){
            if(!data){
                fm.cardNumber.value="";
                document.getElementById("cardMessage").innerHTML="<font color='red' size='-1'>证件号已被使用</font>";                  
            }else{
    document.getElementById("cardMessage").innerHTML="<span>*</span>";
    }
        })
}
    
}


//function checkCardNum2(){
//if(fm.cardNumber2.value=="" ){
//document.getElementById("cardMessage2").innerHTML="<font color='red' size='-1'>证件号码不能为空</font>"; 
//      return false;
//    }
//if(fm.cardNumber.value!=fm.cardNumber2.value){
//document.getElementById("cardMessage2").innerHTML="<font color='red' size='-1'>两次输入身份证号不一致</font>"; 
//      return false;
//    }else{
//   document.getElementById("cardMessage2").innerHTML="<font color='red' size='-1'>*</font><font color='black' size='-1'>请再次输入您身份证上注明的18位证件号码</font>";
//    }
//}
    //根据投资者类型显示相应的信息
    function typeChange(value){
      var type=value;
      
      if(Number(type)==1){
            document.getElementById("selfInfo").style.display="none";
            document.getElementById("corporationInfo").style.display="block";
        }else{
            fm.businessLicenseNo.value="";//如果不是法人将营业执照号置为"",防止验证信息时验证该字段
            document.getElementById("selfInfo").style.display="block";
            document.getElementById("corporationInfo").style.display="none";
        }
 }

function suffixNamePress(){
      if (event.keyCode<46 || event.keyCode>57 || event.keyCode == 47){
        event.returnValue=false;
      }else{
        event.returnValue=true;
      }
}

//验证
function ckall(){ 
    if(fm.name.value=="" ){
        alert("姓名不能为空");
        fm.name.focus();
        return false;
    }
    if(fm.registeredPhoneNo.value==""){
        fm.registeredPhoneNo.focus();
        alert("手机号码不能为空！");
        return false;
    }
    if(fm.registeredPhoneNo.value.length!=11){
        fm.registeredPhoneNo.focus();
        alert("手机号码长度只能为11位！");
        return false;
    }
    if(fm.cardType.value=="-1" ){
        alert("请选择证件类型");
        fm.cardType.focus();
        return false;
    }
    
    if(fm.cardNumber.value=="" ){
        alert("证件号码不能为空");
        fm.cardNumber.focus();
        return false;
    }else{
        if(fm.cardType.value=="1"){
            var d = new Date();
            nowyear = d.getFullYear();
            var birthyear = fm.cardNumber.value.substr(6,4);
            var age = nowyear-birthyear;
            if(age<18){
                alert("开户交易商年龄应大于18周岁");
                fm.cardNumber.focus();
                return false;
            }
        }
        if(fm.cardType.value=="3"&&checkhuzhao(fm.cardNumber.value)==false){
            alert("护照格式填写错误");
            return
        }
        
    }     
      
    if(fm.selectp.value=="0" ){
        alert("请选择所在省市");
        fm.address1.focus();
        return false;
    }

    if(fm.cardType.value=="1"){
        if(yanzheng(fm.cardNumber.value)!="验证通过!"){
            alert(yanzheng(fm.cardNumber.value));
            fm.cardNumber.focus();
            return false;
        }
    }
    
    //去掉邮箱必填
        //if(fm.email.value=="" ){
        //  alert("邮箱不能为空");
        //  fm.email.focus();
        //  return false;
        //}
    var result = fm.email.value.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/); 
    //判断邮箱格式
    if(fm.email.value!=""&&result==null){
        alert("电子邮箱格式不正确");
        fm.email.focus();
        return false;
    }
    if(fm.recommendBankCode.value=="" ){
   // if(fm.recommendBankCode1.value=="" ){
        alert("银行不能为空");
        fm.bank.focus();
        return false;
  //  }
    }
    if(fm.bankAccount.value=="" ){
        alert("银行账号不能为空");
        fm.bankAccount.focus();
        return false;
    }
    if(fm.address.value=="" ){
        alert("地址不能为空");
        fm.address.focus();
        return false;
    }
    if(fm.address1.value=="" ){
        alert("地址不能为空");
        fm.address1.focus();
        return false;
    }
    var type='';
    var numbers=document.getElementsByName("type");
    for ( var i = 0; i < numbers.length; i++) {
        if (numbers[i].checked){
            type=numbers[i].value;
        }
    }
    if(type=="1"&&fm.businessLicenseNo.value==""){
        alert("营业执照号不能为空");
        return;
    }
    if(type=="1"&&formNew.organizationCode.value=="") {
        alert("组织机构代码不能为空！");
        return;
    }
    
    //2014-03-07 by chenyc 不再显示开户机构所在地区
    // if(fm.areaChoose.value=="-1"){
    //  alert("请开户机构所在地区");
    //  fm.areaChoose.focus();
    //  return false;
   // }
    if(fm.brokerId.value=="-1"){
        alert("请选择经纪会员");
        fm.brokerId.focus();
        return false;
    } 
    
    
    if(type=="3"){
        if(fm.contactMan.value=="" ){
            alert("联系人不能为空");
            fm.contactMan.focus();
            return false;
        }  if(fm.ContacterPhoneNo.value=="" ){
            alert("手机号码不能为空");
            fm.ContacterPhoneNo.focus();
            return false;
        }
        
        //2014-03-13 add by chenyc 判断图片是否为空
        
        var attach = document.getElementById("attach").value;
        var imgSize = 1024 * 100; //最大100K
        
       // if(img.fileSize <=0 || img.fileSize > imgSize){
         //           alert("当前文件大小" + img.fileSize / 1024 + "KB, 超出最大限制 " + imgSize / 1024 + "KB");
        //          return false;
         // }else{
           //         alert("OK");
             //       return true;
          //}
        if(attach!=null&&attach!=""){
            var ext = attach.substr(attach.lastIndexOf(".")+1,attach.length);
            //alert("ext:"+ext);
            if(ext==""||ext == "jpg"||ext == "gif"||ext == "png"||ext == "bmp"||ext == "JPG"||ext == "GIF"||ext == "PNG"||ext == "BMP"){
            }else{
                alert("格式不正确!");
                return false;
            }
        }else{
            alert("身份证正面照不能为空!");
            return false;
        }   
    }
    if(fm.yanzhengma.value=="" ){
        alert("验证码不能为空");
        fm.yanzhengma.focus();
        return false;
    }
    return true;  
}
//验证护照
function checkhuzhao(number){
    var str=number;
    var Expression=/^(P\d{7})|(G\d{8})$/; 
    var objExp=new RegExp(Expression);
    if(objExp.test(str)==true){
        return true;
    }
    else{
        return false;       
    }
}
//仅输入6位数字
function onlyNumberInput1()
{
  if (event.keyCode<45 || event.keyCode>57 || event.keyCode == 47 || event.keyCode == 46)
  {
    event.returnValue=false;
  }
  
  var pwd1=document.getElementById("firmId").value;
  
  if(pwd1.length>=6){

    event.returnValue=false;
    }
    
}

//银行卡输入4位加一空格
 function divideAccount(){
 var tt = document.getElementById("bankAccount");
  tt.value =tt.value.replace(/\s/g,'').replace(/(\d{4})(?=\d)/g,"$1 ");

}

//仅输入数字
function onlyNumberInput()
{
  if (event.keyCode<45 || event.keyCode>57 || event.keyCode == 47 || event.keyCode == 46)
  {
    event.returnValue=false;
  }
}
//仅输入数字和.
function onlyNumberAndOInput()
{
  if (event.keyCode<45 || event.keyCode>57|| event.keyCode == 47)
  {
    event.returnValue=false;
  }
}
//仅输入数字和字母
function onlyNumberAndCharInput()
{
  if ((event.keyCode>=48 && event.keyCode<=57) || (event.keyCode>=65 && event.keyCode<=90) || (event.keyCode>=97 && event.keyCode<=122))
  {
    event.returnValue=true;
  }
  else
  {
    event.returnValue=false;
  }
}

//验证时间格式
function isDateFormat(txt){ //是否为合法的日期格式:YYYY-MM-DD
    if(txt==null || txt == "" || txt.length > 10)
    {
        return false;
    }
    else{
        var regex = /[0-9]{1,4}-[0-9]{1,2}-[0-9]{1,2}/;
        if( regex.test(txt) ){
            var noArr = txt.split("-");
            var year = noArr[0];
            var month = noArr[1];
            var day = noArr[2];
            if ( year < 1 || month < 1 || month > 12 || day < 1 || day > 31)
            {
                return false;
            }
            if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30)
            {
                return false;
            }
            if (month == 2){
                if ((year % 4 != 0) && day > 29)
                { 
                    return false;
                }
                if (year % 4 == 0){
                    if(year % 100 == 0 && year % 400 != 0 && day > 29)
                    {
                        return false;
                    }
                    else if (day > 28)
                    {
                        return false;
                    }
                }
            }
            return true;
        }else
        {
            return false;
        }
    }
}

function clearvalue(){

    //fm.birthday.value="";
}
function setRq()
{
  //fm.birthday.value = pTop("./calendar.htm",222,252);  
}

function pTop(location, width, height)
{
    return showModalDialog(location,window,'dialogWidth:'+width+'px;dialogHeight:'+height+'px;dialogLeft:'+(screen.width-width)/2+'px;dialogTop:'+(screen.height-height)/2+'px;center:yes;help:no;resizable:no;status:no;scrollbars:no');
}
function changeImg(){
    document.getElementById("img").src="/SelfOpenAccount/image.jsp?"+Math.random();
}
function searchBroker(){
    var returnValue=openDialog("searchBroker.jsp","_blank",300,350);
    if(returnValue==null){
        fm.brokerId.value="";
    }else{
        fm.brokerId.value=returnValue;
    }
    fm.brokerId.focus();
}
function openDialog(url, args, width, height) {
    if (!width) width = 600;
    if (!height) height = 400;
    var returnVal = window.showModalDialog(url, args, "dialogWidth=" + width + "px; dialogHeight=" + height + "px; status=yes;scroll=yes;help=no;");
    return returnVal;
}

function changeBank(value){

//var bank = document.getElementById("recommendBankCode");
//var text=bank.options[bank.selectedIndex].text;
//var bvalue = bank.value;

//var oSelect = document.getElementById("brokerId");
//  while (oSelect.options.length>0){

//   for(var i=0;i<oSelect.options.length;i++){
//      if("301"==oSelect.options[i].value){
//      oSelect.options[i].outerHTML = null;
//      i--;
//      continue;               
//      }
//      if("302"==oSelect.options[i].value){
//      oSelect.options[i].outerHTML = null;         
//      i--;        
//      }
//   }
//   break;
//  }

//if(bvalue!=""&&bvalue!=null){
//var oOption = document.createElement("option");
//var t = document.createTextNode(bvalue+text);
//oOption.setAttribute("value",bvalue);
//oOption.appendChild(t);               
//oSelect.appendChild(oOption);
//}

/* 不显示密码查询 if(value=="301"){
document.getElementById("passwordArea1").style.display="";
document.getElementById("passwordArea2").style.display="";
}else{
document.getElementById("passwordArea1").style.display="none";
document.getElementById("passwordArea2").style.display="none";
}
 */
}

    function showArea(){
    var i = 0;
    var oSelect = document.getElementById("areaChoose");
    var oOption = document.createElement("option");
    var t = document.createTextNode('--请选择--');
            oOption.setAttribute("value", "-1");
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            submitNext("-1");
    
        
            var oOption = document.createElement("option");
            
            t = document.createTextNode('上海');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '0');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            t = document.createTextNode('北京');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '1');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            t = document.createTextNode('天津');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '2');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            t = document.createTextNode('重庆');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '3');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            t = document.createTextNode('河北');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '4');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            t = document.createTextNode('河南');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '5');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            t = document.createTextNode('云南');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '6');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            t = document.createTextNode('辽宁');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '7');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('黑龙江');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '8');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('湖南');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '9');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('安徽');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '10');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('山东');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '11');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('新疆');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '12');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('江苏');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '13');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('浙江');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '14');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('江西');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '15');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('湖北');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '16');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('广西');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '17');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('甘肃');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '18');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('山西');
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '19');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('内蒙');
            
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '20');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('陕西');
            
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '21');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('吉林');
            
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '22');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('福建');
            
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '23');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('贵州');
            
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '24');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('广东');
            
            
            
            
            
            
            
            
            oOption.setAttribute("value", '25');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('青海');
            
            
            
            
            
            
            
            oOption.setAttribute("value", '26');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('西藏');
            
            
            
            
            
            
            oOption.setAttribute("value", '27');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('四川');
            
            
            
            
            
            oOption.setAttribute("value", '28');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('宁夏');
            
            
            
            
            oOption.setAttribute("value", '29');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('海南');
            
            
            
            oOption.setAttribute("value", '30');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('香港');
            
            oOption.setAttribute("value", '32');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
            var oOption = document.createElement("option");
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            t = document.createTextNode('澳门');
            oOption.setAttribute("value", '33');
            oOption.appendChild(t);
            oSelect.appendChild(oOption);
            i = i + 1;
        
    
    setTimeout(function(){ oSelect.options[0].selected=true; }, 1);         
    submitNext(oSelect.value);
}

function submitNext(area){
    var oSelect = document.getElementById("brokerId");
    while(oSelect.options.length > 0)
    {
      oSelect.options[0].outerHTML = null;
    }
    
//   var bank = document.getElementById("recommendBankCode");
//   var text=bank.options[bank.selectedIndex].text;
//   var bvalue = bank.value;
//  if(bvalue!=""&&bvalue!=null){
//    var oOption = document.createElement("option");
//    var t = document.createTextNode(bvalue+text);
//    oOption.setAttribute("value",bvalue);
//    oOption.appendChild(t);               
//   oSelect.appendChild(oOption);
//   }

    if(area=="-1"){
    var oOption = document.createElement("option");
    var t = document.createTextNode("--请先选择地区--");
    oOption.setAttribute("value", "-1");
    oOption.appendChild(t);
    oSelect.appendChild(oOption);
     }else{ 
    var oOption = document.createElement("option");
    var t = document.createTextNode("--请选择所属经纪会员--");
    oOption.setAttribute("value", "-1");
    oOption.appendChild(t);
    oSelect.appendChild(oOption);
    FirmManager.getBrokerListByIdAndNameAndmem(area,function(data){
        if(data.length>0){
            var arr=data.split(";");
            for(var i=0;i<arr.length;i++){
                var oOption = document.createElement("option");
                var arr2=arr[i].split(",");
                var t = document.createTextNode(arr2[0]+arr2[1]);
                oOption.setAttribute("value", arr2[0]);
                oOption.appendChild(t);
                oSelect.appendChild(oOption);
            }
        }
            
    })
    }
}

function checkFirm(){
    var firmId = document.getElementById("firmId").value;
    var brokerId = document.getElementById("brokerId").value;
    var id = brokerId+firmId;
    if(firmId.length!=6){
        document.getElementById("firmMessage").innerHTML="<font color='red' size='-1'>请输入6位交易商ID</font>";
        fm.firmId.focus();
    }else{
        FirmManager.checkedFirmById(id,function(data){
            if(data=="true"){
                document.getElementById("firmMessage").innerHTML="<font color='red' size='-1'>该交易商ID已存在</font>";
                fm.firmId.focus();
            }else{
                document.getElementById("firmMessage").innerHTML="<font color='red' size='-1'>*</font>";
            }
        })
        
    }
}

function chksize(filePath)
{
            var FileMaxSize = 100;//限制上传的文件大小，单位(k)     
            var suffix="jpg";
            var suffix1="gif"; 
         if(filePath.substring(filePath.length-suffix.length).toLowerCase()==suffix ||filePath.substring(filePath.length-suffix1.length).toLowerCase()==suffix1)
         {   
              
              //var img=new Image();
               img=document.createElement("img");//创建一个 <img...> 对象 
              //img.style.position= "absolute ";//设置图片位置属性 
               img.src=filePath.toLowerCase();
               alert("提示:大小"+img.readyState);
               if(img.readyState!="complete"&&img.readyState!="loaded") //如果图像是未加载完成进行循环检测 
               { 
               sleep(1000);
               }
               alert("提示:大小"+img.fileSize);
               
           if(img.fileSize>=(FileMaxSize*1024))
           {
               alert("您所上传的图片超过100K");
                document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
               return   false; 
           }  
            }else{   
                alert("文件格式不正确,请上传jpg,gif文件");
                     document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
                    return   false; 
          } 
        return true;
}
function sleep(n)
  {
    var start=new Date().getTime();
    while(true) if(new Date().getTime()-start>n) break;
  }
    //清空验证码值
    function clearValue() {
        document.getElementById("imgcode").value = "";
    }
    //显示颜色  
    function pwStrength(pwd) {
        PasswordMode.pwStrength(pwd, "strength_L", "strength_M", "strength_H");
        return;
    }

    //更换验证码图片
    function changeregistimg(id) {
        document.getElementById("verifycode").src = "/SelfOpenAccount/image.jsp?"
                + Math.random();
    }

    function onlyLetterNumber(ch, vec) {
        var s = this.value;
        var china = "";
        var strs = "";
        if (ch) {
            china = "\\u4e00-\\u9fa5";
        }
        if (vec) {
            for ( var i = 0; i < vec.length; i++) {
                strs += "|\\" + vec[i];
            }
        }
        var matchs = '\^[0-9A-Za-z' + china + strs + ']{1,}$';
        var patrn = new RegExp(matchs, "ig");
        if (patrn.exec(s)) {
            return true;
        }
        return false;
    }
    //当交易商类型为'个人的时候',隐藏地域编号、行业编号、组织结构代码和法人代表
    function checkRepeat(){
        var type=document.getElementById("type").value;
        if (type != 3) {
            $("tr[name='content1']").css("display", "");
            $("tr[name='content']").css("display", "none");
        } else {
            $("tr[name='content']").css("display", "");
            $("tr[name='content1']").css("display", "none");
        }
    }
    //当交易商类型为'个人的时候',隐藏地域编号、行业编号、组织结构代码和法人代表
    function getHidden(type) {
        if (type != 3) {
            $("tr[name='content1']").css("display", "");
            $("tr[name='content']").css("display", "none");
        } else {
            $("tr[name='content']").css("display", "");
            $("tr[name='content1']").css("display", "none");
        }
    }

    function get(id) {
        return document.getElementById(id);
    }
    function checkUserId() {
        var userId = $("#userID").val();
        if (!isStr(userId, true)) {
            return "*包含非法字符";
        }

    }
    /**
     * 判断是否包含特殊字符 s 被验证的字符串 ch true汉字不算特殊字符串，false 汉字算是字符串 vec 特殊字符数组，包含在数组中的不算特殊字符
     * true 不包含特殊字符 false 包含特殊字符
     */
    function isStr(s, ch, vec) {
        if (isEmpty(s)) {
            return true;
        }
        var china = "";
        var strs = "";
        if (ch) {
            china = "\\u4e00-\\u9fa5";
        }
        if (vec != null) {
            for ( var i = 0; i < vec.length; i++) {
                strs += "|\\" + vec[i];
            }
        }
        var matchs = '\^[0-9A-Za-z' + china + strs + ']{1,}$';
        var patrn = new RegExp(matchs, "ig");
        if (patrn.exec(s)) {
            return true;
        }
        return false;
    }
    /**
     * 判断是否为空字符串
     */
    function isEmpty(s) {
        if (mytrim(s + '').length <= 0) {
            return true;
        }
        return false;
    }
    function mytrim(s) {
        return s.replace(/(^\s*)|(\s*$)/g, "");
    }
    //--------------以下处理图片下传--------------------------------------------
        // 参数，最大高度 
    var MAX_HEIGHT = 200;
    // 渲染 
    function render(src) {
        // 创建一个 Image 对象 
        var image = new Image();
        // 绑定 load 事件处理器，加载完成后执行 
        image.onload = function() {
            // 获取 canvas DOM 对象 
            var canvas = document.getElementById("myCanvas");
            // 如果高度超标 
            if (image.height > MAX_HEIGHT) {
                // 宽度等比例缩放 *= 
                image.width *= MAX_HEIGHT / image.height;
                image.height = MAX_HEIGHT;
            }
            // 获取 canvas的 2d 环境对象, 
            // 可以理解Context是管理员，canvas是房子 
            var ctx = canvas.getContext("2d");
            // canvas清屏 
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            // 重置canvas宽高 
            canvas.width = image.width;
            canvas.height = image.height;
            // 将图像绘制到canvas上 
            ctx.drawImage(image, 0, 0, image.width, image.height);
            // !!! 注意，image 没有加入到 dom之中 
            
            //隐藏的画布 生成b64码传到后台
            var canvas2=document.createElement("canvas");
            var context2=canvas2.getContext("2d");
            //计算转换后的图片长宽
            var newWidth2,newHeight2;
            var max2=this.width>this.height?this.width:this.height;
            if(max2<=1024){
                newWidth2=this.width;
                newHeight2=this.height;
            }else{
                if(this.width>this.height){
                    newWidth2=1024;
                    newHeight2=newWidth2*this.height/this.width;
                }else{
                    newHeight2=1024;
                    newWidth2=newHeiht2*this.width/this.height;
                }
            }
            canvas2.width=newWidth2;
            canvas2.height=newHeight2;
            context2.drawImage(this,0,0,newWidth2,newHeight2);
            //将画布保存为b64编码的jpeg格式图片，品质为90%
            var dataurl=canvas2.toDataURL('image/jpeg',0.9);
            //获取图片的64码
            var b64="";
            if(dataurl.indexOf('image/jpeg')>0){
                b64=dataurl.substring(23);
            }else{
                b64=dataurl.substring(22);
            }
            $("#b64").val(b64);
        };
        // 设置src属性，浏览器会自动加载。 
        // 记住必须先绑定事件，才能设置src属性，否则会出同步问题。 
        image.src = src;
    };
    // 加载 图像文件(url路径) 
    function loadImage(file) {
        if(!file.files[0]){//图片不存在
             delImage();
        }
        var src = file.files[0];
        // 过滤掉 非 image 类型的文件 
        if (!src.type.match(/image.*/)) {
            $("#file").val("");
            window.confirm("只能选择图片文件");
            return;
        }
        // 创建 FileReader 对象 并调用 render 函数来完成渲染. 
        var reader = new FileReader();
        // 绑定load事件自动回调函数 
        reader.onload = function(e) {
            // 调用前面的 render 函数 
            render(e.target.result);
        };
        // 读取文件内容 
        reader.readAsDataURL(src);
        $("#previewTr").css("display", "");
        $("#fileName").val(attach.value);
    };
    function delImage(){
         $("#previewTr").css("display", "none");
        $("#fileName").val("");
        $("#fileData").val(""); 
        //清理画布
        var canvas = document.getElementById("myCanvas");
        // 可以理解Context是管理员，canvas是房子 
        var ctx = canvas.getContext("2d");
        // canvas清屏 
        ctx.clearRect(0, 0, canvas.width, canvas.height);
    }
    //准备上传的图片
    function prepareImage() {

        // 获取 canvas DOM 对象 
        var canvas = document.getElementById("myCanvas");
        // 获取Base64编码后的图像数据，格式是字符串 
        // "data:image/png;base64,"开头,需要在客户端或者服务器端将其去掉，后面的部分可以直接写入文件。 
        var dataurl = canvas.toDataURL("image/png");
        // 为安全 对URI进行编码 
        // data%3Aimage%2Fpng%3Bbase64%2C 开头 
        var imagedata = encodeURIComponent(dataurl);
        // console.log(dataurl);
        // console.log(imagedata); 
        $("#fileName").val(
                $("#attach").val().substr(attach.value.lastIndexOf("\\") + 1)
                        .toLowerCase());
        $("#fileData").val(imagedata);

        $("#attach").val("");
    }
</script> 

  </head>

  <body onload="checkRepeat();">
    <div class="xinxi">
        <div class="toubu">
            <table>
                <tr>
                    <td class="tu"></td>
                    <td class="you">注册步骤：<br /> <span> 1、填写注册信息......<br />
                            2、注册成功后指定用于登录交易的交易员代码，再通过电话或其他联系方式通知注册用户
                            <br><br><br>
                    </span>
                    </td>
                </tr>
            </table>

        </div>
        <div class="biaoge">
            <iframe name="hiddenframe" width=0 height=0 application='yes'></iframe>
            <form action="./firmController.fir?funcflg=addFirm" method="post" name="fm" id="fm"  enctype="multipart/form-data">
                <table>
                    <tr class="bt">
                        <td colspan="3">填写注册信息↓&nbsp;&nbsp;&nbsp;&nbsp;<span>*为必填项</span></td>
                    </tr>
                    <tr>
                        <td class="td1">姓名：</td>
                        <td class="td2">
                        <input name="sine" id="sine" type="hidden" value="mobile" />
                        <input name="broker" id="broker" type="hidden" value="" />
                        <input name="name" id="name" value="" maxlength="16"/></td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr>
                        <td class="td1">证件类型：</td>
                        <td style="padding-right:0px;" class="td2">
                        <select id="cardType" name="cardType" class="select1">
                            <option value="-1">---请选择证件类型--</option>
                            <option value="1">身份证</option>
                            <option value="2">军官证</option>
                            <option value="3">护照</option>
                            <option value="4">台胞证</option>
                        </select></td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr>
                        <td class="td1">证件编号：</td>
                        <td class="td2">
                            <input name="cardNumber" id="cardNumber" value="" maxlength="18" 
                            onKeyPress="onlyNumberAndCharInput();" onblur="checkCardNum();"/>
                        </td>
                        <td class="td3"><font id="cardMessage"><em>*</em></font></td>
                    </tr>
                    <tr>
                    <td colspan="3">
                        <em>温馨提示：参加“分享有礼，盈在南京”活动的平安易宝用户，平安易宝绑定交易账户同时需绑定本人其他银行帐户，通过入金和出金验证即签约成功；另外，经本中心或平安银行认定为无效户、虚假户的，不计入本次活动。</em>
                    </td></tr>
                    <tr>
                        <td class="td1">开户银行：</td>
                        <td style="padding-right:0px;" class="td2">
                        <select name="recommendBankCode" id="recommendBankCode" class="select1" >
                            <option value="">---请选择银行--</option>
                            
                                <option value='10'>工行</option>
                             
                                <option value='18'>平安银行</option>
                             
                                <option value='005'>农行</option>
                             
                                <option value='25'>民生</option>
                             
                          </select></td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr>
                        <td class="td1">银行账号：</td>
                        <td class="td2">
                            <input name="bankAccount" id="bankAccount" value="" onKeyPress="onlyNumberInput();" onkeyup="divideAccount();" onblur="checkAccountNum();" />
                        </td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr>
                        <td class="td1"></td>
                        <td class="td2"><font id="bankMessage">请输入您本人名下的银行账号信息，不得使用信用卡。</font></td>
                        <td class="td3"></td>
                    </tr>
                    
                    <tr>
                        <td class="td1">开户机构：</td>
                        <td class="td2">
                            <input name="brokerId" id="brokerId" value="1011998" maxlength="18" readonly="readonly" >
                        </td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    
                    <tr>
                        <td class="td1">投资者类型：</td>
                        <td style="padding-right:0px;" class="td2">
                        <select class="select1" id="type"
                            name="type" onchange="getHidden(this.value)">
                        <option value="3" selected="selected">自然人投资者</option>
                        <option value="1">机构投资者</option>
                        </select></td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr name="content">
                        <td class="td1">性别：</td>
                        <td class="td2">
                            <select id="sex" name="sex" class="select1">
                                <option value="1">男</option>
                                <option value="0">女</option>
                            </select>
                        </td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    
                    <tr name="content">
                        <td class="td1">紧急联系人：</td>
                        <td class="td2">
                            <input name="contactMan" value="" type="text"/>
                        </td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr name="content">
                        <td class="td1">紧急联系人电话：</td>
                        <td class="td2">
                            <input name="ContacterPhoneNo" value="" type="text" onkeypress="return suffixNamePress();"/>
                        </td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr name="content">
                        <td class="td1">证件照片：</td>
                        <td class="td2"><input type="file" accept="image/*"
                            capture="camera" name="attach" id="attach"
                            data-prompt-position="centerLeft:175,-6"
                            onchange="loadImage(this);"></td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr name="content">
                        <td class="td1"></td>
                        <td class="td2">请上传身份证正面照片供审核。(图片不大于250K)</td>
                        <td class="td3"></td>
                    </tr>
                    <tr id="previewTr" style="display: none">
                        <td style="text-align: center;" colspan="3"><input
                            type="hidden" name="fileName" id="fileName"> <input
                            type="hidden" name="fileData" id="fileData"><input
                            type="hidden" name="b64" id="b64">
                            <div id="preview">
                                <canvas id="myCanvas"></canvas>
                            </div></td>
                    </tr>
                    
                    <tr name="content1">
                        <td class="td1">营业执照号：</td>
                        <td class="td2">
                            <input name="businessLicenseNo" value=""  type="text" onkeypress="return suffixNamePress();"/>
                        </td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr name="content1">
                        <td class="td1">注册资金：</td>
                        <td class="td2">
                            <input name="registeredCapital" value=""  type="text" onkeypress="return suffixNamePress();"/>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr name="content1">
                        <td class="td1"> 税务登记号 :</td>
                        <td class="td2">
                            <input name="taxRegistrationNo" value=""  type="text" onkeypress="return suffixNamePress();"/>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr name="content1">
                        <td class="td1"> 组织机构代码 :</td>
                        <td class="td2">
                            <input name="organizationCode" value=""  type="text"/>
                        </td>
                        <td class="td3"><em>*</em></td>
                    </tr>             
                    <tr name="content1">
                        <td class="td1"> 法定代表人 :</td>
                        <td class="td2">
                            <input name="legalRepresentative" value=""  type="text"  />
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr name="content1">
                        <td class="td1"> 手机号码 :</td>
                        <td class="td2">
                            <input name="LRphoneNo" value=""  type="text" onkeypress="return suffixNamePress();"/>
                        </td>
                        <td class="td3"></td>
                    </tr>           
                    <tr name="content1">
                        <td class="td1"> 业务联系人 :</td>
                        <td class="td2">
                            <input name="businessContacter" value=""  type="text" />
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr name="content1">
                        <td class="td1"> 企业性质 :</td>
                        <td class="td2">
                            <input name="enterpriseKind" value=""  type="text" />
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <!-------------------------↓联系方式------------------------->
                    <tr class="bt">
                        <td colspan="2">填写联系方式↓</td>
                    </tr>
                    <tr>
                        <td class="td1">联系地址：</td>
                        <td style="padding-right:0px;" class="td2">
                        <select name="selectp" id="selectp" class="select1">
                         <option selected value="0">--请选择--</option>
                         <option  value="北京市">北京</option>
                         <option  value="上海市">上海</option>
                         <option  value="重庆市">重庆</option>
                         <option  value="天津市">天津</option>
                         <option  value="河北省">河北</option>
                         <option  value="山东省">山东</option>
                         <option  value="辽宁省">辽宁</option>
                         <option  value="黑龙江省">黑龙江</option>
                         <option  value="吉林省">吉林</option>
                         <option  value="甘肃省">甘肃</option>
                         <option  value="青海省">青海</option>
                         <option  value="河南省">河南</option>
                         <option  value="江苏省">江苏</option>
                         <option  value="湖北省">湖北</option>
                         <option  value="湖南省">湖南</option>
                         <option  value="江西省">江西</option>
                         <option  value="浙江省">浙江</option>
                         <option  value="广东省">广东</option>
                         <option  value="云南省">云南</option>
                         <option  value="福建省">福建</option>
                         <option  value="台湾省">台湾</option>
                         <option  value="海南省">海南</option>
                         <option  value="山西省">山西</option>
                         <option  value="四川省">四川</option>
                         <option  value="陕西省">陕西</option>
                         <option  value="贵州省">贵州</option>
                         <option  value="安徽省">安徽</option>
                         <option  value="台湾省">台湾</option>
                         <option  value="广西壮族自治区">广西</option>
                         <option  value="内蒙古自治区">内蒙古</option>
                         <option  value="西藏自治区">西藏</option>
                         <option  value="新疆维吾尔自治区">新疆</option>
                         <option  value="宁夏回族自治区">宁夏</option>
                         <option  value="澳门">澳门</option>
                         <option  value="香港">香港</option>
                         </select></td>
                         <td class="td3"><em>*</em></td>
                    </tr>
                    <tr>
                        <td class="td1">省/直辖市：</td>
                        <td class="td2"> <input name="address1" id="address1" value=""/>
                        </td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr>
                        <td class="td1">市/区/县：</td>
                        <td class="td2"><input name="address" id="address" value=""/>街/小区/楼/门/室等
                        </td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr>
                        <td class="td1">手机号：</td>
                        <td class="td2"><input name="registeredPhoneNo" id="registeredPhoneNo" value="" maxlength="16" />
                        </td>
                        <td class="td3"><em>*</em></td>
                    </tr>
                    <tr>
                        <td class="td1">电子邮箱：</td>
                        <td class="td2"><input name="email" id="email" value="" maxlength="40"/></td>
                        <td class="td3"><em></em></td>
                    </tr>
                    <tr>
                        <td class="td1">传真：</td>
                        <td class="td2"><input name="fax" id="fax" value="" maxlength="16"/></td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1">邮编：</td>
                        <td class="td2"><input name="postCode" id="postCode" value="" onKeyPress="onlyNumberInput()" />
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1">验证码：</td>
                        <td class="td2" colspan="2"><input id="yanzhengma"
                            name="yanzhengma" style="float:left; width:50%;" type="text"/>
                            <em style="width: 2px;height:30px;">*</em> 
                            <img id="verifycode"
                            src="/SelfOpenAccount/image.jsp" width="75px" height="35px"
                            align="absmiddle" /></td>
                    </tr>
                    <tr>
                        <td class="td1"></td>
                        <td class="td2"><a href="#"
                            onclick="changeregistimg(id); return false;">看不清？</a></td>
                        <td class="td3"></td>
                    </tr>
                </table>
            </form>
        </div>
        <!-------------------------↓提交------------------------->
        <div class="dibu">
            <div class="anniu">
                <input id="register" type="button" class="button" onclick="Subm();"
                    value="提交注册信息" />
            </div>
        </div>
    </div>

</body>
</html>
