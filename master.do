
******************
*** Title: 
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

global raw "M:\Berlin - Stata\PG\general-raw"
global project "N:\Berlin - Freie Forschung\pgrosskurth\synchronized\project-template-statex"

global data "$project\data"
global logs "$project\logs"

global noise "qui"

***

* Notes: 


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
log using "$logs\master.txt", replace


*     /\    
*    /  \   
*   / /\ \  
*  / ____ \ 
* /_/    \_\
*
*** 
****************************************************************************

* To do: 
* 1. Fill in title
* 2. Adjust globals
* 3. Write a short description of the project
* 4. Whenever a do-file exceeds several pages it needs to be stored as code.
* 5. Tables and figures have unchanging names across all files.

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
*** 
****************************************************************************

****************************************************************************


******************
*** End the log
******************
log close 
