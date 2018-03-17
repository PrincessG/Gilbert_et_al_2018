# Gilbert_et_al_2018
Repository for scripts and codes referred to in the manuscript "Filtering nucleotide sites by phylogenetic signal to noise ratio increases confidence in the Neoaves phylogeny generated from ultraconserved elements", which is currently in review.  

If you find this repository helpful please cite it using the following DOI: https://zenodo.org/badge/latestdoi/124963673

Thanks & Cheers,
PS Gilbert
__________________________________________

#Hello! These are instructions from beginning to end for Signal Noise calculations! 
#Run PI on the nexus alignment files of your choice.
#Navigate to the directory where each nexus.rates file live.

____________________________________Choosing UCEs of Interest________________________________________________________
At some point we decided it would be interesting to look at the split between Neognathae and Paleognathae birds. This occured 
at around 102 MYA. So to explore which UCEs would have the most signal for this question, we're interested in those UCEs
who reach their maximum PI at or after 102 MYA ago. We'd then want to concatenate those UCEs and analyze their signal as
one locus. This presents a challenging problem computationally because we're trying to run one locus that is hundreds of
thousands of base pairs. To make the problem less unruly we decided to "bin" the UCEs into quintiles. 

#Export list of UCEs of interest from R.
#Open UCE interest text file and Find & replace using textwrangler so that each line in the text file matches the following:
#find .nex" & Replace with .nex.rates
#Remove carriage returns and quotations so that every UCE is on the first line separated by a space.
#Add cp to the beginning of line 1.
#Add destination folder to the end of line 1 (i.e. ~/Documents/Research/Aves/DestinationFolder)
#Save as Filename.txt. 


#You might want to run each folder as one giant locus. If this is the case, you'll need to isolate the .nexus
files that match the UCEs you're interested in, put them into a single directory and concatenate them using phyluce. 
RUN FROM THE BIN DIRECTORY OF THE ANACONDA FOLDER ON ANALYSIS:
phyluce_align_format_nexus_files_for_raxml \
    --alignments ~/ \
    --output ~/ \
    --charsets \
    --log-path ~/
    
    
_____________________________After Putting all UCEs of Interest in a directory__________________________
#Alter each file name so that it can be used in the Mathematica signal/noise notebook. 
	#Refer to BigBirdFileFormating_nexus.rates_files.txt

#Now parse each file into 3 files: switches, rates & percentages.->>> 
#This can also be done on the UCLA Analysis computer using the online version of R studio ->>>>> (be sure that you are connected to the internet by eduroam or a vpn).
	#You'll just need to transfer all the files over using FileZilla. And set the working directory to that folder in R. 

#Now transfer the dataset to the alfaro analysis computer. SKIP IF YOUR USED ONLINE R STUDIO.

#Create a text file with the name of each marker in the directory.
	ls > FileNames.txt	#Use this command in terminal to ls 

#Clean up the FileNames.txt file so that it only has the UCE names followed by a comma. 

# Cut & Paste the list of UCE names into the signal/noise mathematica notebook.
# Correct the Tnaught and T value inputs.
#57-55MYA=2MYA so Tnaught is 2, and T is 55. 
# Change file paths so that they match the input dataset locations. 
#Change file path so that they match the output directory location.
#Enter mathematica
	#on linux-> Enter ./math
