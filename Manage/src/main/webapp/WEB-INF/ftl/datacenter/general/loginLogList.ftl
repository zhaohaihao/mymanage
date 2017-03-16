<#include "../../common/globalDef.ftl">
<@simpleList 2700>
<form name="defaultForm" id="loginLogListForm" action="${siteUrl}/datacenter/loginLogList" method="post" >

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
			<th><input type="text" name="userId" value="${example.userId!}" class="form-control" style="width:70px;"/></th>
			<th><input type="text" name="integral" value="${example.integral!}" class="form-control" style="width:70px;"/></th>
			<th><input type="text" name="level" value="${example.level!}" class="form-control" style="width:70px;"/></th>
			<th style="width:120px;"><input type="text" name="loginIp" value="${example.loginIp!}" class="form-control" style="width:110px;"/></th>
			<th style="width:150px;"><input type="text" name="serialNumber" value="${example.serialNumber!}" class="form-control" style="width:140px;"/></th>
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
			<th style="width:70px;"><input type="text" name="infullmount" value="${example.infullmount!}" class="form-control" style="width:60px;"/></th>
			<th style="width:120px;"><input type="text" name="system" value="${example.system!}" class="form-control" style="width:110px;"/></th>
			<th style="width:120px;"><input type="text" name="version" value="${example.version!}" class="form-control" style="width:110px;"/></th>
			<th style="width:120px;"><input type="text" name="mobileNumber" value="${example.mobileNumber!}" class="form-control" style="width:110px;"/></th>
			<th style="width:120px;"><input type="text" name="resolution" value="${example.resolution!}" class="form-control" style="width:110px;"/></th>
			<th style="width:120px;">
				<select class="form-control" name="networkType" style="width:100px;">
		        	<option value="" <#if example.networkType??>selected="selected"</#if>>-请选择-</option>
			        <option value=0 <#if example.networkType?? & example.networkType=="0">selected="selected"</#if> >wifi</option>
			        <option value=1 <#if example.networkType?? & example.networkType=="1">selected="selected"</#if> >cdma</option>
			        <option value=2 <#if example.networkType?? & example.networkType=="2">selected="selected"</#if> >wcdma</option>
		        </select>
			</th>
			<th style="width:120px;"><input type="text" name="freeCurrency" value="${example.freeCurrency!}" class="form-control" style="width:110px;"/></th>
			<th style="width:120px;"><input type="text" name="payCurrency" value="${example.payCurrency!}" class="form-control" style="width:110px;"/></th>
			<th style="width:120px;">
				<select class="form-control" name="loginType" style="width:100px;">
		        	<option selected="selected">-请选择-</option>
			        <option value=0 <#if example.loginType?? & example.loginType==0>selected="selected"</#if> >登陆</option>
			        <option value=1 <#if example.loginType?? & example.loginType==1>selected="selected"</#if> >退出</option>
		        </select>
			</th>
			<th style="width:120px;"><input type="text" name="onlineTime" value="${example.onlineTime!}" class="form-control" style="width:110px;"/></th>
			<th style="width:160px;">
				<@shDateBeginEnd "registetimeSh" example.registetimeSh! />
			</th>
			<th style="width:160px;">
				<@shDateBeginEnd "lastLoginTimeSh" example.lastLoginTimeSh! />
			</th>
			<th style="width:160px;">
				<@shDateBeginEnd "writeLogTimeSh" example.writeLogTimeSh! />
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
			<@seqTh page "defaultForm" "system" >手机系统</@seqTh>
			<@seqTh page "defaultForm" "version" >游戏版本</@seqTh>
			<@seqTh page "defaultForm" "mobile_number" >手机号码</@seqTh>
			<@seqTh page "defaultForm" "resolution" >分辨率</@seqTh>
			<@seqTh page "defaultForm" "network_type" >网络类型</@seqTh>
			<@seqTh page "defaultForm" "free_currency" >付费货币余额</@seqTh>
			<@seqTh page "defaultForm" "pay_currency" >免费货币余额</@seqTh>
			<@seqTh page "defaultForm" "login_type" >登陆类型</@seqTh>
			<@seqTh page "defaultForm" "online_time" >在线时长</@seqTh>
			<@seqTh page "defaultForm" "registetime" >注册时间</@seqTh>
			<@seqTh page "defaultForm" "last_login_time" >上次登陆时间</@seqTh>
			<@seqTh page "defaultForm" "write_log_time" >记录时间</@seqTh>
		</tr>
		</thead>
	</table>
</div>
<div class="widget-content autoTbody" >
	<table class="table table-striped table-bordered table-hover" style="min-width:2650px;">
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.userId!}</td>
			<td>${item.integral!}</td>
			<td>${item.level!}</td>
			<td>${item.loginIp!}</td>
			<td>${item.serialNumber!}</td>
			<td>
			<#list game_list as item>
		    	<#if example.kindid?? && example.kindid == item.kindId>${item.gameName}</#if>
		    </#list>
			</td>
			<td>
			<#list plat_list as item>
				<#if example.platform?? && example.platform == item.platform>${item.platformName}</#if>
	        </#list>
			</td>
			<td>
			<#list chan_list as item>
				<#if example.channel?? && example.channel==item.channelId>${item.channelName}</#if>
		    </#list>
			</td>
			<td>${item.infullmount!}</td>
			<td>${item.system!}</td>
			<td>${item.version!}</td>
			<td>${item.mobileNumber!}</td>
			<td>${item.resolution!}</td>
			<td>
				<#if item.networkType?? & "0"==item.networkType>wifi</#if>
			   	<#if item.networkType?? & "1"==item.networkType>cdma</#if>
			   	<#if item.networkType?? & "2"==item.networkType>wcdma</#if>
			</td>
			<td>${item.freeCurrency!}</td>
			<td>${item.payCurrency!}</td>
			<td>
				<#if item.loginType?? & 0==item.loginType>登陆</#if>
			   	<#if item.loginType?? & 1==item.loginType>退出</#if>
			</td>
			<td>${item.onlineTime!}</td>
			<td>
			<#if item.registetime?exists>
			${item.registetime?datetime!}
			</#if>
			</td>
			<td>
			<#if item.lastLoginTime?exists>
			${item.lastLoginTime?datetime!}
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