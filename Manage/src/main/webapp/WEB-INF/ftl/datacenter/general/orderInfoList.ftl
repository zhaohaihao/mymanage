<#include "../../common/globalDef.ftl">
<@simpleList 2700>
<form name="defaultForm" id="loginLogListForm" action="${siteUrl}/datacenter/orderInfoList" method="post" >

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
			<th style="width:160px;"><input type="text" name="orderId" value="${example.orderId!}" class="form-control" style="width:150px;"/></th>
			<th style="width:70px;"><input type="text" name="merNo" value="${example.merNo!}" class="form-control" style="width:70px;"/></th>
			<th style="width:120px;">
				<select class="form-control" name="kindId">
				    <option value="" <#if example.kindId??>selected="selected"</#if>>-请选择-</option>
				    <#list game_list as item>
				    	<option <#if example.kindId?? && example.kindId == item.kindId>selected="selected"</#if> value="${item.kindId}">${item.gameName}</option>
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
			<th style="width:100px;"><input type="text" name="price" value="${example.price!}" class="form-control" style="width:100px;"/></th>
			<th style="width:120px;">
				<select class="form-control" name="orderStatus" style="width:100px;">
		        	<option value="" <#if example.orderStatus??>selected="selected"</#if>>-请选择-</option>
		        	<option value=0 <#if example.orderStatus?? & example.orderStatus==0>selected="selected"</#if> >未支付</option>
			        <option value=1 <#if example.orderStatus?? & example.orderStatus==1>selected="selected"</#if> >支付成功</option>
			        <option value=2 <#if example.orderStatus?? & example.orderStatus==2>selected="selected"</#if> >支付失败</option>
			        <option value=3 <#if example.orderStatus?? & example.orderStatus==3>selected="selected"</#if> >未知</option>
		        </select>
			</th>
			<th style="width:120px;">
				<select class="form-control" name="deviceType" style="width:100px;">
		        	<option value="" <#if example.deviceType??>selected="selected"</#if>>-请选择-</option>
		        	<option value=1 <#if example.deviceType?? & example.deviceType==1>selected="selected"</#if> >安卓</option>
			        <option value=2 <#if example.deviceType?? & example.deviceType==2>selected="selected"</#if> >iPhone</option>
		        </select>
			</th>
			<th style="width:120px;">
				<select class="form-control" name="notifyStatus" style="width:100px;">
		        	<option value="" <#if example.notifyStatus??>selected="selected"</#if>>-请选择-</option>
		        	<option value=1 <#if example.notifyStatus?? & example.notifyStatus==1>selected="selected"</#if> >成功</option>
			        <option value=2 <#if example.notifyStatus?? & example.notifyStatus==2>selected="selected"</#if> >失败</option>
		        </select>
			</th>
			<th style="width:240px;"><input type="text" name="callbackUrl" value="${example.callbackUrl!}" class="form-control" style="width:220px;"/></th>
			
			<th style="width:80px;"><input type="text" name="diyParam" value="${example.diyParam!}" class="form-control" style="width:70px;"/></th>
			<th style="width:80px;">
			    <select class="form-control" name="payType" style="width:100px;">
		        	<option value="" <#if example.payType??>selected="selected"</#if>>-请选择-</option>
		        	<#if gmPayType??>
			        	<#list gmPayType as item>
			        		<option value=${item.payType} <#if example.payType?? & example.payType==item.payType>selected="selected"</#if> >${item.showName}</option>
				        </#list>
			        </#if>
		        </select>
			</th>
			<th style="width:160px;">
				<@shDateBeginEnd "payDateSH" example.payDateSH! />
			</th>
			<th style="width:100px;"><input type="text" name="payMsg" value="${example.payMsg!}" class="form-control" style="width:90px;"/></th>
			<th style="width:200px;"><input type="text" name="outOrder" value="${example.outOrder!}" class="form-control" style="width:190px;"/></th>
			<th style="width:210px;"><input type="text" name="other" value="${example.other!}" class="form-control" style="width:200px;"/></th>
		    
			<th style="width:160px;">
				<@shDateBeginEnd "createDateSH" example.createDateSH! />
			</th>
			<th><input type="text" name="productName" value="${example.productName!}" class="form-control" style="width:70px;"/></th>
		</tr>
		<tr>
			<@seqTh page "defaultForm" "order_id" >订单编号</@seqTh>
			<@seqTh page "defaultForm" "mer_no" >平台账号</@seqTh>
			<@seqTh page "defaultForm" "kind_id" >游戏</@seqTh>
			<@seqTh page "defaultForm" "platform" >平台号</@seqTh>
			<@seqTh page "defaultForm" "channel" >渠道号</@seqTh>
			
			<@seqTh page "defaultForm" "price" >金额(分)</@seqTh>
			<@seqTh page "defaultForm" "order_status" >订单状态</@seqTh>
			<@seqTh page "defaultForm" "device_type" >设备类型</@seqTh>
			<@seqTh page "defaultForm" "notify_status" >通知状态</@seqTh>
			<@seqTh page "defaultForm" "callback_url" >回调地址</@seqTh>
			
			<@seqTh page "defaultForm" "diy_param" >透传参数</@seqTh>
			<@seqTh page "defaultForm" "pay_type" >支付类型</@seqTh>
			<@seqTh page "defaultForm" "pay_time" >支付时间</@seqTh>
			<@seqTh page "defaultForm" "pay_msg" >支付结果描述</@seqTh>
			<@seqTh page "defaultForm" "out_order" >外部订单号</@seqTh>
			
			<@seqTh page "defaultForm" "other" >other</@seqTh>
			<@seqTh page "defaultForm" "create_time" >订单创建时间</@seqTh>
			<@seqTh page "defaultForm" "product_name" >商品/道具名称</@seqTh>
		</tr>
		</thead>
	</table>
</div>
<div class="widget-content autoTbody" >
	<table class="table table-striped table-bordered table-hover" style="min-width:2650px;">
		<tbody>
	<#list page.items as item>
		<tr>
			<td>${item.orderId!}</td>
			<td>${item.merNo!}</td>
			<td>
			<#list game_list as item1>
		    	<#if item.kindId?default(0) == item1.kindId>${item1.gameName}</#if>
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
			<td>${item.price!}</td>
			<td>
			   	<#if item.orderStatus?? & 0==item.orderStatus>未支付</#if>
			   	<#if item.orderStatus?? & 1==item.orderStatus>支付成功</#if>
			   	<#if item.orderStatus?? & 2==item.orderStatus>支付失败</#if>
			   	<#if item.orderStatus?? & 3==item.orderStatus>未知</#if>
			</td>
			<td>
			   	<#if item.deviceType?? & 1==item.deviceType>安卓</#if>
			   	<#if item.deviceType?? & 2==item.deviceType>iPhone</#if>
			</td>
			<td>
			   	<#if item.notifyStatus?? & 1==item.orderStatus>成功</#if>
			   	<#if item.notifyStatus?? & 2==item.orderStatus>失败</#if>
			</td>
			<td><@txtLimit "${item.callbackUrl!}"/></td>
			
			<td>${item.diyParam!}</td>
			<td>
			   <#if gmPayType??>
			        <#list gmPayType as item2>
			        	   <#if item.payType=item2.payType>${item2.showName}</#if>
				 	</#list>
			   </#if>
			</td>
			<td>
				<#if item.payTime?? >
				${item.payTime?datetime!}
				</#if>
			</td>
			<td>${item.payMsg!}</td>
			<td>${item.outOrder!}</td>
			<td><@txtLimit "${item.other!}"/></td>
			<td>
				<#if item.createTime?? >
				${item.createTime?datetime!}
				</#if>
			</td>
			<td>${item.productName!}</td>
		</tr>
	</#list>
		</tbody>
	</table>
</div>
<div class="widget-foot">
		<#if allInfull??>
			<span>充值金额：${allInfull!}(分)</span>
		</#if>
	<@pagination page "defaultForm"/>
</div>
</form>

</@simpleList>