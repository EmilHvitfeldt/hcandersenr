#' Fairy tales and stories of H.C. Andersen.
#'
#' This package contains the (mostly) complete text of 157 fairy tales of
#' H.C. Andersen, in a number of different languages. formatted to be
#' convenient for text analysis.
#' @docType package
#' @name hcandersenr
NULL

#' The text of H.C. Andersens fairy tales in Danish.
#'
#' A dataset containing 139 out of 157 of H.C. andersens fairy tales
#' translated in Danish. The UTF-8 plain text was sourced from
#' http://www.andersenstories.com/ and is divided into elements of up
#' to about 80 characters each.
#'
#' @format A data frame with 20439 rows and 2 variables: \code{text} and
#' \code{book}.
"hcandersen_da"

#' The text of H.C. Andersens fairy tales in German.
#'
#' A dataset containing 156 out of 157 of H.C. andersens fairy tales
#' translated to German. The UTF-8 plain text was sourced from
#' http://www.andersenstories.com/ and is divided into elements of up
#' to about 80 characters each.
#'
#' @format A data frame with 28255 rows and 2 variables: \code{text} and
#' \code{book}.
"hcandersen_de"

#' The text of H.C. Andersens fairy tales in English.
#'
#' A dataset containing 157 out of 157 of H.C. andersens fairy tales
#' translated to English. The UTF-8 plain text was sourced from
#' http://www.andersenstories.com/ and is divided into elements of up
#' to about 80 characters each.
#'
#' @format A data frame with 27859 rows and 2 variables: \code{text} and
#' \code{book}.
"hcandersen_en"

#' The text of H.C. Andersens fairy tales in Spanish.
#'
#' A dataset containing 157 out of 157 of H.C. andersens fairy tales
#' translated to Spanish. The UTF-8 plain text was sourced from
#' http://www.andersenstories.com/ and is divided into elements of up
#' to about 80 characters each.
#'
#' @format A data frame with 27510 rows and 2 variables: \code{text} and
#' \code{book}.
"hcandersen_es"

#' The text of H.C. Andersens fairy tales in French
#'
#' A dataset containing 61 out of 157 of H.C. andersens fairy tales
#' translated to French The UTF-8 plain text was sourced from
#' http://www.andersenstories.com/ and is divided into elements of up
#' to about 80 characters each.
#'
#' @format A data frame with 11184 rows and 2 variables: \code{text} and
#' \code{book}.
"hcandersen_fr"

#' Eventyrkode (fairy tale code)
#'
#' Eventyrkode (fairy tale code), stipulated by Svend Juel Møller in order
#' to identify the fairy tales by H.C. Andersen
#'
#' @format A data frame with nine variables:
#' \describe{
#' \item{\code{EK}}{Numerical value for identification of fairy tales}
#' \item{\code{date}}{Date of publication}
#' \item{\code{approximate}}{Is the \code{date} an approximation}
#' \item{\code{org_language}}{Original language of the fairy tale}
#' \item{\code{name_da}}{Name of the fairy tale in Danish}
#' \item{\code{name_de}}{Name of the fairy tale in German}
#' \item{\code{name_en}}{Name of the fairy tale in English}
#' \item{\code{name_es}}{Name of the fairy tale in Spanish}
#' \item{\code{name_fr}}{Name of the fairy tale in French}
#' }
"EK"

#' Tidy data frame of all of H.C. Andersens fairy tales in this pacakage
#'
#' A tidy data frame of all of H.C. Andersens fairy tales in this
#' pacakage with three columns: \code{text}, which contains the text of the
#' fairy tales divided into elements of up to about 80 characters each,
#' \code{book}, which contains the titles of the fairy tales in english, and
#' \code{language} which is the language of the \code{text}.
#'
#' @format A data frame with three variables: \code{text},
#' \code{book} and \code{language}.
#' @export
hca_fairytales <- function() {
  length_da <- NROW(hcandersenr::hcandersen_da)
  length_de <- NROW(hcandersenr::hcandersen_de)
  length_en <- NROW(hcandersenr::hcandersen_en)
  length_es <- NROW(hcandersenr::hcandersen_es)
  length_fr <- NROW(hcandersenr::hcandersen_fr)
  
  out <- rbind(
    hcandersenr::hcandersen_da,
    hcandersenr::hcandersen_de,
    hcandersenr::hcandersen_en,
    hcandersenr::hcandersen_es,
    hcandersenr::hcandersen_fr
  )
  
  out$language <- rep(c("Danish", "German", "English", "Spanish", "French"),
                      times = c(length_da, length_de, length_en, length_es, length_fr))
  out
}
