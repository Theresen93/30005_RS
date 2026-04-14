(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Password
 * File: PasswordInit.st
 * Author: pkiel
 * Created: October 20, 2009
 ********************************************************************
 * Implementation of program Password
 ********************************************************************)

PROGRAM _INIT

	UserLevel_Ind := 0;
	PasswordStatus := 0;
	InvalidPassword_Ind := 1;
//	IF (NOT FirstBoot) THEN
		gPassword.Supervisor  := 'super';
		gPassword.Maintenance := 'maint';
		gPassword.Technician  := 'tech725';
//		FirstBoot := 1;
//	END_IF
	PasswordAccepted_Visibility := 1;
	PasswordChange_Visibility := 1;
	PasswordFail_Visibility := 1;
  PasswordConfirm_Visibility := 1;
  
  iDryerTrend_Visibility := 1 ;

END_PROGRAM

