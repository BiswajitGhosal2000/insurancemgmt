<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.User}" >
    <jsp:forward page="userlogin.jsp"/>
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
                <div class="container py-4">
                    <header class="pb-3 mb-4 border-bottom bg-warning">
                        <a href="#" class="d-flex align-items-center text-dark text-decoration-none">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" class="me-2" viewBox="0 0 118 94" role="img"><title>Bootstrap</title><path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z" fill="currentColor"></path></svg>
                            <b>A life insurance quote is the premium price of the life insurance policy. It is crucial to get a life insurance quote so as to simplify the comparison between different life insurance policies and make a wise choice.</b>
                        </a>
                    </header>

                    <div class="p-5 mb-4 bg-light rounded-3">
                        <div class="container-fluid py-5">
                            <h1 class="display-5 fw-bold" style="color:greenyellow; text-shadow: 2px 2px #ff0000;" >Claim Insurance</h1>
                            <p>Despite being a good driver, you could be involved in an accident and the result can be very stressful at times. When you are involved in an accident, you need to follow certain steps to ensure all are safe, follow the law and initiate the insurance claim process. Your immediate action is to inform your insurance company and follow the procedure properly to claim car insurance after an accident. Working with your insurer after an accident is crucial to get your claim settled rightly.</p>
                            <a href="applyclaim.jsp" class="btn btn-primary btn-lg">Apply</a>
                        </div>
                    </div>
                    <div class="p-5 mb-4 bg-light rounded-3">
                        <div class="container-fluid py-5">
                            <h1 class="display-5 fw-bold" style="color:skyblue; text-shadow: 2px 2px #ff0000;" >Track Your Claim</h1>                        
                        <c:if test="${not empty Pending}">
                            <h1 class="text-warning"> <c:out value="${Pending}"></c:out></h1>
                            <c:remove var="Pending" scope="session"/>
                        </c:if>
                        <c:if test="${not empty Approved}">
                            <h1 class="text-success"><c:out value="${Approved}"></c:out></h1>
                            <c:remove var="Approved" scope="session"/>
                        </c:if>
                        <c:if test="${not empty Rejected}">
                            <h1 class="text-danger"><c:out value="${Rejected}"></c:out></h1>
                            <c:remove var="Rejected" scope="session"/>
                        </c:if>
                        <div class=" m-auto p-3">
                            <table class="table table-bordered table-striped">
                                <thead class="bg-warning">
                                    <tr>
                                        <th>Claim Id</th>
                                        <th>Insurance Id</th>
                                        <th>Owner Name</th>
                                        <th>Driver Id</th>
                                        <th>Driver Name</th>
                                        <th>Driver License</th>
                                        <th>Policy Id</th>
                                        <th>Under Writer Status</th>
                                        <th>Officer Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="claim" items="${UserClaimList}">
                                    <tr>
                                        <td>${claim.getClaimId()}</td>
                                        <td>${claim.getInsuranceId()}</td>
                                        <td>${claim.getUserName()}</td>
                                        <td>${claim.getDriverId()}</td>
                                        <td>${claim.getDriverName()}</td>
                                        <td>${claim.getDriverLicense()}</td>
                                        <td>${claim.getPolicyId()}</td>
                                        <td><c:choose>
                                            <c:when test="${claim.isIsapproved() == true}">
                                                <c:out value="Forwarded to Officer"></c:out>
                                            </c:when>
                                            <c:when test="${claim.isIsrejected() == true}">
                                                <c:out value="Rejected by UnderWriter"></c:out>
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="Under Process"></c:out>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${claim.isIssanctioned()== true}">
                                                <c:out value="Sanctioned by Officer"></c:out>
                                            </c:when>
                                            <c:when test="${claim.isIsrejected() == true}">
                                                <c:out value="Rejected by UnderWriter"></c:out>
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="Under Process"></c:out>
                                            </c:otherwise>
                                        </c:choose></td>                                   
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row align-items-md-stretch">
                    <div class="col-md-6">
                        <div class="h-100 p-5 text-white bg-dark rounded-3">
                            <h2>Five Steps to Take after an Accident</h2>
                            <h5>First thing first, check whether you have any serious injury. If yes, call the ambulance and wait for the medical help. Consider helping others, only if you are fit enough to do so. A road accident can also cause damage to your car. It is always a good idea to compare online car insurance quotes and get a policy well in advance. Here are the 5 steps to take after an accident.</h5>
                            <ul>
                                <li>Identify seriously injured persons - Start by identifying severe injuries, such as, bleeding from head, nose, legs, and other organs. In general, victims that can talk or scream are in a better condition than those who cannot breathe or scream.</li>
                                <li>Check for consciousness - Check the pulse to see whether the person is breathing. Keep talking to the person to keep him conscious until medical help arrives. You can ask questions, such as, whether he has an accident insurance policy. If the does not reply, maybe he is in an unconscious state.</li>
                                <li>Remove any obstruction in the airway - Check whether something is blocking the airway in the person?s mouth or throat. If you find something, consider removing the blockage using your middle finger.</li>
                                <li>Try EAR - If the pulse is not working, consider starting external air resuscitation (EAR). Depending on the condition of the person, you may need to try a mouth-to-mouth, a mouth-to-mask or a mouth-to-nose EAR. If you want to know more about the steps of each process, you can join a first aid course. Cardio pulmonary resuscitation (CPR) is an effective first aid treatment for heart failure.</li>
                                <li>Try to stop bleeding - Excessive bleeding from head or mouth could be a sign of danger. If you have a first aid box with you, consider dressing the wounds to stop the bleeding. You can use clean clothes as an alternative to a usual bandage. Make sure that the victim is in a comfortable position. Turn him to his side and keep his neck straight. It is not a good idea to pour water in the victim?s mouth, especially when he is unconscious. It may cause to choking. Finally, do not forget get an accident insurance policy to protect yourself and your family members.</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="h-100 p-5 bg-light border rounded-3">
                            <h2>How to Claim Car Insurance After Accident</h2>
                            <p>A car insurance claim begins with a road accident. The nature of the accident could be two vehicles colliding on the road or a car colliding with an immovable object due to the driver?s negligence. Whatever be the case, filing for a car insurance claim requires you to follow a procedure.
                                When you get involved in an accident, it is natural that you feel a gust of emotions. The situation can be even more stressful if you suffer some body injuries. But you must try to remain calm and think about how to get out of the situation. Know how to claim for car insurance after an accident in order to pay for the expenses.</p>
                            <h3>Steps to follow for claiming car insurance after an accident</h3>
                            <ol>
                                <li>Inform your insurer: Initiate the car insurance claim by informing the car insurance company as soon as possible about the accident and the magnitude of it. Most insurers have a time limit to inform them about the accident, if you fail to intimate them within the deadline, your claim may be rejected.</li>
                                <li>File an FIR at the nearest police station: it is equally vital to file an FIR at a police station. The FIR is an important document that the insurers need to settle claims for physical injuries and damages to the car. The police officials will visit the accident spot to assess whether the accident happened due to mechanical failure or not. The officials will also record details of the driver, witnesses at the spot, and passengers involved in the accident.</li>
                                <li>Click pictures or take a video for evidence: Car accidents can be extremely stressful to deal with but even at such times, you must be aware of the situation and try to click pictures of the accident and gather evidence. It will be useful to support your case during the car insurance claim process. You can take pictures of the bodily injuries and damages to the car. They can serve as proof to validate your claim. Besides, it would help if you note down the name and contact details of the witnesses.</li>
                                <li>Submit the necessary documents to the insurance company:After you have filed the FIR and received a copy of it, you can initiate the settlement process by submitting the necessary documents to the insurance company. Make sure that you submit the copies for important documents including car registration certificate, FIR, driving license, insurance, and other papers as required by the insurer.</li>
                                <li>Request the insurer to send a surveyor: After you file the claim form, you must ask your insurer to assign a surveyor to start the inspection process. The surveyor will assess the damages incurred to your car, and he/she may also assist you with choosing the right garage from the insurer?s network to fix the damages. The survey usually takes places within two to three days after you intimate the insurer about the claim.</li>
                                <li>Get your car repaired: After the surveyor has finished the assessment, you must get your car repaired and initiate the car insurance claim policy process. The settlement can be done in two ways. If you prefer a cashless settlement, you can get your car repaired from any of the network garages and the insurer will directly settle the bill with the garage. But if you prefer reimbursement, you must initially pay the repair cost, and submit the original bills and receipts to the insurance company and claim reimbursement.</li>
                            </ol>
                            <b><i>The claim settlement process for car insurance can be a little challenging to understand, especially if you are filing the claim for the first time. It is therefore suggested that you must read the policy documents carefully to understand the inclusions and exclusions.</i></b>
                        </div>
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