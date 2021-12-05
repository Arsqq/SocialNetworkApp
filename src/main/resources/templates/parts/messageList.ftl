<#include "security.ftl">
<#import "pager.ftl" as p>

<@p.pager url page />

<#include "security.ftl">
<#import "pager.ftl" as p>

<link rel="stylesheet" href="/static/btn.css">
<div class="card-columns" id="message-list">
    <#list page.content as message>

        <div class="card my-3" data-id="${message.id}">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" />
            </#if>
            <div class="m-2">
                <span>${message.text}</span><br/>
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer text-muted container">
                <div class="d-flex flex-row">
                    <a class="badge badge-success align-self-center" href="/user-messages/${message.author.id}">${message.authorName}</a>
                    <div class="p-2">
                        <a class="col align-self-center"  href="/messages/${message.id}/like">
                            <#if message.meLiked>
                                <i class="fas fa-heart"></i>
                            <#else>
                                <i class="far fa-heart"></i>
                            </#if>
                            ${message.likes}
                        </a>
                    </div>
                    <a href="/messages/${message.id}/comments">
                        <div class="p-2">
                            <i class="fa fa-comment" aria-hidden="true"></i>
                           ${message.commentsAmount!}
                        </div>
                    </a>
                        <div class="p-2">
                    <#if message.author.id == currentUserId>
                        <a class="col align-self-center"><a class="fas fa-edit" href="/user-messages/${message.author.id}?message=${message.id}">Edit
                            </a></a>
                    </#if>
                        </div>
                    <#if message.author.id == currentUserId>
                    <div class="p-2">
                        <form action="/user-messages/${message.author.id}/${message.id}" method="post">
                            <button type="submit" value="delete" class="btn"><i class="fa fa-trash"></i></button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </div>
                    </#if>
                </div>
            </div>
        </div>
    <#else>
        No message
    </#list>
</div>
<@p.pager url page />