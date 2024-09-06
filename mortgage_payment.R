# mortgage calculator 

library(tidyverse)

monthly_payment <- function (principal, annual_rate, years) {
  
  monthly_rate <- annual_rate/12/100
  
  total_payments <- years * 12
  
  payment <- (principal * monthly_rate * (1 + monthly_rate) ^ total_payments)/
    ((1+ monthly_rate) ^ total_payments -1)
  
  return(payment)
}

principal <- 300000
annual_rate <- 6.00
years <- 30

monthly_payment <- monthly_payment(principal, annual_rate, years)

monthly_payment