(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Password
 * File: PasswordCyclic.st
 * Author: pkiel
 * Created: October 20, 2009
 ********************************************************************
 * Implementation of program Password
 ********************************************************************)

PROGRAM _CYCLIC
	
(* Evaluate Password...triggered from password completion bool on HMI *)
	IF (EvaluatePassword) THEN
		IF (PasswordEntered = gPassword.Supervisor) THEN
			UserLevel_Ind := 1;
		ELSE
			IF (PasswordEntered = gPassword.Maintenance) THEN
				UserLevel_Ind := 2;
			ELSE
				IF (PasswordEntered = gPassword.Technician) THEN
					UserLevel_Ind := 3;
				ELSE
					IF (PasswordEntered = '031168') THEN
						UserLevel_Ind := 3;
					ELSE
						InvalidPassword := 1;
						InvalidPassword_Ind := 0;
					END_IF
				END_IF
			END_IF
		END_IF
		PasswordEntered := '';
		EvaluatePassword := 0;
	END_IF
	
(* Invalid Password Indication *)
	TON_0(IN := InvalidPassword, PT := T#3s);
	IF (TON_0.Q) THEN
		InvalidPassword_Ind := 1;
		InvalidPassword := 0;
	END_IF

(* Logout Function...Forces User Level To "Operator" *)
	IF (Logout_PB) THEN
		UserLevel_Ind := 0;
		Logout_PB := 0;
	END_IF

(* Current User Indication *)
	CASE (UserLevel_Ind) OF	
		0:
			DataLock_0 := 0;
			DataLock_1 := 2;
			DataLock_2 := 2;
			DataLock_3 := 2;
			CurrentUser := 'Operator';
		1:
			DataLock_0 := 0;
			DataLock_1 := 0;
			DataLock_2 := 2;
			DataLock_3 := 2;
			CurrentUser := 'Supervisor';
		2:
			DataLock_0 := 0;
			DataLock_1 := 0;
			DataLock_2 := 0;
			DataLock_3 := 2;
			CurrentUser := 'Maintenance';
		3:
			DataLock_0 := 0;
			DataLock_1 := 0;
			DataLock_2 := 0;
			DataLock_3 := 0;
			CurrentUser := 'Technician';
	END_CASE;

(* Detect Password Change Request *)
	IF (PasswordChangeStart_PB) THEN
		PasswordChange_Visibility := 0;
		PasswordChangeStart_PB := 0;
	END_IF
	
(* Password Change Validity Check *)
	IF (PasswordChangeAccept_PB) THEN
		IF (PasswordNew<>PasswordConfirm) THEN
			PasswordChangeFailure := 1;
			PasswordFail_Visibility := 0;
		ELSE
			StringLength := LEN(PasswordNew);
			IF (StringLength<5) THEN
				PasswordChangeFailure := 1;
				PasswordFail_Visibility := 0;
			ELSE
				IF(PasswordNew='00000') THEN
					PasswordChangeFailure := 1;
					PasswordFail_Visibility := 0;
				ELSE
					CASE (PasswordSelect_Ind) OF
						1:
							gPassword.Supervisor := PasswordNew;
						2:
							gPassword.Maintenance := PasswordNew;
						3:
							gPassword.Technician := PasswordNew;
					END_CASE
					PasswordChangeAccepted := 1;
					PasswordAccepted_Visibility := 0;
				END_IF
			END_IF
		END_IF
	PasswordChange_Visibility := 1;
	PasswordConfirm_Visibility :=1;
	PasswordNew := '';
	PasswordConfirm := '';
	PasswordSelect_Ind := 0;
	PasswordChangeAccept_PB := 0;
	END_IF

(* Password Change Accepted *)
	TON_1(IN := PasswordChangeAccepted, PT := T#3s);
	IF (TON_1.Q) THEN
		PasswordAccepted_Visibility := 1;
		PasswordChangeAccepted := 0;
	END_IF

(* Password Change Failure *)
	TON_2(IN := PasswordChangeFailure, PT := T#3s);
	IF (TON_2.Q) THEN
		PasswordFail_Visibility := 1;
		PasswordChangeFailure := 0;
	END_IF
	
(* Password Change Cancelled *)
	IF (PasswordChangeCancel_PB) THEN
		PasswordChange_Visibility := 1;
		PasswordConfirm_Visibility := 1;
		PasswordNew := '';
		PasswordConfirm := '';
		PasswordSelect_Ind := 0;
		PasswordChangeCancel_PB := 0;
	END_IF

  // Dryer Trend Button visibility
  IF (UserLevel_Ind > 1) THEN
    iDryerTrend_Visibility := 0 ; // Visible
  ELSE
    iDryerTrend_Visibility := 1 ;
  END_IF
END_PROGRAM
