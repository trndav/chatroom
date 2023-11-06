// importing from importmap pinned hotwired/stimulus
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    reset() {
        this.element.reset();
    }
}