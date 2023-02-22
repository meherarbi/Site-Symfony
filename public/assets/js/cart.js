


function updateProductTotal(productId) {
  // Récupérer la quantité actuelle du produit
  let quantityInput = document.querySelector(
    'input[data-product-id="' + productId + '"]'
  );
  let currentQuantity = parseInt(quantityInput.value);

  // Récupérer le prix unitaire du produit
  let priceElement = document.querySelector(
    'td[data-product-id="' + productId + '"]'
  );
  let currentPrice = parseFloat(priceElement.textContent.replace(" $", ""));

  // Calculer le nouveau prix total pour ce produit
  let newTotal = currentPrice * currentQuantity;
  /*  console.log("newTotal", newTotal); */

  // Récupérer l'élément qui affiche le prix total pour ce produit
  let totalElement = document.querySelector(
    '.product-total[data-product-id="' + productId + '"]'
  );
  /* console.log("totalElement", totalElement); */

  // Mettre à jour l'affichage du prix total pour ce produit
  totalElement.textContent = newTotal.toFixed(2) + " $";
}

function incrementProduct(productId) {
  /* console.log("Button with product id " + productId + " was clicked."); */

  // Get the current quantity of the product
  let quantityInput = document.querySelector(
    'input[data-product-id="' + productId + '"]'
  );
  /*   console.log("quantityInput", quantityInput); */
  let currentQuantity = parseInt(quantityInput.value);
  /* console.log("currentQuantity", currentQuantity); */

  // Increment the quantity by 1
  let newQuantity = currentQuantity + 1;
  /*   console.log(newQuantity); */

  // Send an AJAX request to update the cart
  let xhr = new XMLHttpRequest();
  xhr.open("PUT", "/my-cart/cart/add/" + productId, true);
  xhr.setRequestHeader("Content-Type", "application/json");
  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
      console.log("Cart updated successfully.");

      // Update the quantity input with the new quantity
      quantityInput.value = newQuantity;

      // Update the total price
      updateProductTotal(productId);
      updateCartTotal();
    }
  };
  xhr.send(
    JSON.stringify({
      quantity: newQuantity,
    })
  );
  
}

function decrementProduct(productId) {
  /* console.log("Button with product id " + productId + " was clicked."); */

  // Get the current quantity of the product
  let quantityInput = document.querySelector(
    'input[data-product-id="' + productId + '"]'
  );
  /*   console.log("quantityInput", quantityInput); */
  let currentQuantity = parseInt(quantityInput.value);
  /* console.log("currentQuantity", currentQuantity); */

  // Increment the quantity by 1
  let newQuantity = currentQuantity - 1;
  /*   console.log(newQuantity); */

  // Send an AJAX request to update the cart
  let xhr = new XMLHttpRequest();
  xhr.open("PUT", "/my-cart/cart/decrease/" + productId, true);
  xhr.setRequestHeader("Content-Type", "application/json");
  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
      console.log("Cart updated successfully.");

      // Update the quantity input with the new quantity
      quantityInput.value = newQuantity;

      // Update the total price
      updateProductTotal(productId);
      updateCartTotal();
    }
  };
  xhr.send(
    JSON.stringify({
      quantity: newQuantity,
    })
  );
}
function updateCartTotal() {
  // Récupérer tous les éléments de prix totaux pour chaque produit
  let productTotals = document.querySelectorAll(".product-total");
  console.log(productTotals);

  // Initialiser la variable pour stocker le total de la carte
  let cartTotal = 0;

  // Boucler sur chaque élément de prix total pour chaque produit
  for (let i = 0; i < productTotals.length; i++) {
    console.log("productTotal", productTotals[i].textContent);

    let productTotal = parseFloat(
      productTotals[i].textContent.replace(/[\s,$]/g, "")
    );

    // Vérifier si productTotal est une valeur NaN
    if (!isNaN(productTotal)) {
      cartTotal += productTotal;
    }
  }

  // Récupérer l'élément qui affiche le total de la carte
  let cartTotalElement = document.querySelector(".total-cell");

  // Mettre à jour l'affichage du total de la carte
  cartTotalElement.textContent = cartTotal.toFixed(2) + " $";
}











