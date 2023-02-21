<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.User}" >
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
            <main role="main" id = "changeableArea">
                <div class="jumbotron">
                    <div class="container">
                    <c:if test="${not empty SuccessMsg}">
                        <h1 style="color: green"><c:out value="${SuccessMsg}"/></h1>
                        <c:remove var="SuccessMsg" scope="session"/>
                        <% response.setHeader("Refresh", "3;url=home.jsp");%>
                    </c:if>
                    <c:if test="${not empty ErrorMsg}">
                        <h1 style="color: red"><c:out value="${ErrorMsg}"/></h1>
                    </c:if>
                    <h1 style="color: blue">Apply to Claim</h1>
                </div>
                <div class="form-control w-25 m-auto p-3">
                    <form action="ApplyClaim" method="Post">
                        <input type="text" class="form-control" name="insuranceId" value="${User.getUserId()}" required readonly>
                        <input type="date" class="form-control" name="date" required>
                        <input type="text" class="form-control" name="userName" value="${User.getName()}" required readonly>
                        <input type="number" class="form-control" placeholder="Driver Id" name="driverId" required>
                        <input type="text" class="form-control" placeholder="Driver Name" name="driverName" required>
                        <input type="text" class="form-control" placeholder="Driver License" name="driverLicense" required>
                        <input class="form-control" placeholder="policyId" name="policyId" value="${User.getPolicyId()}" required readonly>
                        <button class="w-50 btn btn-lg btn-info mt-5" type="submit">Submit</button>
                    </form>
                </div>
                <footer class="container">
                    <h5>&copy; Exavalu 2023-24</h5>
                </footer>
            </div>       
        </main>
    </body>
</html>