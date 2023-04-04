function updateProductTotal(productId) {
  console.log('updateProductTotal fonctionne')
  // Récupérer la quantité actuelle du produit
  let quantityInput = document.querySelector(
    'input[data-product-id="' + productId + '"]'
  );
  let currentQuantity = parseInt(quantityInput.value);

  // Récupérer le prix unitaire du produit
  let priceElement = document.querySelector(
    'td[data-product-id="' + productId + '"]'
  );
  console.log("priceElement", priceElement);
  let currentPrice = parseFloat(priceElement.textContent.replace(" $", ""));

  // Calculer le nouveau prix total pour ce produit
  let newTotal = currentPrice * currentQuantity;
   console.log("newTotal", newTotal);

  // Récupérer l'élément qui affiche le prix total pour ce produit
  let totalElement = document.querySelector(
    '.product-total[data-product-id="' + productId + '"]'
  );
  console.log("totalElement", totalElement);

  // Mettre à jour l'affichage du prix total pour ce produit
  totalElement.textContent = newTotal.toFixed(2) + " $";
}

function incrementProduct(productId) {
   console.log("Button with product id " + productId + " was clicked."); 

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
      console.log("Cart INCREMENT successfully.");

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
  console.log("Le bouton du produit avec l'ID " + productId + " a été cliqué."); 

  // Obtenir la quantité actuelle du produit
  let quantityInput = document.querySelector(
    'input[data-product-id="' + productId + '"]'
  );
  let currentQuantity = parseInt(quantityInput.value);

  // Décrémenter la quantité de 1
  let newQuantity = currentQuantity - 1;

  // S'assurer que la nouvelle quantité est au moins 1
  if (newQuantity < 1) {
    newQuantity = 1;
  }

  // Mettre à jour l'affichage de la quantité
  quantityInput.value = newQuantity;

  // Envoyer une requête AJAX pour mettre à jour le panier
  let xhr = new XMLHttpRequest();
  xhr.open("PUT", "/my-cart/cart/add/" + productId, true);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
      /* console.log("Le produit a été mis à jour avec succès."); */

      // Mettre à jour le total du produit
      let productTotal = document.querySelector(
        '.product-total[data-product-id="' + productId + '"]'
      );

      let productPrice = parseFloat(
        document
          .querySelector('td[data-product-id="' + productId + '"]')
          .innerText.replace("$", "")
      );
      productTotal.innerText = (productPrice * newQuantity).toFixed(2) + " $";

      // Mettre à jour le total du panier
      updateProductTotal(productId);
      updateCartTotal();
    } else {
      console.error(
        "Une erreur s'est produite lors de la mise à jour du produit."
      );
    }
  };
  xhr.send();
  
}

function updateCartTotal() {
  console.log("updateCartTotal ! !");
  let cartTotalElement = document.querySelector(".cart-total-cell");
  let productTotals = document.querySelectorAll("td.product-total");

  console.log("cartTotalElement", cartTotalElement);
  console.log("productTotals", productTotals);

  let newTotal = 0;
  productTotals.forEach((productTotal) => {
    console.log("Product total:", productTotal.textContent.replace(" $", ""));
    newTotal += parseFloat(productTotal.textContent.replace(" $", ""));
  });

  cartTotalElement.textContent = newTotal.toFixed(2) + " $";
}



function removeProduct(event) {
  console.log("remove product start")
  event.preventDefault();
  const productId = event.target.closest(".remove-from-cart").dataset.id;
  fetch(`/my-cart/cart/delete/${productId}`, { method: "POST" })
.then((response) => {
  if (response.ok) { // Supprimer le produit du DOM
  const row = event.target.closest("tr");
  row.parentNode.removeChild(row);
  
  // Mettre à jour la notification
  updateNotification(-1);
  
  // Mettre à jour le sous-total
  const subtotalElement = document.querySelector(".subtotal-cell");
  const currentSubtotal = parseInt(subtotalElement.textContent, 10);
  subtotalElement.textContent = currentSubtotal - 1;

  // Mettre à jour le total du panier
  updateCartTotal();
  }
  }).catch((error) => {
  console.error("Erreur lors de la suppression du produit :", error);
  });
  }


  
  
  function updateNotification(change) {
    console.log("update Notification start")
  const cartQuantity = document.querySelector(".cart-quantity");
  const currentCount = parseInt(cartQuantity.textContent, 10);
  cartQuantity.textContent = currentCount + change;
  }

  document.addEventListener("DOMContentLoaded", function () {
    const removeFromCartButtons = document.querySelectorAll(".remove-from-cart");
  
    console.log("removeFromCartButtons: ", removeFromCartButtons); // Ajout d'un console.log ici
  
    removeFromCartButtons.forEach((button) => {
      button.addEventListener("click", removeProduct);
    });
  });
  