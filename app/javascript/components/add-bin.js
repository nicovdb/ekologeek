const btn = document.querySelector('.add-bin');
const form = document.querySelector('.add-bin-form');
if (btn) {
  btn.addEventListener('click', () => {
    form.style.display="block";
  });
}
