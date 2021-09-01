const toggle_seller_field = () => {
    $("#phone-container").show();
    $("#address-container").hide();
}

const toggle_buyer_field = () => {
    $("#address-container").show();
    $("#phone-container").hide();
}

$(() =>
  $('#radio-seller').on('click', () => toggle_seller_field())
);

$(() =>
  $('#radio-buyer').on('click', () => toggle_buyer_field())
);