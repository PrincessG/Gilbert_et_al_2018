
#Load tree files
require(phytools)
packageVersion("phytools")
require(ape)
Moderate_tree<-read.tree("Moderate.tree")
plotTree(Moderate_tree)
Total_UCE_tree<-read.tree("Total.tree")
plotTree(Total_UCE_tree)
Extreme_tree<-read.tree('Extreme.tree')
plotTree(Extreme_tree)
Jarvis_TENT<-read.tree("Jarvis_TENT.tre")
plotTree(Jarvis_TENT)
Jarvis_UCE<-read.tree("Jarvis_UCE.tre")
plotTree(Jarvis_UCE)
Prum<-read.tree("Prum_et_al.tre")
#

str(Extreme_tree)
# "acanthisitta_chloris","Rifleman"
# "anas_platyrhynchos_domestica","Peking duck"
# "apaloderma_vittatum","Bar-tailed trogon"
# "aptenodytes_forsteri","Emperor penguin"
# "balearica_regulorum_gibbericeps","Grey crowned crane"
# "buceros_rhinoceros_silvestris","Rhinoceros hornbill"
# "calypte_anna","Anna's hummingbird"
# "caprimugus_carolinensis","Chuck-will's widow"
# "cariama_cristata","Red-legged seriema"
# "cathartes_aura","Turkey vulture"
# "chaetura_pelagica","Chimney swift"
# "charadrius_vociferus","Killdeer"
# "chlamydotis_undulata","MacQueen's bustard"
# "colius_striatus","Speckled mousebird"
# "columba_livia","Pigeon"
# "corvus_brachyrhynchos","American crow"
# "cuculus_canorus","Common cuckoo"
# "egretta_garzetta","Little egret"
# "eurypyga_helias","Sunbittern"
# "falco_peregrinus","Peregrine falcon"
# "fulmarus_glacialis","Northern fulmar"
# "galga","Chicken"
# "gavia_stellata","Red-throated loon"
# "geospiza_fortis","Medium ground-finch"
# "haliaeetus_albicilla","White-tailed eagle"
# "haliaeetus_leucocephalus","Bald eagle"
# "leptosomus_discolor","Cuckoo-roller"
# "manacus_vitellinus","Golden-collard manakin"
# "meleagris_gallopavo","Turkey"
# "melopsittacus_undulatus","Budgerigar"
# "merops_nubicus","Carmine bee-eater"
# "mesitornis_unicolor","Brown mesite"
# "nestor_notabilis","Kea"
# "nipponia_nippon","Crested ibis"
# "ophisthocomus_hoazin","Hoatzin"
# "pelecanus_crispus","Dalmatian pelican"
# "phaethon_lepturus","White-tailed tropicbird"
# "phalacrocorax_carbo","Great cormorant"
# "phoenicopterus_ruber","American Flamingo"
# "picoides_pubescens","Downy woodpecker"
# "podiceps_cristatus","Great-crested grebe"
# "pterocles_guturalis","Yel.-thr. sandgrouse"
# "pygoscelis_adeliae","Adelie penguin"
# "struthio_camelus","Common ostrich"
# "taeniopygia_guttata","Zebra finch"
# "tauraco_erythrolophus","Red-crested turaco"
# "tinamus_major","Wht.-thr. tinamou"
# "tyto_alba","Barn owl"


mgsub <- function(pattern, replacement, x, ...) {
  if (length(pattern)!=length(replacement)) {
    stop("pattern and replacement do not have the same length.")
  }
  result <- x
  for (i in 1:length(pattern)) {
    result <- gsub(pattern[i], replacement[i], result, ...)
  }
  result
}


Fixed_Tip_Labels<-mgsub(c("acanthisitta_chloris","anas_platyrhynchos_domestica","apaloderma_vittatum","aptenodytes_forsteri","balearica_regulorum_gibbericeps","buceros_rhinoceros_silvestris","calypte_anna","caprimugus_carolinensis","cariama_cristata","cathartes_aura","chaetura_pelagica","charadrius_vociferus","chlamydotis_undulata","colius_striatus","columba_livia","corvus_brachyrhynchos","cuculus_canorus","egretta_garzetta","eurypyga_helias","falco_peregrinus","fulmarus_glacialis","galga","gavia_stellata","geospiza_fortis","haliaeetus_albicilla","haliaeetus_leucocephalus","leptosomus_discolor","manacus_vitellinus","meleagris_gallopavo","melopsittacus_undulatus","merops_nubicus","mesitornis_unicolor","nestor_notabilis","nipponia_nippon","ophisthocomus_hoazin","pelecanus_crispus","phaethon_lepturus","phalacrocorax_carbo","phoenicopterus_ruber","picoides_pubescens","podiceps_cristatus","pterocles_guturalis","pygoscelis_adeliae","struthio_camelus","taeniopygia_guttata","tauraco_erythrolophus","tinamus_major","tyto_alba"),c("Rifleman","Peking duck","Bar-tailed trogon","Emperor penguin","Grey crowned crane","Rhinoceros hornbill","Anna's hummingbird","Chuck-will's widow","Red-legged seriema","Turkey vulture","Chimney swift","Killdeer","MacQueen's bustard","Speckled mousebird","Pigeon","American crow","Common cuckoo","Little egret","Sunbittern","Peregrine falcon","Northern fulmar","Chicken","Red-throated loon","Medium ground-finch","White-tailed eagle","Bald eagle","Cuckoo-roller","Golden-collard manakin","Turkey","Budgerigar","Carmine bee-eater","Brown mesite","Kea","Crested ibis","Hoatzin","Dalmatian pelican","White-tailed tropicbird","Great cormorant","American Flamingo","Downy woodpecker","Great-crested grebe","Yel.-thr. sandgrouse","Adelie penguin","Common ostrich","Zebra finch","Red-crested turaco","Wht.-thr. tinamou","Barn owl"),Extreme_tree$tip.label)

Extreme_tree$tip.label<-Fixed_Tip_Labels
plotTree(Extreme_tree)

Fixed_Total_Tip_Labels<-mgsub(c("acanthisitta_chloris","anas_platyrhynchos_domestica","apaloderma_vittatum","aptenodytes_forsteri","balearica_regulorum_gibbericeps","buceros_rhinoceros_silvestris","calypte_anna","caprimugus_carolinensis","cariama_cristata","cathartes_aura","chaetura_pelagica","charadrius_vociferus","chlamydotis_undulata","colius_striatus","columba_livia","corvus_brachyrhynchos","cuculus_canorus","egretta_garzetta","eurypyga_helias","falco_peregrinus","fulmarus_glacialis","galga","gavia_stellata","geospiza_fortis","haliaeetus_albicilla","haliaeetus_leucocephalus","leptosomus_discolor","manacus_vitellinus","meleagris_gallopavo","melopsittacus_undulatus","merops_nubicus","mesitornis_unicolor","nestor_notabilis","nipponia_nippon","ophisthocomus_hoazin","pelecanus_crispus","phaethon_lepturus","phalacrocorax_carbo","phoenicopterus_ruber","picoides_pubescens","podiceps_cristatus","pterocles_guturalis","pygoscelis_adeliae","struthio_camelus","taeniopygia_guttata","tauraco_erythrolophus","tinamus_major","tyto_alba"),c("Rifleman","Peking duck","Bar-tailed trogon","Emperor penguin","Grey crowned crane","Rhinoceros hornbill","Anna's hummingbird","Chuck-will's widow","Red-legged seriema","Turkey vulture","Chimney swift","Killdeer","MacQueen's bustard","Speckled mousebird","Pigeon","American crow","Common cuckoo","Little egret","Sunbittern","Peregrine falcon","Northern fulmar","Chicken","Red-throated loon","Medium ground-finch","White-tailed eagle","Bald eagle","Cuckoo-roller","Golden-collard manakin","Turkey","Budgerigar","Carmine bee-eater","Brown mesite","Kea","Crested ibis","Hoatzin","Dalmatian pelican","White-tailed tropicbird","Great cormorant","American Flamingo","Downy woodpecker","Great-crested grebe","Yel.-thr. sandgrouse","Adelie penguin","Common ostrich","Zebra finch","Red-crested turaco","Wht.-thr. tinamou","Barn owl"),Total_UCE_tree$tip.label)

Total_UCE_tree$tip.label<-Fixed_Total_Tip_Labels
plotTree(Total_UCE_tree)


Fixed_Moderate_Tip_Labels<-mgsub(c("acanthisitta_chloris","anas_platyrhynchos_domestica","apaloderma_vittatum","aptenodytes_forsteri","balearica_regulorum_gibbericeps","buceros_rhinoceros_silvestris","calypte_anna","caprimugus_carolinensis","cariama_cristata","cathartes_aura","chaetura_pelagica","charadrius_vociferus","chlamydotis_undulata","colius_striatus","columba_livia","corvus_brachyrhynchos","cuculus_canorus","egretta_garzetta","eurypyga_helias","falco_peregrinus","fulmarus_glacialis","galga","gavia_stellata","geospiza_fortis","haliaeetus_albicilla","haliaeetus_leucocephalus","leptosomus_discolor","manacus_vitellinus","meleagris_gallopavo","melopsittacus_undulatus","merops_nubicus","mesitornis_unicolor","nestor_notabilis","nipponia_nippon","ophisthocomus_hoazin","pelecanus_crispus","phaethon_lepturus","phalacrocorax_carbo","phoenicopterus_ruber","picoides_pubescens","podiceps_cristatus","pterocles_guturalis","pygoscelis_adeliae","struthio_camelus","taeniopygia_guttata","tauraco_erythrolophus","tinamus_major","tyto_alba"),c("Rifleman","Peking duck","Bar-tailed trogon","Emperor penguin","Grey crowned crane","Rhinoceros hornbill","Anna's hummingbird","Chuck-will's widow","Red-legged seriema","Turkey vulture","Chimney swift","Killdeer","MacQueen's bustard","Speckled mousebird","Pigeon","American crow","Common cuckoo","Little egret","Sunbittern","Peregrine falcon","Northern fulmar","Chicken","Red-throated loon","Medium ground-finch","White-tailed eagle","Bald eagle","Cuckoo-roller","Golden-collard manakin","Turkey","Budgerigar","Carmine bee-eater","Brown mesite","Kea","Crested ibis","Hoatzin","Dalmatian pelican","White-tailed tropicbird","Great cormorant","American Flamingo","Downy woodpecker","Great-crested grebe","Yel.-thr. sandgrouse","Adelie penguin","Common ostrich","Zebra finch","Red-crested turaco","Wht.-thr. tinamou","Barn owl"),Moderate_tree$tip.label)

Moderate_tree$tip.label<-Fixed_Moderate_Tip_Labels
plotTree(Moderate_tree)

plotTree(Jarvis_TENT) #File already has names changed within it.

plotTree(Jarvis_UCE) #File already has names changed within it. 

write.csv(x=Prum$tip.label,file="~/Desktop/PrumTips.csv")

###############################################################################################################################################################################################################################################################################################################################################################################################################################################################

rr.82_edge<-reroot(Extreme_tree, 82)
plotTree(rr.82_edge)

#
plotTree(Total_UCE_tree,node.numbers=T)
Total.rr.80<-reroot(Total_UCE_tree,80)

#
plotTree(Moderate_tree,node.numbers=T)
Moderate.rr.57<-reroot(Moderate_tree,57)

#
plotTree(Jarvis_TENT)
TENT.rr.76<-reroot(Jarvis_TENT,76)
#
plotTree(Jarvis_UCE)
UCE_Jarvis.rr.51<-reroot(Jarvis_UCE,51)
###############################################################################################################################################################################################################################################################################################################################################################################################################################################################

ultra82_p.05<-compute.brlen(rr.82_edge,power = 0.5)
plotTree(ultra82_p.05)
write.tree(phy = ultra82_p.05,file = "~/roundtrip.tree")   #Roundtripping because there is a bug

Ultra_Total_p.05<-compute.brlen(Total.rr.80,power=0.5)
plotTree(Ultra_Total_p.05)
write.tree(phy = Ultra_Total_p.05,file = "~/Total_Ultra.tree")

Ultra_Moderate_p.05<-compute.brlen(Moderate.rr.57,power=0.5)
plotTree(Ultra_Moderate_p.05)
write.tree(phy=Ultra_Moderate_p.05,file="~/Moderate_Ultra.tree")

Ultra_TENT_p.05<-compute.brlen(TENT.rr.76,power=0.5)
plotTree(Ultra_TENT_p.05)
write.tree(phy=Ultra_TENT_p.05,file="~/Jarvis_TENT_Ultra.tree")

Ultra_UCE.Jarvis_p.05<-compute.brlen(UCE_Jarvis.rr.51,power=0.5)
plotTree(Ultra_UCE.Jarvis_p.05)
write.tree(phy=Ultra_UCE.Jarvis_p.05,file="~/Jarvis_UCE_Ultra.tree")



###############################################################################################################################################################################################################################################################################################################################################################################################################################################################
Roundtree<-read.tree(file = "~/roundtrip.tree") #Extreme Tree
plotTree(Roundtree)

rt.49.rt<-rotateNodes(Roundtree,49)
rt.50<-rotateNodes(rt.49.rt,50)
rt.51<-rotateNodes(rt.50,51)
rt.all<-rotateNodes(rt.51,"all")
rt.51.rt<-rotateNodes(rt.all,51)
rt.50.rt.rt<-rotateNodes(rt.51.rt,50)
rt.92<-rotateNodes(rt.50.rt.rt,92)
rt.91<-rotateNodes(rt.92,91)
rt.90<-rotateNodes(rt.91,90)
rt.87<-rotateNodes(rt.90,87)
rt.86<-rotateNodes(rt.87,86)
rt.80<-rotateNodes(rt.86,80)
rt.82<-rotateNodes(rt.80,82)
rt.76<-rotateNodes(rt.82,76)
rt.75<-rotateNodes(rt.76,75)
rt.56<-rotateNodes(rt.75,56)
rt.57<-rotateNodes(rt.56,57)
rt.60<-rotateNodes(rt.57,60)
rt.61<-rotateNodes(rt.60,61)
rt.62<-rotateNodes(rt.61,62)
rt.63<-rotateNodes(rt.62,63)
rt.68<-rotateNodes(rt.63,68)
rt.70<-rotateNodes(rt.68,70)
rt.71<-rotateNodes(rt.70,71)
rt.72<-rotateNodes(rt.71,72)
rt.66<-rotateNodes(rt.72,66)
rt.89<-rotateNodes(rt.66,89)
rt.85<-rotateNodes(rt.89,85)
rt.95<-rotateNodes(rt.85,95)
rt.83<-rotateNodes(rt.95,83)
rt.89<-rotateNodes(rt.83,89)
rt.91<-rotateNodes(rt.89,91)
rt.69<-rotateNodes(rt.91,69)
rt.59<-rotateNodes(rt.69,59)
rt.49<-rotateNodes(rt.59,49)
plotTree(rt.49)
write.tree(phy = rt.49,file = "~/RotatedNodes_Extreme.tree")

Total_Ultra<-read.tree(file = "~/Total_Ultra.tree")
plotTree(Total_Ultra)
T_rt.49<-rotateNodes(Total_Ultra,49)
T_rt.50<-rotateNodes(T_rt.49,50)
T_rt.51<-rotateNodes(T_rt.50,51)
T_rt.50<-rotateNodes(T_rt.51,50)
T_rt.92<-rotateNodes(T_rt.50,92)
T_rt.91<-rotateNodes(T_rt.92,91)
T_rt.90<-rotateNodes(T_rt.91,90)
T_rt.87<-rotateNodes(T_rt.90,87)
T_rt.86<-rotateNodes(T_rt.87,86)
T_rt.80<-rotateNodes(T_rt.86,80)
T_rt.82<-rotateNodes(T_rt.80,82)
T_rt.76<-rotateNodes(T_rt.82,76)
T_rt.75<-rotateNodes(T_rt.76,75)
T_rt.56<-rotateNodes(T_rt.75,56)
T_rt.57<-rotateNodes(T_rt.56,57)
T_rt.60<-rotateNodes(T_rt.57,60)
T_rt.61<-rotateNodes(T_rt.60,61)
T_rt.62<-rotateNodes(T_rt.61,62)
T_rt.63<-rotateNodes(T_rt.62,63)
T_rt.68<-rotateNodes(T_rt.63,68)
T_rt.70<-rotateNodes(T_rt.68,70)
T_rt.71<-rotateNodes(T_rt.70,71)
T_rt.72<-rotateNodes(T_rt.71,72)
T_rt.73<-rotateNodes(T_rt.72,73)
T_rt.66<-rotateNodes(T_rt.73,66)
T_rt.49<-rotateNodes(T_rt.66,49)
T_rt.52<-rotateNodes(T_rt.49,52)
T_rt.53<-rotateNodes(T_rt.52,53)
T_rt.54<-rotateNodes(T_rt.53,54)
T_rt.55<-rotateNodes(T_rt.54,55)
T_rt.58<-rotateNodes(T_rt.55,58)
T_rt.57<-rotateNodes(T_rt.58,57)
T_rt.69<-rotateNodes(T_rt.57,69)
T_rt.72.rt<-rotateNodes(T_rt.69,72)
T_rt.73.rt<-rotateNodes(T_rt.72.rt,73)
T_rt.59<-rotateNodes(T_rt.73.rt,59)
T_rt.62.rt<-rotateNodes(T_rt.59,62)
T_rt.63.rt<-rotateNodes(T_rt.62.rt,63)
T_rt.87.rt<-rotateNodes(T_rt.63.rt,87)
T_rt.67.rt<-rotateNodes(T_rt.87.rt,67)
T_rt.76<-rotateNodes(T_rt.67.rt,76)
T_rt.80<-rotateNodes(T_rt.76,80)
T_rt.83<-rotateNodes(T_rt.80,83)
T_rt.85<-rotateNodes(T_rt.83,85)
T_50<-rotateNodes(T_rt.85,50)
T_49.rt<-rotateNodes(T_50,49)
T_93.rt<-rotateNodes(T_49.rt,93)
T_92.rt<-rotateNodes(T_93.rt,92)
T_77.rt<-rotateNodes(T_92.rt,77)
T_67.rt<-rotateNodes(T_77.rt,67)
write.tree(phy = T_67.rt,file = "~/RotatedNodes_Total.tree")


Roundtrip_Moderate_tree_rooted_ultra<-read.tree(file="~/Moderate_Ultra.tree")
plotTree(Roundtrip_Moderate_tree_rooted_ultra)
nodelabels()
M_rt.49<-rotateNodes(Roundtrip_Moderate_tree_rooted_ultra,49)
m_rt.50<-rotateNodes(M_rt.49,50)
M.rt.51<-rotateNodes(m_rt.50,51)
M.rt.52<-rotateNodes(M.rt.51,52)
M.rt.61<-rotateNodes(M.rt.52,61)
M.rt.62<-rotateNodes(M.rt.61,62)
M.rt.81<-rotateNodes(M.rt.61,81)
M.rt.86<-rotateNodes(M.rt.81,86)
M.rt.82<-rotateNodes(M.rt.86,82)
M.rt.62<-rotateNodes(M.rt.82,62)
M.rt.52<-rotateNodes(M.rt.62,52)
M.rt.64<-rotateNodes(M.rt.52,64)
M.rt.65<-rotateNodes(M.rt.64,65)
M.rt.66<-rotateNodes(M.rt.65,66)
M.rt.68<-rotateNodes(M.rt.66,68)
M.rt.55<-rotateNodes(M.rt.68,55)
M.rt.94<-rotateNodes(M.rt.55,94)
M.rt.53<-rotateNodes(M.rt.94,53)
M.rt.77<-rotateNodes(M.rt.53,77)
M.rt.79<-rotateNodes(M.rt.77,79)
M.rt.72<-rotateNodes(M.rt.79,72)
M.rt.85<-rotateNodes(M.rt.72,85)
M.rt.58<-rotateNodes(M.rt.85,58)
M.rt.89<-rotateNodes(M.rt.58,89)
M.rt.91<-rotateNodes(M.rt.89,91)
M.rt.92<-rotateNodes(M.rt.91,92)

Roundtrip_TENT_tree_rooted_ultra<-read.tree(file="~/Jarvis_TENT_Ultra.tree") #Jarvis ExaML
plotTree(Roundtrip_TENT_tree_rooted_ultra)
nodelabels()
J.rt.49<-rotateNodes(Roundtrip_TENT_tree_rooted_ultra,49)
J.rt.50<-rotateNodes(J.rt.49,50)
J.rt.51<-rotateNodes(J.rt.50,51)
J.rt.52<-rotateNodes(J.rt.51,52)
J.rt.53<-rotateNodes(J.rt.52,53)
J.rt.54<-rotateNodes(J.rt.53,54)
J.rt.55<-rotateNodes(J.rt.54,55)
J.rt.56<-rotateNodes(J.rt.55,56)
J.rt.57<-rotateNodes(J.rt.56,57)
J.rt.60<-rotateNodes(J.rt.57,60)
J.rt.61<-rotateNodes(J.rt.60,61)
J.rt.62<-rotateNodes(J.rt.61,62)
J.rt.68<-rotateNodes(J.rt.62,68)
J.rt.70<-rotateNodes(J.rt.68,70)
J.rt.76<-rotateNodes(J.rt.70,76)
J.rt.78<-rotateNodes(J.rt.76,78)
J.rt.80<-rotateNodes(J.rt.78,80)
J.rt.94<-rotateNodes(J.rt.80,94)
J.rt.74<-rotateNodes(J.rt.94,74)
J.rt.85<-rotateNodes(J.rt.74,85)
J.rt.95<-rotateNodes(J.rt.85,95)
J.rt.90<-rotateNodes(J.rt.95,90)
J.rt.87<-rotateNodes(J.rt.90,87)

Roundtrip_UCE.Jarvis_rooted_ultra<-read.tree(file="~/Jarvis_UCE_Ultra.tree")
plotTree(Roundtrip_UCE.Jarvis_rooted_ultra)
nodelabels()
UCE.j.rt.51<-rotateNodes(Roundtrip_UCE.Jarvis_rooted_ultra,51)
UCE.j.rt.94<-rotateNodes(UCE.j.rt.51,94)
UCE.j.rt.95<-rotateNodes(UCE.j.rt.94,95)
UCE.j.rt.59<-rotateNodes(UCE.j.rt.95,59)
UCE.j.rt.63<-rotateNodes(UCE.j.rt.59,63)
UCE.j.rt.91<-rotateNodes(UCE.j.rt.63,91)
UCE.j.rt.67<-rotateNodes(UCE.j.rt.91,67)
UCE.j.rt.76<-rotateNodes(UCE.j.rt.67,76)
UCE.j.rt.78<-rotateNodes(UCE.j.rt.76,78)
UCE.j.rt.82<-rotateNodes(UCE.j.rt.78,82)
UCE.j.rt.74<-rotateNodes(UCE.j.rt.82,74)
UCE.j.rt.69<-rotateNodes(UCE.j.rt.74,69)
UCE.j.rt.50<-rotateNodes(UCE.j.rt.69,50)
UCE.j.rt.53<-rotateNodes(UCE.j.rt.50,53)
UCE.j.rt.75<-rotateNodes(UCE.j.rt.53,75)
UCE.j.rt.83<-rotateNodes(UCE.j.rt.75,83)
UCE.j.rt.68<-rotateNodes(UCE.j.rt.83,68)
UCE.j.rt.71<-rotateNodes(UCE.j.rt.68,71)
###############################################################################################################################################################################################################################################################################################################################################################################################################################################################

#Coloring clades for the extreme tree
cols_Extreme<-c("green","sienna4","blue2","cyan","darkorange","darkmagenta","yellow","black");
names(cols_Extreme)<-c(1,2,3,4,5,6,7,8)
blacktips<-paintSubTree(rt.49,node=49,state="8",stem=FALSE)
greentips<-paintSubTree(blacktips,node=56,state="1",stem=FALSE)
sienna4tips<-paintSubTree(greentips,node=74,state="2",stem=FALSE)
bluetips<-paintSubTree(sienna4tips,node=78, state="3",stem=FALSE)
orangetips<-paintSubTree(bluetips,node=87,state="5",stem=FALSE)
purpletips<-paintSubTree(orangetips,node=89,state="6",stem=FALSE)
yellowtips.1<-paintSubTree(purpletips,node=16,state="7",stem=TRUE)
yellowtips.2<-paintSubTree(yellowtips.1,node=14,state="7",stem=TRUE)
cyantips<-paintSubTree(yellowtips.2,node=77,state="4",stem=FALSE)
ExtremeTree<-cyantips
plotSimmap(ExtremeTree,cols_Extreme,lwd=4,pts=F)


#Coloring clades for the total tree
cols_Total<-c("green","sienna4","blue2","cyan","darkorange","darkmagenta","yellow","black");
names(cols_Total)<-c(1,2,3,4,5,6,7,8)
blacktips.t<-paintSubTree(T_67.rt,node=49,state="8",stem=FALSE)
greentips.t<-paintSubTree(blacktips.t,node=57,state="1",stem=FALSE)
sienna4tips.t<-paintSubTree(greentips.t,node=83,state="2",stem=FALSE)
bluetips.t<-paintSubTree(sienna4tips.t,node=75, state="3",stem=FALSE)
orangetips.t<-paintSubTree(bluetips.t,node=88,state="5",stem=FALSE)
purpletips.t.1<-paintSubTree(orangetips.t,node=90,state="6",stem=FALSE)
purpletips.t.2<-paintSubTree(purpletips.t.1,node=92,state="6",stem=FALSE)
yellowtips.t.1<-paintSubTree(purpletips.t.2,node=16,state="7",stem=TRUE)
yellowtips.t.2<-paintSubTree(yellowtips.t.1,node=15,state="7",stem=TRUE)
cyantips.t<-paintSubTree(yellowtips.t.2,node=85,state="4",stem=FALSE)
TotalTree<-cyantips.t
plotSimmap(TotalTree,cols_Total,lwd=4)


#Coloring clades for the moderate tree
cols_moderate<-c("green","sienna4","blue2","cyan","darkorange","darkmagenta","yellow","black");
names(cols_moderate)<-c(1,2,3,4,5,6,7,8)
blacktips.m<-paintSubTree(M.rt.92,node=49,state="8",stem=FALSE)
greentips.m<-paintSubTree(blacktips.m,node=62,state="1",stem=FALSE)
sienna4tips.m<-paintSubTree(greentips.m,node=58,state="2",stem=FALSE)
bluetips.m<-paintSubTree(sienna4tips.m,node=80,state="3",stem=FALSE)
orangetips.m<-paintSubTree(bluetips.m,node=53,state="5",stem=FALSE)
purpletips.m.1<-paintSubTree(orangetips.m,node=92,state="6",stem=FALSE)
purpletips.m.2<-paintSubTree(purpletips.m.1,node=90,state="6",stem=FALSE)
yellowtips.m<-paintSubTree(purpletips.m.2,node=88,state="7",stem=FALSE)
cyantips.m<-paintSubTree(yellowtips.m,node=60,state="4",stem=FALSE)
ModerateTree<-cyantips.m
plotSimmap(ModerateTree,cols_moderate,lwd=4)

#Coloring clades for the TENT tree
cols_Jarvis<-c("green","sienna4","blue2","cyan","darkorange","darkmagenta","yellow","black")
names(cols_Jarvis)<-c(1,2,3,4,5,6,7,8)
blacktips.j<-paintSubTree(J.rt.87,node=49,state="8",stem=FALSE)
greentips.j<-paintSubTree(blacktips.j,node=55,state="1",stem=FALSE)
siennatips.j<-paintSubTree(greentips.j,node=87,state="2",stem=FALSE)
bluetips.j<-paintSubTree(siennatips.j,node=75,state="3",stem=FALSE)
orangetips.j<-paintSubTree(bluetips.j,node=85,state="5",stem=FALSE)
purpletips.j<-paintSubTree(orangetips.j,node=89,state="6",stem=FALSE)
yellowtips.j<-paintSubTree(purpletips.j,node=83,state="7",stem=FALSE)
cyantips.j<-paintSubTree(yellowtips.j,node=74,state="4",stem=FALSE)
Jarvis_ExaML_Tree<-cyantips.j
plotSimmap(Jarvis_ExaML_Tree,cols_Jarvis,lwd=4)

#Coloring clades for the Jarvis UCE tree
cols_UCE.j<-c("green","sienna4","blue2","cyan","darkorange","darkmagenta","yellow","black")
names(cols_UCE.j)<-c(1,2,3,4,5,6,7,8)
blacktips.uce.j<-paintSubTree(UCE.j.rt.71,node=49,state="8", stem=FALSE)
greentips.uce.j<-paintSubTree(blacktips.uce.j,node=66,state="1",stem=FALSE)
siennatips.uce.j<-paintSubTree(greentips.uce.j,node=85,state="2",stem=FALSE)
bluetips.uce.j<-paintSubTree(siennatips.uce.j,node=87,state="3",stem=FALSE)
purpletips.uce.j.1<-paintSubTree(bluetips.uce.j,node=55,state="6",stem=FALSE)
purpletips.uce.j.2<-paintSubTree(purpletips.uce.j.1,node=53,state="6",stem=FALSE)
yellowtips.uce.j<-paintSubTree(purpletips.uce.j.2,node=62,state="7",stem=FALSE)
cyantips.uce.j<-paintSubTree(yellowtips.uce.j,node=65,state="4",stem=FALSE)
orangetips.uce.j<-paintSubTree(cyantips.uce.j,node=58,state="5",stem=FALSE)
Jarvis.UCE.Tree<-orangetips.uce.j
###############################################################################################################################################################################################################################################################################################################################################################################################################################################################


#Extreme vs Total
par(mfrow=c(1,2))
    #Left Panel
    #par(mai=c(0.2,5,0,5))
#write.csv(x=ExtremeTree$node.label,file="~/Desktop/NewBoot.txt")
#Find and replace "100" with "", then create a new variable 
NewBoot2<-c("","","98","82","61","32","","","","","","56","42","","","","99","","","","","","","","","","","53","","","","","","","93","","43","45","99","92","73","","77","","","","")
ExtremeTree$node.label<-NewBoot2
plotSimmap(ExtremeTree,cols_Extreme,lwd=2,fsize=.70)
nodelabels(ExtremeTree$node.label,adj=c(1,0),bg="white", frame="none",cex=0.7)
    #Right Panel
    #par(mai=c(0.4,0,0,0.2))
#write.csv(x=TotalTree$node.label,file="~/Total.bootstrap.csv")
#Find and replace "100" with "", then create a new variable 
Total_bootstrap<-c("","","73","57","56","54","42","","","55","57","","","66","","96","","","","","","","","","","","","","","","","","90","42","","","","90","99","93","77","99","","","","","")
TotalTree$node.label<-Total_bootstrap
plotSimmap(TotalTree,cols_Total,lwd=2,direction="leftwards",fsize = .70)
nodelabels(TotalTree$node.label,adj=c(0,0), bg = "white",frame="none",cex=0.7)
dev.off()

#Extreme vs Jarvis ExaML
par(mfrow=c(1,2),tcl=-0.5,omi=c(0,0,0,0),mai=c(0,0,0,0))
  #LeftPanel
NewBoot2<-c("","","98","82","61","32","","","","","","56","42","","","","99","","","","","","","","","","","53","","","","","","","93","","43","45","99","92","73","","77","","","","")
ExtremeTree$node.label<-NewBoot2
plotSimmap(ExtremeTree,cols_Extreme,lwd=2,fsize=.70)
nodelabels(ExtremeTree$node.label,adj=c(1,0),bg="white", frame="none",cex=0.7)
  #RightPanel
write.csv(x=Jarvis_ExaML_Tree$node.label,file="~/ExaML.bootstrap.csv")
ExaML_Boot<-c("","","","91","96","","","","","","","","","","","","","","84","","","72","","","70","","","","","","","","","91","96","91","","55","","","","","","","","","")
Jarvis_ExaML_Tree$node.label<-ExaML_Boot
plotSimmap(Jarvis_ExaML_Tree,cols_Jarvis,lwd=2,direction="leftwards",fsize=.70)
nodelabels(Jarvis_ExaML_Tree$node.label,adj=c(0,0), bg = "white",frame="none",cex=0.7)

#Extreme vs Jarvis UCE
par(mfrow=c(1,2),tcl=-0.5,omi=c(0,0,0,0),mai=c(0,0,0,0))
#LeftPanel
NewBoot2<-c("","","98","82","61","32","","","","","","56","42","","","","99","","","","","","","","","","","53","","","","","","","93","","43","45","99","92","73","","77","","","","")
ExtremeTree$node.label<-NewBoot2
plotSimmap(ExtremeTree,cols_Extreme,lwd=2,fsize=.70)
nodelabels(ExtremeTree$node.label,adj=c(1,0),bg="white", frame="none",cex=0.7)
#RightPanel
write.csv(x=Jarvis.UCE.Tree$node.label,file="~/JArvisUCE.bootstrap.csv")
UCE.j_Boot<-c("","","","","","81","90","","32","83","79","32","59","98","32","9","","","","78","78","","61","","94","","","","","","","","","","","7","","","","","","","","","67","","")
Jarvis.UCE.Tree$node.label<-UCE.j_Boot
plotSimmap(Jarvis.UCE.Tree,cols_,lwd=2,direction="leftwards",fsize=.70)
nodelabels(Jarvis.UCE.Tree$node.label,adj=c(0,0), bg = "white",frame="none",cex=0.7)




###############################################################      Moderate vs Total
par(mfrow=c(1,2),tcl=-0.5,omi=c(0,0,0,0),mai=c(0,0,0,0))

#Left Panel
plotTree(ModerateTree)
ModerateVTotalTree<-rotateNodes(ModerateTree,57)
plotTree(ModerateVTotalTree)
cols_moderate_V_Total<-c("green","sienna4","blue2","cyan","darkorange","darkmagenta","yellow","black");
names(cols_moderate_V_Total)<-c(1,2,3,4,5,6,7,8)
blacktips.m.v<-paintSubTree(ModerateVTotalTree,node=49,state="8",stem=FALSE)
greentips.m.v<-paintSubTree(blacktips.m.v,node=62,state="1",stem=FALSE)
sienna4tips.m.v<-paintSubTree(greentips.m.v,node=58,state="2",stem=FALSE)
bluetips.m.v<-paintSubTree(sienna4tips.m.v,node=80,state="3",stem=FALSE)
orangetips.m.v<-paintSubTree(bluetips.m.v,node=53,state="5",stem=FALSE)
purpletips.m.1.v<-paintSubTree(orangetips.m.v,node=92,state="6",stem=FALSE)
purpletips.m.2.v<-paintSubTree(purpletips.m.1.v,node=90,state="6",stem=FALSE)
yellowtips.m.v<-paintSubTree(purpletips.m.2.v,node=88,state="7",stem=FALSE)
cyantips.m.v<-paintSubTree(yellowtips.m.v,node=60,state="4",stem=FALSE)
ModerateTree.v<-cyantips.m.v
plotSimmap(ModerateTree.v,cols_moderate_V_Total,lwd=2,fsize=.70)
write.csv(x=ModerateTree$node.label,file="~/Moderate.boostrap.csv")
ModeBoots_<-c("","","79","86","","92","87","65","58","","","","36","","","","","","","","","","","","","50","51","","","","","","","","","","","","71","44","55","96","","","","","")
ModerateVTotalTree$node.label<-ModeBoots_
nodelabels(ModerateTree$node.label,adj=c(1.1,0),bg="white", frame="none",cex=0.70)
#Right Panel
#TotalTree$node.label<-Total_bootstrap
Total_bootstrap<-c("","","73","57","56","54","42","","","55","57","","","66","","96","","","","","","","","","","","","","","","","","90","42","","","","90","99","93","77","99","","","","","")
TotalTree$node.label<-Total_bootstrap
plotSimmap(TotalTree,cols_Total,lwd=2,direction="leftwards",fsize = .70)
nodelabels(TotalTree$node.label,adj=c(0,0), bg = "white",frame="none",cex=0.7)

dev.off()

#################################################################   Moderate Vs ExaML Tree
par(mfrow=c(1,2),tcl=-0.5,omi=c(0,0,0,0),mai=c(0,0,0,0))
#Left Panel
ModeBoots_<-c("","","79","86","","92","87","65","58","","","","36","","","","","","","","","","","","","50","51","","","","","","","","","","","","71","44","55","96","","","","","")
ModerateTree$node.label<-ModeBoots_
plotSimmap(ModerateTree,cols_moderate,lwd=2,mar = c(1,1,1,1),fsize=.70)
nodelabels(ModerateTree$node.label,adj=c(1.1,0),bg="white", frame="none",cex=0.70)
#Right Panel
ExaML_Boot<-c("","","","91","96","","","","","","","","","","","","","","84","","","72","","","70","","","","","","","","","91","96","91","","55","","","","","","","","","")
Jarvis_ExaML_Tree$node.label<-ExaML_Boot
plotSimmap(Jarvis_ExaML_Tree,cols_Jarvis,lwd=2,direction="leftwards",fsize=.70)
nodelabels(Jarvis_ExaML_Tree$node.label,adj=c(0,0), bg = "white",frame="none",cex=0.7)
dev.off()
#################################################################   Moderate Vs Jarvis UCE
par(mfrow=c(1,2),tcl=-0.5,omi=c(0,0,0,0),mai=c(0,0,0,0))
#Left Panel
ModeBoots_<-c("","","79","86","","92","87","65","58","","","","36","","","","","","","","","","","","","50","51","","","","","","","","","","","","71","44","55","96","","","","","")
ModerateTree$node.label<-ModeBoots_
plotSimmap(ModerateTree,cols_moderate,lwd=2,mar = c(1,1,1,1),fsize=.70)
nodelabels(ModerateTree$node.label,adj=c(1.1,0),bg="white", frame="none",cex=0.70)
#RightPanel
write.csv(x=Jarvis.UCE.Tree$node.label,file="~/JArvisUCE.bootstrap.csv")
UCE.j_Boot<-c("","","","","","81","90","","32","83","79","32","59","98","32","9","","","","78","78","","61","","94","","","","","","","","","","","7","","","","","","","","","67","","")
Jarvis.UCE.Tree$node.label<-UCE.j_Boot
plotSimmap(Jarvis.UCE.Tree,cols_Jarvis,lwd=2,direction="leftwards",fsize=.70)
nodelabels(Jarvis.UCE.Tree$node.label,adj=c(0,0), bg = "white",frame="none",cex=0.7)

#################################################################   Total Vs Jarvis UCE Tree
par(mfrow=c(1,2),tcl=-0.5,omi=c(0,0,0,0),mai=c(0,0,0,0))
#Left Panel
Total_bootstrap<-c("","","73","57","56","54","42","","","55","57","","","66","","96","","","","","","","","","","","","","","","","","90","42","","","","90","99","93","77","99","","","","","")
TotalTree$node.label<-Total_bootstrap
plotSimmap(TotalTree,cols_Total,lwd=2,direction=,fsize = .70)
nodelabels(TotalTree$node.label,adj=c(0,0), bg = "white",frame="none",cex=0.7)

#Right Panel
UCE.j_Boot<-c("","","","","","81","90","","32","83","79","32","59","98","32","9","","","","78","78","","61","","94","","","","","","","","","","","7","","","","","","","","","67","","")
Jarvis.UCE.Tree$node.label<-UCE.j_Boot
plotSimmap(Jarvis.UCE.Tree,cols_Jarvis,lwd=2,direction="leftwards",fsize=.70)
nodelabels(Jarvis.UCE.Tree$node.label,adj=c(0,0), bg = "white",frame="none",cex=0.7)
dev.off()
#################################################################   Total Vs ExaML Tree
par(mfrow=c(1,2),tcl=-0.5,omi=c(0,0,0,0),mai=c(0,0,0,0))
#Left Panel
Total_bootstrap<-c("","","73","57","56","54","42","","","55","57","","","66","","96","","","","","","","","","","","","","","","","","90","42","","","","90","99","93","77","99","","","","","")
TotalTree$node.label<-Total_bootstrap
plotSimmap(TotalTree,cols_Total,lwd=2,direction="leftwards",fsize = .70)
nodelabels(TotalTree$node.label,adj=c(0,0), bg = "white",frame="none",cex=0.7)

#Right Panel
plotSimmap(Jarvis_ExaML_Tree,cols_Jarvis,lwd=2,direction="leftwards",fsize=.70)
nodelabels(Jarvis_ExaML_Tree$node.label,adj=c(0,0), bg = "white",frame="none",cex=0.7)
dev.off()





