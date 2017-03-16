<#include "../../common/globalDef.ftl">

<div class="">
	<div class="modal-content">
		<div class="modal-body">
			<form id="addModalForm" class="form-horizontal validate" role="form">
				<div class="padd">
					<div class="form quick-post">
						${productGame.gameName}相关文件下载
						<#list productPackageList as p>
							<ul>
								<li><a href="${siteUrl}/datacenter/download?fileName=${p.packageName}">${p.packageName}</a></li>
							</ul>
						</#list>
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" onclick="layer.closeAll()">关闭</button>
		</div>
	</div>
</div>

