<script>
$(document).ready(function () {
  // Navbar

  // Navbar profile dropdown
  $("#dropdown-btn").click(function () {
    console.log($("#dropdown-btn"));
    $("#profile-dropdown").slideToggle(200);
  })

  // Log in page

  // Remember me button align
  $(".form-check").addClass("flex items-center");


  // Flashes fade out hide the .flash element after 2 seconds

  setTimeout(function() {
    $(".flash").fadeOut(1000, function() {
      if ($(this).is(":hidden")) {
        console.log("Element successfully hidden.");
      } else {
        console.log("Animation interrupted or failed.");
      }
    });
  }, 3000);
});

</script>
