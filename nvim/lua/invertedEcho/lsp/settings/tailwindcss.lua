return {
  tailwindCSS = {
    experimental = {
      classRegex = {
        { 'cva\\(([^)]*)\\)', '["\'`]([^"\'`]*).*?["\'`]' },
      },
    },
  },
}
