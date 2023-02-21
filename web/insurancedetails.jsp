<div class="p-1 mb-1 bg-light rounded-3">
    <div class="container-fluid py-1">
        <form>
            <label>Enter Insurance Id</label>
            <input type="text" id="viewInsuranceId" name="viewInsuranceId" value="${Claim.getInsuranceId()}">
            <a class="btn btn-warning" onclick ="ShowInsurance()">View Details</a>
        </form>
        <h1>Insurance Details</h1>
        <table class="table table-bordered m-auto">
            <tr>
                <th><label>Insurance Id</label></th>
                <td><input name="insuranceID" class="form-control" id="insuranceID" readonly></td>
            </tr>
            <tr>
                <th><label>Insurance Holder Name</label></th>
                <td><input name="ownerName" class="form-control" id="ownerName" readonly></td>
            </tr>
            <tr>
                <th><label>Policy Id</label></th>
                <td><input name="userPolicyId" class="form-control" id="userPolicyId" readonly></td>
            </tr>
            <tr>
                <th><label>Policy Status</label></th>
                <td><input name="status" class="form-control" id="status" readonly></td>
            </tr>
        </table>
    </div>
</div>
<script>
function ShowInsurance (){
    const id = document.getElementById("viewInsuranceId").value;
    let insuranceID = document.getElementById("insuranceID");
    let ownerName = document.getElementById("ownerName");
    let userPolicyId = document.getElementById("userPolicyId");
    let status = document.getElementById("status");
    fetch('https://63f4dc9f2213ed989c4c4cba.mockapi.io/driver/insurance/'+id)
      .then(response => response.json())
      .then((response) => {
            console.log(response);
            insuranceID.value = response.id;
            ownerName.value = response.name;
            userPolicyId.value = response.policyId;
            status.value = response.status;
            }
            );
}
</script>