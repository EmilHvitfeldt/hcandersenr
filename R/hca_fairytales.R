#' Tidy data frame of all of H.C. Andersens fairy tales in this pacakage
#'
#' Returns a tidy data frame of all of H.C. Andersens fairy tales in this
#' pacakage with three columns: \code{text}, which contains the text of the
#' fairy tales divided into elements of up to about 80 characters each,
#' \code{book}, which contains the titles of the fairy tales in english, and
#' \code{language} which is the language of the \code{text}.
#'
#' @return A data frame with three columns: \code{text}, \code{book} and
#' \code{language}
#'
#' @name hca_fairytales
#'
#' @examples
#' library(hcandersenr)
#'
#' hca_fairytales() %>%
#'   group_by(language) %>%
#'   summarise(n_lines = n())
#'
#' @export
hca_fairytales <- function(){
  rbind(
    hcandersenr::hcandersen_da %>%
      dplyr::mutate(language = "Danish") %>%
      dplyr::left_join(
        hcandersenr::EK %>% dplyr::select(.data$name_da, .data$name_en),
        by = c("book" = "name_da")
      ) %>%
      dplyr::mutate(book = .data$name_en) %>%
      dplyr::select(-.data$name_en),
    hcandersenr::hcandersen_de %>%
      dplyr::mutate(language = "German") %>%
      dplyr::left_join(
        hcandersenr::EK %>% dplyr::select(.data$name_de, .data$name_en),
        by = c("book" = "name_de")
      ) %>%
      dplyr::mutate(book = .data$name_en) %>%
      dplyr::select(-.data$name_en),
    hcandersenr::hcandersen_en %>% 
      dplyr::mutate(language = "English"),
    hcandersenr::hcandersen_es %>%
      dplyr::mutate(language = "Spanish") %>%
      dplyr::left_join(
        hcandersenr::EK %>% dplyr::select(.data$name_es, .data$name_en),
        by = c("book" = "name_es")
      ) %>%
      dplyr::mutate(book = .data$name_en) %>%
      dplyr::select(-.data$name_en),
    hcandersenr::hcandersen_fr %>%
      dplyr::mutate(language = "French") %>%
      dplyr::left_join(
        hcandersenr::EK %>% dplyr::select(.data$name_fr, .data$name_en),
        by = c("book" = "name_fr")
      ) %>%
      dplyr::mutate(book = .data$name_en) %>%
      dplyr::select(-.data$name_en)
  )
}
