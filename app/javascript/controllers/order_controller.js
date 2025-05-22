import { Controller } from "@hotwired/stimulus"
import { useDebounce } from "stimulus-use"

// Connects to data-controller="order"
export default class extends Controller {
  static debounces = [
    'onChangeEntryPrice',
    'onChangeStoplossPrice',
    'onChangeTakeProfitPrice',
    'onChangeSide',
  ]

  connect() {
    useDebounce(this)
    this.entryPrice = 0;
    this.stoplossPrice = 0;
    this.takeProfitPrice = 0;
    this.side = "long";
  }

  onChangeEntryPrice() {
    this.entryPrice
  }
  onChangeStoplossPrice() {}
  onChangeTakeProfitPrice() {}
  onChangeSide(e) {
    console.log("onChangeSide", e.target.value);
  }
}
