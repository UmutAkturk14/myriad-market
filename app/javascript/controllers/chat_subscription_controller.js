import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import $ from "jquery"; // Import jQuery

export default class extends Controller {
  static targets = ["messages"]
  static values = { chatId: Number }

  connect() {
    const messagesElement = document.getElementById("messages");
    const chatId = messagesElement.getAttribute("data-chat-subscription-chat-id-value");
    console.log(`Chat ID: ${chatId}`);
    console.log(this.messagesTarget)
    createConsumer().subscriptions.create(
      { channel: "ChatChannel",id: chatId },
      { received: (data) => { console.log(data) }

    })
  }
}
