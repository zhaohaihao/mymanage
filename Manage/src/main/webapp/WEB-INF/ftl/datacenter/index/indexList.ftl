<#include "../../common/globalDef.ftl">
<@dcList "${siteUrl}/datacenter/indexList" 0 1650>
<div class="widget-foot">
	<@pagination page "topForm"/>
</div>
<form name="excelForm" action="${siteUrl}/datacenter/exportExcel" method="post" >
	<input type="hidden" id="ex_ecId" name="ecId" value="">
	<input type="hidden" id="ex_ecCount" name="ecCount" value="">
	<input type="hidden" id="ex_ectId" name="ectId" value="">
</form>

<div class="widget-content"  id="tableContainer" style="overflow:auto;">
	<form id="settingForm" name="settingForm" action="${siteUrl}/datacenter/setting" method="post">
	<table class="table table-striped table-bordered table-hover" style="min-width:950px;">
		<thead>
			<tr>
				<th colspan="100">
					总表
					<div id="_out">
						<input type="button" class="btn btn-xs btn-success" onclick="startSetting()" value="设置">
						<input type="button" class="btn btn-xs btn-success" onclick="exportExcel()" value="导出">
					</div>
					<div id="_in" style="display:none;">
						<input type="button" class="btn btn-xs btn-success" onclick="finishSetting()" value="确认">
						<input type="button" class="btn btn-xs btn-success" id="select_all" onclick="selectAll()" value="全选" >
						<input type="button" class="btn btn-xs btn-success" id="deselect_all" onclick="deselectAll()" value="取消全选" style="display:none;" >
					</div>
				</th>
			</tr>
		</thead>
		<thead>
			<tr id="setting" style="display:none;">
				<th>
					<input type="checkbox" value="" checked style="display:none;"/>
            	</th>
				<th><input type="checkbox" name="settings" value="a01"  
            		<#if index_setting?index_of("a01")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a02" 
            		<#if index_setting?index_of("a02")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a03" 
            		<#if index_setting?index_of("a03")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a04" 
            		<#if index_setting?index_of("a04")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a05" 
            		<#if index_setting?index_of("a05")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a06" 
            		<#if index_setting?index_of("a06")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a07" 
            		<#if index_setting?index_of("a07")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a08" 
            		<#if index_setting?index_of("a08")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a09" 
            		<#if index_setting?index_of("a09")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a10" 
            		<#if index_setting?index_of("a10")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a11" 
            		<#if index_setting?index_of("a11")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a12" 
            		<#if index_setting?index_of("a12")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a13" 
            		<#if index_setting?index_of("a13")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a14" 
            		<#if index_setting?index_of("a14")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a15" 
            		<#if index_setting?index_of("a15")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a16" 
            		<#if index_setting?index_of("a16")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a17" 
            		<#if index_setting?index_of("a17")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a18" 
            		<#if index_setting?index_of("a18")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a19" 
            		<#if index_setting?index_of("a19")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a20" 
            		<#if index_setting?index_of("a20")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a21" 
            		<#if index_setting?index_of("a21")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a22" 
            		<#if index_setting?index_of("a22")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a23" 
            		<#if index_setting?index_of("a23")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a24" 
            		<#if index_setting?index_of("a24")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a25" 
            		<#if index_setting?index_of("a25")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a26" 
            		<#if index_setting?index_of("a26")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a27" 
            		<#if index_setting?index_of("a27")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a28" 
            		<#if index_setting?index_of("a28")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a29" 
            		<#if index_setting?index_of("a29")!=-1> checked </#if>
            	></th>
				<th><input type="checkbox" name="settings" value="a30" 
            		<#if index_setting?index_of("a30")!=-1> checked </#if>
            	></th>
			</form>
			</tr>
			<tr id="showHead">
				<th>日期</th>
				<th>收入</th>
				<th>新增用户充值金额</th>
				<th>老用户充值金额</th>
				<th>DAU</th>
				<th>去新DAU</th>
				<th>新增用户</th>
				<th>新增注册用户</th>
				<th>新增占比</th>
				<th>新增用户价值</th>
				<th>新增注册设备数</th>
				<th>1日留存率</th>
				<th>3日留存率</th>
				<th>7日留存率</th>
				<th>ARPU</th>
				<th>新增用户ARPU</th>
				<th>老用户ARPU</th>
				<th>付费用户数</th>
				<th>新增用户的付费用户</th>
				<th>老用户的付费用户</th>
				<th>ARPPU</th>
				<th>新增用户ARPPU</th>
				<th>老用户ARPPU</th>
				<th>付费率</th>
				<th>新增用户的付费率</th>
				<th>老用户的付费率</th>
				<th>活跃率</th>
				<th>累计用户数</th>
				<th>累计设备数</th>
				<th>回流用户活跃人数</th>
				<th>付费失败率</th>
			</tr>
		</thead>
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.logtime?date!}</td>
			<td>${item.dayinfull?default('-')}</td>
			<td>${item.newPay?default('-')}</td>
			<td>${item.oldPay?default('-')}</td>
			<td>${item.alldau?default('-')}</td>
			<td>${item.olddau?default('-')}</td>
			<td>${item.newuser?default('-')}</td>
			<td>${item.newuserRe?default('-')}</td>
			<td><#if item.alldau?? && item.newuser??>
				<#if item.alldau = 0>0<#else>${(item.newuser?default(0)*100/item.alldau?default(0))?string('#.##')}%</#if>
			<#else>-</#if></td>
			<td><#if item.dayinfull?? && item.newuser??>
				<#if item.newuser?default(0)= 0>0<#else>${(item.dayinfull?default(0) / item.newuser?default(0))?string('#.##')}</#if>
			<#else>-</#if></td>
			<td>-</td>
			<td><#if item.newuser?? && item.day1Login??>
				<#if item.newuser?default(0)= 0>0<#else>${(item.day1Login?default(0)*100/item.newuser?default(0))?string('#.##')}%</#if>
			<#else>-</#if></td>
			<td><#if item.newuser?? && item.day3Login??>
				<#if item.newuser?default(0)= 0>0<#else>${(item.day3Login?default(0)*100/item.newuser?default(0))?string('#.##')}%</#if>
			<#else>-</#if></td>
			<td><#if item.newuser?? && item.day7Login??>
				<#if item.newuser?default(0)= 0>0<#else>${(item.day7Login?default(0)*100/item.newuser?default(0))?string('#.##')}%</#if>
			<#else>-</#if></td>
			<td><#if item.alldau?? && item.dayinfull??>
				<#if item.alldau?default(0)= 0>0<#else>${(item.dayinfull?default(0)/item.alldau?default(0))?string('#.##')}</#if>
			<#else>-</#if></td>
			<td><#if item.newuser?? && item.newPay??>
				<#if item.newuser?default(0)= 0>0<#else>${(item.newPay?default(0)/item.newuser?default(0))?string('#.##')}</#if>
			<#else>-</#if></td>
			<td>
				<#if item.alldau?? && item.newuser?? && item.oldPay??>
					<#if (item.alldau?default(0)-item.newuser?default(0))= 0>0<#else>${(item.oldPay?default(0)/(item.alldau?default(0)-item.newuser?default(0)))?string('#.##')}</#if>
				<#else>-</#if>
			</td>
			<td>${item.daypayp?default('-')}</td>
			<td>${item.daynewpayp?default('-')}</td>
			<td>${item.dayoldpayp?default('-')}</td>
			<td><#if item.daypayp?? && item.dayinfull??>
				<#if item.daypayp?default(0)= 0>0<#else>${(item.dayinfull?default(0) / item.daypayp?default(0))?string('#.##')}</#if>
			<#else>-</#if></td>
			<td><#if item.daynewpayp?? && item.newPay??>
				<#if item.daynewpayp?default(0)= 0>0<#else>${(item.newPay?default(0) / item.daynewpayp?default(0))?string('#.##')}</#if>
			<#else>-</#if></td>
			<td><#if item.dayoldpayp?? && item.oldPay??>
				<#if item.dayoldpayp?default(0)= 0>0<#else>${(item.oldPay?default(0) / item.dayoldpayp?default(0))?string('#.##')}</#if>
			<#else>-</#if></td>
			<td><#if item.alldau?? && item.daypayp??>
				<#if item.alldau?default(0)= 0>0<#else>${(item.daypayp?default(0)*100/item.alldau?default(0))?string('#.##')}%</#if>
			<#else>-</#if></td>
			<td><#if item.newuser?? && item.daynewpayp??>
				<#if item.newuser?default(0)= 0>0<#else>${(item.daynewpayp?default(0)*100/item.newuser?default(0))?string('#.##')}%</#if>
			<#else>-</#if></td>
			<td><#if item.alldau?? && item.newuser?? && item.dayoldpayp?? >
				<#if (item.alldau?default(0)-item.newuser?default(0))= 0>0<#else>${(item.dayoldpayp?default(0)*100/(item.alldau?default(0)-item.newuser?default(0)))?string('#.##')}%</#if>
			<#else>-</#if></td>
			<td>
                <#if item.alldau?? && item.alladduser?? >
					<#if item.alladduser= 0>0<#else>${(item.alldau?default(0)*100/(item.alladduser?default(0)))?string('#.##')}%</#if>
			    <#else>-</#if>
            </td>
			<td>${item.alladduser?default('-')}</td>
			<td>${item.alladddev?default('-')}</td>
			<td>${item.comtouser?default('-')}</td>
			<td><#if item.errorPay?? && item.payCounts??>
				<#if item.payCounts?default(0)= 0>0<#else>${(item.errorPay?default(0)*100/item.payCounts?default(0))?string('#.##')}%</#if>
			<#else>-</#if></td>
		</tr>
	</#list>
	<tr>
			<td>平均</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td>0</td>
			<td></td>
			<td></td>
			</tr>
			<tr>
			<td>合计</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			</tr>
		</tbody>
	</table>
	</form>
	
</div>
<@dcChart "chart_a" '金额' "'收入','新增用户充值金额','老用户充值金额','新增用户价值','ARPU','新增用户ARPU','老用户ARPU','ARPPU','新增用户ARPPU','老用户ARPPU'"  >
	xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : [<#list page.items as item>'${item.logtime?string("MM-dd")!}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'收入',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.dayinfull?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户充值金额',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.newPay?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'老用户充值金额',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.oldPay?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户价值',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.dayinfull?? && item.newuser??><#if item.newuser?default(0)= 0>0<#else>${(item.dayinfull?default(0) / item.newuser?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'ARPU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.alldau?? && item.dayinfull??><#if item.alldau?default(0)= 0>0<#else>${(item.dayinfull?default(0)/item.alldau?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户ARPU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.newuser?? && item.newPay??><#if item.newuser?default(0)= 0>0<#else>${(item.newPay?default(0)/item.newuser?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'老用户ARPU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.alldau?? && item.newuser?? && item.oldPay??><#if (item.alldau?default(0)-item.newuser?default(0))= 0>0<#else>${(item.oldPay?default(0)/(item.alldau?default(0)-item.newuser?default(0)))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'ARPPU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.daypayp?? && item.dayinfull??><#if item.daypayp?default(0)= 0>0<#else>${(item.dayinfull?default(0) / item.daypayp?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户ARPPU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.daynewpayp?? && item.newPay??><#if item.daynewpayp?default(0)= 0>0<#else>${(item.newPay?default(0) / item.daynewpayp?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'老用户ARPPU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.dayoldpayp?? && item.oldPay??><#if item.dayoldpayp?default(0)= 0>0<#else>${(item.oldPay?default(0) / item.dayoldpayp?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        }
		    ]
</@dcChart>
<@dcChart "chart_b" '数量' "'DAU','去新DAU','新增用户','新增注册用户','新增注册设备数','付费用户数','新增用户的付费用户','老用户的付费用户','累计用户数','累计设备数','回流用户活跃人数'"  >
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
		            name:'DAU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.alldau?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'去新DAU',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.alldau?? && item.newuser??>${item.alldau?default(0) - item.newuser?default(0)}<#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.newuser?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增注册用户',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.newuserRe?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增注册设备数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>${item.newuserDev?default(0)}<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'付费用户数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.daypayp?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户的付费用户',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.daynewpayp?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'老用户的付费用户',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.dayoldpayp?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'累计用户数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.alladduser?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'累计设备数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.alladddev?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'回流用户活跃人数',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'${item.comtouser?default(0)}'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        }
		    ]
</@dcChart>
<@dcChart "chart_c" '百分比(%)' "'新增占比','1日留存率','3日留存率','7日留存率','付费率','新增用户的付费率','老用户的付费率','活跃率','付费失败率'"  >
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
		            name:'新增占比',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.alldau?? && item.newuser??><#if item.alldau = 0>0<#else>${(item.newuser?default(0)*100/item.alldau?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'1日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.newuser?? && item.day1Login??><#if item.newuser?default(0)= 0>0<#else>${(item.day1Login?default(0)*100/item.newuser?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'3日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.newuser?? && item.day3Login??><#if item.newuser?default(0)= 0>0<#else>${(item.day3Login?default(0)*100/item.newuser?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'7日留存率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.newuser?? && item.day7Login??><#if item.newuser?default(0)= 0>0<#else>${(item.day7Login?default(0)*100/item.newuser?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'付费率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.alldau?? && item.daypayp??><#if item.alldau?default(0)= 0>0<#else>${(item.daypayp?default(0)*100/item.alldau?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'新增用户的付费率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.newuser?? && item.daynewpayp??><#if item.newuser?default(0)= 0>0<#else>${(item.daynewpayp?default(0)*100/item.newuser?default(0))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'老用户的付费率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.alldau?? && item.newuser?? && item.dayoldpayp?? ><#if (item.alldau?default(0)-item.newuser?default(0))= 0>0<#else>${(item.dayoldpayp?default(0)*100/(item.alldau?default(0)-item.newuser?default(0)))?string('#.##')}</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'活跃率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'0'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        },
		        {
		            name:'付费失败率',
		            type:'line',
		            symbol:'none',
		            
		            data:[<#list page.items as item>'<#if item.errorPay?? && item.payCounts??><#if item.payCounts?default(0)= 0>0<#else>${(item.errorPay?default(0)*100/item.payCounts?default(0))?string('#.##')}%</#if><#else>0</#if>'<#if item_index lt page.totalResult-1>,</#if></#list>]
		        }
		    ]
</@dcChart>
</@dcList>

<script>
 	$(window).load(function() { 
      	 var sum = 0; 
		 var _lenght=$('table #showHead th').length;
		 var tr_lenght=$('tbody tr').length-1;
		 var cal_length = tr_lenght-1;
		 for(var i=1;i<_lenght;i++){
			 for(var j=0;j<tr_lenght;j++){
			 	if(j == tr_lenght-1){
			 		var avg = Math.round((sum/(cal_length))*100)/100;
			 		if(!isNaN(avg)){
			 			if(i==8 || (i>=11 && i <=13) || (i>=23 && i <=26) || i==30){
							$("tbody tr:not(:last) td").eq(i+j*_lenght).text(avg+"%");
						} else {
			 				$("tbody tr:not(:last) td").eq(i+j*_lenght).text(avg);
			 			}
			 		} else {
			 			$("tbody tr:not(:last) td").eq(i+j*_lenght).text('-');
			 		}
			 	}else{
					$("tbody tr:not(:last) td").eq(i+j*_lenght).each(function(){
						var num = $(this).text();
						if(num == "-"){
							num = 0;
							cal_length = cal_length - 1;
						}
				    	sum = sum + parseInt(num);
					}); 
				}
			}
			if(!isNaN(sum) && i != 8 && i !=9 && !(i>=11 && i <=16) && !(i>=20 && i <=26) && i !=30){
				$("tbody tr:last-child td").eq(i).text(sum);
			}else{
				$("tbody tr:last-child td").eq(i).text('-');
			}
			
			sum = 0;
			cal_length = tr_lenght-1;
		}
	}); 
	
	$(window).load(function() { 
		showAndHide();
	});
	
	var startSetting = function(){
		$("#setting").show();
		$("#_in").show();
		$("#_out").hide();
		$("tbody td").show();
		$("#showHead th").show();
	};
	
	var selectAll = function(checked){
		$("#setting :checkbox").prop("checked",true);
		$("#select_all").hide();
		$("#deselect_all").show();
	};
	
	var deselectAll = function(checked){
		$("#setting :checkbox").prop("checked",false);
		$("#deselect_all").hide();
		$("#select_all").show();
	};
	
	var finishSetting = function(){
		$("#_in").hide();
		$("#_out").show();
		showAndHide();
		$("#setting").hide();
		$('#settingForm').ajaxSubmit({
	        type: "POST",
	        url: "${siteUrl}/datacenter/setting",
	        async: false,
	        dataType : 'json',
	        error:function(dataOrg){
	        	alertErr('未知异常');
	        },
	        success : function(dataOrg){
	        	
	        }
	    });
	};
	
	var showAndHide = function(){
		var td_lenght=$('#setting th').length;
		var tr_lenght=$('tbody tr').length;
		for(var i=1;i<td_lenght;i++){
			var chk_flag = $("#setting :checkbox").eq(i).prop("checked");
			if(chk_flag){
				$("#showHead th").eq(i).show();
			} else {
				$("#showHead th").eq(i).hide();
			}
			for(var j=0;j<tr_lenght;j++){
				$("tbody td").eq(i+j*td_lenght).each(function(){
					if(chk_flag){
						$(this).show();
					} else {
						$(this).hide();
					}
				}); 
			}
		}
	};
	
	function exportExcel(){
		document.topForm.action="${siteUrl}/datacenter/exportExcel"; 
		topForm.submit();
	}
</script>