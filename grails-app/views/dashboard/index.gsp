<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Dashboard</title>
    <asset:stylesheet href="style.css"/>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
        #map {
            width: 100%;
            height: 500px;
        }
    </style>
</head>
<body>
<content tag="breadcrumb">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Home</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Dashboard</li>
        </ol>
        <h6 class="font-weight-bolder mb-0">Dashboard</h6>
    </nav>
</content>
<div id="content" role="main">
    <div class="row">
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-header p-3 pt-2">
                    <div class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                        <i class="material-icons opacity-10">person</i>
                    </div>
                    <div class="text-end pt-1">
                        <p class="text-sm mb-0 text-capitalize">Today's Users</p>
                        <h4 class="mb-0">${totalUsers}</h4>
                    </div>
                </div>
                <hr class="dark horizontal my-0">
            </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-header p-3 pt-2">
                    <div class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                        <i class="material-icons opacity-10">sync</i>
                    </div>
                    <div class="text-end pt-1">
                        <p class="text-sm mb-0 text-capitalize">Today's Exchanges</p>
                        <h4 class="mb-0">${totalExchanges}</h4>
                    </div>
                </div>
                <hr class="dark horizontal my-0">
            </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card z-index-2  ">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                    <div class="bg-gradient-success shadow-success border-radius-lg py-3 pe-1">
                        <div class="chart">
                            <canvas id="chart-line" class="chart-canvas" height="170"></canvas>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h6 class="mb-0 "> Daily Transactions </h6>
                    <hr class="dark horizontal">
                </div>
            </div>
        </div>
</div>
    <div class="row mt-4">
        <div class="col-lg-4 col-md-6">
            <div class="card h-100">
                <div class="card-header pb-0">
                    <h6>Transaction overview</h6>
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
        <div class="col-lg-8 col-md-6 mb-md-0 mb-4">
            <div class="card">
                <div class="card-header pb-0">
                    <div class="row">
                        <div class="col-lg-6 col-7">
                            <h6>Exchanges overview</h6>
                        </div>
                        <div class="col-lg-6 col-5 my-auto text-end">
                            <div class="dropdown float-lg-end pe-4">
                                <a class="cursor-pointer" id="dropdownTable" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-ellipsis-v text-secondary"></i>
                                </a>
                                <ul class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5" aria-labelledby="dropdownTable">
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                                    <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body px-0 pb-2">
                    <div class="table-responsive">
                        <table class="table align-items-center mb-0">
                            <thead>
                            <tr>
                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Ref</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Proposer</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Proposer products</th>
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
                                        <span class="badge badge-sm bg-gradient-${exchange.status == 'ACCEPTED' ? 'success' : exchange.status == 'CANCELLED' ? 'danger' : 'warning'}">
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
    <div class="row mt-4">
        <div class="col-12">
            <div class="card z-index-2  ">
                <div class="card-body">
                    <h6 class="mb-0 "> Transaction location </h6>
                </div>
                <div class="card-header p-0 position-relative mb-n4 mx-3 z-index-2 bg-transparent">
                    <div class="shadow-success border-radius-lg py-3 pe-1 w-100 h-100">
                        <div id="map"></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<input type="hidden" value="${dailyTransactions}" id="dailyTransactions" />
<input type="hidden" value="${mapTransactions}" id="mapTransactions" />

<asset:javascript src="plugins/chartjs.min.js"/>
<script>
    var ctx2 = document.getElementById("chart-line").getContext("2d");
    var dailyTransactionsJson = document.getElementById("dailyTransactions").value;
    var dailyTransactions = JSON.parse(dailyTransactionsJson)
    var labels = dailyTransactions.map(item => item._id);
    var datasets = dailyTransactions.map(item => item.count);

    new Chart(ctx2, {
        type: "line",
        data: {
            labels: labels,
            datasets: [{
                label: "Transactions",
                tension: 0,
                borderWidth: 0,
                pointRadius: 5,
                pointBackgroundColor: "rgba(255, 255, 255, .8)",
                pointBorderColor: "transparent",
                borderColor: "rgba(255, 255, 255, .8)",
                borderColor: "rgba(255, 255, 255, .8)",
                borderWidth: 4,
                backgroundColor: "transparent",
                fill: true,
                data: datasets,
                maxBarThickness: 6

            }],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false,
                }
            },
            interaction: {
                intersect: false,
                mode: 'index',
            },
            scales: {
                y: {
                    grid: {
                        drawBorder: false,
                        display: true,
                        drawOnChartArea: true,
                        drawTicks: false,
                        borderDash: [5, 5],
                        color: 'rgba(255, 255, 255, .2)'
                    },
                    ticks: {
                        display: true,
                        color: '#f8f9fa',
                        padding: 10,
                        font: {
                            size: 14,
                            weight: 300,
                            family: "Roboto",
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
                x: {
                    grid: {
                        drawBorder: false,
                        display: false,
                        drawOnChartArea: false,
                        drawTicks: false,
                        borderDash: [5, 5]
                    },
                    ticks: {
                        display: true,
                        color: '#f8f9fa',
                        padding: 10,
                        font: {
                            size: 14,
                            weight: 300,
                            family: "Roboto",
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
            },
        },
    });
</script>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<script>
    var mapTransactionsList = document.getElementById("mapTransactions").value;
    const mapTransactionsJson = mapTransactionsList
        .replace(/([{\s,])([a-zA-Z0-9_]+)=/g, '$1"$2":') // Add quotes around keys
        .replace(/=/g, ':') // Replace '=' with ':'
        .replace(/'/g, '"');
    var mapTransactions = JSON.parse(mapTransactionsJson)

        //[{"_id": {"latitude": -20.295482, "longitude": 44.278044}, "count": 1}, {"_id": {"latitude": -19.86268, "longitude": 47.033619}, "count": 1}, {"_id": {"latitude": -18.944499, "longitude": 47.524682}, "count": 1}, {"_id": {"latitude": -18.915619, "longitude": 47.539369}, "count": 1}, {"_id": {"latitude": -18.91552, "longitude": 47.5394}, "count": 1}]

    // initialize Leaflet
    var map = L.map('map').setView({lon: 47.532831, lat: -18.986034}, 5);

    // add the OpenStreetMap tiles
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 50,
        attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap contributors</a>'
    }).addTo(map);

    // show the scale bar on the lower left corner
    L.control.scale({imperial: true, metric: true}).addTo(map);

    // count = 1 -> 10
    mapTransactions.map(item => {
        var coord = item._id
        var rayon = item.count*100
        L.circle([coord.latitude, coord.longitude], rayon, {
            color: 'red',
            fillColor: '#f03',
            fillOpacity: 0.5
        }).addTo(map)
    });
</script>
</body>
</html>
