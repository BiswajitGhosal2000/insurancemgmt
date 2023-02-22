<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty UnderWriter}" >
    <jsp:forward page="login.jsp"/>
</c:if>
<!doctype html>
<html lang="en">
    <head>
        <title>Insurance Management</title>
        <link rel="SHORTCUT ICON" href="img/profilePhoto.png">
        <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/home.css"/>
        <!-- Custom styles for this template -->
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    </head>
    <body class="text-center">
        <jsp:include page="menu.jsp"></jsp:include>
        <main>
            <!--<div class="jumbotron">-->
                <h1>Claim List</h1>
                <table class="table table-bordered table-hover" cellspacing="0">
                    <thead class="bg-info">
                        <tr>
                            <th>Claim Id</th>
                            <th>Insurance Id</th>
                            <th>Owner Name</th>
                            <th>Date</th>
                            <th>Driver Id</th>
                            <th>Driver Name</th>
                            <th>Driver License</th>
                            <th>Policy Id</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty ClaimList}">
                        <c:forEach var="claim" items="${ClaimList}">
                            <tr>
                                <td>${claim.getClaimId()}</td>
                                <td>${claim.getInsuranceId()}</td>
                                <td>${claim.getUserName()}</td>
                                <td>${claim.getDate()}</td>
                                <td>${claim.getDriverId()}</td>
                                <td>${claim.getDriverName()}</td>
                                <td>${claim.getDriverLicense()}</td>
                                <td>${claim.getPolicyId()}</td>
                                <td><a onclick="showDetails('ViewClaim',${claim.getClaimId()})" class="btn btn-success">View Details</a></td>
                                <!--<td><a href="ViewClaim?claimId=${claim.getClaimId()}" class="btn btn-success">View</a></td>-->
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            <!--</div>-->
            <div class="row align-items-md-stretch">
                <div class="col-md-6" >
                    <div class="h-100 p-5 text-white rounded-3" id="changeableArea">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="h-50 p-1 text-white rounded-3 mt-5" id="insurance">
                    </div>
                    <div class="h-50 p-1 text-white rounded-3" id="dmv">
                    </div>
                    
                </div>
            </div>
        </main>
        <script>
            function showDetails(method,data){
                $.ajax({
                url: method,
                data: {
                    claimId: data
                },
                success: function (responseText) {
                console.log(responseText);
                $("#changeableArea").html(responseText);
                }
                });
            }
        </script>
        <script src="https://getbootstrap.com/docs/5.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>