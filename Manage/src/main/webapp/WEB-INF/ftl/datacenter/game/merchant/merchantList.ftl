<#include "../../../common/globalDef.ftl">
<@simpleList 850>
<form name="defaultForm" id="merchantForm" action="${siteUrl}/datacenter/merchantList" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
		<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/merchantAddPage','添加平台账号')" value="添加">
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
			<th><input type="text" name="merName" value="${example.merName!}" class="form-control" style="width:120px;"/></th>
			<th>
			<!--选择游戏-->
				<select class="form-control" name="kindId" style="width:120px;">
		        	<option value="" <#if example.kindId??>selected="selected"</#if>>-选择游戏-</option>
			        <#list gameKindList as item>
			        <option <#if example.kindId?? && example.kindId==item.kindId>selected="selected"</#if> value="${item.kindId!}">${item.gameName!}</option>
			        </#list>
		        </select>
	        </th>
	        <th style="width:300px;"></th>
	        <th style="width:120px;"></th>
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "mer_no" >游戏平台账号</@seqTh>
				<@seqTh page "defaultForm" "mer_name" >游戏平台名称</@seqTh>
				<@seqTh page "defaultForm" "kind_id" >游戏</@seqTh>
				<@seqTh page "defaultForm" "pri_key" >签名密钥</@seqTh>
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
			<td>${item.merNo!}</td>
			<td>${item.merName!}</td>
			<td>
				<#list gameKindList as g>
                     <#if item.kindId?exists && g.kindId = item.kindId>${g.gameName}</#if>
	         	</#list>
			</td>
			<td>${item.priKey!}</td>
			<td>
				<input type="button" class="btn btn-xs btn-danger" onclick="deleteConfirm('merchantForm','${siteUrl}/datacenter/merchantDel?merNo=${item.merNo}')" value="删除">
				<input type="button" class="btn btn-xs btn-warning" onclick="showSimplePop('${siteUrl}/datacenter/merchantEditPage?merNo=${item.merNo}','修改平台账号')" value="修改">
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