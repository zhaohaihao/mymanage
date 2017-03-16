<#include "../../../common/globalDef.ftl">
<@simpleAdd "新增游戏" "${siteUrl}/datacenter/gameKindAdd">
<@formTextCheck "游戏类别ID" "kindId" "" 6  11 "/[^(\\d]/g" />
<@formText "游戏名称" "gameName" />
</@simpleAdd>