#Hello! These are the commands I used to find subsets in the PI results for signal/noise analyses. 

library("Hmisc", lib.loc="/Library/Frameworks/R.framework/Versions/2.13/Resources/library")
library("plyr")
library("gtools")
###Read in the locus file that has each locus & it's corresponding length###
Bird_Lengths<- read.table("Input_Length_File_Location.txt", header=TRUE)

# Read in the net table.
net<-read.table("~/Input_Net_File_Location.txt", header=TRUE)

# Read in the locus table.
loci<-read.table("Input_Loci_File_Location.txt", header=TRUE)

# From the net table, select the first time point
head(net$id, n=100)


#if V1 of UCE25_Lengths == $locus of loci then put the corresponding $V2 of UCE25_Lengths next to it. 
#first use net table merge with loci tabel.
#then merge loci/net with locus length table. 
#LocusLength<-cbind(loci,Bird_Lengths)
#sort so that the order is identical then bind. 
#merge(dataset1,dataset2, by="columnname")
#FIRST
NetLoci<-merge(net,loci, by="id")
LengthNetLoci<-merge(NetLoci,Bird_Lengths, by="locus")
#Bin by id and apply the length colum of the "LocusLength" dataset to the "net" dataset.

#Merged<- merge(net,LocusLength,by="id")
write.table(x=LengthNetLoci,file="~/FileOutputName.txt")

attach(LengthNetLoci)
SpikeRemoval9<-ddply(LengthNetLoci,"id",subset,time>=9,.progress=progress_text(char="."))
#SpikeRemoval8<-ddply(LengthNetLoci,"id",subset,time>=8, .progress=progress_text(char="."))
#SpikeRemoval7<-ddply(LengthNetLoci,"id",subset,time>=7, .progress=progress_text(char="."))
#SpikeRemoval2<-ddply(Merged,"locus",time>=3, .progress=progress_text(char="."))
#SpikeRemoval3<-ddply(Merged,"locus",subset,time>=3, .progress=progress_text(char="."))
#SpikeRemoval<-ddply(LengthNetLoci,"id",subset,time>=3, .progress=progress_text(char="."))
detach(LengthNetLoci)

attach(SpikeRemoval9)
#attach(SpikeRemoval8)
#attach(SpikeRemoval)
MaxPiTableNo8<-ddply(SpikeRemoval9,"id",subset,pi==max(pi),.progress=progress_text(char = "."))
#MaxPiTableNo7<-ddply(SpikeRemoval8,"id",subset,pi==max(pi),.progress=progress_text(char = "."))
#MaxPiTable<-ddply(SpikeRemoval,"id",subset,pi==max(pi),.progress=progress_text(char = "."))
#MaxPiTable<-ddply(SpikeRemoval,"locus",subset,pi==max(pi),.progress=progress_text(char = "."))
TimePoint62<-ddply(SpikeRemoval9,"id",subset,time==62,.progress=progress_text(char = "."))
TimePoint93<-ddply(SpikeRemoval9,"id",subset,time==93,.progress=progress_text(char = "."))
TimePoint59<-ddply(SpikeRemoval9,"id",subset,time==59,.progres=progress_text(char = "."))#Using this timeslice so that I can isolate 65MYA ago. 
detach(SpikeRemoval9)
#detach(SpikeRemoval8)
#detach(SpikeRemoval)
names(TimePoint62)[4]<-"PiAt62"
names(TimePoint93)[4]<-"PiAt93"
names(TimePoint59)[4]<-"PiAt59"
T1<-merge(MaxPiTableNo8,TimePoint62,by="id")
T2<-merge(T1,TimePoint93, by="id")
plot(MaxPiTableNo8$"time",MaxPiTableNo8$"pi")
write.table(x=MaxPiTable,file="~/MaxPI_Table_corrected.txt")
write.table(x=T2,file="~/PI_INFO_TABLE.txt")
write.table(x=TimePoint59,file="~/TimePoint59.txt")
detach(SpikeRemoval)





#####################################       Pelecanimorphae
attach(MaxPiTable)
GreaterThanOrBetter<-ddply(MaxPiTable,"locus",subset,time>=52,.progress=progress_text(char = ".")) #I'm using 52 because each time slice is the equivalent of 1.1 Million years. So split the data at 57MYA we want to isolate 52nd timeslice or 52*1.1=57.2. 

LessThanOrWorse<-ddply(MaxPiTable,"locus",subset,time>52,.progress=progress_text(char = "."))
#I'm using 52 because each time slice is the equivalent of 1.1 Million years. So split the data at 57MYA we want to isolate 52nd timeslice or 52*1.1=57.2. 
detach(MaxPiTable)
attach(GreaterThanOrBetter)
PI_GreaterThanOrBetter<-ddply(GreaterThanOrBetter,"locus",subset,pi/Length>=0.0014665,.progress=progress_text(char = "."))
detach(GreaterThanOrBetter)
3157/3679
#[1] 0.858
3679-3157
#[1] 522



####################################       Columbea
attach(MaxPiTable)

AfterColumbeaSplit<-ddply(MaxPiTable,"locus",subset,time>=62,.progress=progress_text(char = "."))#I'm using 62 because each time slice is the equivalent of 1.1 Million years. So for the split at 68MYA we want to isolate 62nd timeslice or 62*1.1=68.2. 

BeforeColumbeaSplit<-ddply(MaxPiTable,"locus",subset,time<62,.progress=progress_text(char = "."))#I'm using 62 because each time slice is the equivalent of 1.1 Million years. So for the split at 68MYA we want to isolate 62nd timeslice or 62*1.1=68.2. 

FirstColumbeaQuartile<-ddply(MaxPiTable,"locus",subset,time<=60.5,.progress=progress_text(char = "."))
SecondColumbeaQuartile<-ddply(MaxPiTable,"locus",subset,time> 60.50 & time<=75.00,.progress=progress_text(char = "."))
#MaxPiTable$time> 60.5 & MaxPiTable$time<73.16
ThirdColumbeaQuartile<-ddply(MaxPiTable,"locus",subset,time>75.00 & time<= 88.00,.progress=progress_text(char = "."))
#time>=73.17& time< 88
FourthColumbeaQuartile<-ddply(MaxPiTable,"locus",subset,time>88.00,.progress=progress_text(char = "."))

detach(MaxPiTable)
#Find the top 50% of loci who reach their maximum after 79MYA. Maxpi/perbp is 0.0020780. So keep everthing in the top 50%. 
attach(AfterColumbeaSplit)
Top50PI_AfterColumbeaSplit<-ddply(AfterColumbeaSplit,"locus",subset,pi/Length>=0.001039,.progress=progress_text(char = "."))
Lower50PI_AfterColumbeaSplit<-ddply(AfterColumbeaSplit,"locus",subset,pi/Length<0.001039,.progress=progress_text(char = "."))
detach(AfterColumbeaSplit)

############################## Paleo_Neo_gnathae
#quantile(MaxPiTable$time, prob=seq(0,1, by=0.2))
#0%  20%  40%  60%  80% 100% 
#  3   56   70   80   92   99
attach(MaxPiTable)
TimePoint62<-ddply(MaxPiTable,"id",subset,time==62,.progress=progress_text(char = "."))
BinOne_Pale_Neo_gnathae<-ddply(MaxPiTable,"locus",subset,time<56.00,.progress=progress_text(char = "."))#I'm using 93 because each time slice is the equivalent of 1.1 Million years. So for the split at 102 MYA we want to isolate the 93rd timeslice or 93*1.1= 102.3

BinTwo_Pale_Neo_gnathae<-ddply(MaxPiTable,"locus",subset,time>=56.0 & time<70.00,.progress=progress_text(char = "."))#I'm using 93 because each time slice is the equivalent of 1.1 Million years. So for the split at 102 MYA we want to isolate the 93rd timeslice or 93*1.1= 102.3

BinThree_Pale_Neo_gnathae<-ddply(MaxPiTable,"locus",subset,time>=70.0 & time<80.00,.progress=progress_text(char = "."))#I'm using 93 because each time slice is the equivalent of 1.1 Million years. So for the split at 102 MYA we want to isolate the 93rd timeslice or 93*1.1= 102.3

BinFour_Pale_Neo_gnathae<-ddply(MaxPiTable,"locus",subset,time>=80.0 & time<92.00,.progress=progress_text(char = "."))#I'm using 93 because each time slice is the equivalent of 1.1 Million years. So for the split at 102 MYA we want to isolate the 93rd timeslice or 93*1.1= 102.3

BinFive_Pale_Neo_gnathae<-ddply(MaxPiTable,"locus",subset,time>=92.00,.progress=progress_text(char = "."))#I'm using 93 because each time slice is the equivalent of 1.1 Million years. So for the split at 102 MYA we want to isolate the 93rd timeslice or 93*1.1= 102.3
detach(MaxPiTable)
###BinOne!!!
attach(BinOne_Pale_Neo_gnathae)
summary(BinOne_Pale_Neo_gnathae$pi/BinOne_Pale_Neo_gnathae$Length)
#Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#3.784e-05 1.368e-03 1.742e-03 1.784e-03 2.156e-03 6.953e-03 
#Find the top 50% of loci who reach their maximum from BinOne. Maxpi/perbp is 1.742e-03. So keep everthing in the top 50%. 
Top_BinOne_Pale_Neo_gnathae<-ddply(BinOne_Pale_Neo_gnathae,"locus",subset,pi/Length>=1.742e-03,.progress=progress_text(char = "."))
Bottom_BinOne_Pale_Neo_gnathae<-ddply(BinOne_Pale_Neo_gnathae,"locus",subset,pi/Length<1.742e-03,.progress=progress_text(char = "."))
detach(BinOne_Pale_Neo_gnathae)

###BinFive!!!!
attach(BinFive_Pale_Neo_gnathae)
summary(BinFive_Pale_Neo_gnathae$pi/BinFive_Pale_Neo_gnathae$Length)
#Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#0.0001254 0.0007885 0.0009910 0.0009804 0.0011760 0.0017280 
Top_BinFive_Pale_Neo_gnathae<-ddply(BinFive_Pale_Neo_gnathae,"locus",subset,pi/Length>=0.0009910,.progress=progress_text(char = "."))
Bottom_BinFive_Pale_Neo_gnathae<-ddply(BinFive_Pale_Neo_gnathae,"locus",subset,pi/Length<0.0009910,.progress=progress_text(char = "."))
detach(BinFive_Pale_Neo_gnathae)





### Summary Stats 
#All UCEs
summary(Merged$pi)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.000   1.936   2.752   2.852   3.620  23.290 

quantile(MaxPiTable$time, prob=c(0,.25,.50.75 1))
quantile(MaxPiTable$time, prob=seq(0,1, by=0.1))


ecdf(MaxPiTable$time)(62)
# Pelecanimorphae
summary(GreaterThanOrBetter$pi)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.2753  2.4240  3.0640  3.0930  3.7480  7.2010
summary(AfterColumbeaSplit$pi)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.08379  3.02700  3.80800  3.95100  4.70800 16.93000 
summary(GreaterThanOrBetter$pi/GreaterThanOrBetter$Length)
#Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#0.0001254 0.0009805 0.0012270 0.0012320 0.0014790 0.0029330 

# Columbea
summary(BeforeColumbeaSplit$pi)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.08379  3.05100  3.85200  3.98300  4.75300 16.93000 
summary(AfterColumbeaSplit$pi/AfterColumbeaSplit$Length)
#Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#0.0001254 0.0009337 0.0011430 0.0011410 0.0013610 0.0020780 
summary(BeforeColumbeaSplit$pi/BeforeColumbeaSplit$Length)
#Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#3.784e-05 1.205e-03 1.510e-03 1.558e-03 1.824e-03 6.953e-03 

##################################################################### Plots 
#                     Pelecanimorphae Plots
hist(GreaterThanOrBetter$time,xlab="MYA" ,ylab="Frequency")
plot(x=GreaterThanOrBetter$time,y=GreaterThanOrBetter$pi)
plot(x=GreaterThanOrBetter$time,y=(GreaterThanOrBetter$pi/GreaterThanOrBetter$Length),xlab="Time MYA",ylab="Any UCE with MaxPI per bp After 57MYA")
hist(GreaterThanOrBetter$pi/GreaterThanOrBetter$Length)
plot(x=PI_GreaterThanOrBetter$pi/PI_GreaterThanOrBetter$Length)
plot(x=PI_GreaterThanOrBetter$pi/PI_GreaterThanOrBetter$Length,y=GreaterThanOrBetter$pi/GreaterThanOrBetter$Length)
plot(x=PI_GreaterThanOrBetter$time,y=PI_GreaterThanOrBetter$pi/PI_GreaterThanOrBetter$Length,xlab="Time MYA",ylab="UCEs with Highest with MaxPI per bp After 57MYA")

#                    Columbea Plots
plot(x=Top50PI_AfterColumbeaSplit$time,y=Top50PI_AfterColumbeaSplit$pi/Top50PI_AfterColumbeaSplit$Length,xlab="Time MYA",ylab="UCEs with Top 50% Highest MaxPI per bp After 79MYA")
plot(x=Lower50PI_AfterColumbeaSplit$time,y=Lower50PI_AfterColumbeaSplit$pi/Lower50PI_AfterColumbeaSplit$Length,xlab="Time MYA",ylab="UCEs with Lower 50% MaxPI per bp After 79MYA")


plot(x=AfterColumbeaSplit$time,y=(AfterColumbeaSplit$pi/AfterColumbeaSplit$Length),xlab="Time MYA",ylab="Any UCE with MaxPI per bp After 68MYA")
plot(x=BeforeColumbeaSplit$time,y=(BeforeColumbeaSplit$pi/BeforeColumbeaSplit$Length),xlab="Time MYA",ylab="UCEs with MaxPI per bp Before 68MYA")

plot(x=FirstColumbeaQuartile$time,y=FirstColumbeaQuartile$pi/FirstColumbeaQuartile$Length)
plot(x=SecondColumbeaQuartile$time, y=SecondColumbeaQuartile$pi/SecondColumbeaQuartile$Length)
plot(x=ThirdColumbeaQuartile$time,y=ThirdColumbeaQuartile$pi/ThirdColumbeaQuartile$Length)
plot(x=FourthColumbeaQuartile$time,y=FourthColumbeaQuartile$pi/FourthColumbeaQuartile$Length)

## Table Exports
write.table(MaxPiTable$Name,file="~/NoStutterUCEs.txt",col.names=F,row.names=F)
write.table(GreaterThanOrBetter$Name,file="~/Post57List.txt",col.names=F,row.names=F)
write.table(GreaterThanOrBetter,file="~/MaxPi_After57MYA.txt")
write.table(LessThanOrWorse$Name,file="~/Pre57List.txt",col.names=F,row.names=F)
write.table(PI_GreaterThanOrBetter$Name,file="~/Pre57_HighPI_List.txt",col.names=F,row.names=F)
write.table(BeforeColumbeaSplit$Name,file="~/Pre79List.txt", col.names=F, row.names=F)
write.table(AfterColumbeaSplit$Name,file="~/Post79List_ALL.txt", col.names=F, row.names=F)
write.table(Top50PI_AfterColumbeaSplit$Name,file="~/Post79_Top50_List.txt", col.names=F, row.names=F)
write.table(Lower50PI_AfterColumbeaSplit$Name,file="~/Post79_Lower50_List.txt", col.names=F, row.names=F)

write.table(FirstColumbeaQuartile$Name,file="~/FirstColumbeaQuartile.txt",col.names=F,row.names=F)
write.table(SecondColumbeaQuartile$Name,file="~/SecondColumbeaQuartile.txt",col.names=F,row.names=F)
write.table(ThirdColumbeaQuartile$Name,file="~/ThirdColumbeaQuartile.txt",col.names=F,row.names=F)
write.table(FourthColumbeaQuartile$Name,file="~/FourthColumbeaQuartile.txt",col.names=F,row.names=F)


write.table(Top_BinOne_Pale_Neo_gnathae$Name,file="~/Top_BinOne_Pale_Neo_gnathae.txt", col.names=F,row.names=F)
write.table(Bottom_BinOne_Pale_Neo_gnathae$Name,file="~/Bottom_BinOne_Pale_Neo_gnathae.txt", col.names=F,row.names=F)

write.table(Top_BinFive_Pale_Neo_gnathae$Name,file="~/Top_BinFive_Pale_Neo_gnathae.txt", col.names=F,row.names=F)
write.table(Bottom_BinFive_Pale_Neo_gnathae$Name,file="~/Bottom_BinFive_Pale_Neo_gnathae.txt", col.names=F,row.names=F)




