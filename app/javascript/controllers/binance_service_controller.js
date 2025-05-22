import { Controller } from "@hotwired/stimulus"
import { DerivativesTradingUsdsFutures } from '@binance/derivatives-trading-usds-futures';

// Connects to data-controller="binance_service"
export default class extends Controller {
  connect() {
    console.log("BinanceServiceController connected");
    this.init();
    console.log('this.client.restAPI', this.client.restAPI)
    this.fetchExchangeInformation()
  }

  init() {
    const configurationRestAPI = {
      apiKey: this.element.dataset.apiKey,
      apiSecret: this.element.dataset.apiSecret,
    };
    this.client = new DerivativesTradingUsdsFutures({ configurationRestAPI });
  }

  fetchExchangeInformation() {
    this.client.restAPI
      .tradeApi.allOrders({symbol: "BNBUSDT"})
      .then((res) => res.data())
      .then((data) => console.log(data))
      .catch((err) => console.error(err));
  }
}
