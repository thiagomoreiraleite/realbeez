// NOTIFICATION

const notificationMethod = () => {

  // TEST
  // const urlPath = "http://localhost:3000"
  // PROD
  const urlPath = "http://realbeez.com"
  const url = urlPath + "/notifications.json"

  // GET REQUEST
  fetch(url)
   .then(response => response.json())
    .then((data) => {
      // notificationStart.innerHTML = ""
      data.forEach((result) => {
        const notificationStart = document.querySelector("#notification-start")
        const notificationMessage = `<a class="dropdown-item truncate" style="color:rgba(0, 0, 0, 0.5);" href="${urlPath+result.url}"> ${result.actor[0].toUpperCase() + result.actor.slice(1) +" "+ result.notifiable.type}<a>`
        notificationStart.insertAdjacentHTML("beforeend", notificationMessage)

      })
      const notificationCount = document.querySelector("#count")
      const countInput = data.length
      notificationCount.insertAdjacentHTML("beforeend", countInput)
    });

  // POST REQUEST
  const dropdownMenuButton = document.querySelector("#dropdownMenuButton")

  dropdownMenuButton.addEventListener( "click", (event) => {
    const urlMarkAsRead = urlPath + '/notifications/mark_as_read'
    console.log(event)
    console.log(urlMarkAsRead)

    const time = { read_at: Date.now };
    fetch(urlMarkAsRead, {
        method: 'POST',
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(time)
      })
    })

  // Auto refresh every 30 seconds
  document.addEventListener("DOMContentLoaded", () => {
    setInterval('window.location.reload()', 30000);
  });
}

export { notificationMethod }

