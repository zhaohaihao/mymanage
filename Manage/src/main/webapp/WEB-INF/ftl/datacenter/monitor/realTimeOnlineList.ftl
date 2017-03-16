<#include "../../common/globalDef.ftl">
<@dcList "${siteUrl}/datacenter/realTimeOnlineList" 1>

<div class="widget-content"  id="tableContainer" style="overflow:auto;">

<@dcChart "chartDiv" '实时在线人数' "'当天${date0?date!}','1天前${date1?date!}','3天前${date3?date!}','7天前${date7?date!}'"  >
	xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : [<#list onlines as o><#if o_index gt 0>,</#if>'${o.logtime!}'</#list>]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'当天${date0?date!}',
		            type:'line',
		            symbol:'none',
		            smooth:true,
		            data:[<#list onlines as o><#if o_index gt 0>,</#if>'${o.counts?default(0)}'</#list>]
		        },
		        {
		            name:'1天前${date1?date!}',
		            type:'line',
		            symbol:'none',
		            smooth:true,
		            data:[<#list onlines as o><#if o_index gt 0>,</#if>'${o.counts1?default(0)}'</#list>]
		        },
		        {
		            name:'3天前${date3?date!}',
		            type:'line',
		            symbol:'none',
		            smooth:true,
		            data:[<#list onlines as o><#if o_index gt 0>,</#if>'${o.counts3?default(0)}'</#list>]
		        },
		        {
		            name:'7天前${date7?date!}',
		            type:'line',
		            symbol:'none',
		            smooth:true,
		            data:[<#list onlines as o><#if o_index gt 0>,</#if>'${o.counts7?default(0)}'</#list>]
		        }
		    ]
</@dcChart>

	<table class="table table-striped table-bordered table-hover" style="min-width:950px;">
		<thead>
			<tr>
				<th colspan="100">实时在线人数</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>峰值表</th>
				<th>当天</th>
				<th>1天前</th>
				<th>3天前</th>
				<th>7天前</th>
				<th>历史最高</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>峰值时间</td>
				<td><#if dayMax??>${dayMax.logtime!}</#if></td>
				<#if dols??><#list dols as dol><td>${dol.winningTime!}</td></#list>
				<#if dols?size = 1 ><td></td><td></td></#if><#if dols?size = 2 ><td></td></#if>
				<#else><td></td><td></td><td></td></#if>
				<td><#if hisMax??>${hisMax.logtime?string("yyyy-MM-dd")!}&nbsp;${hisMax.winningTime!}</#if></td>
			</tr>
			<tr>
				<td>最高值</td>
				<td><#if dayMax??>${dayMax.counts?default(0)}</#if></td>
				<#if dols??><#list dols as dol><td>${dol.maxcounts?default(0)}</td></#list>
				<#if dols?size = 1 ><td></td><td></td></#if><#if dols?size = 2 ><td></td></#if>
				<#else><td></td><td></td><td></td></#if>
				<td><#if hisMax??>${hisMax.maxcounts?default(0)}</#if></td>				
			</tr>
			<tr>
				<td>平均值</td>
				<td><#if dayMax??>${dayMax.avgCounts?string("#.##")?default(0)}</#if></td>
				<#if dols??><#list dols as dol><td>${dol.avgcounts?string("#.##")?default(0)}</td></#list>
				<#if dols?size = 1 ><td></td><td></td></#if><#if dols?size = 2 ><td></td></#if>
				<#else><td></td><td></td><td></td></#if>
				<td><#if hisMax??>${hisMax.avgcounts?default(0)}</#if></td>
			</tr>
		</tbody>
	</table>
	
	<table class="table table-striped table-bordered table-hover" style="min-width:950px;">
		<thead>
			<tr>
				<th>时间</th>
				<th>当天在线人数</th>
				<th>1天前在线人数</th>
				<th>3天前在线人数</th>
				<th>7天前在线人数</th>
			</tr>
		</thead>
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.logtime!}</td>
			<td>${item.counts?default(0)}</td>
			<td>${item.counts1?default(0)}</td>
			<td>${item.counts3?default(0)}</td>
			<td>${item.counts7?default(0)}</td>
		</tr>
	</#list>
		</tbody>
	</table>
	
	
	
	
</div>
<div class="widget-foot">
	<@pagination page "topForm"/>
</div>

</@dcList>
