var regexEnum = 
{
	intege:"^-?[1-9]\\d*$",
	intege1:"^[1-9]\\d*$",
	intege2:"^-[1-9]\\d*$",
	num:"^([+-]?)\\d*\\.?\\d+$",
	num1:"^[1-9]\\d*|0$",
	num2:"^-[1-9]\\d*|0$",
	decmal:"^([+-]?)\\d*\\.\\d+$",
	decmal1:"^[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*$",
	decmal2:"^-([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*)$",
	decmal3:"^-?([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*|0?.0+|0)$",
	decmal4:"^[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*|0?.0+|0$",
	decmal5:"^(-([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*))|0?.0+|0$",

	email:"^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", //�ʼ�
	color:"^[a-fA-F0-9]{6}$",				//��ɫ
	url:"^http[s]?:\\/\\/([\\w-]+\\.)+[\\w-]+([\\w-./?%&=]*)?$",	//url
	chinese:"^[\\u4E00-\\u9FA5\\uF900-\\uFA2D]+$",					//������
	ascii:"^[\\x00-\\xFF]+$",				//��ACSII�ַ�
	zipcode:"^\\d{6}$",						//�ʱ�
	mobile:"^(13|15)[0-9]{9}$",				//�ֻ�
	ip4:"^(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)$",	//ip��ַ
	notempty:"^\\S+$",						//�ǿ�
	picture:"(.*)\\.(jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga)$",	//ͼƬ
	rar:"(.*)\\.(rar|zip|7zip|tgz)$",								//ѹ���ļ�
	date:"^\\d{4}(\\-|\\/|\.)\\d{1,2}\\1\\d{1,2}$",					//����
	qq:"^[1-9]*[1-9][0-9]*$",				//QQ����
	tel:"^(([0\\+]\\d{2,3}-)?(0\\d{2,3})-)?(\\d{7,8})(-(\\d{3,}))?$",	//�绰�����ĺ���(������֤��������,��������,�ֻ���)
	username:"^\\w+$",						//�����û�ע�ᡣƥ�������֡�26��Ӣ����ĸ�����»������ɵ��ַ���
	letter:"^[A-Za-z]+$",					//��ĸ
	letter_u:"^[A-Z]+$",					//��д��ĸ
	letter_l:"^[a-z]+$",					//Сд��ĸ
	idcard:"^[1-9]([0-9]{14}|[0-9]{17})$"	//����֤
}

var aCity={11:"����",12:"����",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"����",82:"����",91:"����"} 

function isCardID(sId){ 
	var iSum=0 ;
	var info="" ;
	if(!/^\d{17}(\d|x)$/i.test(sId)) return "������������֤���Ȼ���ʽ����"; 
	sId=sId.replace(/x$/i,"a"); 
	if(aCity[parseInt(sId.substr(0,2))]==null) return "��������֤�����Ƿ�"; 
	sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2)); 
	var d=new Date(sBirthday.replace(/-/g,"/")) ;
	if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))return "����֤�ϵĳ������ڷǷ�"; 
	for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11) ;
	if(iSum%11!=1) return "������������֤�ŷǷ�"; 
	return true;//aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"��":"Ů") 
} 

//��ʱ�䣬���� (13:04:06)
function isTime(str)
{
	var a = str.match(/^(\d{1,2})(:)?(\d{1,2})\2(\d{1,2})$/);
	if (a == null) {return false}
	if (a[1]>24 || a[3]>60 || a[4]>60)
	{
		return false;
	}
	return true;
}

//�����ڣ����� (2003-12-05)
function isDate(str)
{
	var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
	if(r==null)return false; 
	var d= new Date(r[1], r[3]-1, r[4]); 
	return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
}

//��ʱ�䣬���� (2003-12-05 13:04:06)
function isDateTime(str)
{
	var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/; 
	var r = str.match(reg); 
	if(r==null) return false; 
	var d= new Date(r[1], r[3]-1,r[4],r[5],r[6],r[7]); 
	return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]&&d.getHours()==r[5]&&d.getMinutes()==r[6]&&d.getSeconds()==r[7]);
}