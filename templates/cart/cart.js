$(".add-button").click(function () {
    console.log('add button clicked');
  var productId = $(this).data("product-id");
  $.ajax({
    url: "/cart/add/" + productId,
    type: "POST",
    success: function (response) {
      // handle success response, update quantity display
    },
  });
});

$(".remove-button").click(function () {
  var productId = $(this).data("product-id");
  $.ajax({
    url: "/cart/remove/" + productId,
    type: "POST",
    success: function (response) {
      // handle success response, update quantity display
    },
  });
});
