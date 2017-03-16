<#include "../../common/globalDef.ftl">
<@simpleList 2700>
<form name="defaultForm" id="loginLogListForm" action="${siteUrl}/datacenter/payRmbLogList" method="post" >

<div class="widget-head">
	<div class="pull-left">
		<input type="submit" class="btn btn-success" value="搜索">
	</div>
	<div class="pull-right">
		<button  type="button" class="btn btn-default" onclick="ClearForm('defaultForm')">重置</button>
	</div>
	<div class="clearfix"></div>
</div>

<div class="widget-content autoHeader" >
	<table class="table table-striped table-bordered table-hover" style="min-width:2650px;">
		<thead class="fixedHeader">
		<tr>
			<th><input type="text" name="userid" value="${example.userid!}" class="form-control" style="width:70px;"/></th>
			<th><input type="text" name="integral" value="${example.integral!}" class="form-control" style="width:70px;"/></th>
			<th><input type="text" name="level" value="${example.level!}" class="form-control" style="width:70px;"/></th>
			<th><input type="text" name="loginIp" value="${example.loginIp!}" class="form-control" style="width:70px;"/></th>
			<th><input type="text" name="serialNumber" value="${example.serialNumber!}" class="form-control" style="width:70px;"/></th>
			<th style="width:120px;">
				<select class="form-control" name="kindid">
				    <option value="" <#if example.kindid??>selected="selected"</#if>>-请选择-</option>
				    <#list game_list as item>
				    	<option <#if example.kindid?? && example.kindid == item.kindId>selected="selected"</#if> value="${item.kindId}">${item.gameName}</option>
				    </#list>
				</select>
			</th>
			<th style="width:120px;">
				<select class="form-control" name="platform"">
		        	<option value="" <#if example.platform??>selected="selected"</#if>>-请选择-</option>
			        <#list plat_list as item>
			        	<option <#if example.platform?? && example.platform == item.platform>selected="selected"</#if> value="${item.platform}">
			        		${item.platformName}
			        	</option>
			        </#list>
		        </select>
			</th>
			<th style="width:120px;">
				<select class="form-control" name="channel">
		        	<option value="" <#if example.channel??>selected="selected"</#if>>-请选择-</option>
		        	<#list chan_list as item>
				        	<option <#if example.channel?? && example.channel==item.channelId>selected="selected"</#if> value="${item.channelId}">
				        		${item.channelName}
				        	</option>
				    </#list>
		        </select>
			</th>
			<th><input type="text" name="infullmount" value="${example.infullmount!}" class="form-control" style="width:70px;"/></th>
			<th><input type="text" name="orderId" value="${example.orderId!}" class="form-control" style="width:70px;"/></th>
			<th><input type="text" name="amount" value="${example.amount!}" class="form-control" style="width:70px;"/></th>
			<th style="width:120px;">
				<select class="form-control" name="orderType" style="width:100px;">
		        	<option value="" <#if example.orderType??>selected="selected"</#if>>-请选择-</option>
			        <option value=1 <#if example.orderType?? & example.orderType==1>selected="selected"</#if> >买道具</option>
			        <option value=2 <#if example.orderType?? & example.orderType==2>selected="selected"</#if> >买金币</option>
		        </select>
			</th>
			<th><input type="text" name="numbers" value="${example.numbers!}" class="form-control" style="width:70px;"/></th>
		    <th style="width:160px;">
				<@shDateBeginEnd "registertimeSH" example.registertimeSH! />
			</th>
			<th style="width:160px;">
				<@shDateBeginEnd "lastpaytimeSH" example.lastpaytimeSH! />
			</th>
			<th style="width:160px;">
				<@shDateBeginEnd "writeLogTimeSH" example.writeLogTimeSh! />
			</th>
		</tr>
		<tr>
			<@seqTh page "defaultForm" "user_id" >用户ID</@seqTh>
			<@seqTh page "defaultForm" "integral" >用户积分</@seqTh>
			<@seqTh page "defaultForm" "level" >用户等级</@seqTh>
			<@seqTh page "defaultForm" "login_ip" >登陆ip</@seqTh>
			<@seqTh page "defaultForm" "serial_number" >设备id</@seqTh>
			<@seqTh page "defaultForm" "kindid" >游戏</@seqTh>
			<@seqTh page "defaultForm" "platform" >平台</@seqTh>
			<@seqTh page "defaultForm" "channel" >渠道</@seqTh>
			<@seqTh page "defaultForm" "infullmount" >充值总和</@seqTh>
			<@seqTh page "defaultForm" "system" >订单ID</@seqTh>
			<@seqTh page "defaultForm" "version" >订单金额</@seqTh>
			<@seqTh page "defaultForm" "mobile_number" >订单类型</@seqTh>
			<@seqTh page "defaultForm" "resolution" >数量</@seqTh>
			<@seqTh page "defaultForm" "network_type" >注册时间</@seqTh>
			<@seqTh page "defaultForm" "free_currency" >上次充值时间</@seqTh>
			<@seqTh page "defaultForm" "pay_currency" >记录时间</@seqTh>
		</tr>
		</thead>
	</table>
</div>
<div class="widget-content autoTbody" >
	<table class="table table-striped table-bordered table-hover" style="min-width:2650px;">
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.userid!}</td>
			<td>${item.integral!}</td>
			<td>${item.level!}</td>
			<td>${item.loginIp!}</td>
			<td>${item.serialNumber!}</td>
			<td>
			<#list game_list as item1>
		    	<#if item.kindid?default(0) == item1.kindId>${item1.gameName}</#if>
		    </#list>
			</td>
			<td>
			<#list plat_list as item1>
				<#if item.platform! == item1.platform>${item1.platformName}</#if>
	        </#list>
			</td>
			<td>
			<#list chan_list as item1>
				<#if item.channel! == item1.channelId>${item1.channelName}</#if>
		    </#list>
			</td>
			<td>${item.infullmount!}</td>
			<td>${item.orderId!}</td>
			<td>${item.amount!}</td>
			<td>
			   	<#if item.orderType?? & 1==item.orderType>买道具</#if>
			   	<#if item.orderType?? & 2==item.orderType>买金币</#if>
			</td>
			<td>${item.numbers!}</td>
			<td>
			<#if item.registertime?exists>
			${item.registertime?datetime!}
			</#if>
			</td>
			<td>
			<#if item.lastpaytime?exists>
			${item.lastpaytime?datetime!}
			</#if>
			</td>
			<td>
			<#if item.writeLogTime?exists>
			${item.writeLogTime?datetime!}
			</#if>
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