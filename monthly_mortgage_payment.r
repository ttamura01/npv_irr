library(tidyverse)
library(ggtext)

monthly_payment <- tribble(~"case", ~payment,
        1, 1331,
        2, 1225,
        3, 1174,
        4, 1267)

monthly_payment <- monthly_payment %>% 
  mutate("is_now" = case == 2)


monthly_payment %>% 
  ggplot(aes(x = case, y = payment, fill = is_now)) +
  geom_col( alpha = 0.5, show.legend = FALSE) +
  annotate("label",
           x = 1,
           y = 1331 *0.9,
           label = "$1,331", size = 12) +
  annotate("label",
           x = 2,
           y = 1225 * 0.75,
           label = "$1,225", size = 12) +
  annotate("label",
           x = 3,
           y = 1174 * 0.6,
           label = "$1,174", size = 12) +
  annotate("label",
           x = 4,
           y = 1174 * 0.8,
           label = "$1,267", size = 12) +  
  scale_fill_manual(breaks = c(FALSE, TRUE),
                    values = c("#004D40", "#D81B60")) +
  scale_x_continuous(breaks = seq(1,4),
                     labels = c("7.0%", "6.2%", "5.8%", "5.8%")) +
  labs(x = "30-year mortgage rate (%)",
       y = "monthly payment",
       title = "Waiting for rates to drift a bit lower? The math says the payoff is shrinking fast",
       subtitle = "From the 7% peak, a $200,000 mortgage already saves $106 a month at today’s 6.2% rate. Even if rates fall all the way to the “theoretical” 5.8%, the extra benefit is only another $51 per month—barely half the gain you’ve already captured",
       caption = "source FRED, by Takayuki Tamura") +
  theme(
    panel.background = element_blank(),
    plot.title.position = "plot",
    plot.title = element_textbox_simple(size = 20, face = "bold", margin = margin(t = 10, b = 10)),
    plot.subtitle = element_textbox_simple(size = 16),
    axis.title.x = element_text(size = 16),
    axis.text.x = element_text(size = 16),
    axis.ticks.x = element_blank(),
    axis.title.y = element_text(size = 16),
    axis.text.y = element_text(size = 14)
  )

#version_2
monthly_payment %>%
  ggplot(aes(x = factor(case), y = payment, fill = factor(case))) +
  geom_col(alpha = 0.8, show.legend = FALSE) +
  annotate("label", x = 1, y = 1331 * 0.9, label = "$1,331", size = 6) +
  annotate("label", x = 2, y = 1225 * 0.75, label = "$1,225", size = 6) +
  annotate("label", x = 3, y = 1174 * 0.6, label = "$1,174\nreflect\nrate-cut", size = 6) +
  annotate("label", x = 4, y = 1267 * 0.775, label = "$1,267\nrefect\nrate-cut\n&\nvalue-up", size = 6, vjust =1) +
  scale_fill_manual(
    values = c(
      "1" = "#004D40",  # dark green
      "2" = "#00796B",  # medium teal
      "3" = "#009688",  # lighter teal
      "4" = "#D81B60"   # highlighted pink (case 4)
    )
  ) +
  # annotate("segment",
  #          x = 4, y = 1400,
  #          xend = 4, yend = 1270,
  #          arrow = arrow(length = unit(0.5, "cm"), type = "closed"),
  #          colour = "#D81B60", size = 3) +
  scale_x_discrete(labels = c("7.0%", "6.2%", "5.8%", "5.8%")) +
  labs(x = "Mortgage Rate", y = "Monthly Payment ($)") +
  labs(x = "30-year mortgage rate (%)",
       y = "monthly payment",
       title = "Waiting for rates to drift a bit lower? The math says the payment may increase",
       subtitle = "Mortgage rate declined to 6.2~6.3%, monthly payment on $200,000 mortgage already down $106 a monthly from 7% rate. Even if rates fall to the “theoretical” 5.8%, the monthly payment may increase due to increasing property value",
       caption = "source FRED, by Takayuki Tamura") +
  theme(
    panel.background = element_blank(),
    plot.title.position = "plot",
    plot.title = element_textbox_simple(size = 20, face = "bold", margin = margin(t = 10, b = 10)),
    plot.subtitle = element_textbox_simple(size = 16),
    axis.title.x = element_text(size = 16),
    axis.text.x = element_text(size = 16),
    axis.ticks.x = element_blank(),
    axis.title.y = element_text(size = 16),
    axis.text.y = element_text(size = 14)
    
  )

ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point() +
  annotate("segment", 
           x = 20, y = 150, # Start coordinates
           xend = 25, yend = 200, # End coordinates
           arrow = arrow(length = unit(0.3, "cm"), type = "closed"), # Arrowhead properties
           color = "red", 
           size = 1) 
