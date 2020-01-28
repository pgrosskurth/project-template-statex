
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

global noise "qui"

# d ;
global graphstyle "graphregion(margin(right) color(white)) 
	legend(region(lcolor(white))) 
	bgcolor(white) 
	ylabel(, glwidth(thin) glpattern(dash) glcolor(gs10)) 
	bar(1, color(edkblue) lcolor(black)) bar(2, color(ebg) lcolor(black)) bar(3, color(ltbluishgray) lcolor(black)) 
	title("", margin(medium)) b1title("", margin(small))
	ytitle("", margin(medium))"
	;
# d cr

******************
*** Install required packages
******************

capture ssc install writepsfrag, all replace
capture ssc install reghdfe, all replace
capture ssc install ftools, all replace
capture net install st0085_2.pkg, all replace //esttab
capture net install st0085_1.pkg, all replace 
capture net install st0183.pkg, all replace 
capture net install estout.pkg, all replace 
capture ssc install tabout, all replace
capture ssc install kountry, all replace
capture ssc install carryforward, all replace
capture ssc install dm89_2.pkg, all replace // dropmiss
capture ssc install dm0090.pkg, all replace // sreshape
capture net install todate.pkg, all replace

***

run "$project\code\sutexPG.ado" // needed to produce summary tables in analysis-loops
run "$project\code\taboutPG.ado" // needed to produce summary tables in analysis-loops

capture program drop timeon
program timeon
args start
global starttime "`start'"
timer clear
timer on 1
end

capture program drop timeoff
program timeoff
timer off 1
qui timer list
di "started " "$starttime" " $S_DATE"
di "finished" " $S_TIME  $S_DATE"
di "duration: " round(r(t1)/60) " mins or " r(t1)/3600 " hours"  
end

***

* Notes: Add an explanation of the project


*
***
****
*****
	* Structural overview

	** A - 
	*
	
*****
****
***
*

******************
*** Start the log
******************
log using "$project\logs\master.txt", replace


*     /\    
*    /  \   
*   / /\ \  
*  / ____ \ 
* /_/    \_\
*
*** Add a description of this part
****************************************************************************

* Add a description what this do-file does. 

timer on 1

*do "$project\code\anydofile.do"

timer off 1
timer list 
timer clear

* Takes x seconds // Add the time here. 

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

******************
*** End the log
******************
log close 
