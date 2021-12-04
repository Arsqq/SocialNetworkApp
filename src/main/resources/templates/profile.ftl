
<#import "parts/common.ftl" as c>
<@c.page>
    <link rel="stylesheet" href="/static/backForMessagesAndProfile.css">
    <link rel="stylesheet" href="/static/profile.css">
    ${message!}
<form method="post">
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">${user.username!}</span><span class="text-black-50">${user.email!''}</span><span> </span></div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6"><label class="labels">Name</label><input type="text" name="name" class="form-control" placeholder="first name" value="${user.name!    }"></div>
                        <div class="col-md-6"><label class="labels">Surname</label><input type="text" name="surname" class="form-control" value="${user.surname!}" placeholder=""></div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12"><label class="labels">Age</label><input type="text" name="age" class="form-control" placeholder="enter age" value="${user.age!}"></div>
                        <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" name="phone" class="form-control" placeholder="enter phone number" value="${user.phone!}"></div>
                        <div class="col-md-12"><label class="labels">Password</label><input type="text" name="password" class="form-control" placeholder="" value="${user.password}"></div>
                        <div class="col-md-12"><label class="labels">Email</label><input type="text" name="email" class="form-control" placeholder="" value="${user.email}"></div>

                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6"><label class="labels">Country</label><input type="text" class="form-control" placeholder="country" value=""></div>
                        <div class="col-md-6"><label class="labels">State/Region</label><input type="text" class="form-control" value="" placeholder="state"></div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                </div>
            </div>
        </div>
    </div>
</form>
</@c.page>