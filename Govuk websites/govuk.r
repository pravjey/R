govweb2017 <- read.csv("e:/Data Science projects/Govuk websites/List_of_.gov.uk_domain_names_as_at_26_October_2017.csv")
govweb2016 <- read.csv("e:/Data Science projects/Govuk websites/List_of_gov.uk_domains_as_of_1_Oct_2016.csv")
govweb2015 <- read.csv("e:/Data Science projects/Govuk websites/gov.uk_domains_as_of_01Oct_2015.csv")
govweb2014 <- read.csv("e:/Data Science projects/Govuk websites/List_of_gov_uk_domain_names_as_at_1_October_2014.csv")
govweb2013 <- read.csv("e:/Data Science projects/Govuk websites/gov-uk_domain_names_as_at_1_October_2013.csv")
govweb2012 <- read.csv("e:/Data Science projects/Govuk websites/gov-uk-domains-as-of-1-Oct-2012.csv")
govweb2011 <- read.csv("e:/Data Science projects/Govuk websites/gov-uk-domains_as_of_1_Oct_2011.csv")

View(govweb2017)

# The number of registered ".gov.uk" domain na"mes has steadily decreased since 2011

nrowvector = (0)
for (i in seq(1,7)) {
  p = toString(i)
  govweb = paste("govweb201", p, sep = "") 
  govweb = eval(parse(text = govweb))
  nrowvector = c(nrowvector,nrow(govweb))
}
nrowvector <- nrowvector[2:length(nrowvector)]
nrowvector
barplot(nrowvector, names.arg = c(2011, 2012, 2013, 2014, 2015, 2016, 2017), main = "Registered .gov.uk sites", xlab = "Year", ylab = "Number of .gov.uk domain names")


# The number of registered .gov.uk domain names fell by 833. 

nrowvector[1] - nrowvector[7]


# Which .gov.uk websites have closed since 2011?

# Method:
# 1. Create a dataset of websites that are active in each pair of consecutive years (2011/12, 2012/13, etc), prefixed "common"
# 2. Of the original dataset for a particular year, create a dataset of websites that are not in "common..." datasets, prefix "closed"  

common20112012 <- intersect(govweb2011$Domain.Name, govweb2012$Domain.Name) 
closed20112012 <- govweb2011[!govweb2011$Domain.Name %in% common20112012,]
opened2012 <- govweb2012[!govweb2012$Domain.Name %in% common20112012,]

common20122013 <- intersect(govweb2012$Domain.Name, govweb2013$Domain.Name) 
closed20122013 <- govweb2012[!govweb2012$Domain.Name %in% common20122013,]
opened2013 <- govweb2013[!govweb2013$Domain.Name %in% common20122013,]

common20132014 <- intersect(govweb2013$Domain.Name, govweb2014$Domain.Name) 
closed20132014 <- govweb2013[!govweb2013$Domain.Name %in% common20132014,]
opened2014 <- govweb2014[!govweb2014$Domain.Name %in% common20132014,]

common20142015 <- intersect(govweb2014$Domain.Name, govweb2015$Domain.Name) 
closed20142015 <- govweb2014[!govweb2014$Domain.Name %in% common20142015,]
opened2015 <- govweb2015[!govweb2015$Domain.Name %in% common20142015,]

common20152016 <- intersect(govweb2015$Domain.Name, govweb2016$Domain.Name) 
closed20152016 <- govweb2015[!govweb2015$Domain.Name %in% common20152016,]
opened2016 <- govweb2016[!govweb2016$Domain.Name %in% common20152016,]

common20162017 <- intersect(govweb2016$Domain.Name, govweb2017$Domain.Name) 
closed20162017 <- govweb2016[!govweb2016$Domain.Name %in% common20162017,]
opened2017 <- govweb2017[!govweb2017$Domain.Name %in% common20162017,]

View(closed20112012)
View(closed20122013)
View(closed20132014)
View(closed20142015)
View(closed20152016)
View(closed20162017)




# How many .gov.uk websites closed

nrow(closed20112012) + nrow(closed20122013) + nrow(closed20132014) + nrow(closed20142015) + nrow(closed20152016) + nrow(closed20162017)

nrowvector1 = (0)
for (i in seq(2011,2016)) {
  p = toString(i)
  q = toString(i+1)
  closed = paste("closed", p, q, sep = "")
  closed = eval(parse(text = closed))
  nrowvector1 = c(nrowvector1,nrow(closed))
}
nrowvector1
barplot(nrowvector1, names.arg = c(2011, 2012, 2013, 2014, 2015, 2016, 2017), main = "Deactivated .gov.uk sites", xlab = "Year deactivated in", ylab = "Number of deactivated .gov.uk domain names")

# There were 1635 deactivations of .gov.uk domain names between 2011 and 2017. 

sum(nrowvector1)
mean(nrowvector1[-6][-1])


# How many .gov.uk websites were registered each year between 2011 and 2017?

nrowvector2 = (0)
for (i in seq(2012,2017)) {
  p = toString(i)
  opened = paste("opened", p, sep = "")
  opened = eval(parse(text = opened))
  nrowvector2 = c(nrowvector2,nrow(opened))
}
nrowvector2
barplot(nrowvector2, names.arg = c(2011, 2012, 2013, 2014, 2015, 2016, 2017), main = "Registerations of .gov.uk sites", xlab = "Year registered in", ylab = "Number of registrations")


# There were 802 registrations of .gov.uk domain names between 2011 and 2017

sum(nrowvector2)
mean(nrowvector2[-6][-1])

# Which websites were registered each year?

View(opened2012)
View(opened2013)
View(opened2014)
View(opened2015)
View(opened2016)
View(opened2017)

nrowvector1
nrowvector2

nrowvector3 <- nrowvector1 - nrowvector2



