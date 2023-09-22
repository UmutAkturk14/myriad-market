import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import $ from "jquery"; // Import jQuery

export default class extends Controller {
  static targets = ["messages"]
  static values = { chatId: Number }

  connect() {
    const $messagesElement = $("#messages");
    const chatId = $messagesElement.data("chat-subscription-chat-id-value");
    console.log(`Chat ID: ${chatId}`);

    console.log(this.messagesTarget);

    const subscription = createConsumer().subscriptions.create(
      { channel: "ChatChannel", id: chatId},
      {
        received: (data) => {
          // Check if it's the sender
          const notSender = parseInt($("#messages").attr("user")) != data.sender_id;

          // Find the span to manipulate the span if necessary
          let messageElement = $(data.message)
          let messageCard = messageElement.find(".message-card");
          console.log(messageCard);
          console.log(messageElement);

          if (notSender) {
            // Add the necessary class
            messageElement.addClass("flex-row-reverse justify-start")
            messageElement.find("span").removeClass("rounded-br-none bg-orange-500 text-white").addClass("rounded-bl-none bg-gray-700 text-gray-200");
          }
          $messagesElement.append(messageElement);
          $messagesElement.scrollTop($messagesElement[0].scrollHeight);
        },
      }
    );

    // Store the subscription for later use or cleanup if needed
    this.subscription = subscription;
  }

}


// import { Controller } from "@hotwired/stimulus"
// import { createConsumer } from "@rails/actioncable"
// import $ from "jquery"; // Import jQuery

// export default class extends Controller {
//   static targets = ["messages"]
//   static values = { chatId: Number }

//   connect() {
//     const $messagesElement = $("#messages");
//     const chatId = $messagesElement.data("chat-subscription-chat-id-value");
//     console.log(`Chat ID: ${chatId}`);

//     console.log(this.messagesTarget);

//     const subscription = createConsumer().subscriptions.create(
//       { channel: "ChatChannel", id: chatId},
//       {
//         received: (data) => {
//           // Check if it's the sender
//           const notSender = parseInt($("#messages").attr("user")) != data.sender_id;

//           // Find the span to manipulate the span if necessary
//           let messageElement = $(data.message)
//           let spanElement = $(messageElement).find("span")
//           let messageCard = $(messageElement).find(".message-card")
//           console.log(messageCard);
//           console.log(messageElement);

//           if (notSender) {
//             // Add the necessary class
//             $(spanElement).removeClass("rounded-br-none bg-orange-500 text-white").addClass("rounded-bl-none bg-gray-700 text-gray-200");
//             $(messageCard).removeClass("justify-end")
//           }
//           console.log(spanElement);
//           $messagesElement.append(messageElement);
//           $messagesElement.scrollTop($messagesElement[0].scrollHeight);
//         },
//       }
//     );

//     // Store the subscription for later use or cleanup if needed
//     this.subscription = subscription;
//   }

// }
