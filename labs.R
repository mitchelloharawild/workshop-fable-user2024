library(fpp3)

aus_production |>
  autoplot(Beer)

aus_production |>
  gg_season(Beer)


aus_production |>
  filter(Quarter >= yearquarter("1990 Q1")) |>
  autoplot(Beer)
aus_production |>
  filter(Quarter >= yearquarter("1990 Q1")) |>
  gg_subseries(Beer)


aus_production |>
  filter(Quarter >= yearquarter("1990 Q1")) |>
  autoplot(Beer) +
  geom_line(aes(y = lag(Beer, 8)), color = "steelblue")



aus_production |>
  filter(Quarter >= yearquarter("1990 Q1")) |>
  ACF(Beer)


install.packages("urca")


# Cyclical ARIMA data

sunspots_tsbl <- as_tsibble(sunspot.year)
sunspots_tsbl |>
  autoplot(value)

sunspots_tsbl |>
  ACF(value) |>
  autoplot()

pelt |>
  model(
    ARIMA(Lynx)
  ) |>
  forecast(h = "50 years") |>
  autoplot(tail(pelt, 40))
