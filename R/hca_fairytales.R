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
#' @examples 
#' 
#' hca_fairytales()
#' 
#' table(hca_fairytales()$book)
#' 
#' @export
hca_fairytales <- function() {
  length_da <- NROW(hcandersenr::hcandersen_da)
  length_de <- NROW(hcandersenr::hcandersen_de)
  length_en <- NROW(hcandersenr::hcandersen_en)
  length_es <- NROW(hcandersenr::hcandersen_es)
  length_fr <- NROW(hcandersenr::hcandersen_fr)
  
  out <- rbind(
    hcandersenr::hcandersen_da["text"],
    hcandersenr::hcandersen_de["text"],
    hcandersenr::hcandersen_en["text"],
    hcandersenr::hcandersen_es["text"],
    hcandersenr::hcandersen_fr["text"]
  )
  
  id_da <- hcandersenr::EK$name_en
  names(id_da) <- hcandersenr::EK$name_da
  id_de <- hcandersenr::EK$name_en
  names(id_de) <- hcandersenr::EK$name_de
  id_es <- hcandersenr::EK$name_en
  names(id_es) <- hcandersenr::EK$name_es
  id_fr <- hcandersenr::EK$name_en
  names(id_fr) <- hcandersenr::EK$name_fr
  
  out$book <- c(id_da[hcandersenr::hcandersen_da$book], 
                id_de[hcandersenr::hcandersen_de$book],
                hcandersenr::hcandersen_en$book,
                id_es[hcandersenr::hcandersen_es$book],
                id_fr[hcandersenr::hcandersen_fr$book])
  
  
  out$language <- rep(c("Danish", "German", "English", "Spanish", "French"),
                      times = c(length_da, length_de, length_en, length_es, length_fr))
  out
}
