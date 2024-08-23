library(tidyverse)
library(FinCal)

cash_flows <- c(-250000, 17500, 17500, 18000, 280000)
discount_rate <- 0.6

npv_value <- npv(discount_rate, cash_flows)
npv_value

npv_manual <- sum(cash_flows/(1+discount_rate)^(0:(length(cash_flows) - 1)))

irr_value <- irr(cash_flows)

irr_calculate <- function(r, cash_flows) {
  
  sum(cash_flows/(1 +r)^(0:(length(cash_flows) - 1)))
}

irr_value_manual <- uniroot(irr_calculate, c(0, 1), cash_flows = cash_flows)$root
irr_value_manual
