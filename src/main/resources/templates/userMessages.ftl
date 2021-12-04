<#import "parts/common.ftl" as c>
<@c.page>
    <link rel="stylesheet" href="/static/backForMessagesAndProfile.css">
    <link rel="stylesheet" href="/static/profile.css">
    <div class="row">
        <img class="avatar"
             src="/img/${userChannel.filename!}">
        <h3>${userChannel.username}</h3>
    </div>
    <#if !isCurrentUser>
        <#if isSubscribed>
            <a class="btn btn-warning" href="/user/unsubscribe/${userChannel.id}">Unsubscribe</a>
        <#else>
            <a class="btn btn-warning" href="/user/subscribe/${userChannel.id}">Subscribe</a>
        </#if>
    </#if>
    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Subscriptions</div>
                        <h3 class="card-text">
                            <a href="/user/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Subscribers</div>
                        <h3 class="card-text">
                            <a href="/user/subscribers/${userChannel.id}/list">${subscribersCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#if isCurrentUser>
        <#include "parts/messagesEdit.ftl" />
    </#if>

    <#include "parts/messageList.ftl" />
</@c.page>