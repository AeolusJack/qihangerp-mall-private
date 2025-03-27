import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'

// 配置element Plus按需导入
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'

import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    port: 3000, // 设置开发服务器的端口为 3000
    proxy: {
      // 配置接口转发
      '/dev-api': {
        target: 'http://localhost:8088',  // 转发到这个服务器
        changeOrigin: true,              // 是否修改请求头中的 Host 为目标服务器的地址
        rewrite: (path) => path.replace(/^\/dev-api/, ''),  // 将路径中的 /api 替换为空
      },
    },
  },
  plugins: [
    vue(),
    AutoImport({
      resolvers: [ElementPlusResolver()]
    }),
    Components({
      resolvers: [
        // 1. 配置elementPlus采用sass样式配色系统
        ElementPlusResolver({ importStyle: 'sass' })
      ]
    })
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  css: {
    preprocessorOptions: {
      scss: {
        // 2. 自动导入定制化样式文件进行样式覆盖
        additionalData: `
          @use "@/styles/element/index.scss" as *;
          @use "@/styles/var.scss" as *;
        `
      }
    }
  }
})
