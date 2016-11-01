$(document).ready(function() {
  Stripe.setPublishableKey('sk_test_E8Fyusa5CGAMRNmEx80oKrlN');

  // EVENT LISTENER
  $('#payment-form').on('submit', generateToken);

  var generateToken = function(e) {
      var form = $(this);

      // No pressing the buy now button more than once
      form.find('button').prop('disabled', true);

      // Create the token, based on the form object
      Stripe.create(form, stripeResponseHandler);

      // Prevent the form from submitting
      e.preventDefault();
  };

  var stripeResponseHandler = function(status, response) {
    var form = $('#payment-form');

    // Any validation errors?
    if (response.error) {
      // Show the user what they did wrong
      form.find('.payment-errors').text(response.error.message);

      // Make the submit clickable again
      form.find('button').prop('disabled', false);
    } else {
      // Otherwise, we're good to go! Submit the form.

      // Insert the unique token into the form
      $('<input>', {
          'type': 'hidden',
          'name': 'stripeToken',
          'value': response.id
      }).appendTo(form);

      // Call the native submit method on the form
      // to keep the submission from being canceled
      // form.get(0).submit();
    }
  };

});
