import { Controller } from "@hotwired/stimulus"
import { AreaSeries, BarSeries, BaselineSeries, createChart } from 'lightweight-charts';

// Connects to data-controller="trading-view-chart"
export default class extends Controller {
  static targets = ["chart"]

  connect() {
    this.initChart();
  }

  initChart() {
    if (this.chartTarget) {
      const chartSymbol = this.chartTarget.dataset.symbol;
      const chartInterval = this.chartTarget.dataset.interval;

      const script = document.createElement("script");
      script.src = "https://s3.tradingview.com/external-embedding/embed-widget-advanced-chart.js";
      script.type = "text/javascript";
      script.async = true;
      script.innerHTML = `
        {
          "autosize": true,
          "symbol": "${chartSymbol}",
          "interval": "${chartInterval}",
          "timezone": "Asia/Bangkok",
          "theme": "dark",
          "style": "1",
          "locale": "en",
          "backgroundColor": "rgba(0, 0, 0, 1)",
          "hide_side_toolbar": false,
          "allow_symbol_change": true,
          "studies": [
            "STD;MA%Ribbon"
          ],
          "support_host": "https://www.tradingview.com"
        }`;
        this.chartTarget.replaceChild(script, this.chartTarget.children[0]);
    }
  }

  changeSymbol(event) {
    const symbolID = event.target.value;
    const symbol = event.target.querySelector(`[value="${symbolID}"]`).textContent;
    this.chartTarget.dataset.symbol = symbol;
    this.initChart();
  }
}
