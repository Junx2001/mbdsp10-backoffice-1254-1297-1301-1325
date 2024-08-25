<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Dashboard</title>
  <asset:stylesheet href="style.css"/>
</head>
<body>
<content tag="breadcrumb">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
      <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Home</a></li>
      <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="/Product">Products</a></li>
      <li class="breadcrumb-item text-sm text-dark active" aria-current="page">${this.product.id}</li>
    </ol>
    <h6 class="font-weight-bolder mb-0">Product</h6>
  </nav>
</content>
<div id="content" role="main">
  <div class="card card-body mx-3 mx-md-4 mt-2">
    <div class="row gx-4 mb-2">
      <div class="col-auto">
        <div class="avatar avatar-xl position-relative">
          <img src="${this.product.productImage}" alt="${this.product.productName}" class="w-100 border-radius-lg shadow-sm" />
        </div>
      </div>
      <div class="col-auto my-auto">
        <div class="h-100">
          <h5 class="mb-1">
            ${this.product.productName}
          </h5>
          <p class="mb-1 font-weight-normal text-sm">
            Current owner : ${this.product.actualOwner.username}
          </p>
          <p class="mb-0 font-weight-normal text-sm">
            <g:if test="${this.product.isExchangeable}">
              <span class="badge badge-sm bg-gradient-success">is exchangeable</span>
            </g:if>
            <g:else>
              <span class="badge badge-sm bg-gradient-danger">not exchangeable</span>
            </g:else>
          </p>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="row">
        <div class="col-8">

          <div class="row">
            <div class="col-12">
              <div class="card card-plain h-100">
                <div class="card-header pb-0 p-3">
                  <h6 class="mb-0">Current Exchanges</h6>
                </div>
                <div class="card-body p-3">
                  <div class="table-responsive p-0">
                    <table class="table align-items-center mb-0">
                      <thead>
                      <tr>
                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Ref</th>
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
                      <g:each in="${exchangeList}" var="exchange">
                        <tr>
                            <td class="align-middle text-center">
                              <span class="text-sm ">${exchange.id}</span>
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
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card card-plain h-100">
            <div class="card-header pb-0 p-3">
              <h6 class="mb-0">Transaction overview</h6>
            </div>
            <div class="card-body p-3">
              <div class="timeline timeline-one-side">
                <g:each in="${transactionList}" var="transaction">
                  <div class="timeline-block mb-3">
                    <span class="timeline-step">
                      <i class="material-icons text-success text-gradient">check_circle</i>
                    </span>
                    <div class="timeline-content">
                      <h6 class="text-dark text-sm font-weight-bold mb-0">
                        Transaction between <span class="text-primary">${transaction.owner.username}</span> and <span class="text-primary">${transaction.taker.username}</span>
                      </h6>
                      <p class="text-secondary font-weight-bold text-xs mt-1 mb-0">
                        <g:formatDate format="yyyy-MM-dd HH:mm" date="${transaction.creationDate}"/>
                      </p>
                    </div>
                  </div>
                </g:each>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
