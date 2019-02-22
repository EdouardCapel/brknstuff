console.log("test")

document.addEventListener("DOMContentLoaded", () => {
  setInterval(updateFeed, 5000); // Every 1 second, the `refresh` function is called.
});

const updateFeed = (event) => {
  fetch("/notification")
  .then(response => response.json())
  .then((data) => {
    if (data["notifications"].length > 0){
      data["notifications"].forEach((notification) => {
        updateNavbar();
        console.log(notification);
      });
    };
  });
};

const updateNavbar = () => {
  const navbar = document.querySelector("#flash-notification-container")
  const notify_message = `<div class="flash flash-notification">
  <span>You have a new <strong> trash! </strong> &nbsp <i class="fas fa-trash"></i></span>
</div>`;
  navbar.innerHTML = notify_message;
}
