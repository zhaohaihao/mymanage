<#include "../../common/globalDef.ftl">
<@dcList "${siteUrl}/datacenter/kpiWeekReportList" 1 >
<div class="widget-content"  id="tableContainer" style="overflow:auto;">
	<table class="table table-striped table-bordered table-hover" style="min-width:950px;">
		<thead>
			<tr>
				<th colspan="100">KPI周报<span style="float:right;"><input type="button" id="lweek" class="btn btn-success" value="上周">
				<input type="button" id="llweek" class="btn btn-success" value="上上周"><span></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>层次</th>
				<th colspan="3">指标</th>
				<th>${logtimeSh3.begin?string("MM-dd")!}~${logtimeSh3.end?string("MM-dd")!}</th>
				<th>${logtimeSh2.begin?string("MM-dd")!}~${logtimeSh2.end?string("MM-dd")!}</th>
				<th>${logtimeSh1.begin?string("MM-dd")!}~${logtimeSh1.end?string("MM-dd")!}</th>
				<th>环比上周%</th>
				<th>环比上上周%</th>
			</tr>
			<tr>
				<td rowspan="8">核心KPI</td>
				<td colspan="3">日均去新DAU</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wAddUsers!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wAddUsers!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wAddUsers!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wAddUsers=0>0<#else>
					${(wkpiInfo1.wAddUsers-wkpiInfo2.wAddUsers)/wkpiInfo2.wAddUsers*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wAddUsers=0>0<#else>
					${(wkpiInfo1.wAddUsers-wkpiInfo3.wAddUsers)/wkpiInfo3.wAddUsers*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td colspan="3">上周新用户第7日留存率</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
			</tr>
			<tr>
				<td colspan="3">上周新增用户的7日注收比</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
			</tr>
			<tr>
				<td colspan="3">付费率</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wActv=0>0<#else>
					${wkpiInfo3.wPayPeople/wkpiInfo3.wActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wActv=0>0<#else>
					${wkpiInfo2.wPayPeople/wkpiInfo2.wActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wActv=0>0<#else>
					${wkpiInfo1.wPayPeople/wkpiInfo1.wActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wActv=0 || wkpiInfo2.wActv=0>0<#else>
					${(wkpiInfo1.wPayPeople/wkpiInfo1.wActv-wkpiInfo2.wPayPeople/wkpiInfo2.wActv)/(wkpiInfo2.wPayPeople/wkpiInfo2.wActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wActv=0 || wkpiInfo3.wActv=0>0<#else>
					${(wkpiInfo1.wPayPeople/wkpiInfo1.wActv-wkpiInfo3.wPayPeople/wkpiInfo3.wActv)/(wkpiInfo3.wPayPeople/wkpiInfo3.wActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td colspan="3">ARPPU</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
			</tr>
			<tr>
				<td colspan="3">日最高在线人数</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wDayOnline!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wDayOnline!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wDayOnline!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wDayOnline=0>0<#else>
					${(wkpiInfo1.wDayOnline-wkpiInfo2.wDayOnline)/wkpiInfo2.wDayOnline*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wDayOnline=0>0<#else>
					${(wkpiInfo1.wDayOnline-wkpiInfo3.wDayOnline)/wkpiInfo3.wDayOnline*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td colspan="3">一周内至少有3日登录行为的用户数</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.w3dayLogin!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.w3dayLogin!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.w3dayLogin!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.w3dayLogin=0>0<#else>
					${(wkpiInfo1.w3dayLogin-wkpiInfo2.w3dayLogin)/wkpiInfo2.w3dayLogin*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.w3dayLogin=0>0<#else>
					${(wkpiInfo1.w3dayLogin-wkpiInfo3.w3dayLogin)/wkpiInfo3.w3dayLogin*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td colspan="3">连续至少2天登录的用户数</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.w2dayLogin!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.w2dayLogin!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.w2dayLogin!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.w2dayLogin=0>0<#else>
					${(wkpiInfo1.w2dayLogin-wkpiInfo2.w2dayLogin)/wkpiInfo2.w2dayLogin*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.w2dayLogin=0>0<#else>
					${(wkpiInfo1.w2dayLogin-wkpiInfo3.w2dayLogin)/wkpiInfo3.w2dayLogin*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			
			<tr>
				<td rowspan="24">分析</td>
				<td rowspan="24">周老用户</td>
				<td rowspan="4">上周用户在本周登录</td>
				<td>收入</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wLoginPay!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wLoginPay!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wLoginPay!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wLoginPay=0>0<#else>
					${(wkpiInfo1.wLoginPay-wkpiInfo2.wLoginPay)/wkpiInfo2.wLoginPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wLoginPay=0>0<#else>
					${(wkpiInfo1.wLoginPay-wkpiInfo3.wLoginPay)/wkpiInfo3.wLoginPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>活跃人数</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wLoginActv!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wLoginActv!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wLoginActv!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wLoginActv=0>0<#else>
					${(wkpiInfo1.wLoginActv-wkpiInfo2.wLoginActv)/wkpiInfo2.wLoginActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wLoginActv=0>0<#else>
					${(wkpiInfo1.wLoginActv-wkpiInfo3.wLoginActv)/wkpiInfo3.wLoginActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>留存率</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wLogin=0>0<#else>
					${wkpiInfo3.wLoginActv/wkpiInfo3.wLogin*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wLogin=0>0<#else>
					${wkpiInfo2.wLoginActv/wkpiInfo2.wLogin*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wLogin=0>0<#else>
					${wkpiInfo1.wLoginActv/wkpiInfo1.wLogin*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wLogin=0 || wkpiInfo2.wLogin=0>0<#else>
					${(wkpiInfo1.wLoginActv/wkpiInfo1.wLogin-wkpiInfo2.wLoginActv/wkpiInfo2.wLogin)/(wkpiInfo2.wLoginActv/wkpiInfo2.wLogin)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wLogin=0 || wkpiInfo3.wLogin=0>0<#else>
					${(wkpiInfo1.wLoginActv/wkpiInfo1.wLogin-wkpiInfo3.wLoginActv/wkpiInfo3.wLogin)/(wkpiInfo3.wLoginActv/wkpiInfo3.wLogin)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>ARPU</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wLoginActv=0>0<#else>
					${(wkpiInfo3.wLoginPay/wkpiInfo3.wLoginActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wLoginActv=0>0<#else>
					${(wkpiInfo2.wLoginPay/wkpiInfo2.wLoginActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wLoginActv=0>0<#else>
					${(wkpiInfo1.wLoginPay/wkpiInfo1.wLoginActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wLoginActv=0 || wkpiInfo2.wLoginActv=0>0<#else>
					${(wkpiInfo1.wLoginPay/wkpiInfo1.wLoginActv-wkpiInfo2.wLoginPay/wkpiInfo2.wLoginActv)/(wkpiInfo2.wLoginPay/wkpiInfo2.wLoginActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wLoginActv=0 || wkpiInfo3.wLoginActv=0>0<#else>
					${(wkpiInfo1.wLoginPay/wkpiInfo1.wLoginActv-wkpiInfo3.wLoginPay/wkpiInfo3.wLoginActv)/(wkpiInfo3.wLoginPay/wkpiInfo3.wLoginActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			
			<tr>
				<td rowspan="4">上周新增用户在本周登录</td>
				<td>收入</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wLoginNewPay!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wLoginNewPay!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wLoginNewPay!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wLoginNewPay=0>0<#else>
					${(wkpiInfo1.wLoginNewPay-wkpiInfo2.wLoginNewPay)/wkpiInfo2.wLoginNewPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wLoginNewPay=0>0<#else>
					${(wkpiInfo1.wLoginNewPay-wkpiInfo3.wLoginNewPay)/wkpiInfo3.wLoginNewPay*100!}%
					</#if>
					<#else>-</#if>
					</td>
			</tr>
			<tr>
				<td>活跃人数</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wLoginNewActv!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wLoginNewActv!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wLoginNewActv!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wLoginNewActv=0>0<#else>
					${(wkpiInfo1.wLoginNewActv-wkpiInfo2.wLoginNewActv)/wkpiInfo2.wLoginNewActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wLoginNewActv=0>0<#else>
					${(wkpiInfo1.wLoginNewActv-wkpiInfo3.wLoginNewActv)/wkpiInfo3.wLoginNewActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>留存率</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wLoginNew=0>0<#else>
					${wkpiInfo3.wLoginNewActv/wkpiInfo3.wLoginNew*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wLoginNew=0>0<#else>
					${wkpiInfo2.wLoginNewActv/wkpiInfo2.wLoginNew*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wLoginNew=0>0<#else>
					${wkpiInfo1.wLoginNewActv/wkpiInfo1.wLoginNew*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wLoginNew=0 || wkpiInfo2.wLoginNew=0>0<#else>
					${(wkpiInfo1.wLoginNewActv/wkpiInfo1.wLoginNew-wkpiInfo2.wLoginNewActv/wkpiInfo2.wLoginNew)/(wkpiInfo2.wLoginNewActv/wkpiInfo2.wLoginNew)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wLoginNew=0 || wkpiInfo3.wLoginNew=0>0<#else>
					${(wkpiInfo1.wLoginNewActv/wkpiInfo1.wLoginNew-wkpiInfo3.wLoginNewActv/wkpiInfo3.wLoginNew)/(wkpiInfo3.wLoginNewActv/wkpiInfo3.wLoginNew)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>ARPU</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wLoginNewActv=0>0<#else>
					${(wkpiInfo3.wLoginNewPay/wkpiInfo3.wLoginNewActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wLoginNewActv=0>0<#else>
					${(wkpiInfo2.wLoginNewPay/wkpiInfo2.wLoginNewActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wLoginNewActv=0>0<#else>
					${(wkpiInfo1.wLoginNewPay/wkpiInfo1.wLoginNewActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wLoginNewActv=0 || wkpiInfo2.wLoginNewActv=0>0<#else>
					${(wkpiInfo1.wLoginNewPay/wkpiInfo1.wLoginNewActv-wkpiInfo2.wLoginNewPay/wkpiInfo2.wLoginNewActv)/(wkpiInfo2.wLoginNewPay/wkpiInfo2.wLoginNewActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wLoginNewActv=0 || wkpiInfo3.wLoginNewActv=0>0<#else>
					${(wkpiInfo1.wLoginNewPay/wkpiInfo1.wLoginNewActv-wkpiInfo3.wLoginNewPay/wkpiInfo3.wLoginNewActv)/(wkpiInfo3.wLoginNewPay/wkpiInfo3.wLoginNewActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			
			<tr>
				<td rowspan="4">上周老用户在本周登录</td>
				<td>收入</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wLoginOldPay!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wLoginOldPay!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wLoginOldPay!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wLoginOldPay=0>0<#else>
					${(wkpiInfo1.wLoginOldPay-wkpiInfo2.wLoginOldPay)/wkpiInfo2.wLoginOldPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wLoginOldPay=0>0<#else>
					${(wkpiInfo1.wLoginOldPay-wkpiInfo3.wLoginOldPay)/wkpiInfo3.wLoginOldPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>活跃人数</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wLoginOldActv!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wLoginOldActv!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wLoginOldActv!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wLoginOldActv=0>0<#else>
					${(wkpiInfo1.wLoginOldActv-wkpiInfo2.wLoginOldActv)/wkpiInfo2.wLoginOldActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wLoginOldActv=0>0<#else>
					${(wkpiInfo1.wLoginOldActv-wkpiInfo3.wLoginOldActv)/wkpiInfo3.wLoginOldActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>留存率</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wLoginOld=0>0<#else>
					${wkpiInfo3.wLoginOldActv/wkpiInfo3.wLoginOld*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wLoginOld=0>0<#else>
					${wkpiInfo2.wLoginOldActv/wkpiInfo2.wLoginOld*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wLoginOld=0>0<#else>
					${wkpiInfo1.wLoginOldActv/wkpiInfo1.wLoginOld*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wLoginOld=0 || wkpiInfo2.wLoginOld=0>0<#else>
					${(wkpiInfo1.wLoginOldActv/wkpiInfo1.wLoginOld-wkpiInfo2.wLoginOldActv/wkpiInfo2.wLoginOld)/(wkpiInfo2.wLoginOldActv/wkpiInfo2.wLoginOld)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wLoginOld=0 || wkpiInfo3.wLoginOld=0>0<#else>
					${(wkpiInfo1.wLoginOldActv/wkpiInfo1.wLoginOld-wkpiInfo3.wLoginOldActv/wkpiInfo3.wLoginOld)/(wkpiInfo3.wLoginOldActv/wkpiInfo3.wLoginOld)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>ARPU</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wLoginOldActv=0>0<#else>
					${(wkpiInfo3.wLoginOldPay/wkpiInfo3.wLoginOldActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wLoginOldActv=0>0<#else>
					${(wkpiInfo2.wLoginOldPay/wkpiInfo2.wLoginOldActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wLoginOldActv=0>0<#else>
					${(wkpiInfo1.wLoginOldPay/wkpiInfo1.wLoginOldActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wLoginOldActv=0 || wkpiInfo2.wLoginOldActv=0>0<#else>
					${(wkpiInfo1.wLoginOldPay/wkpiInfo1.wLoginOldActv-wkpiInfo2.wLoginOldPay/wkpiInfo2.wLoginOldActv)/(wkpiInfo2.wLoginOldPay/wkpiInfo2.wLoginOldActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wLoginOldActv=0 || wkpiInfo3.wLoginOldActv=0>0<#else>
					${(wkpiInfo1.wLoginOldPay/wkpiInfo1.wLoginOldActv-wkpiInfo3.wLoginOldPay/wkpiInfo3.wLoginOldActv)/(wkpiInfo3.wLoginOldPay/wkpiInfo3.wLoginOldActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			
			<tr>
				<td rowspan="4">上周付费用户在本周登录</td>
				<td>收入</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wPayPay!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wPayPay!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wPayPay!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wPayPay=0>0<#else>
					${(wkpiInfo1.wPayPay-wkpiInfo2.wPayPay)/wkpiInfo2.wPayPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wPayPay=0>0<#else>
					${(wkpiInfo1.wPayPay-wkpiInfo3.wPayPay)/wkpiInfo3.wPayPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>活跃人数</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wPayActv!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wPayActv!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wPayActv!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wPayActv=0>0<#else>
					${(wkpiInfo1.wPayActv-wkpiInfo2.wPayActv)/wkpiInfo2.wPayActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wPayActv=0>0<#else>
					${(wkpiInfo1.wPayActv-wkpiInfo3.wPayActv)/wkpiInfo3.wPayActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>留存率</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wPay=0>0<#else>
					${wkpiInfo3.wPayActv/wkpiInfo3.wPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wPay=0>0<#else>
					${wkpiInfo2.wPayActv/wkpiInfo2.wPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wPay=0>0<#else>
					${wkpiInfo1.wPayActv/wkpiInfo1.wPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wPay=0 || wkpiInfo2.wPay=0>0<#else>
					${(wkpiInfo1.wPayActv/wkpiInfo1.wPay-wkpiInfo2.wPayActv/wkpiInfo2.wPay)/(wkpiInfo2.wPayActv/wkpiInfo2.wPay)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wPay=0 || wkpiInfo3.wPay=0>0<#else>
					${(wkpiInfo1.wPayActv/wkpiInfo1.wPay-wkpiInfo3.wPayActv/wkpiInfo3.wPay)/(wkpiInfo3.wPayActv/wkpiInfo3.wPay)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>ARPU</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wPayActv=0>0<#else>
					${(wkpiInfo3.wPayPay/wkpiInfo3.wPayActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wPayActv=0>0<#else>
					${(wkpiInfo2.wPayPay/wkpiInfo2.wPayActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wPayActv=0>0<#else>
					${(wkpiInfo1.wPayPay/wkpiInfo1.wPayActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wPayActv=0 || wkpiInfo2.wPayActv=0>0<#else>
					${(wkpiInfo1.wPayPay/wkpiInfo1.wPayActv-wkpiInfo2.wPayPay/wkpiInfo2.wPayActv)/(wkpiInfo2.wPayPay/wkpiInfo2.wPayActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wPayActv=0 || wkpiInfo3.wPayActv=0>0<#else>
					${(wkpiInfo1.wPayPay/wkpiInfo1.wPayActv-wkpiInfo3.wPayPay/wkpiInfo3.wPayActv)/(wkpiInfo3.wPayPay/wkpiInfo3.wPayActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			
			<tr>
				<td rowspan="4">上周新增付费用户在本周登录</td>
				<td>收入</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wPayNewPay!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wPayNewPay!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wPayNewPay!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wPayNewPay=0>0<#else>
					${(wkpiInfo1.wPayNewPay-wkpiInfo2.wPayNewPay)/wkpiInfo2.wPayNewPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wPayNewPay=0>0<#else>
					${(wkpiInfo1.wPayNewPay-wkpiInfo3.wPayNewPay)/wkpiInfo3.wPayNewPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>活跃人数</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wPayNewActv!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wPayNewActv!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wPayNewActv!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wPayNewActv=0>0<#else>
					${(wkpiInfo1.wPayNewActv-wkpiInfo2.wPayNewActv)/wkpiInfo2.wPayNewActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wPayNewActv=0>0<#else>
					${(wkpiInfo1.wPayNewActv-wkpiInfo3.wPayNewActv)/wkpiInfo3.wPayNewActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>留存率</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wPayNew=0>0<#else>
					${wkpiInfo3.wPayNewActv/wkpiInfo3.wPayNew*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wPayNew=0>0<#else>
					${wkpiInfo2.wPayNewActv/wkpiInfo2.wPayNew*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wPayNew=0>0<#else>
					${wkpiInfo1.wPayNewActv/wkpiInfo1.wPayNew*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wPayNew=0 || wkpiInfo2.wPayNew=0>0<#else>
					${(wkpiInfo1.wPayNewActv/wkpiInfo1.wPayNew-wkpiInfo2.wPayNewActv/wkpiInfo2.wPayNew)/(wkpiInfo2.wPayNewActv/wkpiInfo2.wPayNew)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wPayNew=0 || wkpiInfo3.wPayNew=0>0<#else>
					${(wkpiInfo1.wPayNewActv/wkpiInfo1.wPayNew-wkpiInfo3.wPayNewActv/wkpiInfo3.wPayNew)/(wkpiInfo3.wPayNewActv/wkpiInfo3.wPayNew)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>ARPU</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wPayNewActv=0>0<#else>
					${(wkpiInfo3.wPayNewPay/wkpiInfo3.wPayNewActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wPayNewActv=0>0<#else>
					${(wkpiInfo2.wPayNewPay/wkpiInfo2.wPayNewActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wPayNewActv=0>0<#else>
					${(wkpiInfo1.wPayNewPay/wkpiInfo1.wPayNewActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wPayNewActv=0 || wkpiInfo2.wPayNewActv=0>0<#else>
					${(wkpiInfo1.wPayNewPay/wkpiInfo1.wPayNewActv-wkpiInfo2.wPayNewPay/wkpiInfo2.wPayNewActv)/(wkpiInfo2.wPayNewPay/wkpiInfo2.wPayNewActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wPayNewActv=0 || wkpiInfo3.wPayNewActv=0>0<#else>
					${(wkpiInfo1.wPayNewPay/wkpiInfo1.wPayNewActv-wkpiInfo3.wPayNewPay/wkpiInfo3.wPayNewActv)/(wkpiInfo3.wPayNewPay/wkpiInfo3.wPayNewActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			
			<tr>
				<td rowspan="4">上周老付费用户在本周登录</td>
				<td>收入</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wPayOldPay!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wPayOldPay!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wPayOldPay!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wPayOldPay=0>0<#else>
					${(wkpiInfo1.wPayOldPay-wkpiInfo2.wPayOldPay)/wkpiInfo2.wPayOldPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wPayOldPay=0>0<#else>
					${(wkpiInfo1.wPayOldPay-wkpiInfo3.wPayOldPay)/wkpiInfo3.wPayOldPay*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>活跃人数</td>
				<td><#if wkpiInfo3??>${wkpiInfo3.wPayOldActv!}<#else>-</#if></td>
				<td><#if wkpiInfo2??>${wkpiInfo2.wPayOldActv!}<#else>-</#if></td>
				<td><#if wkpiInfo1??>${wkpiInfo1.wPayOldActv!}<#else>-</#if></td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo2.wPayOldActv=0>0<#else>
					${(wkpiInfo1.wPayOldActv-wkpiInfo2.wPayOldActv)/wkpiInfo2.wPayOldActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo3.wPayOldActv=0>0<#else>
					${(wkpiInfo1.wPayOldActv-wkpiInfo3.wPayOldActv)/wkpiInfo3.wPayOldActv*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>留存率</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wPayOld=0>0<#else>
					${wkpiInfo3.wPayOldActv/wkpiInfo3.wPayOld*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wPayOld=0>0<#else>
					${wkpiInfo2.wPayOldActv/wkpiInfo2.wPayOld*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wPayOld=0>0<#else>
					${wkpiInfo1.wPayOldActv/wkpiInfo1.wPayOld*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wPayOld=0 || wkpiInfo2.wPayOld=0>0<#else>
					${(wkpiInfo1.wPayOldActv/wkpiInfo1.wPayOld-wkpiInfo2.wPayOldActv/wkpiInfo2.wPayOld)/(wkpiInfo2.wPayOldActv/wkpiInfo2.wPayOld)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wPayOld=0 || wkpiInfo3.wPayOld=0>0<#else>
					${(wkpiInfo1.wPayOldActv/wkpiInfo1.wPayOld-wkpiInfo3.wPayOldActv/wkpiInfo3.wPayOld)/(wkpiInfo3.wPayOldActv/wkpiInfo3.wPayOld)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
			<tr>
				<td>ARPU</td>
				<td>
					<#if wkpiInfo3??>
					<#if wkpiInfo3.wPayOldActv=0>0<#else>
					${(wkpiInfo3.wPayOldPay/wkpiInfo3.wPayOldActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo2??>
					<#if wkpiInfo2.wPayOldActv=0>0<#else>
					${(wkpiInfo2.wPayOldPay/wkpiInfo2.wPayOldActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1??>
					<#if wkpiInfo1.wPayOldActv=0>0<#else>
					${(wkpiInfo1.wPayOldPay/wkpiInfo1.wPayOldActv)?string("#.##")!}
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo2??>
					<#if wkpiInfo1.wPayOldActv=0 || wkpiInfo2.wPayOldActv=0>0<#else>
					${(wkpiInfo1.wPayOldPay/wkpiInfo1.wPayOldActv-wkpiInfo2.wPayOldPay/wkpiInfo2.wPayOldActv)/(wkpiInfo2.wPayOldPay/wkpiInfo2.wPayOldActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
				<td>
					<#if wkpiInfo1?? & wkpiInfo3??>
					<#if wkpiInfo1.wPayOldActv=0 || wkpiInfo3.wPayOldActv=0>0<#else>
					${(wkpiInfo1.wPayOldPay/wkpiInfo1.wPayOldActv-wkpiInfo3.wPayOldPay/wkpiInfo3.wPayOldActv)/(wkpiInfo3.wPayOldPay/wkpiInfo3.wPayOldActv)*100!}%
					</#if>
					<#else>-</#if>
				</td>
			</tr>
		</tbody>
	</table>
	
	
</div>
<script>
	$('#lweek').on('click',function(e){
	$('#week').val('-1');
	$("form[name='topForm']").submit();
	});
	$('#llweek').on('click',function(e){
	$('#week').val('-2');
	$("form[name='topForm']").submit();
	});
</script>
</@dcList>