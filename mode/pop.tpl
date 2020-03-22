<script src="<{$zpf.theme_url}>scripts/tools.js" charset="utf-8"></script>
<style type="text/css">
html, body{
	margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
}
</style>
<!-- 筛选区 -->
<div style="width:100%;">

	<div class="mini-toolbar" style="border-bottom:0; padding:5px;">
		<h1>窗口栏</h1>
	</div>
	<!-- 工具栏 开始 -->
	<div class="mini-toolbar" style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
			<tr>
				<td style="width:100%;">
					<a class="mini-button" iconCls="icon-add" id="show" onclick="show" plain="true" tooltip="弹出窗口...">弹出窗口</a>
				</td>
			</tr>
		</table>
	</div>
		<!-- 工具栏 结束 -->
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
	 /**
	  * 显示窗口
	  * @return {[type]} [description]
	  */
	 function show() {
		 var file = '?r=webend.console&a=pages/mode/pop-form&token='+zpf.token;
		 var data =  { action: "new" };
		 var onload_func = function(contentWindow){
			 mini.alert('onload_func')
			 //调用 iframen 内的方法
			 contentWindow.SetData(data);
		 };
		 var destroy_func = function(){
			mini.alert('destroy_func')
	   };
		 	pop(
					file,
					data,
					'新增',
					onload_func,
					destroy_func,
			);
  	}

		/**
		 * pop弹框
		 * @param  {String} file                文件路径
		 * @param  {Object} [data={}]           数据
		 * @param  {String} [title='新增']     	窗口标题
		 * @param  {[type]} [onload_func=null]  窗口加载时方法 第一个固定参数是iframe的contentWindow
		 * @param  {[type]} [destroy_func=null] 窗口销毁后方法 第一个固定参数是 mini.open 的 action
		 * @param  {Number} [width=800]         窗口宽度
		 * @param  {Number} [height=550]        窗口高度
		 * @return {[type]}
		 */
		function pop(file,data={},title='新增',onload_func = null ,destroy_func=null,width=800,height=550){
				mini.open({
				targetWindow: window,
				url: file,
				title: title, width: width, height: height,
				onload: function () {
					if(onload_func){
						if('function' != typeof(onload_func)) console.error('pop function param:'+onload_func+'not a function');
						var iframeContentWindow = this.getIFrameEl().contentWindow;
						onload_func(iframeContentWindow);
					}
				},
				ondestroy: function (action) {
					if(destroy_func){
						if('function' != typeof(destroy_func)) console.error('pop function param:'+destroy_func+'not a function');
						destroy_func(action);
					}
				}
			});
		}

</script>
