const kitters = document.getElementById('booking_number_of_kiters');
const price_per_day = parseInt(document.getElementById('experience_price_per_day').innerHTML);

kitters.addEventListener('change', function(){
  document.getElementById('btn-submit-booking').value = "Book for " + parseInt(kitters.value) * price_per_day + "€"
});


