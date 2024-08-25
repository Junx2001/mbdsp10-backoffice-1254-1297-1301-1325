<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Transaction</title>
  <asset:stylesheet href="style.css"/>
</head>
<body>
<content tag="breadcrumb">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
      <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Home</a></li>
      <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Exchanges</li>
    </ol>
    <h6 class="font-weight-bolder mb-0">Exchanges</h6>
  </nav>
</content>
<div id="content" role="main">
  <div class="row">
    <div class="col-12">
      <div class="card ">
        <div class="card-header pb-0">
          <h6 class="text-capitalize">Exchanges history</h6>
          <g:form action="search"  method="GET" >
            <div class="row">
              <div class="col">
                <div class="input-group input-group-outline my-3">
                  <g:textField name="keyword"  class="form-control" id="keyword" placeholder="Keyword"
                               value="${params.keyword ?: ''}"/>
                </div>
              </div>
              <div class="col">
                <div class="input-group input-group-outline my-3">
                  <select id="exampleFormControlSelect1" class="form-control" name="state">
                    <option value="" ${params.state == '' || params.state == null ? 'selected' : ''}>All</option>
                    <option value="CREATED" ${params.state == 'pending' ? 'selected' : ''}>CREATED</option>
                    <option value="ACCEPTED" ${params.state == 'accepted' ? 'selected' : ''}>ACCEPTED</option>
                    <option value="CANCELLED" ${params.state == 'rejected' ? 'selected' : ''}>CANCELLED</option>
                    <option value="RECEIVED" ${params.state == 'rejected' ? 'selected' : ''}>RECEIVED</option>
                  </select>
                </div>
              </div>
              <div class="col">
                <button class="btn btn-primary my-3" type="submit">Search</button>
              </div>
            </div>
          </g:form>
          <div >
          <g:form action="exportCsv"  method="POST" >
            <button class="btn btn-icon btn-3 btn-info" type="submit">
              <span class="btn-inner--icon"><i class="material-icons">download</i></span>
              <span class="btn-inner--text">Export CSV</span>
            </button>
          </g:form>
          </div>
        </div>

        <div class="card-body px-0 pb-2">
          <div class="table-responsive p-0">
            <table class="table align-items-center mb-0">
              <thead>
              <tr>
                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Owner</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Owner products</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Taker</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Taker products</th>
                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Datetime</th>
                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                <th class="text-secondary opacity-7"></th>
              </tr>
              </thead>
              <tbody>
              <g:each in="${exchangeList}" var="exchange" >
                <tr>
                  <td class="align-middle text-center">
                    <span class="text-sm "></span>
                  </td>
                  <td>
                    <span class="text-xs ">${exchange.ownerProposition.user.username}</span>
                  </td>
                  <td class=" align-middle text-xs">
                    <ul>
                      <g:each in="${exchange.ownerProposition.getProducts()}" var="product">
                        <li>${product.productName}</li>
                      </g:each>
                    </ul>
                  </td>
                  <td>
                    <span class="text-xs ">${exchange.takerProposition.user.username}</span>
                  </td>
                  <td class="align-middle text-xs">
                    <ul>
                      <g:each in="${exchange.takerProposition.getProducts()}" var="product">
                        <li>${product.productName}</li>
                      </g:each>
                    </ul>
                  </td>
                  <td class="align-middle text-center">
                    <span class="text-secondary text-xs">
                      <g:formatDate format="yyyy-MM-dd HH:mm" date="${exchange.creationDate}"/>
                    </span>
                  </td>
                  <td class="align-middle text-center text-sm">
                    <span class="badge badge-sm bg-gradient-${exchange.status == 'ACCEPTED' || exchange.status == 'RECEIVED'  ? 'success' : exchange.status == 'CANCELLED' ? 'danger' : 'warning'}">
                      ${exchange.status}
                    </span>
                  </td>
                </tr>
              </g:each>
              </tbody>
            </table>

            <g:if test="${exchangeCount > params.int('max')}">
              <div class="pagination pagination-primary">
                <g:paginate total="${exchangeCount ?: 0}"/>
              </div>
            </g:if>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
