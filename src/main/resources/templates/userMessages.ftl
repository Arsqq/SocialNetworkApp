<#import "parts/common.ftl" as c>
<@c.page>
    <link rel="stylesheet" href="/static/backForMessagesAndProfile.css">
    <link rel="stylesheet" href="/static/forSubs.css">
    <link rel="stylesheet" href="/static/profile.css">
    <#if alertMessage??>
        <div class="alert alert-success" role="alert">${alertMessage}</div>
    </#if>
    <div class="secondColor">
    <div class="row">
        <#if userChannel.filename??>
            <img class="avatar"
                 src="/img/${userChannel.filename!}">
        <#else>
            <img class="avatar"
                 src="/static/images/istockphoto-476085198-612x612.jpg">
        </#if>
        <div class="col">
            <h3>${userChannel.username}</h3>
            <span>${userChannel.name!},${userChannel.age!} лет</span>
        </div>
    </div>
    </div>
    <#if !isCurrentUser>
        <#if isSubscribed>
            <button class="container-button" onclick=window.location.href="/user/unsubscribe/${userChannel.id}">Unsubscribe</button>
        <#else>
            <button class="container-button" onclick=window.location.href="/user/subscribe/${userChannel.id}">Subscribe</button>
        </#if>
    </#if>
    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="niceColor">
                    <div class="card-body">
                        <div class="card-title">Subscriptions</div>
                        <h3 class="card-text">
                            <a href="/user/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="niceColor">
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