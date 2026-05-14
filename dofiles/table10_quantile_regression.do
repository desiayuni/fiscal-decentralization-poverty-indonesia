
	**********************************
	*** Ksoll, Lilleor, Lonborg, Rasmussen
	*** Impact of Village Savings and Loans Associations: Evidence from a Cluster Randomized Trial 
	*** This file replicates the table 10 in the paper
	*** Note there is a separate file, as qreg with weights only works with STATA 13 and later
	
	**********************************

	version 12.1

	* paths
global dropbox_main  "C:\Users\user1\Dropbox"
*global dropbox_main "C:\Users\cksoll\Dropbox\"
*global dataandlog "$dropbox_main\VSLAimpact\Submission\JDE\R&R\Final\2nd revision\Replication data and do-file\"
global dataandlog "$dropbox_main\Kunyu\Malawi\R&R\Final revision"

*global outreg "C:\output\outreg\"

global outreg "$dropbox_main\Kunyu\Malawi\R&R\Final revision"

global reps 1599
capture log close
log using "$dataandlog\businessquantilereg", replace
use "$dataandlog\impact_replication_final.dta", clear

bys vid hhid (post): gen basebusinc2=businc2[1]


bys vid hhid (post): gen lagbusnum=busnum[1] if _n==2

bys vid hhid post: assert _n==1

keep if ss==1
keep if post==1

xtset, clear
keep vid hhid businc2 treat baseanybus blocks weightlong basebusinc2 post

**************************************
*** All observations
**************************************

capture program drop bootitDiM_W
				program define bootitDiM_W
					xi: qreg businc2 treat baseanybus i.blocks if post==1 [pweight=weightlong], quantile(0.25)
				end
				*bootitDiM_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiM_W 
outreg2 treat baseanybus using "$outreg\DiM_W_q25", excel replace label 


capture program drop bootitDiMLag_W
				program define bootitDiMLag_W
					xi: qreg businc2 treat basebusinc2 baseanybus i.blocks if post==1 [pweight=weightlong], quantile(0.25)
				end
				*bootitDiMLag_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiMLag_W 
outreg2 treat baseanybus basebusinc2 using "$outreg\DiMLag_W_q25", excel replace label 

capture program drop bootitDiM_W
				program define bootitDiM_W
					xi: qreg businc2 treat baseanybus i.blocks if post==1 [pweight=weightlong], quantile(0.5)
				end
				*bootitDiM_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiM_W 
outreg2 treat baseanybus using "$outreg\DiM_W_q50", excel replace label 


capture program drop bootitDiMLag_W
				program define bootitDiMLag_W
					xi: qreg businc2 treat basebusinc2 baseanybus i.blocks if post==1 [pweight=weightlong], quantile(0.5)
				end
				*bootitDiMLag_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiMLag_W 
outreg2 treat baseanybus basebusinc2 using "$outreg\DiMLag_W_q50", excel replace label 


capture program drop bootitDiM_W
				program define bootitDiM_W
					xi: qreg businc2 treat baseanybus i.blocks if post==1 [pweight=weightlong], quantile(0.75)
				end
				*bootitDiM_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiM_W 
outreg2 treat baseanybus using "$outreg\DiM_W_q75", excel replace label 


capture program drop bootitDiMLag_W
				program define bootitDiMLag_W
					xi: qreg businc2 treat basebusinc2 baseanybus i.blocks if post==1 [pweight=weightlong], quantile(0.75)
				end
				*bootitDiMLag_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiMLag_W 
outreg2 treat baseanybus basebusinc2 using "$outreg\DiMLag_W_q75", excel replace label 


tempfile tempall
save `tempall'

***********************************************************
* Has business at baseline
***********************************************************

use `tempall', clear

*bys vid hhid (post): gen basebusinc2=businc2[1]

keep if baseanybus==1

capture program drop bootitDiM_W
				program define bootitDiM_W
					xi: qreg businc2 treat i.blocks if post==1 [pweight=weightlong], quantile(0.25)
				end
				*bootitDiM_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiM_W 
outreg2 treat using "$outreg\DiM_W_q25", excel replace label 

capture program drop bootitDiMLag_W
				program define bootitDiMLag_W
					xi: qreg businc2 treat basebusinc2 i.blocks if post==1 [pweight=weightlong], quantile(0.25)
				end
				*bootitDiMLag_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiMLag_W 
outreg2 treat basebusinc2 using "$outreg\DiMLag_W_q25", excel replace label 

capture program drop bootitDiM_W
				program define bootitDiM_W
					xi: qreg businc2 treat i.blocks if post==1 [pweight=weightlong], quantile(0.5)
				end
				*bootitDiM_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiM_W 
outreg2 treat using "$outreg\DiM_W_q50", excel replace label 


capture program drop bootitDiMLag_W
				program define bootitDiMLag_W
					xi: qreg businc2 treat basebusinc2 i.blocks if post==1 [pweight=weightlong], quantile(0.5)
				end
				*bootitDiMLag_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiMLag_W 
outreg2 treat basebusinc2 using "$outreg\DiMLag_W_q50", excel replace label 


capture program drop bootitDiM_W
				program define bootitDiM_W
					xi: qreg businc2 treat i.blocks if post==1 [pweight=weightlong], quantile(0.75)
				end
				*bootitDiM_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiM_W 
outreg2 treat using "$outreg\DiM_W_q75", excel replace label 


capture program drop bootitDiMLag_W
				program define bootitDiMLag_W
					xi: qreg businc2 treat basebusinc2 i.blocks if post==1 [pweight=weightlong], quantile(0.75)
				end
				*bootitDiMLag_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiMLag_W 
outreg2 treat basebusinc2 using "$outreg\DiMLag_W_q75", excel replace label 



***********************************************************
* Does not have a business at baseline
***********************************************************

use `tempall', clear

keep if baseanybus==0

capture program drop bootitDiM_W
				program define bootitDiM_W
					xi: qreg businc2 treat i.block if post==1 [pweight=weightlong], quantile(0.25)
				end
				*bootitDiM_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiM_W 
outreg2 treat using "$outreg\DiM_W_q25", excel replace label 

capture program drop bootitDiM_W
				program define bootitDiM_W
					xi: qreg businc2 treat i.blocks if post==1 [pweight=weightlong], quantile(0.5)
				end
				*bootitDiM_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiM_W 
outreg2 treat using "$outreg\DiM_W_q50", excel replace label 


capture program drop bootitDiM_W
				program define bootitDiM_W
					xi: qreg businc2 treat i.blocks if post==1 [pweight=weightlong],  quantile(0.75)
				end
				*bootitDiM_W
sort vid hhid
set seed 02092015				
bootstrap _b, cluster(vid) strata(blocks) reps($reps): bootitDiM_W 
outreg2 treat using "$outreg\DiM_W_q75", excel replace label 


log close
