<div class="p-1 mb-1 bg-light rounded-3">
    <div class="container-fluid py-1">
        <form>
            <label>Enter Driver Id</label>
            <input type="text" id="viewDriverId" name="viewDriverId" value="${Claim.getDriverId()}">
            <a class="btn btn-warning" onclick ="ShowDMV()">View Details</a>
        </form>
        <h1>DMV Details</h1>
        <table class="table table-bordered m-auto">
            <tr>
                <th><label>Driver Id</label></th>
                <td><input name="driverID" class="form-control" id="driverID" readonly></td>
            </tr>
            <tr>
                <th><label>Driver Name</label></th>
                <td><input name="driverName" class="form-control" id="driverName" readonly></td>
            </tr>
            <tr>
                <th><label>Driver License</label></th>
                <td><input name="driverLicense" class="form-control" id="driverLicense" readonly></td>
            </tr>
        </table>
    </div>
</div>
            <script>
function ShowDMV (){
    const id = document.getElementById("viewDriverId").value;
    let driverId = document.getElementById("driverID");
    let driverName = document.getElementById("driverName");
    let driverLicense = document.getElementById("driverLicense");
    fetch('https://63f4dc9f2213ed989c4c4cba.mockapi.io/driver/license/'+id)
      .then(response => response.json())
      .then((response) => {
            console.log(response);
            driverId.value = response.id;
            driverName.value = response.driverName;
            driverLicense.value = response.driverLicense;
            }
            );
}
</script>