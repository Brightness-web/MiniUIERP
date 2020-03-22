<script src="<{$zpf.theme_url}>scripts/tools.js" charset="utf-8"></script>
<script src="<{$zpf.theme_url}>scripts/utils/pop.js" charset="utf-8"></script>
<script src="<{$zpf.theme_url}>scripts/utils/grid.js" charset="utf-8"></script>


<div class="mini-toolbar" style="border-bottom:0;padding:0px;">
  <table style="width:100%;">
    <tr>
      <td style="width:100%;">
        <a  class="mini-button" iconCls="icon-add"  onclick="showSelect" data-options="{name:'user_id',tname:'uname'}">选择</a>
      </td>

    </tr>
  </table>
</div>


<script type="text/javascript">
function showSelect(e){
  var btnEdit = this;
  var fname = e.sender.name;//控件的name属性值
  var textname = e.sender.tname?e.sender.tname:false;//控件要显示内容的字段
  var onload_func = function(iframeContentWindow){
        var dataUrl = zpf.createServiceLink("","CaricaUser", "getList",true);
        mwColumns.__retColumns = [];//清空表格配置
        // mwColumns.addIndexCol(); //创建索引列
        mwColumns.addCheckCol(); //创建勾选框
        mwColumns.addCol(fname, "用户编号", 200);
        if(textname){
          mwColumns.addCol(textname, "用户名称", 200);
        }
        var cols = mwColumns.get();
      iframeContentWindow.SetGrid(dataUrl,'user_id',cols,true,[1,2]);
  }

  var destroy_func = function(iframeContentWindow,action){
    if (action == "ok") {
        var data = iframeContentWindow.GetSelecteds();
        data = mini.clone(data);
        console.log(data);
    }
  }
  
  pop(
    '?r=webend.console&a=pages/mode/SelectWindow&token='+zpf.token,
    '选择用户',
    onload_func,
    destroy_func,
    650,
    380
  );
}
</script>
