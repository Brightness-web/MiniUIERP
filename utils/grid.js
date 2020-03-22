/*
 * @Author: Brightness
 * @Date: 2020-03-22 15:30:55
 * @LastEditors: Brightness
 * @LastEditTime: 2020-03-22 17:37:47
 * @Description: 基于miniui 的表格对象
 */



/**
 * 表格对象
 * @param       {Object} grid                             miniui 的表格对象
 * @param       {String} url                              表格数据请求url
 * @param       {String} [idField=null]              唯一字段 存在时，添加数据会检验数据是否存在
 * @param       {Number} [pageSize=18]                    每页显示多数行
 * @param       {Array}  [sizeList=[8,18,28]]       每页显示选项
 * @param       {String} [dataField='data.result.data']   数据子字段
 * @param       {String} [totalField='data.result.total'] 总条数字段
 * @constructor
 */
function Grid(grid,url,idField=null,pageSize=18,sizeList=[8, 18,28],dataField='data.result.data',totalField='data.result.total'){
 this.grid = grid,
 this.config = {
   url: url,
   idField:idField,
   dataField:dataField,
   totalField:totalField,
   emptyText:'暂无数据',
   showEmptyText:true,
   allowResize:true,
   sizeList: sizeList,
   pageSize: pageSize,
   columns: {},
   editNextOnEnterKey:true,
   allowAlternating: true, //显示间行色
   multiSelect: true,
   allowUnselect:true,
   fitColumns: false, //使用过滤行必须设定这个全充满，否则会有列对齐问题。
   allowCellEdit: false,
   allowCellSelect: true,
   showFilterRow: false,
   showModified: true,
   allowMoveColumn: false
 };

 this.init = function(columns,config=null){
     var gridConfig = this.config;
     if(null !=config){
       if('object' != typeof(config)){
         console.error('Grid init error: '+config+'not a json object');
         return ;
       }
       // 合并和替换配置
        gridConfig = Object.assign(gridConfig,config);
     }
     gridConfig.columns = columns;
     this.grid.set(gridConfig);
     this.grid.load();
 }
}
/**
* 表格添加一条数据
* @param  {Object} rowData 数据Object，必须包含主键数据
* @return {Boolean}         是否添加成功
*/
Grid.prototype.add = function (rowData,idField=null) {
 if(!idField){
   idField = this.grid.idField;
}
// 存在 idField 判断唯一
 if(idField){
   var row = this.grid.findRow(function(row){
    if(row[idField] == rowData[idField]) return true;
  });
  if(row){
    mini.alert('条目已存在');
    return false;
  }
 }
 this.grid.addRow(rowData);
 return true;
};
/**
* 表格更新一条数据
* @param  {Object} rowData       	数据Object，必须包含主键数据
* @param  {String} [idField=null] 主键字段
* @return {Boolean}
*/
Grid.prototype.update = function(rowData,idField=null){
 if(!idField){
    idField = this.grid.idField;
 }
 if(!idField){
   console.error('Grid update error:update function not idField');
   return false;
 }
 //根据主键获取一行数据
 var row = this.grid.findRow(function(row){
   if(row[idField] == rowData[idField]) return true;
 });

 if(!row){
   mini.alert('未找到要修改的一行数据');
   return false;
 }

 this.grid.updateRow(row,rowData);
 return true;
}

/**
* 删除表格勾选的数据
* @return {[type]} [description]
*/
Grid.prototype.remove=function(){
 var grid = this.grid;
 var rows = grid.getSelecteds();
 if(0 >= rows.length){
   mini.alert('请勾选行');
   return false;
 }
 mini.confirm('请确定是否要移除记录','删除记录',function(action){
   if('ok' == action){
     grid.removeRows(rows);
   }
 });
}

	 /**
	  * 根据主键选中数据
	  * @param  {Array}   [ids=[]]           主键值
	  * @param  {Boolean} [returnRows=false] 是否返回选中的数据
	  * @param  {[type]}  [idField=null]    	主键
	  * @param  {Boolean} [fireEvent=false]  是否激发选择事件，miniui的事件
	  * @return {[type]}                     [description]
	  */
	 Grid.prototype.selectByIds = function (ids=[],returnRows=false,idField = null,fireEvent=false) {
    if(!idField){
      idField = this.grid.idField;
    }
    if(!idField){
      console.error('Grid selectById error: not idField param');
      return false;
    }
    var grid = this.grid;
    var rows = [];
    ids.forEach(function(id){
      var row = grid.findRow(function (row) {
        if(row[idField] == id) return true;
       });
       if(row){
         grid.select(row,fireEvent);
         rows.push(row);
       }
    });
    if(returnRows){
      return rows;
    }else {
      return true;
    }

 }

