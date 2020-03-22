<script src="<{$zpf.theme_url}>scripts/tools.js" charset="utf-8"></script>
<script src="<{$zpf.theme_url}>scripts/utils/grid.js" charset="utf-8"></script>
<style type="text/css">
html, body{
	margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
}
</style>
    <div class="mini-toolbar" style="line-height:30px;" borderStyle="border:0;">
          <a class="mini-button" iconCls="icon-ok"  onclick="onOk()">确定</a>
          <a class="mini-button" iconCls="icon-cancel" onclick="onCancel()">关闭</a>
          <span class="separator"></span>
          <a class="mini-button" iconCls="icon-search"  onclick="search()">查询</a>
    </div>
    <div class="mini-toolbar" style="line-height:30px;" borderStyle="border:0;">
      <span>搜索：</span>
      <input id="key" class="mini-textbox" style="width:400px;" onenter="onKeyEnter"/>
    </div>
    <div class="mini-fit">

      <div id="grid1" class="mini-datagrid" style="width:100%;height:100%;"  borderStyle="border-left:0;border-right:0;"></div>

    </div>
<script type="text/javascript">
    mini.parse();
    var grid = mini.get("grid1");


    ////////////////////////////////////////////////////////////////////////////////



    var firstLoad = true;
    var initIds;                   //存放初始数据id，这个作为选中数据。
		//根据主键值选中行
    function selectRowsByIds(ids) {
        if (ids) {
            var rows = [];
						var idField = grid.idField;
            for (var i = 0, l = ids.length; i < l; i++) {
              	var o = grid.findRow(function(row){
									if(row[idField] == ids[i]) return true;
								});
                if (o) rows.push(o);
            }
            grid.selects(rows);
        }
    }
		//设置主键值
    function SetInitIds(ids) {
        initIds = ids;
    }
		//获取选中行
    function GetSelecteds() {
        var rows = grid.getSelecteds();
        return rows;
    }

		/**
		 * 表格默认选中
		 * @param  {[type]} e [description]
		 * @return {[type]}   [description]
		 */
		grid.on("load", function (e) {

				if (firstLoad) {
						firstLoad = false;
						if (initIds) {
								selectRowsByIds(initIds);
						}
				}
		});

    /**
    * 设置表格
    * @param string url 数据路径
    * @param object columns 表格头配置
    * @param bool multiSelect 是否可以多选
    * @param string ids 初始数据id，这个作为选中数据。 格式是数组
    **/
    function SetGrid(url,idField,columns,multiSelect = false,ids=null){
				var select_grid = new Grid(grid,url,idField);
				select_grid.init(columns,{multiSelect:multiSelect});
				if(ids){
					SetInitIds(ids);
				}
    }



      //获取选择的数据
      //@param fname 值的字段名，text显示内容的字段名
    function GetData(fname,text=false) {
        var rows = grid.getSelecteds();
        var ids = [], texts = [];
        for (var i = 0, l = rows.length; i < l; i++) {
            var row = rows[i];
            ids.push(row[fname]);
						if(text){
							texts.push(row[text]);
						}else {
							texts.push(row[fname]);
						}
        }
        var data = {};
        data.id = ids.join(",");
        data.text = texts.join(",");
        return data;
    }

		/////////////////////////////////////////////////////////////////////
		/**
		 * 数据搜索
		 * @return {[type]} [description]
		 */
		function search() {
        var key = mini.get("key").getValue();
        grid.load({ keywords: key });
    }


    function onKeyEnter(e) {
        search();
    }

		function setSearchKey(data){
			 data = mini.clone(data);
				mini.get('key').setValue(data);
		}





    //////////////////////////////////
		/**
		 * 关闭窗口
		 * @param       {[type]} action [description]
		 * @constructor
		 */
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }

    function onOk() {
        CloseWindow("ok");
    }

    function onCancel() {
        CloseWindow("cancel");
    }


</script>
