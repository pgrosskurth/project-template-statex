
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

global root "M:\Berlin - Stata\FNG\DATA"

global rawdata "$root\rawdata"
global prepdata "$root\prepdata"
global workdata "$root\workdata"
global scripts "$root\do-files\Philipp"

global noise "qui"

****************************************************************************
** Privileged and confidential
** Description:
****************************************************************************

***

* Notes: 


*
***
****
*****
	* Structural overview

	** A - 
	*		

	** B - 
	*		

	** C - 
	*		

	** D - 
	*		

	** E - 
	*		

	** F - 
	*

	** G - 
	*		
			
	** H -  
	*

	** I - 
	*

	** J - 
	*
	
	** K - Bonus Code
	*		
*****
****
***
*



*     /\    
*    /  \   
*   / /\ \  
*  / ____ \ 
* /_/    \_\
*
*** 
****************************************************************************

* Numbers: ASCII generator, ogre type font

***
*  _ 
* / |
* | |
* | |
* |_|
*
***  

***
*  ____  
* |___ \ 
*   __) |
*  / __/ 
* |_____|
*       
***

***
*  _____ 
* |___ / 
*   |_ \ 
*  ___) |
* |____/ 
*       
***

***
*  _  _   
* | || |  
* | || |_ 
* |__   _|
*    |_|  
*
***

***
*  ____  
* | ___| 
* |___ \ 
*  ___) |
* |____/ 
*
***     

***
*   __   
*  / /_  
* | '_ \ 
* | (_) |
*  \___/ 
*       
***  

***
* _____ 
* |___  |
*    / / 
*   / /  
*  /_/   
*       
***

***
*   ___  
*  ( _ ) 
*  / _ \ 
* | (_) |
*  \___/ 
*       
***

***
*   ___  
*  / _ \ 
* | (_) |
*  \__, |
*    /_/ 
*
*** 

***
*  _  ___  
* / |/ _ \ 
* | | | | |
* | | |_| |
* |_|\___/ 
*         
***

***
*  _ _ 
* / / |
* | | |
* | | |
* |_|_|
*     
***

***
*  _ ____  
* / |___ \ 
* | | __) |
* | |/ __/ 
* |_|_____|
*         
***		 

***
*  _ _____ 
* / |___ / 
* | | |_ \ 
* | |___) |
* |_|____/ 
*          
***

***
*  _ _  _   
* / | || |  
* | | || |_ 
* | |__   _|
* |_|  |_|  
*
***


***
*  _ ____  
* / | ___| 
* | |___ \ 
* | |___) |
* |_|____/ 
*         
***

***
*  _  __   
* / |/ /_  
* | | '_ \ 
* | | (_) |
* |_|\___/ 
*         
***

		 
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
*** 
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
*** 
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
*** 
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
* | |     
* |_|     
*
*** 
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
***
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
***
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
*** 
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
***
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
