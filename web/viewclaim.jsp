<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty UnderWriter}" >
    <jsp:forward page="UnderWriterlogin.jsp"/>
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
                <div class="container py-3">
                    <div class="p-1 mb-4 bg-light rounded-3">
                        <div class="container-fluid py-1">
                            <h1 style="color: green">Claim Details</h1>
                            <form>
                                <table class="table table-bordered m-auto">
                                    <tr>
                                        <th><label>Claim Id</label></th>
                                        <td><input name="claimId" class="form-control" id="claimId" value="${Claim.getClaimId()}" readonly></td>
                                </tr>
                                <tr>
                                    <th><label>Insurance Id</label></th>
                                    <td><input name="insuranceId" class="form-control" id="insuranceId" value="${Claim.getInsuranceId()}" readonly></td>
                                </tr>
                                <tr>
                                    <th><label>Owner Name</label></th>
                                    <td><input name="userName" class="form-control" id="userName" value="${Claim.getUserName()}" readonly></td>
                                </tr>
                                <tr>
                                    <th><label>Claim Date</label></th>
                                    <td><input name="date" class="form-control" id="date" value="${Claim.getDate()}" readonly></td>
                                </tr>
                                <tr>
                                    <th><label>Driver Id</label></th>
                                    <td><input name="driverId" class="form-control" value="${Claim.getDriverId()}" readonly></td>
                                </tr>
                                <tr>
                                    <th><label>Driver Name</label></th>
                                    <td><input name="driverName" class="form-control" value="${Claim.getDriverName()}" readonly></td>
                                </tr>
                                <tr>
                                    <th><label>Driver License</label></th>
                                    <td><input name="driverLicense" class="form-control" value="${Claim.getDriverLicense()}" readonly></td>
                                </tr>
                                <tr>
                                    <th><label>Policy Id</label></th>
                                    <td><input name="policyId" class="form-control" id="policyId" value="${Claim.getPolicyId()}" readonly></td>
                                </tr>
                            </table>
                            <div>
                                <a class="btn btn-info mt-3" onclick="goTo('insurancedetails.jsp', 'insurance')">Check Insurance Details</a>
                                <a class="btn btn-info mt-3" onclick="goTo('dmvdetails.jsp', 'dmv')">Check DMV Details</a>
                            </div>
                            <div>
                                <a class="btn btn-success mt-3 w-25" href="Approve?claimId=${Claim.getClaimId()}">Approve</a>
                                <a class="btn btn-danger mt-3 w-25" href="Reject?claimId=${Claim.getClaimId()}">Reject</a>
                            </div>
                        </form>
                    </div>
                </div>
                <footer class="pt-3 mt-4 text-muted border-top">
                    &copy; 2023
                </footer>
            </div>
        </main>
        <script>
            function goTo(method, id) {
                $.ajax({
                    url: method,
                    success: function (responseText) {
                        //console.log(responseText);
                                        $("#" + id).html(responseText);
                                    }
                });
            }
        </script>
        <script src="https://getbootstrap.com/docs/5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/dmvpolicy.js"></script>
    </body>
</html>