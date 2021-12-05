<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <link rel="stylesheet" href="/static/comments.css">
    <link rel="stylesheet" href="/static/backForMessagesAndProfile.css">
    <link rel="stylesheet" href="/static/home.css">
<section>
    <div class="myBodyHome">
        <div class="d-flex flex-row">
            <div class="col-sm-5 col-md-6 col-12 pb-4">
                <h1>Comments</h1>
                <#list comments as comment>
                <div class="comment mt-4 text-justify float-left"> <img src="/img/${comment.author.filename!}" alt="" class="rounded-circle" width="40" height="40">
                    <h4>${comment.author.username!}</h4> <span>-${comment.dateOfCreation!}</span> <br>
                    <p>${comment.text!}</p>
                </div>
                </#list>
            </div>
        </div>

        <form class="formForComments" id="algin-form" method="post">
            <div class="form-group">
                <h2>Leave a comment</h2> <label for="message"></label> <textarea name="msg" id="message" msg cols="30" rows="5" class="form-control" >
                        </textarea>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class=""> <button type="submit" id="post" class="button-custom">Post Comment</button> </div>
        </form>
    </div>
</section>
</@c.page>