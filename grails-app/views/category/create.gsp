<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Category</title>
  <asset:stylesheet href="style.css"/>
</head>
<body>
<content tag="breadcrumb">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
      <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="${createLink(uri: '/')}">Home</a></li>
      <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="/Category">Categories</a></li>
      <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Create</li>
    </ol>
    <h6 class="font-weight-bolder mb-0">Categories</h6>
  </nav>
</content>
<div id="content" role="main">
  <did class="row">
    <div class="col-12">
      <div class="card ">
        <div class="card-header pb-0">
          <h6 class="text-capitalize">Create a new category</h6>
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
            <g:hasErrors bean="${this.category}">
              <div class="alert alert-danger alert-dismissible text-white" role="alert">

                <g:eachError bean="${this.category}" var="error">
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
          <g:form controller="category" action ="save" method="POST" class="form">
            <div class="input-group input-group-outline mb-4">
              <label class="form-label">Name</label>
              <g:textField name="categoryName"  class="form-control" id="categoryName" value="${this.category.categoryName}" />
            </div>
            <g:submitButton name="create" class="btn bg-gradient-primary mb-4"
                            value="Save" />
          </g:form>
        </div>
      </div>
    </div>
  </did>
</div>
</body>
</html>
