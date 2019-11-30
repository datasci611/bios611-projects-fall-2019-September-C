library(tidyverse)

load_dat = function(){
  dat = read_tsv("https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project1_2019/UMD_Services_Provided_20190719.tsv")
  return(dat)
}

clean_dat = function(){
  dat = load_dat()
  dat = dat[ , -c(2,3,4,5,8,9,10,11,12,13,14,15,16,17,18)]
  dat$Date = as.Date(dat$Date,'%m/%d/%Y')
  dat$Year = as.numeric(format(dat$Date,'%Y'))
  dat = dat[ ,-2]
  return(dat)
}

plot_trend = function(timePeriod, df){
  dat = dat%>%filter(Year >= timePeriod[1] & Year <= timePeriod[2])
  p = ggplot(dat, aes(x=get(timePeriod),y=`Food Pounds`)) + geom_line(size = 0.8) +
    theme_bw() + scale_x_continuous(breaks = seq(range[1],range[2],ceiling((range[2]-range[1])/4)))
  return(p)
  # p = ggplot(dat, aes(x=get(timePeriod),y=`Food Pounds`)) + 
  #     geom_point() + 
  #     geom_smooth() + 
  #     xlab("Date") + ylab("Amount of Food Distributed (lbs) over the years")
      #geom_line(size = 0.8)+theme_bw()+ scale_x_continuous(breaks = seq(range[1],range[2],ceiling((range[2]-range[1])/4)))+
      #labs(x=timePeriod,y="Amount of Food Provided (lbs)", title="Trend of the Amount of Food Provided in lbs") 
      #theme_minimal()
  # return(p)
}