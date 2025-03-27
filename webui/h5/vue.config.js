const { defineConfig } = require('@vue/cli-service')
// module.exports = defineConfig({
//   publicPath: './',
//   transpileDependencies: true
// })
const port = process.env.port || process.env.npm_config_port || 88

module.exports = defineConfig({
  transpileDependencies: true,
  devServer: {
    host: '0.0.0.0',
    port: port,
    open: true,
    proxy: {
      // detail: https://cli.vuejs.org/config/#devserver-proxy
      '/dev-api': {
        target: `http://localhost:8088`,
        changeOrigin: true,
        pathRewrite: {
          '^/dev-api' : ''
        }
      }
    }
  },
})