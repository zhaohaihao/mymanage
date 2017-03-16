<#include "../../common/globalDef.ftl">
<div class="modal-content">
	<form action="${siteUrl}/datacenter/changeGame" method="post" id="changeGameForm" class="form-horizontal" role="form">
		<div class="modal-body">
			<div class="padd">
			<div class="form quick-post">
				<select class="form-control" name="gameId">
				    <option value="0" <#if !curr_game?? || curr_game==0>selected="selected"</#if>>-请选择-</option>
				    <#list game_list as item>
				    	<option <#if curr_game?? && curr_game==item.kindId>selected="selected"</#if> value="${item.kindId}">${item.gameName}</option>
				    </#list>
				</select>
			</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" onclick="layer.closeAll()">关闭</button>
			<button type="button" class="btn btn-danger" onclick="javascript:changeGameSubmit('${siteUrl}/datacenter/changeGame','changeGameForm')">确定并保存信息</button>
		</div>
	</form>
</div>

<script>
function changeGameSubmit(url,formId){
	if(!commonModalSubmitCheck()){
		return checkOk;
	}
	var aa=layer;
	$('#'+formId).ajaxSubmit({
        type: "POST",
        url:url,
        async: false,
        dataType : 'json',
        error:function(dataOrg){
        	alertErr('未知异常');
        },
        success : function(dataOrg){
        	var res=comMsg(dataOrg);
			if(res!=null){
				layer.closeAll();
				alertSuc(res);
				var leaf = document.getElementById('leafId');
				leaf.length = 0;
				leaf.options.add(new Option('全部', ''));
				location.reload();
			}
        }
    });
}
</script>