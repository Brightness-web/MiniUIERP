/*
 * @Author: Brightness
 * @Date: 2020-03-20 19:23:14
 * @LastEditors: Brightness
 * @LastEditTime: 2020-03-22 18:28:46
 * @Description: pop弹框
 */


/**
		 * pop弹框
		 * @param  {String} file                文件路径
		 * @param  {String} [title='新增']     	窗口标题
		 * @param  {[type]} [onload_func=null]  窗口加载时方法 第一个固定参数是iframe的contentWindow
		 * @param  {[type]} [destroy_func=null] 窗口销毁后方法 第一个固定参数是 mini.open 的 action
		 * @param  {Number} [width=800]         窗口宽度
		 * @param  {Number} [height=550]        窗口高度
		 * @return {[type]}
		 */
	function pop(file,title='新增',onload_func = null ,destroy_func=null,width=800,height=550){
        mini.open({
            targetWindow: window,
            url: file,
            title: title, width: width, height: height,
            onload: function (action) {
                if(onload_func){
                    if('function' != typeof(onload_func)) console.error('pop function param:'+onload_func+'not a function');
                    var iframeContentWindow = this.getIFrameEl().contentWindow;
                    onload_func(iframeContentWindow,action);
                }
            },
            ondestroy: function (action) {
                if(destroy_func){
                    if('function' != typeof(destroy_func)) console.error('pop function param:'+destroy_func+'not a function');
                    var iframeContentWindow = this.getIFrameEl().contentWindow;
                    destroy_func(iframeContentWindow,action);
                }
            }
        });
    }
