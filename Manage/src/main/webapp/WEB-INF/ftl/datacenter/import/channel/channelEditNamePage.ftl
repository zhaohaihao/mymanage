<#include "../../../common/globalDef.ftl">
<@simpleEdit "修改渠道" "${siteUrl}/datacenter/import/channelEditName">
<input type="hidden" name="ids" value="${ids!}"/>

<@formText "子渠道名" "name"/>
</@simpleEdit>