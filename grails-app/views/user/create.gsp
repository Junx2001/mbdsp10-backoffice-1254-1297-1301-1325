<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>User</title>
    <asset:stylesheet href="style.css"/>
</head>
<body>
<content tag="breadcrumb">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="${createLink(uri: '/')}">Home</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="/User">Users</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Create</li>
        </ol>
        <h6 class="font-weight-bolder mb-0">Users</h6>
    </nav>
</content>
<div id="content" role="main">
    <div class="row">
        <div class="col-12">
            <div class="card ">
                <div class="card-header pb-0">
                    <h6 class="text-capitalize">Administrator User Creation</h6>
                </div>
                <div class="card-body pb-2">

                    <div class="mb-4">
                        <g:if test="${flash.message}">
                            <div class="alert alert-success alert-dismissible text-white" role="alert">
                                <span class="text-sm">${flash.message}</span>
                                <button type="button" class="btn-close text-lg py-3 opacity-10" data-bs-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </g:if>
                        <g:hasErrors bean="${this.user}">
                            <div class="alert alert-danger alert-dismissible text-white" role="alert">

                                <g:eachError bean="${this.user}" var="error">
                                <span class="text-sm"
                                      <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                                    <g:message error="${error}"/>
                                </span>
                                </g:eachError>
                                <button type="button" class="btn-close text-lg py-3 opacity-10" data-bs-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </g:hasErrors>
                    </div>

                    <g:uploadForm action="save" method="POST" controller="user" class="form">
                        <div class="input-group input-group-outline mb-4">
                            <label class="form-label">Username</label>
                            <g:textField name="username"  class="form-control" id="inputUsername" value="${this.user.username}" />
                        </div>
                        <div class="input-group input-group-outline mb-4">
                            <label class="form-label">Email</label>
                            <g:textField class="form-control" id="email" name="email" required=""
                                         value="${this.user?.email}"/>
                        </div>
                        <div class="input-group input-group-outline mb-4">
                            <label class="form-label">Password</label>
                            <g:passwordField class="form-control" id="inputPassword" name="password" required="" value="${this.user.password}" />
                        </div>
                    <%-- <div class="input-group input-group-outline mb-4">
                        <g:select class="form-control" id="exampleFormControlSelect"
                                placeholder="Role"
                                  name="role"
                                  from="${roles}"
                                  optionValue="authority"
                                  optionKey="id"
                                  value="id"
                                  required=""
                        />
                    </div>--%>
                    <div class="input-group input-group-outline mb-4">
                        <label class="form-label">Address</label>
                        <g:textField name="address"  class="form-control" id="address" value="${this.user.address}" />
                    </div>
                    <%-- <div class="input-group input-group-outline mb-4">
                        <input type="file" class="form-control" id="image" name="image">
                    </div> --%>
                        <g:submitButton name="create" class="btn bg-gradient-primary mb-4">Save</g:submitButton>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
