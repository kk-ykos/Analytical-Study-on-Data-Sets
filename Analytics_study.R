title: "AR1"

author: "Kirtikumar"

output: html_document

---


```{r setup, include=FALSE}

knitr::opts_chunk$set(echo = TRUE)

```

#Task_1

```{r}

library(dplyr)

library(tidyr)

data <- read.csv("C:/Users/Kirtikumar/Downloads/incidents.csv")

```

```{R}

df <- data %>% group_by(DISTRICT, MONTH)

df1<-summarise(df, Incidents=n())

df1<-df1 %>%

  na_if("") %>%

  na.omit

write.csv(df1,"C:/Users/Kirtikumar/Downloads/df2.csv")

```


#Task_2: Using R, filter by United States, select country, date, and variables related to mobility (retail and recreation, groceries and pharmacies, parks, transit stations, workplaces, and residential). Group by country and date. Summarize all mobility variables by using mean function

```{r}

data1 <- read.csv("C:/Users/Kirtikumar/Downloads/Global_Mobility_Report.csv")


```

```{R}

mob <- data1 %>% filter(country_region == "United States")%>%

  select(country_region, date, retail_and_recreation_percent_change_from_baseline, grocery_and_pharmacy_percent_change_from_baseline, parks_percent_change_from_baseline, transit_stations_percent_change_from_baseline, workplaces_percent_change_from_baseline, residential_percent_change_from_baseline)%>%

  group_by(country_region, date)%>%

  summarise(retail_and_recreation=mean(retail_and_recreation_percent_change_from_baseline, na.rm = TRUE), grocery_and_pharmacy= mean(grocery_and_pharmacy_percent_change_from_baseline, na.rm = TRUE), parks= mean(parks_percent_change_from_baseline, na.rm = TRUE), transit_stations= mean(transit_stations_percent_change_from_baseline, na.rm = TRUE), workplaces= mean( workplaces_percent_change_from_baseline, na.rm = TRUE), residential=mean(residential_percent_change_from_baseline, na.rm = TRUE))%>%

  na_if("") %>%

  na.omit

write.csv(mob,"C:/Users/Kirtikumar/Downloads/US_Report.csv", append = FALSE, col.names = TRUE, row.names = FALSE)