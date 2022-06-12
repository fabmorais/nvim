require('onedark').setup {
  style = 'darker',
  code_style = {
    comments = 'italic',
  },

  highlights = {
    TSVariable = { fg = '$red' },
  }
}

require('onedark').load()

