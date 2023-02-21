<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <div class="container py-4">
                    <header class="pb-3 mb-4 border-bottom bg-warning">
                        <a href="#" class="d-flex align-items-center text-dark text-decoration-none">
                            <b>A life insurance quote is the premium price of the life insurance policy. It is crucial to get a life insurance quote so as to simplify the comparison between different life insurance policies and make a wise choice.</b>
                        </a>
                    </header>

                    <div class="p-0 mb-0 bg-light rounded-3">
                        <div class="container-fluid py-0">
                            <h1>Policy List</h1>
                            <table class="table table-bordered table-hover" cellspacing="0">
                                <thead class="bg-info">
                                    <tr>
                                        <th>Policy Id</th>
                                        <th>Title</th>
                                        <th>Description</th>                  
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty PolicyList}">
                                    <c:forEach var="policy" items="${PolicyList}">
                                        <tr>
                                            <td>${policy.getPolicyId()}</td>
                                            <td>${policy.getTitle()}</td>
                                            <td>${policy.getDescription()}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
                <footer class="pt-3 mt-4 text-muted border-top">
                    &copy; 2023
                </footer>
            </div>
        </main>
        <script src="https://getbootstrap.com/docs/5.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>