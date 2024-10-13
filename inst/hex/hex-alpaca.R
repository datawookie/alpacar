library(hexSticker)
library(showtext)

# Load Google font.
#
font_add_google("Roboto Slab", "roboto_slab")
showtext_auto()

sticker(here::here("inst/hex/alpaca-logo.png"),
  # Image
  s_x = 0.85,
  s_y = 1.25,
  s_width = 0.625,
  s_height = 0.625,
  # Package name
  package = "{alpacar}",
  p_size = 16,
  p_y = 0.45,
  p_color = "#000000",
  p_family = "roboto_slab",
  # Hex
  h_fill = "#fcd72b",
  h_color = "#000000",
  # Output
  filename = here::here("man/figures/alpacar-hex.png"),
  dpi = 300
)
