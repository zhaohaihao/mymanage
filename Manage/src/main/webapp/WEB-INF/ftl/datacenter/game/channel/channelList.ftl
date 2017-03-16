<#include "../../../common/globalDef.ftl">
<@simpleList 1150>
<form name="defaultForm" id="channelForm" action="${siteUrl}/datacenter/channelList" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/channelAddPage','添加渠道')" value="添加">
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
			<th><input type="text" name="channelId" value="${example.channelId!}" class="form-control" style="width:120px;"/></th>
			<th><input type="text" name="channelName" value="${example.channelName!}" class="form-control" style="width:120px;"/></th>
			<th>
			<!--选择代理商-->
				<select class="form-control" name="platform" style="width:120px;">
		        	<option value="" <#if example.platform??>selected="selected"</#if>>-选择平台-</option>
			        <#list platformList as item>
			        <option <#if example.platform?? && example.platform==item.platform>selected="selected"</#if> value="${item.platform!}">${item.platformName!}</option>
			        </#list>
		        </select>
	        </th>
	        <th style="width:300px;"><input type="text" name="channelDesc" value="${example.channelDesc!}" class="form-control" style="width:120px;"/></th>
	        <th style="width:120px;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "channel_id" >渠道编号</@seqTh>
				<@seqTh page "defaultForm" "channel_name" >渠道名称</@seqTh>
				<@seqTh page "defaultForm" "platform" >平台名称</@seqTh>
				<@seqTh page "defaultForm" "channel_desc" >描述</@seqTh>
				<th>操作</th>
			</tr>
		</thead>
	</table>
	
	
</div>
<div class="widget-content autoTbody"  id="tableContainer" style="overflow:auto;">
	<table class="table table-striped table-bordered table-hover" style="min-width:680px;">
		<tbody>
	<#list page.items as item>
		<tr>  
			<td>${item.channelId!}</td>
			<td>${item.channelName!}</td>
			<td>
				<#list platformList as p>
                     <#if item.platform?exists && p.platform = item.platform>${p.platformName}</#if>
	         	</#list>
			</td>
			<td>${item.channelDesc!}</td>
			<td>
				<input type="button" class="btn btn-xs btn-danger" onclick="deleteConfirm('channelForm','${siteUrl}/datacenter/channelDel?channelId2=${item.channelId}')" value="删除">
				<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/channelEditPage?channelId=${item.channelId}','修改渠道')" value="修改">
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