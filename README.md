# Welcome to the Readme file for Gilbert_et_al_2018! 
This is a repository for scripts, codes and data referred to in the manuscript *Filtering nucleotide sites by phylogenetic signal to noise ratio increases confidence in the Neoaves phylogeny generated from ultraconserved elements*(In Review).

If you find this repository helpful please cite it using the following DOI: https://zenodo.org/badge/latestdoi/124963673

Thanks & Cheers,

PS Gilbert
__________________________________________

# Instructions from beginning to end for Signal Noise calculations! 
1. Run PI on the nexus alignment files of your choice.

   To do this , navigate to the directory where each nexus.rates file live and see below:

2. Choose UCEs of Interest

  #How I chose my UCEs of Interest
	Exported list of UCEs of interest from R.
	Open UCE interest text file and Find & replace using textwrangler so that each line in the text file matches the following:
	find `.nex` & Replace with `.nex.rates`.
	Remove carriage returns and quotations so that every UCE is on the first line separated by a space.
	Add cp to the beginning of line 1.
	Add destination folder to the end of line 1 (i.e. ~/DestinationFolder)
	Save as YourChosenFilename.txt. 


#You might want to run each folder as one giant locus. If this is the case, you'll need to isolate the .nexus
files that match the UCEs you're interested in, put them into a single directory and concatenate them using phyluce. 

FROM THE BIN DIRECTORY OF THE ANACONDA FOLDER:
```
phyluce_align_format_nexus_files_for_raxml \
    --alignments ~/LocationOfAlignments \
    --output ~/LocationOfOutput \
    --charsets \
    --log-path ~/LocationOfLogFile    
```    
# After Putting all UCEs of Interest in a directory
#Alter each file name so that it can be used in the Mathematica signal/noise notebook. 
	#Refer to BigBirdFileFormating_nexus.rates_files.txt

#Now parse each file into 3 files: switches, rates & percentages.->>> 
#This can also be done on the UCLA Analysis computer using the online version of R studio ->>>>> (be sure that you are connected to the internet by eduroam or a vpn).
	#You'll just need to transfer all the files over using FileZilla. And set the working directory to that folder in R. 

#Now transfer the dataset to the alfaro analysis computer. SKIP IF YOUR USED ONLINE R STUDIO.

#Create a text file with the name of each marker in the directory.
	```ls > FileNames.txt```	#Use this command in terminal to ls 

#Clean up the FileNames.txt file so that it only has the UCE names followed by a comma. 

#Cut & Paste the list of UCE names into the signal/noise mathematica notebook.
#Correct the Tnaught and T value inputs.
#57-55MYA=2MYA so Tnaught is 2, and T is 55. 
#Change file paths so that they match the input dataset locations. 
#Change file path so that they match the output directory location.
#Enter mathematica
	#on linux-> Enter ```./math```
	
# After Running Mathematica
#Concatenate all the Mathematica Output files into one text file. 
	#Use cat *.csv >> FileName.txt 
	##If file list is exceedingly long use ls | xargs -n 32 -P 8 cat  >> ~/SNImportFiles/filename.txt
#	Grep " ,\n " and replace it with "\n" in textwrangler
	## If the file list is exceedingly long use 
		vim filename.txt # Enter vim or vi 
		:%s/,\n/\r/g #Remove the comma at the end of each line and replace with a character return
		:wq #Save file
#	Run SNImport.R, be sure that the output is sorted by UCE because Jing's script won't work if the UCEs are NOT read in consecutively. 
#	Remove the header using textwrangler (as of 2018 BBEdit will suffice)
#	Confirm that the two columns are sorted correctly in microsoft Excel (it's the fastest way). 
#	Initiate Jing Script
python test.py Corrected_CuratedUCE_List

####	Protip: To remove the large folders created by Mathematica a useful command is : rm -rv FolderName
								OR
					   : perl -e 'for(<*>){((stat)[9]<(unlink))}'


#	Do Step A or B depending on your dataset:  

#	Step A: You have UCEs that will be concatenated as one locus
	#Concatenate All Nexus files into one alignment. This script will also export the concatenated dataset in phylip format for RaxML.
	#WARNING: DO NOT CREATE THE OUTPUT DIRECTORY BEFORE RUNNING THE SCRIPT!!!
	
#RUN THE FOLLOWING THE anaconda/bin DIRECTORY ON ANALYSIS:
phyluce_align_format_nexus_files_for_raxml \
--alignment ~/CuratedNexusFiles \
--output ~/CuratedTest/ \
--log-path ~/Logs/ \

######Example Problem Run:
phyluce_align_format_nexus_files_for_raxml \
--alignment ~/PSG/FolderLocationOfNexusFiles \
--verbosity INFO \
--output ~/ProblemName_Date.RAxML_Input/ \
--log-path ~/PSG/ProbemName_RAxML_Logs/ \


#	Change the output file name to be more logical manually
CuratedNexusFiles.phylip -> CuratedPhylipFile.phylip


#	Step B: You have individual loci that will each need their own substitution model:
	#RUN FROM THE BIN DIRECTORY OF THE ANACONDA FOLDER ON YOUR COMPUTER:
phyluce_align_convert_one_align_to_another \
--alignment ~/CuratedNexusFiles \
--output ~/CuratedPhylipFiles \
--input-format nexus \
--output-format phylip \
--cores 12 \
--log-path ~/Logs/ \
--shorten-names

# RaxML
#First Generate your two random numbers:
for i in 1 2; do echo $RANDOM; done

#First find the "best" ML tree.
#!!!RUN FROM THE DIRECTORY YOU WANT YOUR RAxML OUTPUT FILES TO LIVE there will be at least as many as you specify with -N!!!

	#9.28.16
```raxmlHPC-PTHREADS-SSE3 -m GTRGAMMA -n QuestionE_RAxML.9.28.16.best -s ~/LocationOf_RAxML_Input/ProblemName_CuratedPhylipFiles.phylip -N 20 -p 31257 -T 24
```
#Now calculate the bootstrap support values for each branch of your phylogeny. 
```raxmlHPC-PTHREADS-SSE3 -m GTRGAMMA -n boostraps -s ~/ProblemName_CuratedPhylipFiles.phylip -N 200 -b 18965 -p 10410 -T2
```
#From the Phyluce Tutorial, you can also "reconcile the bootstraps with the best tree" by entering
```raxmlHPC-SSE3 \
    -m GTRGAMMA \
    -f b \
    -t RAxML_bestTreeFileName \
    -z RAxML_BestTreeFileName_bootstrap.bootstraps \
    -n Run.CurrentDate
```


#Now you can open the tree for viewing in FigTree. Use the file without "BranchLabels" in the filename. 

#You'll want to edit the .tree file so that the tip labels are common names instead of scientific names if you're making the trees we did Gilbert et al. 2018. 
