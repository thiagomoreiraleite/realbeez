// NOTIFICATION

const notificationMethod = () => {

  const urlPath = origin
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
        console.log(result)
      })
      const notificationCount = document.querySelector("#notification-count")
      const countInput = `<div class="border text-center mb-3" style="font-size: 12px; border-radius:50%; background-color: red; height:20px; width:20px; color:white; font-weight: bold; z-index: 1;">${data.length}</div>`
      if (data.length > 0) {
        notificationCount.insertAdjacentHTML("beforeend", countInput);
      }
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

}

export { notificationMethod }

