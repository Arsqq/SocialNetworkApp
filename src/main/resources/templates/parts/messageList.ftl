<#include "security.ftl">
<#import "pager.ftl" as p>

<@p.pager url page />

<#include "security.ftl">
<#import "pager.ftl" as p>


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
                <div class="row">
                    <a class="badge badge-success align-self-center" href="/user-messages/${message.author.id}">${message.authorName}</a>
                    <a class="col align-self-center"  href="/messages/${message.id}/like">
                        <#if message.meLiked>
                            <i class="fas fa-heart"></i>
                        <#else>
                            <i class="far fa-heart"></i>
                        </#if>
                        ${message.likes}
                    </a>
                    <a href="/messages/${message.id}/comments">
                        <i class="fa fa-comment" aria-hidden="true"></i>
                    <#if message.author.id == currentUserId>
                        <a class="btn btn-warning" href="/user-messages/${message.author.id}?message=${message.id}">Edit</a>
                    </#if>
                    <#if message.author.id == currentUserId>
                        <form action="/user-messages/${message.author.id}/${message.id}" method="post">
                            <input type="submit"  class="btn btn-danger" value="Delete">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </#if>
                </div>
            </div>
        </div>
    <#else>
        No message
    </#list>
</div>
<@p.pager url page />