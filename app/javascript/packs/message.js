const messageMethod = () => {

  const urlPath = origin
  const url = urlPath + "/conversations.json"

  // GET REQUEST
  fetch(url)
   .then(response => response.json())
    .then((data) => {
      const messageCount = document.querySelector("#message-count")
      const countInput = data.length
      messageCount.insertAdjacentHTML("beforeend", countInput)
    });


  // POST REQUEST
  // const form = document.querySelector("#new_forum");
  // const forumStart = document.querySelector("#forumstart");
  // const messageInput = document.getElementById("body");

  // form.addEventListener( "submit", (event) => {
  //   const messageValue = { body: messageInput.value};
  //   event.preventDefault();
  //   const urlMessage = event.target.action
  //   console.log(event)
  //   console.log(messageInput.value)
  //   console.log(urlMessage)

  //   fetch(urlMessage, {
  //       method: 'POST',
  //       headers: { "Content-Type": "application/json" },
  //       body: JSON.stringify(messageValue)
  //     })
  //   console.log(JSON.stringify(messageValue))
  //   })
}

export { messageMethod }
