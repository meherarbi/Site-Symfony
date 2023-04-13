function updateProductTotal(productId) {
  console.log("updateProductTotal fonctionne");
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
  xhr.open("PUT", "/my-cart/cart/decrease/" + productId, true);
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
  console.log("remove product start");
  event.preventDefault();
  const productId = event.target.closest(".remove-from-cart").dataset.id;
  fetch(`/my-cart/cart/delete/${productId}`, { method: "POST" })
    .then((response) => {
      if (response.ok) {
        // Supprimer le produit du DOM
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
    })
    .catch((error) => {
      console.error("Erreur lors de la suppression du produit :", error);
    });
}

function updateNotification(change) {
  console.log("update Notification start");
  const cartQuantity = document.querySelector(".cart-quantity");
  const currentCount = parseInt(cartQuantity.textContent, 10);
  const newCount = currentCount + change;

  // Mettre à jour la valeur de la quantité et l'affichage
  if (newCount <= 0) {
    cartQuantity.textContent = "";
    cartQuantity.style.display = "none";
  } else {
    cartQuantity.textContent = newCount;
    cartQuantity.style.display = "inline";
  }
}

function clearCart() {
  // Afficher un message de confirmation avec SweetAlert2
  Swal.fire({
    title: "Êtes-vous sûr de vouloir vider le panier ?",
    text: "Cette action ne peut pas être annulée.",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Oui, vider le panier",
    cancelButtonText: "Annuler",
  }).then((result) => {
    // Si l'utilisateur confirme, vider le panier
    if (result.isConfirmed) {
      const removeFromCartButtons =
        document.querySelectorAll(".remove-from-cart");

      // Parcourir chaque bouton de suppression de produit et déclencher un clic sur eux
      removeFromCartButtons.forEach((button) => {
        button.click();
      });

      // Afficher une notification de succès
      Swal.fire(
        "Panier vidé",
        "Votre panier a été vidé avec succès.",
        "success"
      );
    }
  });
}

function showNotification() {
  const notification = document.getElementById("notification");
  
  // Afficher la notification
  notification.style.display = "block";

  // Masquer la notification après un certain temps (3 secondes)
  setTimeout(() => {
    notification.style.display = "none";
  }, 3000);
}


document.addEventListener("DOMContentLoaded", function () {
  const addToCartButtons = document.querySelectorAll(".add-to-cart");

  const removeFromCartButtons = document.querySelectorAll(".remove-from-cart");

  console.log("removeFromCartButtons: ", removeFromCartButtons); 

  addToCartButtons.forEach((button) => {
    button.addEventListener("click", showNotification);
  });
  removeFromCartButtons.forEach((button) => {
    button.addEventListener("click", removeProduct);
  });

  const clearCartButton = document.getElementById("clear-cart-btn");
  clearCartButton.addEventListener("click", clearCart);
});
