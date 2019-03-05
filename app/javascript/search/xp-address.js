const search = document.querySelector('#xp-address')
var placesAutocomplete = places({
    appId: 'plIU9286CN0E',
    apiKey: 'e4cefb2ae24dbfae7d78173a8b0735b0',
    container: document.querySelector('#xp-address')
  });

search.addEventListener("keyup", (event) => {
  callApi(placesAutocomplete);
});

export { placesAutocomplete }
