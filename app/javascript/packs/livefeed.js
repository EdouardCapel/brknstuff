console.log("test")

document.addEventListener("DOMContentLoaded", () => {
  setInterval(updateFeed, 1000); // Every 1 second, the `refresh` function is called.
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
  console.log();
  const notify = "<p>You have a new notification</p>";
  results.insertAdjacentHTML("beforeend", words);
}
