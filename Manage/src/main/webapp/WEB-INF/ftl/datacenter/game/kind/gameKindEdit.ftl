<#include "../../../common/globalDef.ftl">
<@simpleEdit "修改游戏" "${siteUrl}/datacenter/gameKindEdit">

<@formTextReadOnly "游戏类别ID" "kindId" "${example.kindId!}"/>
<@formText "游戏名称" "gameName" "${example.gameName!}"/>

</@simpleEdit>