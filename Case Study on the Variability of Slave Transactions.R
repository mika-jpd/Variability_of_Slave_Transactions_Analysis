#1) Open the dataset
path = "C:/Users/mikad/Desktop/RStudio/slavery.csv"
dat = read.csv(path)

#2) Dataset Manipulation
colnames(dat)
dat = data.frame(dat)
names(dat)

#Cleaning the dataset and removing textual data

dat$Transaction.Date
Dates_extracted = as.integer(format(as.Date(dat$Transaction.Date, format="%m/%d/%Y"),"%Y"))
Dates_extracted

dat = dat[ , names(dat) %in% c("Slave.Age", "Transaction.Number.of.Adult.Slaves", "Transaction.Number.of.Child.Slaves", "Transaction.Number.of.Total.Slaves.Purchased", "Transaction.Sale.Details.Discount.Rate", "Transaction.Sale.Details.Predicted.Interest.Rate", "Transaction.Sale.Details.Price")]
dat = data.frame(dat)
dat$Dates = Dates_extracted
names(dat)
dat = na.omit(dat)

#3) Pre-PCA dataset presentation
#pre-normalization summary
summary(dat[, 1:4])
summary(dat[, 5:8])

#normalize for coherence in order to run PCA
scaled.dat = scale(dat)
apply(scaled.dat, 2, sd)

#post-normalization summary
summary(scaled.dat[, 1:4])
summary(scaled.dat[, 5:8])

#symmetric matrix with scatterpolots of all pairs in the lower triangle, 
#the density estimate along the diagonal line, and
#pair-wise correlation in the upper triangle

library(GGally)
ggpairs(data.frame(scaled.dat))

#4) Perform PCA
#summary to principle component findings
pr.out = prcomp(scaled.dat)
summary(pr.out)
pr.out$rotation

#plot of proportion of variance explained for each principle component
pr.var = (pr.out$sdev)^2
pve = pr.var/sum(pr.var)
plot(pve, xlab = "Principal Component", ylab = "Proportion of Variance Explained", ylim=c(0,1), type="b")

#plot of cummulative propertion explained for the principle components listed in decreasing order
plot(cumsum(pve), xlab = "Principal Component", ylab = "Cumulative proportion of Variance Explained", ylim=c(0,1), type="b")

#biplot with 1st two principle components as axis and arrows representing scores on each principle component
biplot(pr.out, scale = 0)
