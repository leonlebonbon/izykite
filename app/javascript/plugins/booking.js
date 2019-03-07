const updatePrice = () => {
  const kitters = document.getElementById('booking_number_of_kiters');
  kitters.addEventListener('change', function(){
    const price_per_day = parseInt(document.getElementById('experience_price_per_day').innerHTML);
    document.getElementById('btn-submit-booking').value = "Book for " + parseInt(kitters.value) * price_per_day + "€";
  });
}

export { updatePrice };
