#! /usr/bin/env Rscript

library(whisker)

source = "desktopIcon.png"

sizes = c(16, 32, 128)

outDir = "desktopIcons"
if (!dir.exists(outDir)) dir.create(outDir)

output = file.path(outDir, paste0("icon_", sizes, ".png"))

template = "{{source}} -scale {{size}} {{output}}"

for (i in seq_along(sizes)) {
    system2(command = "magick",
            args = whisker.render(template = template,
               data = list(source = source,
                           size = sizes[i],
                           output = output[i])))
}
