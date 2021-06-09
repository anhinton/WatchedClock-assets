#! /usr/bin/env Rscript

library(whisker)

source = "iosIcon.png"

sizes = c(40, 58, 60, 76, 80, 87, 120, 152, 167, 180, 1024)

outDir = "iosIcons"
if (!dir.exists(outDir)) dir.create(outDir)

output = file.path(outDir, paste0("iosIcon-", sizes, ".png"))

template = "{{source}} -scale {{size}} {{output}}"

for (i in seq_along(sizes)) {
    system2(command = "magick",
            args = whisker.render(template = template,
               data = list(source = source,
                           size = sizes[i],
                           output = output[i])))
}
