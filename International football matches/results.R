football <- read.csv("e:/Data Science projects/International football matches/results.csv/results.csv")

names(football)

#Numbwe of international men's full team matches between 1872 and 2018 

nrow(football)


# Top ten match hosts 

tail(sort(table(football$country)),10)


# Number of times where the host country was not participating (i.e. not home or away team)

table((as.character(football$country) != as.character(football$home_team) ) &  (as.character(football$country) != as.character(football$away_team)))  


# The number of times that countries have hosted games where they are not participating

table(football$country[(as.character(football$country) != as.character(football$home_team)) &  (as.character(football$country) != as.character(football$away_team))])  
tail(sort(table(football$country[(as.character(football$country) != as.character(football$home_team)) &  (as.character(football$country) != as.character(football$away_team))])))


# Is there such a thing as home_advantage?

home_win <- (as.character(football$country) == as.character(football$home_team)) & (as.integer(football$home_score) >= as.integer(football$away_score))  
away_win <- (as.character(football$country) == as.character(football$home_team)) & (as.integer(football$home_score) < as.integer(football$away_score))  

table(home_win)
table(away_win)

barplot(table(home_win), main = "Number of Home wins")
barplot(table(away_win), main = "Number of Away wins")


# Who are the best teams of all time? (i.e. most number of wins)

best_hometeam <- football$home_team[football$home_score >= football$away_score]
best_awayteam <- football$away_team[football$away_score > football$home_score]

tail(sort(table(best_hometeam)),10)
tail(sort(table(best_awayteam)),10)

length(best_awayteam)
length(best_hometeam)

barplot(tail(sort(table(best_hometeam)),10),horiz = TRUE, las = 1, main = "Home team performance (1872 - 2017)", xlab = "Number of victories")
barplot(tail(sort(table(best_awayteam)),10),horiz = TRUE, las = 1, main = "Away team performance (1872 - 2017)", xlab = "Number of victories" )

best_team <- (0)
for (i in seq(1,nrow(football))) {
  x <- ifelse(football[i,4,] >= football[i,5,], as.character(football[i,2,]), as.character(football[i,3,]))
  best_team <- c(best_team, x)
}
best_team

tail(sort(table(best_team)),10)
barplot(tail(sort(table(best_team)),10),horiz = TRUE, las = 1, main = "Overall performance (1872 - 2017)", xlab = "Number of victories")


# Who are the best teams of all time in competitive tournaments?

best_hometeam_comp <- football$home_team[football$home_score >= football$away_score & football$tournament != "Friendly"]
best_awayteam_comp <- football$away_team[football$away_score > football$home_score & football$tournament != "Friendly"]

tail(sort(table(best_hometeam_comp)),10)
tail(sort(table(best_awayteam_comp)),10)

barplot(tail(sort(table(best_hometeam_comp)),10),horiz = TRUE, las = 1, main = "Home team performance in competitions (1872 - 2017)", xlab = "Number of victories")
barplot(tail(sort(table(best_awayteam_comp)),10),horiz = TRUE, las = 1, main = "Away team performance in competitions (1872 - 2017)", xlab = "Number of victories")

best_team_comp <- (0)
for (i in seq(1,nrow(football))) {
  if(football[i,6,] != "Friendly") {
    x <- ifelse(football[i,4,] >= football[i,5,], as.character(football[i,2,]), as.character(football[i,3,]))
    best_team_comp <- c(best_team_comp, x)
  }  
}
best_team_comp

tail(sort(table(best_team_comp)),10)
barplot(tail(sort(table(best_team_comp)),10),horiz = TRUE, las = 1, main = "Overall performance in competitions (1872 - 2017)", xlab = "Number of victories")


# Who are the worst teams of all time?

worst_hometeam <- football$home_team[football$home_score < football$away_score]
worst_awayteam <- football$away_team[football$away_score < football$home_score]

tail(sort(table(worst_hometeam)),10)
tail(sort(table(worst_awayteam)),10)

length(worst_awayteam)
length(worst_hometeam)

barplot(tail(sort(table(worst_hometeam)),10),horiz = TRUE, las = 1)
barplot(tail(sort(table(worst_awayteam)),10),horiz = TRUE, las = 1)

worst_team <- (0)
for (i in seq(1,nrow(football))) {
  x <- ifelse(football[i,4,] < football[i,5,], as.character(football[i,2,]), as.character(football[i,3,]))
  worst_team <- c(worst_team, x)
}
worst_team

tail(sort(table(worst_team)),10)
barplot(tail(sort(table(worst_team)),10),horiz = TRUE, las = 1, main = "Overall performance (1872-2017)", xlab = "Number of victories", cex.names = 0.5)



# Who are the worst teams of all time in competitive tournaments?

worst_hometeam_comp <- football$home_team[football$home_score < football$away_score & football$tournament != "Friendly"]
worst_awayteam_comp <- football$away_team[football$away_score < football$home_score & football$tournament != "Friendly"]

tail(sort(table(worst_hometeam_comp)),10)
tail(sort(table(worst_awayteam_comp)),10)

barplot(tail(sort(table(worst_hometeam_comp)),10),horiz = TRUE, las = 1)
barplot(tail(sort(table(worst_awayteam_comp)),10),horiz = TRUE, las = 1)

worst_team_comp <- (0)
for (i in seq(1,nrow(football))) {
  if(football[i,6,] != "Friendly") {
    x <- ifelse(football[i,4,] < football[i,5,], as.character(football[i,2,]), as.character(football[i,3,]))
    worst_team_comp <- c(worst_team_comp, x)
  }  
}
worst_team_comp

tail(sort(table(worst_team_comp)),10)
barplot(tail(sort(table(worst_team_comp)),10),horiz = TRUE, las = 1, main = "Overall competitive performance (1872-2017)", xlab = "Number of victories", cex.names = 0.5)


# Which countries play the most friendly matches?

home_friendlies <- football$home_team[football$tournament == "Friendly"]
away_friendlies <- football$away_team[football$tournament == "Friendly"]

tail(sort(table(home_friendlies)))
tail(sort(table(away_friendlies)))

barplot(tail(sort(table(home_friendlies)),10),horiz = TRUE, las = 1)
barplot(tail(sort(table(away_friendlies)),10),horiz = TRUE, las = 1)

most_friendlies <- (0)
for (i in seq(1,nrow(football))) {
  if(football[i,6,] == "Friendly") {
    most_friendlies <- c(most_friendlies, as.character(football[i,2,]))
    most_friendlies <- c(most_friendlies, as.character(football[i,3,]))
  }  
}
most_friendlies

tail(sort(table(most_friendlies)),10)
barplot(tail(sort(table(most_friendlies)),10),horiz = TRUE, las = 1)


# Is there a relationship between performance in friendlies and performance in competitive tournaments?

length(best_team_comp)
length(most_friendlies)

bestteam_table <- table(best_team_comp)
mostfriendlies_table <- table(most_friendlies)

bestfriend.df <- data.frame(bestteam_table,mostfriendlies_table[1:230])
summary(lm(bestfriend.df$Freq.1~bestfriend.df$Freq))


# Who are the strongest teams in this year's World Cup 2018 (based on historical performance)

Worldcup2018 <- c("Argentina","Australia","Belgium","Brazil","Colombia","Costa Rica","Denmark","Egypt","England","France","Germany","Iceland","Iran","Japan","Korea Republic","Mexico","Morocco","Nigeria","Panama","Peru","Portugal","Poland","Russia","Saudia Arabia","Senegal","Serbia","Sweden","Switzerland","Tunisia","Uruguay")

results = (0)
for (i in Worldcup2018) {
  results <- c(results,bestteam_table[i])
  
}

best_team_all <- table(best_team)
results2 = (0)
for (i in Worldcup2018) {
  results2 <- c(results2,best_team_all[i])
  
}

sort(results)
barplot(sort(results),horiz = TRUE, las = 1, space = TRUE, main = "World Cup 2018 nations in competitive matches (1872 - 2017)", xlab = "Number of victories", cex.names = 0.6)

sort(results2)
barplot(sort(results),horiz = TRUE, las = 1, space = TRUE, main = "World Cup 2018 nations: competitive & friendly matches (1872-2017)", xlab = "Number of victories", cex.names = 0.6)

