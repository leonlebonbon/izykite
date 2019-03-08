import swal from 'sweetalert';

const initSweetalert = () => {
  const buttons = document.querySelectorAll(".delete-button")
  buttons.forEach((button) => {
    button.addEventListener('click', printAlert)
  })
}

const printAlert = (event) => {
  swal("Are you sure you want to delete?", {
      buttons: ["No", "Yes"],
  });
}
export { initSweetalert }

