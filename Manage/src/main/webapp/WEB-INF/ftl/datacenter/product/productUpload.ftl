<#include "../../common/globalDef.ftl">
<script type="text/javascript">
	axUpload=true;
	var fileName = "";
	function ajaxuploadsubmit() {
		var gameId=$("input[name='example.productGame.gameId']").val();
		var index = layer.load();
	   	$('#uploadForm').ajaxSubmit({
		    url:'${siteUrl}/datacenter/uploadFile.do?gameId='+gameId,
		    type:'post',
		    dataType: 'json',
		    success:function (data){
		        if(data.code == "S"){
		        	layer.close(index);
		        	layer.msg("文件上传成功,上传文件的文件名为"+data.msg, {icon: 1});
		        	fileName = data.msg;
		        	closeAndOpenSuc();
		        }else{
		        	layer.close(index);
		        	layer.msg(data.msg, {icon: 2});
					}
		    }
		});
    }
    
    function closeAndOpenSuc() {
    	layer.close(uploadObj.imgLayerId);
    	$('#'+uploadObj.imgInputId).val(fileName);
    	$('#'+uploadObj.imgShowId).attr("src",fileName);
    }
    
    function closeAndOpen() {
    	layer.close(uploadObj.imgLayerId);
    }
</script>

<div class="modal-content">
	<div class="modal-body">
		<form id="uploadForm" class="form-horizontal" role="form" enctype="multipart/form-data">
		<div class="padd">
		<div class="form quick-post">
			<div class="form-group">
				<label class="control-label col-lg-2" style="width:100px;padding-top:5px;">选择文件</label>
				<div class="col-lg-6">
					<input id="upload" type="file" size="30" height="20px" name="upload">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-2" style="width:100px;padding-top:5px;">&nbsp;</label>
				<div class="col-lg-6">
					<input type="button" name="button" value="上传文件" class="btn btn-success" onclick="ajaxuploadsubmit()" />
				</div>
			</div>		
		</div>
		</div>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" onclick="closeAndOpen()">关闭</button>
	</div>
</div>