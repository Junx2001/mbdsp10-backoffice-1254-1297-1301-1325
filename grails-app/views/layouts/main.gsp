<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Troc App</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

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
    <asset:stylesheet id="custom" href="style.css" rel="stylesheet" />

    <g:layoutHead/>
</head>

<body class="g-sidenav-show  bg-gray-200">

<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">

    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="/" target="_blank">
            <asset:image src="grails.svg" class="navbar-brand-img h-100" alt="Grails Logo"/>
            <span class="ms-1 font-weight-bold text-white">TA - Admin Area</span>
        </a>
    </div>


    <hr class="horizontal light mt-0 mb-2">

    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link text-white " href="/">

                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">dashboard</i>
                    </div>

                    <span class="nav-link-text ms-1">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white " href="/product">

                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">list</i>
                    </div>

                    <span class="nav-link-text ms-1">Manage Products</span>
                </a>
            </li>


            <li class="nav-item">
                <a class="nav-link text-white " href="/exchange">

                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">sync_alt</i>
                    </div>

                    <span class="nav-link-text ms-1">Log Exchanges</span>
                </a>
            </li>


            <li class="nav-item">
                <a class="nav-link text-white " href="/user">

                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">manage_accounts</i>
                    </div>

                    <span class="nav-link-text ms-1">Manage Users</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link text-white " href="/category">

                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">list</i>
                    </div>

                    <span class="nav-link-text ms-1">Manage Categories</span>
                </a>
            </li>

            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">Account pages</h6>
            </li>

            <li class="nav-item">
                <sec:ifLoggedIn>
                    <g:link controller="logout" class="nav-link text-white ">
                        <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                            <i class="material-icons opacity-10">logout</i>
                        </div>
                        <span class="nav-link-text ms-1">Sign Out</span>
                    </g:link>
                </sec:ifLoggedIn>
            </li>

            <li class="nav-item">
                <sec:ifNotLoggedIn>
                    <g:link controller="login"  class="nav-link text-white ">
                        <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                            <i class="material-icons opacity-10">login</i>
                        </div>
                        <span class="nav-link-text ms-1">Sign In</span>
                    </g:link>
                </sec:ifNotLoggedIn>
            </li>


        </ul>
    </div>


</aside>
<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
        <div class="container-fluid py-1 px-3">
            <g:pageProperty name="page.breadcrumb"/>

            <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                </div>
                <ul class="navbar-nav  justify-content-end">
                    <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                            <div class="sidenav-toggler-inner">
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item d-flex align-items-center">

                    </li>

                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid py-4">
        <g:layoutBody/>
    </div>
    <footer class="footer py-4  ">
        <div class="container-fluid">
            <div class="row align-items-center justify-content-lg-between">
                <div class="col-lg-6 mb-lg-0 mb-4">
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
</main>


<asset:javascript src="core/popper.min.js"/>
<asset:javascript src="core/bootstrap.min.js"/>
<asset:javascript src="plugins/perfect-scrollbar.min.js"/>
<asset:javascript src="plugins/smooth-scrollbar.min.js"/>
<asset:javascript src="material-dashboard.min.js"/>
</body>
</html>
