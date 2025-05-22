module TokenHelper
  def token_image(symbol_name)
    logos = {
      "ARBUSDT" => "https://s3-symbol-logo.tradingview.com/crypto/XTVCARBI.svg",
      "BTCUSDT" => "https://s3-symbol-logo.tradingview.com/crypto/XTVCBTC.svg",
      "ETHUSDT" => "https://s3-symbol-logo.tradingview.com/crypto/XTVCETH.svg",
      "JUPUSDT" => "https://s3-symbol-logo.tradingview.com/crypto/XTVCJUPI.svg",
      "BNBUSDT" => "https://s3-symbol-logo.tradingview.com/crypto/XTVCBNB.svg",
      "SOLUSDT" => "https://s3-symbol-logo.tradingview.com/crypto/XTVCSOL.svg",
    }
    logos.fetch(symbol_name, "https://s3-symbol-logo.tradingview.com/crypto/XTVCUSDT.svg")
  end
end
