const { environment } = require('@rails/webpacker')

module.exports = environment
const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    JQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
