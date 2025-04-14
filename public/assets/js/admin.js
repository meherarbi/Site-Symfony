import $ from 'jquery';

console.log("Category");

$(document).ready(function() {
    $('#category').change(function() {
        var categoryId = $(this).val();
        $.ajax({
            url: '/ajax/products/' + categoryId,
            type: 'GET',
            success: function(data) {
                var productsSelect = $('#products');
                productsSelect.empty();
                $.each(data, function(index, product) {
                    productsSelect.append('<option value="' + product.id + '">' + product.name + '</option>');
                });
            }
        });
    });
});
