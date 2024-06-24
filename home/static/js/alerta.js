function hizoClick() {
    var nombre = document.getElementById("name").value;
    var correo = document.getElementById("correo").value;
    if (nombre == "") {
        alert("Debes compeltar ambos campos"); 
    } else {
    alert("Enviado");
    }
  }