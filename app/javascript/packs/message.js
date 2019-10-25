const messageMethod = () => {

  const urlPath = origin
  const url = urlPath + "/conversations.json"

  // GET REQUEST TO COUNT NUMBER OF UNREAD MESSAGES
  fetch(url)
   .then(response => response.json())
    .then((data) => {
      const messageCount = document.querySelector("#message-count")
      const countInput = data.length
      messageCount.insertAdjacentHTML("beforeend", countInput)
    }
  );


  // GET REQUEST TO DISPLAY THE MESSAGE
  // const form = document.querySelector("#new_forum");
  // const forumStart = document.querySelector("#forumstart");
  // const messageInput = document.getElementById("body");

  // document.addEventListener( "DOMContentLoaded", (event) => {
  //   event.preventDefault();
  //   const urlMessage = event.target.baseURI + ".json"
  //   console.log(event)
  //   console.log(urlMessage)

  //   fetch(urlMessage)
  //     .then(response => response.json())
  //     .then((data) => {
  //       console.log(data)
  //       console.log(data[0].message.sender_id)

  //     data.forEach((element) => {
  //       forumStart.insertAdjacentHTML("beforeend",`
  //         <div class="border my-3 p-2" style="background-color: white; border-radius: 30px">
  //           <div class="m-0 text-center" style="font-weight: bold">
  //             ${element.sender.prénom}
  //             - ${element.message.updated_at} ${element.message.updated_at}
  //           </div>
  //           <div class="text-left px-4">
  //             <p  style="">${element.message.body}</p>
  //           </div>
  //         </div>
  //       `)
  //     })
  //   });
  // })
}

export { messageMethod }
