const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

module.exports = new webpack.ProvidePlugin({
  "$":"jquery",
  "jQuery":"jquery",
  "window.jQuery":"jquery"
});

module.exports = environment

