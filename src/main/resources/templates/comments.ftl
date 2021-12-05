<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <link rel="stylesheet" href="/static/comments.css">
    <link rel="stylesheet" href="/static/backForMessagesAndProfile.css">
    <link rel="stylesheet" href="/static/home.css">
<section>
    <#if alertMessage??>
        <div class="alert alert-success" role="alert">${alertMessage}</div>
    </#if>
    <div class="myBodyHome">
        <div class="d-flex flex-row">
            <div class="col-sm-5 col-md-6 col-12 pb-4">
                <h1>Comments</h1>
                <#list comments as comment>
                <div class="comment mt-4 text-justify float-left">
                    <img src="/img/${comment.author.filename!}" alt="" class="rounded-circle" width="40" height="40">
                    <h4>${comment.author.username!}</h4> <span>-${comment.dateOfCreation!}</span> <br>
                    <div class="d-flex flex-row">
                            <span>${comment.text!}</span>
                        <div class="p-2">
                            <form action="/messages/${message.id}/comments/${comment.id}" method="post">
                                <button type="submit" value="delete" class="btn">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            </form>
                        </div>
                    </div>
                </div>
                </#list>
            </div>
            <form class="formForComments" id="algin-form" method="post">
                <div class="form-group">
                    <h2>Leave a comment</h2> <label for="message"></label> <textarea name="msg" id="message" msg cols="40" rows="10" class="form-control" >
                        </textarea>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class=""> <button type="submit" id="post" class="button-custom">Post Comment</button> </div>
            </form>
        </div>
    </div>
</section>
</@c.page>