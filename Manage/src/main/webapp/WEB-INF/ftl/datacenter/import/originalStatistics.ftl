<#include "../../common/globalDef.ftl">
<@simpleList 1650>
<style type="text/css">
	#page{width: 500px; margin: 0 auto; text-align: left;}
	#test{width: 212px; padding: 2px; height: 22px; border: 1px solid #ddd; margin: 0 5px 0 0; display:none;}
	#test option{padding: 2px 5px;}
	#test option:first-child{display: none;}
	#pre{position:relative; float: right;}
	#over_text{width: 185px; padding: 2px 15px 2px 5px; margin-bottom: -1px; background: url(${imgUrl}/dropdown.png) no-repeat scroll right center; border: 1px solid #ccc; box-shadow: 0 1px 0 0 #eee inset; cursor: default;}
	#over_text:focus{cursor: text;}
	#over_div{width: 185px; border: 1px solid #333; border-radius: 0 0 3px 3px; display: none; position:absolute;}
	.soption{display: block; padding: 2px 5px; position:relative; background-color:#FFF;}
	.soption:hover{background: #1E90FF; color:#fff; padding: 1px 5px;}
</style>

<form name="defaultForm" action="${siteUrl}/datacenter/originalStatistics" method="post" >
<input type="hidden" id="cidList" name="cidList" value="${cidList!}">
<div class="widget-head">
	<div class="pull-left" style="height:33px;">
		<button type="button" class="btn btn-success" onclick="commitTable()">搜索</button>
	</div>
	<div class="pull-right" style="height:33px;">
		<button type="button" class="btn btn-success" onclick="exportExcel()">导出</button>&nbsp;
		<button type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>&nbsp;
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader">
	<table class="table table-striped table-bordered table-hover" style="min-width:1600px;">
		<thead class="fixedHeader">
		<tr>
			<th style="width:110px;">
				<@shDateBeginEnd "logDateSh" example.logDateSh! />
			</th>
			<th style="width:135px;">
				<select class="form-control" name="kindId">
		        	<option value="" <#if !example.kindId?? >selected="selected"</#if>>请选择</option>
		        	<#if otGameKindList?exists>
			        <#list otGameKindList as item>
				        <option <#if example.kindId?? && example.kindId==item.id>selected="selected"</#if> value="${item.id}">
				        	${item.name}
				        </option>
			        </#list>
			        </#if>
		        </select>
		    </th>
		    <th style="width:120px;">
		    	<select class="form-control" name="platformId">
		        	<option value="" <#if !example.platformId?? >selected="selected"</#if>>请选择</option>
			        <#list otPlatformList as item>
				        <option <#if example.platformId?? && example.platformId==item.id>selected="selected"</#if> value="${item.id}">
				        	${item.name}
				        </option>
			        </#list>
		        </select>
		    </th>
		    <th style="width:120px;">
		    	<input type="button" class="btn btn-success" onclick="showSimplePop('${siteUrl}/datacenter/screenChannelPage?cidList=${cidList!}','筛选渠道')" value="筛选渠道">
		    </th>
			<th style="width:200px;"></th>
			<th style="width:200px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:120px;"></th>
			<!--隐藏
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			<th style="width:100px;"></th>
			-->
		</tr>
		</thead>
		<thead>
			<tr>
				<@seqTh page "defaultForm" "logDate" >日期</@seqTh>
				<@seqTh page "defaultForm" "kindId" >游戏</@seqTh>
				<@seqTh page "defaultForm" "platformId" >平台</@seqTh>
				<@seqTh page "defaultForm" "channelId" >渠道商</@seqTh>
				<@seqTh page "defaultForm" "subId" >子渠道号</@seqTh>
				<th>子渠道名</th>
				<@seqTh page "defaultForm" "payAmount" >充值金额</@seqTh>
				<@seqTh page "defaultForm" "payPl" >付费用户</@seqTh>
				<@seqTh page "defaultForm" "newPl" >新增用户</@seqTh>
				<@seqTh page "defaultForm" "actPl" >活跃用户</@seqTh>
				<@seqTh page "defaultForm" "totalPl" >累计用户</@seqTh>
				<@seqTh page "defaultForm" "day1Remain" >次日留存</@seqTh>
				<!--隐藏
				<@seqTh page "defaultForm" "resource1" >资源位-免</@seqTh>
				<@seqTh page "defaultForm" "resource2" >资源位-畅</@seqTh>
				<@seqTh page "defaultForm" "zbzxDay1Remain" >次日留存</@seqTh>
				<@seqTh page "defaultForm" "zbzxDay3Remain" >3日留存</@seqTh>
				<@seqTh page "defaultForm" "zbzxDay7Remain" >7日留存</@seqTh>
				-->
			</tr>
		</thead>
	</table>
	
	
</div>
<div class="widget-content autoTbody">
	<table class="table table-striped table-bordered table-hover" style="min-width:1600px;">
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.logDate?date!}</td>
			<td>
				<#if item.kindId?? ><#list otGameKindList as rollItem>
			    	<#if rollItem.id==item.kindId>
			    		${rollItem.name}<#break/>
			    	</#if>
			    </#list></#if>
			</td>
			<td>
				<#if item.platformId?? && item.platformId!=0><#list otPlatformList as rollItem>
			    	<#if rollItem.id==item.platformId>
			    		${rollItem.name}<#break/>
			    	</#if>
			    </#list></#if>
			</td>
			<td>
				<#if item.channelId?? && item.channelId!=0><#list otChannelList as rollItem>
			    	<#if rollItem.id==item.channelId>
			    		${rollItem.name}<#break/>
			    	</#if>
			    </#list></#if>
			</td>
			<td>${item.subId!}</td>
			<td>
				<#if item.subId??><#list subChannelList as rollItem>
			    	<#if rollItem.code==item.subId && rollItem.kindId==item.kindId>
			    		${rollItem.name!}<#break/>
			    	</#if>
			    </#list></#if>
			</td>
			<td><@parseNum item.payAmount/></td>
			<td>${item.payPl!}</td>
			<td>${item.newPl!}</td>
			<td>${item.actPl!}</td>
			<td>${item.totalPl!}</td>
			<td><@parseNum2 item.day1Remain*100/></td>
			<!--隐藏
			<td>${item.resource1!}</td>
			<td>${item.resource2!}</td>
			<td>#{item.zbzxDay1Remain*100;m0M2}%</td>
			<td>#{item.zbzxDay3Remain*100;m0M2}%</td>
			<td>#{item.zbzxDay7Remain*100;m0M2}%</td>
			-->
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

<script type="text/javascript">
	function exportExcel(){
		document.defaultForm.action="${siteUrl}/datacenter/makeOriginalExcel"; 
		defaultForm.submit();
	}
	
	function commitTable(){
		document.defaultForm.action="${siteUrl}/datacenter/originalStatistics"; 
		defaultForm.submit();
	}
</script>