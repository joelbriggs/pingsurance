document.addEventListener("DOMContentLoaded", function(event) {
  dismiss = document.getElementById("clear-alert")

  dismiss.addEventListener("click", function() {
    dismiss.parentElement.remove()
  })

});