
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

******************
*** Install required packages
******************

capture ssc install writepsfrag

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
