function findGetParameter(parameterName) {
    var result = null,
        tmp = [];
    location.search
    .substr(1)
        .split("&")
        .forEach(function (item) {
        tmp = item.split("=");
        if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
    });
    return result;
}

$(document).ready(function() {

console.log('in carts.js');

  Stripe.setPublishableKey('pk_test_K0JzIUsN2Cc2kfstB87gy2Vs');


  var generateToken = function(e) {

    console.log('hihihih');

      var form = $(this);

      console.log('in generateToken()');

      // No pressing the buy now button more than once
      form.find('button').prop('disabled', true);

      // Create the token, based on the form object
      Stripe.createToken(form, stripeResponseHandler);

      // Prevent the form from submitting
      e.preventDefault();
  };

  var stripeResponseHandler = function(status, response) {
    var form = $('#payment-form');

    // Any validation errors?
    if (response.error) {
      // Show the user what they did wrong
      form.find('.payment-errors').text(response.error.message);

      console.log('error', response);

      // Make the submit clickable again
      form.find('button').prop('disabled', false);
    } else {
      // Otherwise, we're good to go! Submit the form.

      console.log(response.id);
      // Insert the unique token into the form
      $('<input>', {
          'type': 'hidden',
          'name': 'stripeToken',
          'value': response.id
      }).appendTo(form);

      // Call the native submit method on the form
      // to keep the submission from being canceled
      form.get(0).submit();
    }
  };


  // EVENT LISTENER
  $('#payment-form').on('submit', generateToken);

  // CREDIT CARD FORMATTING
  $('.processCN').on('keypress', function(e){
    e.target.value = e.target.value.replace(/[^\dA-Z]/g, '').replace(/(.{4})/g, '$1 ').trim();
  })

    // Ajax for cart
  $('.addToCartButton').click(function () {
    $.getJSON($(this).attr('href')).done(function(response){

      $('.itemsInCart').html(response.total_qty +' Items in Cart ( $' + response.total_price +'.00 )');
      $('.checkOutSub p').html('Sub-total: '+ response.total_price);

    });
  });
});
