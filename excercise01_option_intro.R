#Excerises for options intro

#Q1
df_options_intro<-readr::read_csv("data_options_intro.csv")


#Q2
#Prove to yourself that this code will work weather you use readr::read_csv() or simply read_csv(). Why might you want to use one versus the other?
df_options_intro <- read_csv("data_options_intro.csv")


#Q3
df_options_intro$strike
df_options_intro$ask
df_options_intro$implied_vol

#Q4
nrow(df_options_intro)
#[1] 119


#Q5
View(df_options_intro)

#Q6
#What is the expiration date of all the options? Which date are these prices from?

distinct(df_options_intro, expiration)
# # A tibble: 1 x 1
# expiration
# <date>    
#   1 2013-09-21

distinct(df_options_intro, trade_date)
# # A tibble: 1 x 1
# trade_date
# <date>    
#   1 2013-08-16


#Q7
#Use dplyr::distinct() to determine how many different underlyings are represented in the data.
#What are they?
dplyr::distinct(df_options_intro, underlying)
# # A tibble: 4 x 1
# underlying
# <chr>     
# 1 SPY       
# 2 IWM       
# 3 QQQ       
# 4 DIA   


#Q8
##Use dplyr::filter() along with variable assignment <- to create four sub-dataframes, 
#each of which consists of all of the options for one underlying. 
#Call these dataframes df_SPY, df_QQQ, df_IWM, df_DIA. 
#(For each iteration, type out the code from scratch. 
#This will be good typing practice that will make you more efficient in the future.)
df_SPY<-dplyr::filter(df_options_intro, underlying=="SPY")
df_IWM<-dplyr::filter(df_options_intro, underlying=="IWM")
df_QQQ<-dplyr::filter(df_options_intro, underlying=="QQQ")
df_DIA<-dplyr::filter(df_options_intro, underlying=="DIA")


##Q9
#For each of the underlyings, use ggplot2::qplot() to create a line graph with strike 
#on the x-axis and implied_vol on the y-axis.
ggplot2::qplot(strike, implied_vol, data = df_options_intro)


#Q10
# What is the relationship between strike and implied_vol for these underlyings?

## negative corelation 



#Q11
# Let's break down df_SPY a little further. Using dplyr::filter() create two sub-dataframes, 
#one consisting of all the puts and one consisting of all the calls. 
# Label them df_SPY_puts and df_SPY_calls, respectively.
df_SPY_puts<- dplyr::filter(df_SPY, type=="put")
df_SPY_calls<- dplyr::filter(df_SPY, type=="call")



#Q12
# How many puts are there? How many calls are there? What are there so many more puts?
# (Hint: remember that options are insurance contracts and that SPY is an ETF 
# that tracks the S&P 500.)

nrow(df_SPY_puts)
# 28
nrow(df_SPY_calls)
# 12


#Q13
#For both df_SPY_calls and df_SPY_puts create a graph with strike on x-axis and bid_price.
ggplot2::qplot(strike, bid, data = df_SPY_puts)
ggplot2::qplot(strike, bid, data = df_SPY_calls)


#Q14
#Based on the graphs you created above: for puts, 
#what is the relationship between strike and price, 
#assuming we hold the price of the underlying fixed? How about for calls?

# put: positive corelation
# call: negative corelation



