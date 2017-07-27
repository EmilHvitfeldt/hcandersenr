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
#'
#' hca_fairytales() %>%
#'   group_by(language) %>%
#'   summarise(n_lines = n())
#'
#' @export
hca_fairytales <- function(){
  rbind(
    hcandersenr::hcandersen_da %>%
      mutate(language = "Danish") %>%
      left_join(
        hcandersenr::EK %>% select(name_da, name_en),
        by = c("book" = "name_da")
      ) %>%
      mutate(book = name_en) %>%
      select(-name_en),
    hcandersenr::hcandersen_de %>%
      mutate(language = "German") %>%
      left_join(
        hcandersenr::EK %>% select(name_de, name_en),
        by = c("book" = "name_de")
      ) %>%
      mutate(book = name_en) %>%
      select(-name_en),
    hcandersenr::hcandersen_en %>% mutate(language = "English"),
    hcandersenr::hcandersen_es %>%
      mutate(language = "Spanish") %>%
      left_join(
        hcandersenr::EK %>% select(name_es, name_en),
        by = c("book" = "name_es")
      ) %>%
      mutate(book = name_en) %>%
      select(-name_en),
    hcandersenr::hcandersen_fr %>%
      mutate(language = "French") %>%
      left_join(
        hcandersenr::EK %>% select(name_fr, name_en),
        by = c("book" = "name_fr")
      ) %>%
      mutate(book = name_en) %>%
      select(-name_en)
  )
}
