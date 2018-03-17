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
