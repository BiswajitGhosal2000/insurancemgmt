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