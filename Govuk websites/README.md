Fall in active ".gov.uk" domain names between 2011 and 2017

Original source of datasets:
https://data.gov.uk/dataset/6eb57d6e-c4cb-4f54-ad6f-f128fd1399d1/list-of-gov-uk-domain-names

Blog post:
https://pravinjeyaraj.wordpress.com/2018/06/06/fall-in-uk-government-websites/

R programming skills used:
1. Handling more than one dataset
2. Using iteration to calculate the total number of .gov.uk domain names (rows) in each year (dataset) and visualising in a bar chart with appropriate labels
3. Identify which and how many websites have closed since 2011 by creating the intersections of each pair of years, finding which sets from each pair of years are not in the intersection. If a website is in the 2011 dataset but not in the intersection, it must have been deactivated in 2012. If a website is in the 2012 dataset but not the intersection of 2012 and 2011, it must have been activated in 2012.
4. After step three, used iteration to calculate the number of deactivations and activations in each year.
 
