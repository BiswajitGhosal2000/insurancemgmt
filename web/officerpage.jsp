<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty Officer}" >
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
            <h1 style="color: greenyellow;margin-top: 20px">Approved Claim List</h1>
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
                    <c:if test="${not empty ApprovedClaimList}">
                        <c:forEach var="claim" items="${ApprovedClaimList}">
                            <tr>
                                <td>${claim.getClaimId()}</td>
                                <td>${claim.getInsuranceId()}</td>
                                <td>${claim.getUserName()}</td>
                                <td>${claim.getDate()}</td>
                                <td>${claim.getDriverId()}</td>
                                <td>${claim.getDriverName()}</td>
                                <td>${claim.getDriverLicense()}</td>
                                <td>${claim.getPolicyId()}</td>
                                <td><a href="Sanction?claimId=${claim.getClaimId()}" class="btn btn-success">Sanction</a></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
        </main>
        <script src="https://getbootstrap.com/docs/5.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>