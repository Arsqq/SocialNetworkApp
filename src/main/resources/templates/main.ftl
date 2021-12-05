<#import "parts/common.ftl" as c>
<@c.page>
    <link rel="stylesheet" href="/static/backForMessagesAndProfile.css">
    <#if alertMessage??>
        <div class="alert alert-success" role="alert">${alertMessage}</div>
    </#if>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
                <button type="submit" class="container-button">Search</button>
            </form>
        </div>
    </div>
    <#include "parts/messagesEdit.ftl" />

    <#include "parts/messageList.ftl" />

</@c.page>