$(document).ready(function() {
  logOutListener()
});

var logOutListener = function () {
  $(".logout").on("click", function (event) {
    event.preventDefault()
    $.ajax({
      url: "/sessions",
      method: "POST",
      data: {_method: 'DELETE'}
    })
    .done(function () {
      location.reload(true)
    })
    .fail(function () {
      location.reload(true)
    })
  })
}