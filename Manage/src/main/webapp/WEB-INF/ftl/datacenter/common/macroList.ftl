<#macro dcList actionUrl listType=0 maxWidth=1350>
<@header>
<style>
.control-label{width:85px;padding-top:5px;}
.timectrl{width:110px;}
.col-lg-6{width:140px;}
</style>

<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
</@header>
<body>
<@top/>
<!-- Main content starts -->

<div class="content">
  	<@left/>
  	<!-- Main bar -->
	<div class="mainbar">
		<#list game_list as rollItem>
						    	<#if rollItem.kindId==curr_game>
						    		<#assign gameName = rollItem.gameName><#break/>
						    	</#if>
						    </#list>
      <@title gameName/>
	  
		<div class="matter">
		<div class="container">
		<div class="col-md-12" style="max-width:${maxWidth}px;">
		<#if code?? && code!="S">
		<div class="alert alert-danger hideit">
          ${msg!}
        </div>
        </#if>
		<div class="row">
		<div class="widget">
		<form name="topForm" id="topForm" action="${actionUrl}" method="post" >
			<div class="widget-head">
				<div class="pull-left">
					<div style="float:left; width:240px;">
					<!--
						<label class="control-label col-lg-3" style="width:135px;font-size:150%;">
							<#list game_list as rollItem>
						    	<#if rollItem.kindId==curr_game>
						    		${rollItem.gameName}<#break/>
						    	</#if>
						    </#list>
						</label>
						-->
						<input type="hidden" name="kindid" value="${curr_game!}">
						<input type="hidden" id="week" name="week" value="">
						<label class="control-label col-lg-2">选择游戏</label>
						<div class="col-lg-6">
							<select class="form-control" name="gameId" id="changeGame">
							    <!--<option value="0" <#if !curr_game?? || curr_game==0>selected="selected"</#if>>-请选择-</option>-->
							    <#list game_list as item>
							    	<option <#if curr_game?? && curr_game==item.kindId>selected="selected"</#if> value="${item.kindId}">${item.gameName}</option>
							    </#list>
							</select>
						</div>
					</div>
					<div style="float:left; width:225px;">
						<label class="control-label col-lg-2">选择渠道</label>
						<div class="col-lg-6">
							<select class="form-control" name="platform" id="rootId" onClick="changeLeaf(this.value)">
					        	<option value="--" <#if !example.platform??>selected="selected"</#if>>全部</option>
						        <#list plat_list as item>
						        	<option <#if example.platform?? && example.platform == item.platform>selected="selected"</#if> value="${item.platform}">
						        		${item.platformName}
						        	</option>
						        </#list>
					        </select>
						</div>
					</div>
					<div style="float:left; width:155px;">
						<div class="col-lg-6">
							<select class="form-control" name="channel" id="leafId" style="float:left;">
					        	<option value="--" <#if !example.channel??>selected="selected"</#if>>全部</option>
					        	<#list chan_list as item>
							        <#if example.platform?? && example.platform==item.platform >
							        	<option <#if example.channelId?? && example.channelId==item.channelId>selected="selected"</#if> value="${item.channelId}">
							        		${item.channelName}
							        	</option>
							        </#if>
							    </#list>
					        </select>
						</div>
					</div>
					<div style="float:left; width:510px;">
					<#if listType=0>
						<label class="control-label col-lg-2">起止时间</label>
						<@shDateBeginEnd "logtimeSh" example.logtimeSh! />
					</#if>
					<#if listType=1>
						<#if example.logtime??>
							<@formDate "选择时间" "logtime" "${example.logtime?date!}" />
						</#if>
						<#if !example.logtime??>
							<@formDate "选择时间" "logtime" />
						</#if>
					</#if>
					</div>
				</div>
				<div class="pull-right">
					<input type="submit" class="btn btn-success" value="搜索">
					<button type="button" class="btn btn-default" onclick="ClearForm('topForm')">重置</button>
				</div>
				<div class="clearfix"></div>
			</div>
		
		<#nested/>
		</form>
		</div>
		</div>
		</div>
		</div>
		</div>
	</div>
   <!-- Mainbar ends -->
	<div class="clearfix"></div>
</div>
<!-- Content ends -->

<@footer/>
<script>
window.onload = function(){
	$('.timectrl').datetimepickerNew({
		showHour: false,
		showMinute: false,
		showSecond: false,
		timeText: '',
		timeFormat: ''
	});
} 

var types = [
				<#list chan_list as item>
					{selfId:'${item.channelId}', selfName:'${item.channelName}', parentId:'${item.platform}'},
				</#list>
			];
	
	function changeLeaf(thisId) 
	{
		var leaf = document.getElementById('leafId');
		leaf.length = 0;
		leaf.options.add(new Option('全部', ''));
		for(var i = 0; i < types.length; i++){
			if(types[i].parentId == thisId){
				leaf.options.add(new Option(types[i].selfName, types[i].selfId));
			}
		}
	};
$('#changeGame').on('change',function(e){
	$.ajax({
		"url": "changeGame",
		"type":"post",
		"dataType":"json",
		data : {'gameId': $(this).val()},
		"async":false,
		success:function(dataOrg){
			var res=comMsg(dataOrg);
			if(res!=null){
				location.reload();
			}
		},
		error:function(e){
			alert('操作失败,未知异常');
		}
	});
});	
	
</script>
</#macro>