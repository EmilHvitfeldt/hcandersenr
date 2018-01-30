library(tidyverse)

hca_fairytales <- rbind(
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
