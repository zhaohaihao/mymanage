<#include "../../common/globalDef.ftl">
<@dcList "${siteUrl}/datacenter/nopayRetainList" 0 1800>
<style>
.other-tables{
	float:left;
	background: #fff none repeat scroll 0 0;
    border: 1px solid #c9c9c9;
    border-radius: 3px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
    margin-bottom: 20px;
    margin-top: 10px;
    min-height: 50px;
    position: relative;
}
</style>

<div class="widget-content" style="overflow:auto;">
	<table class="table table-striped table-bordered table-hover" style="min-width:1500px;">
		<thead>
			<tr>
				<th colspan="100">
					非付费留存信息&emsp;&nbsp;
					<input type="button" class="btn btn-xs btn-success" onclick="showCol(1)" value="留存人数">
					<input type="button" class="btn btn-xs btn-success" onclick="showCol(2)" value="留存率">
					<input type="button" class="btn btn-xs btn-success" onclick="showCol(3)" value="全显示">
				</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>日期</th>
				<th>非付费新增用户数</th>
				<th class="col_a">次日留存数</th>
				<th class="col_b">次日留存率</th>
				<th class="col_a">2日留存数</th>
				<th class="col_b">2日留存率</th>
				<th class="col_a">3日留存数</th>
				<th class="col_b">3日留存率</th>
				<th class="col_a">4日留存数</th>
				<th class="col_b">4日留存率</th>
				<th class="col_a">5日留存数</th>
				<th class="col_b">5日留存率</th>
				<th class="col_a">6日留存数</th>
				<th class="col_b">6日留存率</th>
				<th class="col_a">7日留存数</th>
				<th class="col_b">7日留存率</th>
				<th class="col_a">15日留存数</th>
				<th class="col_b">15日留存率</th>
				<th class="col_a">30日留存数</th>
				<th class="col_b">30日留存率</th>
			</tr>
		</thead>
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.logtime?date!}</td>
			<td>${item.dayAdduser!}</td>
			<td class="col_a">${item.days1Login?default(0)}</td>
			<td class="col_b">#{item.day1Rate*100 ;m0M4}%</td>
			<td class="col_a">${item.days2Login!}</td>
			<td class="col_b">#{item.day2Rate*100 ;m0M4}%</td>
			<td class="col_a">${item.days3Login!}</td>
			<td class="col_b">#{item.day3Rate*100 ;m0M4}%</td>
			<td class="col_a">${item.days4Login!}</td>
			<td class="col_b">#{item.day4Rate*100 ;m0M4}%</td>
			<td class="col_a">${item.days5Login!}</td>
			<td class="col_b">#{item.day5Rate*100 ;m0M4}%</td>
			<td class="col_a">${item.days6Login!}</td>
			<td class="col_b">#{item.day6Rate*100 ;m0M4}%</td>
			<td class="col_a">${item.days7Login!}</td>
			<td class="col_b">#{item.day7Rate*100 ;m0M4}%</td>
			<td class="col_a">${item.days15Login!}</td>
			<td class="col_b">#{item.day15Rate*100 ;m0M4}%</td>
			<td class="col_a">${item.days30Login!}</td>
			<td class="col_b">#{item.day30Rate*100 ;m0M4}%</td>
		</tr>
	</#list>
		</tbody>
	</table>
</div>
<div class="widget-foot">
	<@pagination page "topForm"/>
</div>

<@dcChart "chart_a" '留存人数' "'次日留存数','2日留存数','3日留存数','4日留存数','5日留存数','6日留存数','7日留存数','15日留存数','30日留存数'"  >
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
		            name:'次日留存数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days1Login!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'2日留存数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days2Login!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'3日留存数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days3Login!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'4日留存数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days4Login!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'5日留存数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days5Login!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'6日留存数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days6Login!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'7日留存数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days7Login!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'15日留存数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days15Login!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'30日留存数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'${item.days30Login!}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        }
		    ]
</@dcChart>
<@dcChart "chart_b" '留存率(%)' "'次日留存率','2日留存率','3日留存率','4日留存率','5日留存率','6日留存率','7日留存率','15日留存率','30日留存率'"  >
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
		            name:'次日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day1Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'2日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day2Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'3日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day3Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'4日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day4Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'5日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day5Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'6日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day6Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'7日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day7Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'15日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day15Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        },
		        {
		            name:'30日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items?reverse as item>'#{item.day30Rate*100 ;m0M4}'<#if item_index lt page.showCount-1>,</#if></#list>]
		        }
		    ]
</@dcChart>
</@dcList>
<script>
	function showCol(flag){
		if(flag==3){
			$("#chart_a").show();
			$("#chart_b").show();
			$(".col_a").show();
			$(".col_b").show();
		} else if(flag==1){
			$("#chart_a").show();
			$("#chart_b").hide();
			$(".col_a").show();
			$(".col_b").hide();
		} else if(flag==2){
			$("#chart_a").hide();
			$("#chart_b").show();
			$(".col_a").hide();
			$(".col_b").show();
		}
	}
</script>