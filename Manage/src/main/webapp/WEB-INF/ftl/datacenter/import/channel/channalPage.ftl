<#include "../../../common/globalDef.ftl">
<@simpleList 850>
<form name="defaultForm" id="channelForm" action="${siteUrl}/datacenter/import/channalPage" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/import/channelAddPage','添加渠道')" value="添加">
	</div>
	<div class="pull-right">
	    <#if example.cid?? && example.kindId??>
	    <button type="button" class="btn btn-default" onclick="showSimplePopForm('${siteUrl}/datacenter/import/channelEditNamePage','修改渠道名','channelForm')">修改</button>
	    </#if>
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:800px;">
		<thead class="fixedHeader">
		<tr>
		    <th style="width:30px;"></th>
			<th style="width:120px;"><input type="text" name="code" value="${example.code!}" class="form-control" style="width:100px;"/></th>
			<th style="width:120px;"><input type="text" name="name" value="${example.name!}" class="form-control" style="width:100px;"/></th>
			<th>
			<!--选择代理商-->
				<select class="form-control" name="pid" style="width:120px;">
		        	<option value="" <#if example.pid??>selected="selected"</#if>>-选择平台-</option>
			        <#list otPlatformList as item>
			        <option <#if example.pid?? && example.pid==item.id>selected="selected"</#if> value="${item.id!}">${item.name!}</option>
			        </#list>
		        </select>
	        </th>
	        <th>
			<!--选择渠道-->
				<select class="form-control" name="cid" style="width:120px;">
		        	<option value="" <#if example.cid??>selected="selected"</#if>>-选择渠道-</option>
			        <#list otChannelList as item>
			        <option <#if example.cid?? && example.cid==item.id>selected="selected"</#if> value="${item.id!}">${item.name!}</option>
			        </#list>
		        </select>
	        </th>
	        <!--选择游戏-->
	        <th>
				<select class="form-control" name="kindId" style="width:120px;">
		        	<option value="" <#if example.kindId??>selected="selected"</#if>>-选择游戏-</option>
			        <#list otGameKindList as item>
			        <option <#if example.kindId?? && example.kindId==item.id>selected="selected"</#if> value="${item.id!}">${item.name!}</option>
			        </#list>
		        </select>
	        </th>
	        <th style="width:120px;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
			    <th><input type="checkbox" id="chkAll" onclick="checkAll(defaultForm, this.checked);" title="全选"></th>
				<@seqTh page "defaultForm" "code" >子渠道号</@seqTh>
				<@seqTh page "defaultForm" "name" >子渠道名</@seqTh>
				<@seqTh page "defaultForm" "pid" >平台</@seqTh>
				<@seqTh page "defaultForm" "cid" >渠道</@seqTh>
				<@seqTh page "defaultForm" "kindId" >游戏</@seqTh>
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
		    <td><input type="checkbox" name="ids" value="${item.id}"></td>  
			<td>${item.code!}</td>
			<td>${item.name!}</td>
			<td>
				<#list otPlatformList as p>
                     <#if item.pid?exists && p.id = item.pid>${p.name}</#if>
	         	</#list>
			</td>
			<td>
				<#list otChannelList as p>
                     <#if item.cid?exists && p.id = item.cid>${p.name}</#if>
	         	</#list>
			</td>
			<td>
				<#list otGameKindList as p>
                     <#if item.kindId?exists && p.id = item.kindId>${p.name}</#if>
	         	</#list>
			</td>
			<td>
				<input type="button" class="btn btn-xs btn-danger" onclick="deleteConfirm('channelForm','${siteUrl}/datacenter/import/channelDel?id=${item.id}&subId=${item.code!}&kindid=${item.kindId!}')" value="删除">
				<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/import/channelEditPage?id=${item.id}','修改渠道')" value="修改">
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