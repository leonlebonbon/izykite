const search = document.querySelector("#search");
const results = document.querySelector("#results");

const insertHTML = (word) => {
  results.insertAdjacentHTML("beforeend", `<li>${word}</li>`);
};

const displayData = (data) => {
  results.innerHTML = "";
  if (data.words) {
    data.words.forEach((word) => {
      insertHTML(word);
    });
  }
};

const callApi = (event) => {
  const userInput = event.currentTarget.value;
  const apiurl = `https://wagon-dictionary.herokuapp.com/autocomplete/${userInput}`;
  fetch(apiurl)
    .then(response => response.json())
    .then((data) => {
      displayData(data);
    });
};

search.addEventListener("keyup", (event) => {
  callApi(event);
});

