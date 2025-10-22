import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    timeout: { type: Number, default: 4000 }
  }

  connect() {
    this.timeout = setTimeout(() => this.close(), this.timeoutValue)
  }

  close() {
    this.element.remove()
  }

  stopPropagation(event) {
    event.stopPropagation()
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}

