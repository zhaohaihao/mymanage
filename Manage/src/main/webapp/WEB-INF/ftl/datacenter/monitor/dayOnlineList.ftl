<#include "../../common/globalDef.ftl">
<@dcList "${siteUrl}/datacenter/dayOnlineList" 0>

<@dcChart "chartDiv" '每日在线统计' "'活跃人数','最高在线人数','平均在线人数'"  >
	xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : [<#list page.items?reverse as item>'${item.logtime?string("MM-dd")!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'活跃人数',
		            type:'line',
		            itemStyle: {normal: {areaStyle: {type: 'default'}}},
		            data:[<#list page.items?reverse as item>'${item.dayactv?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'最高在线人数',
		            type:'line',
		            itemStyle: {normal: {areaStyle: {type: 'default'}}},
		            data:[<#list page.items?reverse as item>'${item.maxcounts?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'平均在线人数',
		            type:'line',
		            itemStyle: {normal: {areaStyle: {type: 'default'}}},
		            data:[<#list page.items?reverse as item>'${item.avgcounts?default(0)}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        }
		    ]
</@dcChart>


<div class="widget-content"  id="tableContainer" style="overflow:auto;">
	<table class="table table-striped table-bordered table-hover" style="min-width:950px;">
		<thead>
			<tr>
				<th colspan="100">每日在线统计</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>日期</th>
				<th>活跃人数</th>
				<th>最高在线人数</th>
				<th>平均在线人数</th>
				<th>最高在线时长</th>
				<th>平均在线时长</th>
				<th>总在线时长</th>
			</tr>
		</thead>
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.logtime?date!}</td>
			<td>${item.dayactv?default(0)}</td>
			<td>${item.maxcounts?default(0)}</td>
			<td>${item.avgcounts?default(0)}</td>
			<td><#if item.maxonlinetime?default(0) gt 60*60*24>${(item.maxonlinetime?default(0)/60/60/24)?string('#.##')}天<#elseif item.maxonlinetime?default(0) gt 60*60>${(item.maxonlinetime?default(0)/60/60)?string('#.##')}小时<#elseif item.maxonlinetime?default(0) gt 60>${(item.maxonlinetime?default(0)/60)?string('#.##')}分<#else>${item.maxonlinetime?default(0)}秒</#if></td>
			<td><#if item.avgonlinetime?default(0) gt 60*60*24>${(item.avgonlinetime?default(0)/60/60/24)?string('#.##')}天<#elseif item.avgonlinetime?default(0) gt 60*60>${(item.avgonlinetime?default(0)/60/60)?string('#.##')}小时<#elseif item.avgonlinetime?default(0) gt 60>${(item.avgonlinetime?default(0)/60)?string('#.##')}分<#else>${item.avgonlinetime?default(0)}秒</#if></td>
			<td><#if item.sumonlinetime?default(0) gt 60*60*24>${(item.sumonlinetime?default(0)/60/60/24)?string('#.##')}天<#elseif item.sumonlinetime?default(0) gt 60*60>${(item.sumonlinetime?default(0)/60/60)?string('#.##')}小时<#elseif item.sumonlinetime?default(0) gt 60>${(item.sumonlinetime?default(0)/60)?string('#.##')}分<#else>${item.sumonlinetime?default(0)}秒</#if></td>
		</tr>
	</#list>
		</tbody>
	</table>
	
	
</div>
<div class="widget-foot">
	<@pagination page "topForm"/>
</div>


</@dcList>
