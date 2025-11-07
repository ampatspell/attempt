export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: true },
  modules: ['@nuxt/eslint', '@nuxt/icon', 'nuxt-eslint-auto-explicit-import'],
  imports: {
    scan: false,
    autoImport: false
  },
  components: {
    dirs: [],
  },
});
