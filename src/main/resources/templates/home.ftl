<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
    <link rel="stylesheet" href="/static/backForMessagesAndProfile.css">
    <link rel="stylesheet" href="/static/home.css">
<link rel="stylesheet" href="/static/userCard.css">
<link rel="stylesheet" href="/static/profile.css">
    <div class="overlay">
        <div class="myBodyHome">
            <header class="head-form">
                <h2>Latest Trends:</h2>
            </header>
            <div class="row">
                <div class="col-md-4">
                    <a href="/user-messages/${userWithMostSubscribers.id}" class="cardCustom">
                        <img src="/img/${userWithMostSubscribers.filename!}" class="cardCustom__image" alt="" />
                        <div class="cardCustom__overlay">
                            <div class="cardCustom__header">
                                <svg class="cardCustom__arc" xmlns="http://www.w3.org/2000/svg"><path /></svg>
                                <img class="cardCustom__thumb" src="/img/${userWithMostSubscribers.filename!}" alt="" />
                                <div class="cardCustom__header-text">
                                    <h3 class="cardCustom__title">${userWithMostSubscribers.username}</h3>
                                    <span>${userWithMostSubscribers.name!},${userWithMostSubscribers.age!} лет</span>
                                </div>
                            </div>
                            <p class="cardCustom__description">Wow!This user is the most popular one</p>
                            <p class="cardCustom__description">His amount of subscribers:${userWithMostSubscribers.subscribers?size}</p>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="/user-messages/${userWithMostMessages.id}" class="cardCustom">
                        <img src="/img/${userWithMostMessages.filename!}" class="cardCustom__image" alt="" />
                        <div class="cardCustom__overlay">
                            <div class="cardCustom__header">
                                <svg class="cardCustom__arc" xmlns="http://www.w3.org/2000/svg"><path /></svg>
                                <img class="cardCustom__thumb" src="/img/${userWithMostMessages.filename!}" alt="" />
                                <div class="cardCustom__header-text">
                                    <h3 class="cardCustom__title">${userWithMostMessages.username}</h3>
                                    <span>${userWithMostMessages.name!},${userWithMostMessages.age!} лет</span>
                                </div>
                            </div>
                            <p class="cardCustom__description">Wow!This user wrote the largest amount of messages</p>
                            <p class="cardCustom__description">Messages wrote:${userWithMostMessages.messages?size}</p>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="/user-messages/${userWithMostSubscriptions.id}" class="cardCustom">
                        <img src="/img/${userWithMostSubscriptions.filename!}" class="cardCustom__image" alt="" />
                        <div class="cardCustom__overlay">
                            <div class="cardCustom__header">
                                <svg class="cardCustom__arc" xmlns="http://www.w3.org/2000/svg"><path /></svg>
                                <img class="cardCustom__thumb" src="/img/${userWithMostSubscriptions.filename!}" alt="" />
                                <div class="cardCustom__header-text">
                                    <h3 class="cardCustom__title">${userWithMostSubscriptions.username}</h3>
                                    <span>${userWithMostSubscriptions.name!},${userWithMostSubscriptions.age!} лет</span>
                                </div>
                            </div>
                            <p class="cardCustom__description">Wow!This user has the largest amount of subscriptions</p>
                            <p class="cardCustom__description">Amount of subscriptions:${userWithMostSubscriptions.subscriptions?size}</p>
                        </div>
                    </a>
                </div>







            <div class="row">
                <div class="col-sm-4">
                    <div class="card my-3" data-id="${msgWithMostComments.id}">
                        <h4>Message with most comments</h4>
                        <#if msgWithMostComments.filename??>
                            <img src="/img/${msgWithMostComments.filename}" class="card-img-top" />
                        </#if>
                        <div class="m-2">
                            <span>${msgWithMostComments.text}</span><br/>
                            <i>#${msgWithMostComments.tag}</i>
                        </div>
                        <div class="card-footer text-muted container">
                            <div class="d-flex flex-row">
                                <a class="badge badge-success align-self-center" href="/user-messages/${msgWithMostComments.author.id}">
                                    ${msgWithMostComments.authorName}</a>
                                <div class="p-2">
                                    <a class="col align-self-center"  href="/messages/${msgWithMostComments.id}/like">
                                        <i class="fas fa-heart"></i>
                                        ${msgWithMostComments.getLikes()?size}
                                    </a>
                                </div>
                                <a href="/messages/${msgWithMostComments.id}/comments">
                                    <div class="p-2">
                                        <i class="fa fa-comment" aria-hidden="true"></i>
                                        ${msgWithMostComments.getComments()?size}
                                    </div></a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card my-3" data-id="${msgWithMostLikes.id}">
                        <h4>Message with most likes</h4>
                        <#if msgWithMostLikes.filename??>
                            <img src="/img/${msgWithMostLikes.filename}" class="card-img-top" />
                        </#if>
                        <div class="m-2">
                            <span>${msgWithMostLikes.text}</span><br/>
                            <i>#${msgWithMostLikes.tag}</i>
                        </div>
                        <div class="card-footer text-muted container">
                            <div class="d-flex flex-row">
                                <a class="badge badge-success align-self-center" href="/user-messages/${msgWithMostLikes.author.id}">
                                    ${msgWithMostLikes.authorName}</a>
                                <div class="p-2">
                                    <a class="col align-self-center"  href="/messages/${msgWithMostLikes.id}/like">
                                        <i class="fas fa-heart"></i>
                                        ${msgWithMostLikes.getLikes()?size}
                                    </a>
                                </div>
                                <a href="/messages/${msgWithMostLikes.id}/comments">
                                    <div class="p-2">
                                        <i class="fa fa-comment" aria-hidden="true"></i>
                                        ${msgWithMostLikes.getComments()?size}
                                    </div></a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card my-3" data-id="${msgLongest.id}">
                        <h4>Longest message</h4>
                        <#if msgLongest.filename??>
                            <img src="/img/${msgLongest.filename}" class="card-img-top" />
                        </#if>
                        <div class="m-2">
                            <span>${msgLongest.text}</span><br/>
                            <i>#${msgLongest.tag}</i>
                        </div>
                        <div class="card-footer text-muted container">
                            <div class="d-flex flex-row">
                                <a class="badge badge-success align-self-center" href="/user-messages/${msgLongest.author.id}">
                                    ${msgLongest.authorName}</a>
                                <div class="p-2">
                                    <a class="col align-self-center"  href="/messages/${msgLongest.id}/like">
                                        <i class="fas fa-heart"></i>
                                        ${msgLongest.getLikes()?size}
                                    </a>
                                </div>
                                <a href="/messages/${msgLongest.id}/comments">
                                    <div class="p-2">
                                        <i class="fa fa-comment" aria-hidden="true"></i>
                                        ${msgLongest.getComments()?size}
                                    </div></a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>

