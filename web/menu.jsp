<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">Insurance <sup>+</sup></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav text-start">
            <a class="btn bg-transparent" style="color: yellow" href="Policies">Policies</a>
        </ul>
        <ul class="navbar-nav m-auto text-start">
 
        </ul>
        <form class="form-inline my-2 my-lg-0">
            
                <c:if test="${not empty User}">
                    <a class="nav-link" href="#">
                    Welcome: 
                    <c:out value = "${User.getName()}"/>
                    </a>
                </c:if>
                <c:if test="${not empty Officer}">
                    <a class="nav-link" href="#">
                    Welcome: 
                    <c:out value = "${Officer.getName()}"/>
                </c:if>
                <c:if test="${not empty UnderWriter}">
                    <a class="nav-link" href="#">
                    Welcome:<c:out value = "${UnderWriter.getName()}"/>
                    </a>
                </c:if>
        </form>
        <div class="text-end">
            <a href="Logout">
                <button type="button" class="btn btn-outline-light me-2" >Log Out</button>
            </a>
        </div>
    </div>
</nav>