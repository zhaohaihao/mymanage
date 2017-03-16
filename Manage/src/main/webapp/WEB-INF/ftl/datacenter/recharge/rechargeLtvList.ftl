<#include "../../common/globalDef.ftl">
<@dcList "${siteUrl}/datacenter/rechargeLtvList" 0>

<div class="widget-content"  id="tableContainer" style="overflow:auto;">
	<table class="table table-striped table-bordered table-hover" style="min-width:950px;">
		<thead>
			<tr>
				<th colspan="100">LTV</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>日期</th>
				<th>2天LTV</th>
				<th>3天LTV</th>
				<th>4天LTV</th>
				<th>5天LTV</th>
				<th>6天LTV</th>
				<th>7天LTV</th>
				<th>15天LTV</th>
				<th>30天LTV</th>
			</tr>
		</thead>
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.logtime?date!}</td>
			<td>#{item.day2Ltv ;m0M4}</td>
			<td>#{item.day3Ltv ;m0M4}</td>
			<td>#{item.day4Ltv ;m0M4}</td>
			<td>#{item.day5Ltv ;m0M4}</td>
			<td>#{item.day6Ltv ;m0M4}</td>
			<td>#{item.day7Ltv ;m0M4}</td>
			<td>#{item.day15Ltv ;m0M4}</td>
			<td>#{item.day30Ltv ;m0M4}</td>
		</tr>
	</#list>
		</tbody>
	</table>
	
	
</div>
<div class="widget-foot">
	<@pagination page "topForm"/>
</div>
<@dcChart "chartDiv" 'LTV' "'2天LTV','3天LTV','4天LTV','5天LTV','6天LTV','7天LTV','15天LTV','30天LTV'"  >
	xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : [<#list page.items?reverse as item>'${item.logtime?string("MM-dd")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'2天LTV',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.day2Ltv!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'3天LTV',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.day3Ltv!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'4天LTV',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.day4Ltv!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'5天LTV',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.day5Ltv!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'6天LTV',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.day6Ltv!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'7天LTV',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.day7Ltv!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'15天LTV',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.day15Ltv!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'30天LTV',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.day30Ltv!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        }
		    ]
</@dcChart>
</@dcList>
