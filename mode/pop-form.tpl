<script src="<{$zpf.theme_url}>scripts/tools.js" charset="utf-8"></script>
<style type="text/css">
html, body{
  margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
}
form {
  display: inline;
}
</style>

<div style="width:100%;">
  <!-- 工具栏 开始 -->
  <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
    <table style="width:100%;">
      <tr>
        <td style="width:100%;">
          <a id='createBtn' class="mini-button" iconCls="icon-save" onclick="onCreate">保存</a>
          <a class="mini-button" iconCls="icon-cancel" plain="true" onclick="onCancel">关闭</a>
        </td>
      </tr>
    </table>
  </div>
  <div class="mini-fit">
    iframe 内容
  </div>
</div>

<style media="screen">
table td{ font-size:12px;}
.desc-box{border:1px solid #aaa;width: 80%;margin-top: 20px;padding:20px;position: relative;}
.desc-box h3{color: #aaa;position: absolute;background: #fff;top:-24px;}
.fit-widht .mini-textbox{width: 300px;}
.mini-textbox-border{padding: 0px;}
.mini-buttonedit-border{padding-left: 0px; }
.mini-textarea .mini-textbox-border{padding-left: 0px;}
[readonly]{background-color:#bcd9f55e; }
input,textarea{padding-left:10px;}
</style>

<script type="text/javascript">
    mini.parse();


  /**
   * 当前页面方法 开始
   */
    function onCreate(){
      mini.alert('iframe onCreate');
    }

    function onCancel(){
        window.CloseOwnerWindow();
    }
    /**
     * 当前页面方法 结束
     */
    ////////////////////////////////////////////////
  /**
   * 父级页面可调用方法 开始
   */
       function SetData(data) {
          console.log('iframe SetData data',data);
       }

       /**
        * 父级页面可调用方法 结束
        */
</script>
