import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";
import $ from "jquery";

export default class extends Controller {
  // Define targets and values as static properties
  static targets = ["messages"];
  static values = { chatId: Number };

  connect() {
    // Get the messages container and chat ID
    const $messagesElement = $("#messages");
    const chatId = $messagesElement.data("chat-subscription-chat-id-value");

    // Create a subscription to the ChatChannel
    const subscription = createConsumer().subscriptions.create(
      { channel: "ChatChannel", id: chatId },
      {
        received: (data) => {
          // Check if the message sender is not the current user
          const notSender = parseInt($messagesElement.attr("user")) !== data.sender_id;

          // Get the message element
          const messageElement = $(data.message);

          if (notSender) {
            // Add classes for proper message styling
            messageElement.addClass("flex-row-reverse justify-start");
            messageElement.find("span")
              .removeClass("rounded-br-none bg-orange-500 text-white")
              .addClass("rounded-bl-none bg-gray-700 text-gray-200");
          }

          // Append the message element to the messages container
          $messagesElement.append(messageElement);

          // Scroll to the bottom of the messages container
          $messagesElement.scrollTop($messagesElement[0].scrollHeight);
        },
      }
    );

    // Store the subscription for later use or cleanup if needed
    this.subscription = subscription;
  }
}
