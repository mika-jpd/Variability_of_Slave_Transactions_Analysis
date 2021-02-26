# Case Study on the Variability of Slave Transactions

## Table of Contens
* [Description](#description)
* [Dataset](#dataset)
* [*Tentative* Analysis](#tentative-analysis)
* [*Tentative* Interpretation](#tentative-interpretation)
* [*Tentative* Conclusion](#tentative-conclusion)

## Description
A script that uses the Principal Component Analysis' dimension reduction to identify variability in the characteristics of New Orleans slave sales between 1856 and 1861 in the US. I wrote this script to help out a friend writing working on a history project.

## Dataset
The dataset used details the financial records of over 16,000 New Orleans slave sales between 1856 and 1861. This dataset was first used in “Betting on Secession: Quantifying Political Events Surrounding Slavery and the Civil War.” (2016) by Calomiris, Charles W. and Jonathan Pritchett and published in American Economic Review. 

Link to dataset: https://corgis-edu.github.io/corgis/csv/slavery/

## *Tentative* Analysis:
*Note: I have refrained from commenting on the signs associated to different variables in the principal components because these are completely insignificant. My code, run on another computer, could invert the signs I got because the principal components found are unique up to a sign. We can, however, comment on which variables have different signs.

```
PC1: (33.6% variability)
  •	Strong negative weights for:
    o Number of adult slaves (-0.57831736)
    o	Number of slaves purchased (-0.58856073)
    o	Price of purchase (-0.53075772)
  •	Small negative weights:
    o	Number of child slaves bought (-0.120564861)
  •	Small Positive weights for:
    o	Discount rate (0.098770532)
    o	Interest Rate (0.098320283)
```

*Tentative* Interpretation: 

The first PCA seems to confirm our intuitions that the more slaves are bought, the higher the purchasing cost (it however does not match our intuitions that humans are tradeable goods). The price increases when slaves are bought and when numerous are bought at once. We can see that while both the number of adult slaves and the number of slaves are significantly weighted variables, the number of child slaves seems to hold less significant weight in increasing the final price than the other two. This can be explained by the fact that adult slaves were deemed more valuable since they were stronger and more skilled and thus play a larger role in determining the price. 
We can see the correlation between the number of adult slaves bought, number of slaves purchased, and the price of the purchase in the biplot which shows that the arrows of all three variables move in the same direction.

```
PC2: (25% variability)
  •	Strong negative weights for
    o	Interest rate (-0.69486589)
    o	Discount rate (-0.69475868)
  •	Slight negative weights for
    o	Number of child slaves (-0.11977020)
    o	Number of slaves purchased (-0.10193098)
```

*Tentative* Interpretation:

Since interest rate and discount rates measure the same thing, that both are identically weighted and that their arrows in the biplot point in the exact same direction makes sense. The slight negative weights associated to the number of child slaves purchased and the total number of slaves purchased makes sense since the number of slaves bought would increase as the number of child slaves are bought. We cannot, however, make any inference about the interest rate and discount rate's relationships with the number of child slaves and  number of total slaves purchased.

```
PC3: (13% variability explained)
  •	Strong positive weights to:
    o	Slave age (0.68521777)
    o	Number of child slaves (0.69180351)
  •	Medium Negative:
    o	Transaction price (-0.12)
    o	Number of adults purchased (-0.11)
    o	Date (-0.10)
```

*Tentative* Interpretation: 

PC2 identifies an inverse correlation between price and number of child slaves purchased. While the transaction price is not significantly weighted, it further confirms our interpretation of PC1. The age variability is explained by the fact that few child slaves were sold. On average, slaves that were sold were 27 years old with a std dev of 11.4. Thus, it seems that the variability in the age of slaves sold is linked in part to the number of child slaves sold.

```
PC4: (12% variability)
  •	Extremely strong variability:
    o	Dates (-0.99)
```

*Tentative* Interpretation: 

The dataset was taken from a paper which argued that there was not a significant correlation between the news between 1856 and 1861. In previous PCAs, the date was given little variability. However, from PCA4 we can infer that the Year was responsible for 12% of the total variability. As argued in the paper, it wasn't monthly news but extreme years (ie. 1860 and 1861) that had a significant effects on the price of slavery. The paper argues that this is explained by the fact that southern farmers became increasingly anxious by the possibility of a war as tensions escalated between the North and the South. However, Principal Component Analysis seems to contest this conclusion. It shows that other variables like the number of slaves bought, the number of adults bought, and the age of slaves varied in the same way as the price. These appear to be the standard variables that drive transaction prices. The year was given little weight in PC1 in which the price was highly weighted and thus seems to vary independently of all the variables that appear to be related to the price of the transaction. 

## *Tentative* Conclusion:
The PCA analysis is far from conclusive but does seem to show that slave purchases prices varied in the most part due to variables such as the number bought, and the age of slaves bought. The year represents a tenth of the variability but varies alone. Thus, it seems to not have had a significant impact on slave prices.
