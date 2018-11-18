const anchors = document.querySelectorAll(".anchor");
console.log(anchors)

anchors.forEach((anchor) => {
  anchor.addEventListener("click", function(event) {
    const nav = document.getElementById("navbarNavDropdown");
    nav.classList.remove("show");
  })
})
