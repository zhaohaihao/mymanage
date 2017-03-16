<#include "../../../common/globalDef.ftl">
<@simpleList 850>
<form name="defaultForm" id="gameKindForm" action="${siteUrl}/datacenter/gameKindList" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/gameKindAddPage','添加游戏')" value="添加">
	</div>
	<div class="pull-right">
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:680px;">
		<thead class="fixedHeader">
		<tr>
			<th></th>
			<th><input type="text" name="gameName" value="${example.gameName!}" class="form-control" style="width:120px;"/></th>
	        <th style="width:120px;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "kind_id" >游戏类别ID</@seqTh>
				<@seqTh page "defaultForm" "game_name" >游戏名称</@seqTh>
				<th>操作</th>
			</tr>
		</thead>
	</table>
	
	
</div>
<div class="widget-content autoTbody">
	<table class="table table-striped table-bordered table-hover" style="min-width:680px;">
		<tbody>
	<#list page.items as item>
		<tr>  
			<td>${item.kindId!}</td>
			<td>${item.gameName!}</td>
			<td>
				<input type="button" class="btn btn-xs btn-danger" onclick="deleteConfirm('gameKindForm','${siteUrl}/datacenter/gameKindDel?kindId=${item.kindId}')" value="删除">
				<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/gameKindEditPage?kindId=${item.kindId}','修改游戏')" value="修改">
            </td> 
		</tr>
	</#list>
		</tbody>
	</table>
	
	
</div>
<div class="widget-foot">
	<@pagination page "defaultForm"/>
</div>
</form>
</@simpleList>