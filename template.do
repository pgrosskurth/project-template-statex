
******************
*** Title: Add the title of the project
******************

clear all
clear mata
set more off
set type double
capture log close
version 14

******************
*** Set up globals
******************

* Adjust these according to the project

global raw "M:\Berlin - Stata\PG\general-raw"
global project "N:\Berlin - Freie Forschung\pgrosskurth\synchronized\project-template-statex"

global noise "qui"

global graphstyle "graphregion(color(white)) legend(region(lcolor(white))) bgcolor(white) ylabel(, glwidth(thin) glpattern(dash) glcolor(gs10))"

* color palette:
* bar(1, color(maroon)) 
* bar(2, color(edkblue)) 
* bar(3, color("237 244 250")) 
* bar(4, color("197 219 237")) 
* bar(5, color("159 196 225")) 
* bar(6, color("123 173 215")) 
* bar(7, color(eltgreen)) 

******************
*** Install required packages
******************

capture ssc install writepsfrag

***

* Notes: If you want to change this template do it on the master version.


*
***
****
*****
	* Structural overview

	** A - Copy the description from below
	*		Add some more explanation if needed 	

	** B - Copy the description from below
	*		Add some more explanation if needed 	

	** C - Copy the description from below
	*		Add some more explanation if needed 	

	** D - Copy the description from below
	*		Add some more explanation if needed 	

	** E - Copy the description from below
	*		Add some more explanation if needed 	

	** F - Copy the description from below
	*		Add some more explanation if needed 	

	** G - Copy the description from below
	*		Add some more explanation if needed 	

	** H - Copy the description from below
	*		Add some more explanation if needed 	

	** I - Copy the description from below
	*		Add some more explanation if needed 	
	
	** J - Copy the description from below
	*		Add some more explanation if needed 	

	** K - Bonus Code
	*		
*****
****
***
*

******************
*** Start the log
******************
log using "$project\logs\filename.txt", replace // adjust the filename here!


******************
*** End the log
******************
log close 

*     /\    
*    /  \   
*   / /\ \  
*  / ____ \ 
* /_/    \_\
*
*** Add a description of this part
****************************************************************************

*** Template for generating a figure with latex font:

graph bar (asis) stable_p stack, stack ///
over(year, reverse label(labgap(2)) relabel(1 "2002" 2 " " 3 "2004" 4 " " 5 "2006" 6 " " 7 "2008" 8 " " 9 "2010" 10 " " 11 "2012")) ///
title("Ownership information stability, 2012-2002") b1title("Year", margin(small)) ///
$graphstyle bar(1, color(edkblue)) bar(2, color(maroon)) legend(rows(1))  ///
ytitle("Share of constant information", margin(medium)) 

graph export "$project\output\dofilename-something-figurename.eps", replace 
graph export "$project\output\dofilename-something-figurename.png", replace height(1000)
writepsfrag2 "$project\output\dofilename-something-figurename.eps" using "$project\output\dofilename-something-figurename.tex", replace textsize(\normalsize) // needs Latex filepath!



*** Template for producing a table of estimates in latex
* Adjust this part according to the number of estimates and coefficients (table width)
* \begin{tabular}{@{\extracolsep{\fill} }l*{10}{Cd{2.6}}}
* change the 10 to 7 + number of results
* copy "\multicolumn{1}{c}{@}" for every additional stat
* adjust format for each stat in the same way
* DON'T FORGET TO ADJUST THE LABEL!
* Don't use _ in the filename or the label!

# d ;
esttab m1 m2 m3
	using "$project\output\dofilename-something-tablename.tex" ,
	booktabs replace not b(3) star( * 0.10 ** 0.05 *** 0.01 ) 
	mtitles("ln(TFAS)" "ln(TFAS)" "ln(TFAS)")
	keep (treat1 treat2 MNE_2012Xtreat1 MNE_2012Xtreat2 MNE_A_2012Xtreat1 MNE_A_2012Xtreat2 MNE_B_2012Xtreat1 MNE_B_2012Xtreat2) ///
	stats(N_clust N r2_within, labels("Firms" "Obs." "Within R Squared") layout("\multicolumn{1}{c}{@}" "\multicolumn{1}{c}{@}" "\multicolumn{1}{c}{@}") fmt(%9.0g %9.0g %9.3f)) substitute(\_ _) label

prehead( 
	\caption{`ADD CAPTION HERE!'}
	\label{tab:`ADD LABEL HERE!'}
	\resizebox{!}{!}{
	\begin{tabular}{@{\extracolsep{\fill} }l*{10}{Cd{2.6}}}
	\toprule 
	)
	
postfoot( "\bottomrule 
	\multicolumn{@span}{l}{\tiny Significance levels: $\ast$ p \textless 0.10, $\ast\ast$ p \textless 0.05, $\ast\ast\ast$ p \textless 0.01} \\
	\multicolumn{@span}{l}{\tiny Standard errors are clustered on the firm level.} \\
	\multicolumn{@span}{l}{\tiny Yearly fixed effects and firm-level fixed effects included, but not shown.} \\
	\end{tabular}
	}
	" ) ;	
# d cr

*** Template for adding another .do-file to the master.


* Add a description what this do-file does. 

timer on 1

*do "$project\code\anydofile.do"

timer off 1
timer list 
timer clear

* Takes x seconds // Add the time here. 



* Numbers: ASCII generator, ogre type font

**************************************

****************************************************************************


*
**
***
**
*


*  ____  
* |  _ \ 
* | |_) |
* |  _ < 
* | |_) |
* |____/ 
*
*** Add a description of this part
****************************************************************************

****************************************************************************


*
**
***
**
*


*   _____ 
*  / ____|
* | |     
* | |     
* | |____ 
*  \_____|
*
*** Add a description of this part
****************************************************************************

****************************************************************************


*
**
***
**
*


*  _____  
* |  __ \ 
* | |  | |
* | |  | |
* | |__| |
* |_____/ 
*
*** Add a description of this part
****************************************************************************

****************************************************************************


*
**
***
**
*


*  ______ 
* |  ____|
* | |__   
* |  __|  
* | |____ 
* |______|
*
*** Add a description of this part
****************************************************************************

**************************************

***
*  _ 
* / |
* | |
* | |
* |_|
*
***  Add a description of this part

**************************************

***
*  ____  
* |___ \ 
*   __) |
*  / __/ 
* |_____|
*       
*** Add a description of this part

***
*  _____ 
* |___ / 
*   |_ \ 
*  ___) |
* |____/ 
*       
*** Add a description of this part

***
*  _  _   
* | || |  
* | || |_ 
* |__   _|
*    |_|  
*
*** Add a description of this part

***
*  ____  
* | ___| 
* |___ \ 
*  ___) |
* |____/ 
*
*** Add a description of this part     

***
*   __   
*  / /_  
* | '_ \ 
* | (_) |
*  \___/ 
*       
*** Add a description of this part 

***
* _____ 
* |___  |
*    / / 
*   / /  
*  /_/   
*       
*** Add a description of this part

***
*   ___  
*  ( _ ) 
*  / _ \ 
* | (_) |
*  \___/ 
*        
*** Add a description of this part

***
*   ___  
*  / _ \ 
* | (_) |
*  \__, |
*    /_/ 
*
*** Add a description of this part

***
*  _  ___  
* / |/ _ \ 
* | | | | |
* | | |_| |
* |_|\___/ 
*         
*** Add a description of this part

***
*  _ _ 
* / / |
* | | |
* | | |
* |_|_|
*     
*** Add a description of this part

***
*  _ ____  
* / |___ \ 
* | | __) |
* | |/ __/ 
* |_|_____|
*         
***	Add a description of this part	 

***
*  _ _____ 
* / |___ / 
* | | |_ \ 
* | |___) |
* |_|____/ 
*          
*** Add a description of this part

***
*  _ _  _   
* / | || |  
* | | || |_ 
* | |__   _|
* |_|  |_|  
*
*** Add a description of this part


***
*  _ ____  
* / | ___| 
* | |___ \ 
* | |___) |
* |_|____/ 
*         
*** Add a description of this part

***
*  _  __   
* / |/ /_  
* | | '_ \ 
* | | (_) |
* |_|\___/ 
*         
*** Add a description of this part

		 
****************************************************************************


*
**
***
**
*
 

*  ______ 
* |  ____|
* | |__   
* |  __|  
* | |     
* |_|     
*
*** Add a description of this part
****************************************************************************
 
****************************************************************************


*
**
***
**
*


*   _____ 
*  / ____|
* | |  __ 
* | | |_ |
* | |__| |
*  \_____|
*
*** Add a description of this part
****************************************************************************

****************************************************************************


*
**
***
**
*


*  _    _ 
* | |  | |
* | |__| |
* |  __  |
* | |  | |
* |_|  |_|
*
*** Add a description of this part
****************************************************************************

****************************************************************************


*
**
***
**
*


*  _____ 
* |_   _|
*   | |  
*   | |  
*  _| |_ 
* |_____|
*
*** Add a description of this part 
****************************************************************************

****************************************************************************


*
**
***
**
*


*      _
*     | |
*     | |
* /\__| |
* \_____|
*
*** Add a description of this part
****************************************************************************

****************************************************************************


*
**
***
**
*


* _  __
*| |/ /
*| ' / 
*|  <  
*| . \ 
*|_|\_\
*
*** Bonus Code
****************************************************************************
/*
******
*** Correcting for duplicates

quietly bysort variablename: gen dup = cond(_N==1,0,_n)
tab dup

keep if dup <= 1
drop dup

***
******



******
*** Checking if a combination of variables is a unique identifier

egen unique_id = group(var_1 var_2)

sort unique_id
quietly by unique_id: gen dup_unique_id = cond(_N==1,0,_n)
tab dup_unique_id

count if dup_unique_id <= 1
* This should be 0
* Can be changed to a keep command to force success

drop unique_id dup_unique_id

***
******



******
*** Replacing all variable names with the values of the first row

* Extracting the variable names from of the first row
unab oldvars: _all

* Counting the number of variables, storing the result in varnum
describe
local varnum=r(k)

* Collecting names of vars from first row and fix them as needed
forvalues i=1/`varnum' {

	* Write variable i in a new macro oldvar
	local oldvar: word `i' of `oldvars'
	  
	* Capture the value from first row of variable oldvar
	local newvar=`oldvar' in 1

	* Correct for special characters: ADJUST THIS PART!

	* turn % signs to percent 
	local newvar=regexr("`newvar'","\%","percent")
	* turn ( to nothing
	local newvar=regexr("`newvar'","\(","")
	* turn ) to nothing
	local newvar=regexr("`newvar'","\)","")
	* turn . to nothing
	local newvar=regexr("`newvar'","\.","")
  
	* clean up blank spaces
	while regexm("`newvar'"," ") {
		* Replace blanks with _
		local newvar=regexr("`newvar'"," ","_")
	}
     
	* collect clean var names into a list
	local newvars `newvars' `newvar'
}
* 

* Store number of new variables
local newvarnum3: list sizeof newvars3

* Loop to replace the old variables with the contents of the macro
forvalues i=1/`newvarnum3' {
  local oldvar3: word `i' of `oldvars3'
  local newvar3: word `i' of `newvars3'
  rename `oldvar3' `newvar3'
  
 * Optional output to check the results
 * di "`i'"
 * di "`newvarnum'"
}

*** 
******



******
*** Labelling all variables at once

foreach var of varlist `outcomes' {
	local lab: variable label `var'  /* <- save variable label in local `lab'
        replace labelvar = "`lab'" in `i'  /* <- store contents of `lab' in */
        local i 1
}

*** 
******


*** Filling columns

* replace sh_name = sh_name[_n-1] if sh_name==""



****************************************************************************


* Unicode information from Corinna's email
if 1 == 0 {
/*	
help unicode_advice

Folgende Befehle sind exemplarisch möglich:
cd "M:\Berlin - Stata\FNG\DATA\workdata\ALL\Matched BvDids\"
unicode analyze "E5_merge_accounts_complete.dta"   // prüft, ob Umwandlung nötig ist
unicode encoding set ISO-8859-1   // legt ISO-Norm fest
unicode translate "E5_merge_accounts_complete.dta"    // wandelt das Do-File oder den Datensatz um

Oder alle Dateien im aktiven Pfad konvertieren:
unicode translate *
*/
}

*** Print what you see
* 1. Add loop that constructs the strings to be printed
* 2. Print labels instead of varnames
Denmark & 2002 & 558 \\

* Relabeling
forvalues year = 2002(1)2012 {
	
	label var year`year' "`year'"
	
}
*

local filename myfile
file open `filename' using "$project\temp\staticyears.tex", write replace `opt'

	*** Table header
	
	file write `filename' "\label{tab:staticyears}" _n

	file write `filename' "\resizebox{\linewidth}{!}{" _n
	file write `filename' "\begin{tabular}{@{\extracolsep{\fill}}l*{29}{Cd{2.6}}}" _n
	
	
	* Write headline with var labels
	foreach var of varlist _all {
		
		local lab: variable label `var'
		local item = "`item'" + "`lab'" + "&" 
		
	}
	file write `filename' "`item' \\" _n
	file write `filename' "\toprule" _n
	
	* Write the rest of the dataset, line by line
	
	local maxobs = (_N-1)
	forvalues i = 1(1)`maxobs' {
		local item
		foreach var of varlist _all {
		
			local value = `var'[`i']
			local item = "`item'" + "`value'" + "&" 
		}
		file write `filename' "`item' \\" _n
	}
	
	file write `filename' "\bottomrule" _n	
	
	local item
	foreach var of varlist _all {
		
		local value = `var'[_N]
		local item = "`item'" + "`value'" + "&" 
	}
	file write `filename' "`item' \\" _n
	

	file write `filename' "\end{tabular} }" _n
	
file close `filename' 
	
* We need new code for this. 
* Idea: Just write this shit into a Latex table without toughing it.
