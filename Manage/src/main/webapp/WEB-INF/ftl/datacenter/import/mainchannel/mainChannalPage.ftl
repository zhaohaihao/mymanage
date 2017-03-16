<#include "../../../common/globalDef.ftl">
<@simpleList 850>
<form name="defaultForm" id="channelForm" action="${siteUrl}/datacenter/import/mainChannalPage" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/import/mainChannalAddPage','添加渠道')" value="添加">
	</div>
	<div class="pull-right">
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:800px;">
		<thead class="fixedHeader">
		<tr>
			<th style="width:120px;"><input type="text" name="id" value="${example.id!}" class="form-control" style="width:100px;"/></th>
			<th style="width:120px;"><input type="text" name="name" value="${example.name!}" class="form-control" style="width:100px;"/></th>
	        <th style="width:120px;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "id" >渠道号</@seqTh>
				<@seqTh page "defaultForm" "name" >渠道名</@seqTh>
			    <th>操作</th>
			</tr>
		</thead>
	</table>
	
	
</div>
<div class="widget-content autoTbody"  id="tableContainer" style="overflow:auto;">
	<table class="table table-striped table-bordered table-hover" style="min-width:800px;">
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.id!}</td>
			<td>${item.name!}</td>
			<td>
				<input type="button" class="btn btn-xs btn-danger" onclick="deleteConfirm('channelForm','${siteUrl}/datacenter/import/mainChannelDel?id=${item.id}')" value="删除">
				<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/import/mainChannalEditPage?id=${item.id}','修改渠道')" value="修改">
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