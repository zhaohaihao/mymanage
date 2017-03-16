<#include "../../../common/globalDef.ftl">
<@simpleList 850>
<form name="defaultForm" id="platformForm" action="${siteUrl}/datacenter/platformList" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/platformAddPage','添加平台')" value="添加">
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
			<th><input type="text" name="platform" value="${example.platform!}" class="form-control" style="width:120px;"/></th>
			<th><input type="text" name="platformName" value="${example.platformName!}" class="form-control" style="width:120px;"/></th>
	        <th style="width:120px;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "platform" >平台编号</@seqTh>
				<@seqTh page "defaultForm" "platform_name" >平台名称</@seqTh>
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
			<td>${item.platform!}</td>
			<td>${item.platformName!}</td>
			<td>
				<input type="button" class="btn btn-xs btn-danger" onclick="deleteConfirm('platformForm','${siteUrl}/datacenter/platformDel?platform2=${item.platform}')" value="删除">
				<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/platformEditPage?platform=${item.platform}','修改平台')" value="修改">
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