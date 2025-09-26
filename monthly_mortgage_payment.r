library(tidyverse)
library(ggtext)

monthly_payment <- tribble(~"case", ~payment,
        1, 1331,
        2, 1225,
        3, 1174)

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
  scale_fill_manual(breaks = c(FALSE, TRUE),
                    values = c("#004D40", "#D81B60")) +
  scale_x_continuous(breaks = seq(1,3),
                     labels = c("7.0%", "6.2%", "5.8%")) +
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
