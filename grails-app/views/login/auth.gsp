<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Troc App</title>
  <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
  <!--     Fonts and icons     -->
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />

  <!-- Nucleo Icons -->
  <asset:stylesheet href="nucleo-icons.css" rel="stylesheet" />
  <asset:stylesheet href="nucleo-svg.css" rel="stylesheet" />

  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>

  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">

  <!-- CSS Files -->
  <asset:stylesheet id="pagestyle" href="material-dashboard.css" rel="stylesheet" />
</head>

<body class="bg-gray-200">
<main class="main-content  mt-0">

  <div class="page-header align-items-start min-vh-100" style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
    <span class="mask bg-gradient-dark opacity-6"></span>
    <div class="container my-auto">
      <div class="row">
        <div class="col-lg-4 col-md-8 col-12 mx-auto">
          <div class="card z-index-0 fadeIn3 fadeInBottom">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">Sign in</h4>
              </div>
            </div>
            <div class="card-body">
              <form role="form" class="text-start" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm">
                <div class="input-group input-group-outline my-3">
                  <label for="username" class="form-label">Email</label>
                  <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none" value="Super Admin">
                </div>
                <div class="input-group input-group-outline mb-3">
                  <label class="form-label">Password</label>
                  <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password" value="motdepasse">
                </div>
                <div class="form-check form-switch d-flex align-items-center mb-3">
                  <input class="form-check-input" type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>>
                  <label class="form-check-label mb-0 ms-3" for="remember_me">Remember me</label>
                </div>
                <div class="text-center">
                  <button type="submit" id="submit" class="btn bg-gradient-primary w-100 my-4 mb-2">Sign in</button>
                </div>
              </form>

              <g:if test='${flash.message}'>
                <div class="alert alert-danger alert-dismissible text-white fade show" role="alert">
                  <span class="alert-text">${flash.message}</span>
                  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
              </g:if>

            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="footer position-absolute bottom-2 py-2 w-100">
      <div class="container">
        <div class="row align-items-center justify-content-lg-between">
          <div class="col-12 col-md-6 my-auto">
            <div class="copyright text-center text-sm text-muted text-lg-start">
              © <script>
              document.write(new Date().getFullYear())
            </script>,
              <span class="font-weight-bold">MBDS TPT Prom 10</span> 1325, 1254, 1297, 1301.
            </div>
          </div>
        </div>
      </div>
    </footer>
  </div>
</main>
<asset:javascript src="core/popper.min.js"/>
<asset:javascript src="core/bootstrap.min.js"/>
<asset:javascript src="plugins/perfect-scrollbar.min.js"/>
<asset:javascript src="plugins/smooth-scrollbar.min.js"/>
<asset:javascript src="material-dashboard.min.js"/>
<script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function(event) {
    document.forms['loginForm'].elements['username'].focus();
  });

</script>
</body>

</html>