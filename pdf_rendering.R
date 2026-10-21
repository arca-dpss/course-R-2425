# Render the PDF version of every slide deck
#
# Run from the project root (open course-R-2425.Rproj, then source this file).
# Render the slides to HTML first (quarto render), then run this script.
#
# The decks load a shared stylesheet (materials/slides.css) from outside their own
# folder, so they are printed from a small local web server that serves the whole
# project. Each PDF is written to a temporary file first: if printing fails, the
# existing PDF is left untouched.

library(httpuv)
library(pagedown)

decks <- c(
  "materials/0_getStarted/0_getStarted.html",
  "materials/1_intro/1.1_intro.html",
  "materials/1_intro/1.2_intro.html",
  "materials/1_intro/1.3_funzioniErrori.html",
  "materials/2_struttureDati/2.1_vettori.html",
  "materials/2_struttureDati/2.2_fattori.html",
  "materials/2_struttureDati/2.3_listeMatriciArray.html",
  "materials/2_struttureDati/2.4_dataframe.html",
  "materials/3_programmazione/3.1_condizionale.html",
  "materials/3_programmazione/3.2_iterativa.html",
  "materials/3_programmazione/3.3_apply.html",
  "materials/4_extra/Extra.html",
  "materials/4_extra/recap.html",
  "materials/4_extra/recap-day1.html"
)

# PDF names that differ from the HTML name (the index links to EXTRA.pdf)
pdf_names <- c("materials/4_extra/Extra.html" = "materials/4_extra/EXTRA.pdf")

if (!file.exists("materials/slides.css")) {
  stop("Run this script from the project root (the folder with index.qmd)")
}

# Local web server for the whole project ---------------------------------------
# Chrome also asks for /favicon.ico: answer with an existing file, because
# pagedown stops on any missing file
port <- randomPort()
server <- startServer(
  host = "127.0.0.1",
  port = port,
  app = list(staticPaths = list(
    "/favicon.ico" = staticPath("arca_logo.svg"),
    "/" = staticPath(getwd(), indexhtml = FALSE)
  ))
)
on.exit(stopServer(server), add = TRUE)

# Print each deck --------------------------------------------------------------
for (deck in decks) {
  pdf <- if (deck %in% names(pdf_names)) pdf_names[[deck]] else sub("\\.html$", ".pdf", deck)

  if (!file.exists(deck)) {
    message("SKIP  ", deck, " (HTML not found, render the .qmd first)")
    next
  }

  url <- paste0("http://127.0.0.1:", port, "/", gsub("&", "%26", deck, fixed = TRUE))
  tmp <- tempfile(fileext = ".pdf")

  ok <- tryCatch({
    chrome_print(input = url, output = tmp, verbose = 0)
    file.copy(tmp, pdf, overwrite = TRUE)
  }, error = function(e) {
    message("FAIL  ", pdf, ": ", conditionMessage(e))
    FALSE
  })
  if (isTRUE(ok)) message("OK    ", pdf)
  unlink(tmp)
}

stopServer(server)
on.exit()
