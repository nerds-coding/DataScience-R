library(rvest)
#install.packages("xml2")
library(xml2)
library(magrittr)

# Amazon Reviews #############################
aurl <- "https://www.amazon.in/Apple-MacBook-Air-13-3-inch-Integrated/product-reviews/B073Q5R6VR/ref=cm_cr_arp_d_paging_btm_3?showViewpoints=1&pageNumber"
amazon_reviews <- NULL
for (i in 1:10){
  murl <- read_html(as.character(paste(aurl,i,sep="=")))
  rev <- murl %>%
    html_nodes(".review-text") %>%
    html_text()
  amazon_reviews <- c(amazon_reviews,rev)
  }
length(amazon_reviews)
write.table(amazon_reviews,"apple.txt",row.names = F)

