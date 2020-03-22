<script src="<{$zpf.theme_url}>scripts/tools.js" charset="utf-8"></script>
<style type="text/css">
html, body{
	margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
}
</style>
<!-- 筛选区 -->
<div style="width:100%;">

	<div class="mini-toolbar" style="border-bottom:0; padding:5px;">
		<h1>表单验证</h1>
	</div>
	<!-- 筛选区 开始 -->
	<div class="mini-toolbar" style="border-bottom:0;padding:3px;">
		<form id="validateForm" class="" method="get">
		<table border="0">
			<tr>
				<td>用户编号:</td><td><input name="user_id" class="mini-textbox" required='true' requiredErrorText='用户编号不能为空' onenter="validate"/></td>
				<td>用户名称：</td><td><input name="uname" class="mini-textbox" required='true' onenter="validate"/></td>
				<td><a class="mini-button" onclick="validate">验证</a></td>
			</tr>
			<tr>
		</table>
		</form>
	</div>
		<!-- 筛选区 结束 -->
</div>


<style media="screen">
	table td{ font-size:12px; /*text-align: right;*/}
	h1 { padding-left:30px; }
	#readonlyform table td{margin-left: 40px;}
	.desc-box{border:1px solid #aaa;width: 80%;margin-top: 20px;padding:20px;position: relative;}
	.desc-box h3{color: #aaa;position: absolute;background: #fff;top:-24px;}
	.fit-widht .mini-textbox{width: 300px;}
</style>
<script type="text/javascript">
	 mini.parse();//初始化
	 var validateForm = new mini.Form("#validateForm");//筛选区表单对象
	 function validate(){
		 var bool = validForm(validateForm);
		 mini.alert(bool);
	 }

	 /**
		* 检验表单数据
		* @param  obj form 表单对象
		* @return bool     true/false 表单验证通过/失败
		*/
	 function validForm(form) {
		 var isvalid = form.validate();
		 if(!isvalid){
			 mini.alert(form.getErrorTexts());
		 }
		 return isvalid;
	 }
</script>
