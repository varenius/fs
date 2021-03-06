@echo off

rem This batch file automatically generates the file version.c with today's
rem date and the version number from version.h. It uses 4DOS features such
rem as TEXT and unset, so it won't work with plain old DOS!

rem Put today's date in environment variable DATE
echo. | date | head /1 | input %%DATE

TEXT >version.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "version.h"

/* Do not edit this file (version.c). It is automatically generated by
   makever.bat, so edit that file.  Set the version number in version.h. */

const char* rclco_version(void)
{
   static char result[80];

   strcpy(result,RCLCO_VERSION);
ENDTEXT
echo strcat(result,"  (compiled %DATE%)");  >>version.c
TEXT >>version.c
   return(result);
}
ENDTEXT

rem Clear env variable DATE
unset DATE

