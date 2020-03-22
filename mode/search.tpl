<script src="<{$zpf.theme_url}>scripts/tools.js" charset="utf-8"></script>
<style type="text/css">
html, body{
	margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
}
</style>
<!-- 筛选区 -->
<div style="width:100%;">

	<div class="mini-toolbar" style="border-bottom:0; padding:5px;">
		<h1>搜索栏</h1>
	</div>
	<!-- 筛选区 开始 -->
	<div class="mini-toolbar" style="border-bottom:0;padding:3px;">
		<form id="searchForm" class="" method="get">
		<table border="0">
			<tr>
				<td>用户编号:</td><td><input name="user_id" class="mini-textbox" onenter="search"/></td>
				<td>用户名称：</td><td><input name="uname" class="mini-textbox" onenter="search"/></td>
				<td><a class="mini-button" onclick="search">查找</a></td>
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
	 var searchForm = new mini.Form("#searchForm");//筛选区表单对象
	 function search(){
		 var formData = searchForm.getData();
		 console.log(formData);
		 mini.alert('表单数据已获取');
	 }
</script>
