function validateForm() {
  var x = document.forms[""][""].value;
  if (x == "") {
    alert("Name must be filled out");
    return false;
  }
}

function Sub() {
  var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
}
