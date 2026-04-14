<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio Version=3.0.90.32 SP14?>
<SwConfiguration CpuAddress="SL0" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="GlobProgCa" Source="BagMachine_Section.GlobProgCalc.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Alarms1" Source="SupervisoryControl_Section.Alarm_Section.Alarms1.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="MainAlarms" Source="SupervisoryControl_Section.Alarm_Section.MainAlarms.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Perf_Gen" Source="BagMachine_Section.Perf.Perf_Gen.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A0_Basic" Source="BagMachine_Section.Servo_Power_Supply.Axis0.A0_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A1_Basic" Source="BagMachine_Section.Perf.Axis1.A1_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A2_Basic" Source="BagMachine_Section.FP.Axis2.A2_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A3_Basic" Source="BagMachine_Section.Holding.Axis3.A3_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A4_Basic" Source="BagMachine_Section.Tearing.Axis4.A4_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A5_Basic" Source="BagMachine_Section.EntryPull.Axis5.A5_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A5_Reg1" Source="BagMachine_Section.EntryPull.Registration.A5_Reg1.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A6_Basic" Source="BagMachine_Section.ExitPull.Axis6.A6_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A7_Basic" Source="BagMachine_Section.Drum.Axis7.A7_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A8_Basic" Source="BagMachine_Section.ColdMicroPerf.Axis8.A8_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A9_Basic" Source="BagMachine_Section.MasterAxis.A9_Init.A9_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A11_Basic" Source="BagMachine_Section.Perf.Axis11_VirtualAxis.A11_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A12_Basic" Source="BagMachine_Section.EnvBag.Axis12.A12_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A13_Basic" Source="BagMachine_Section.EnvBag.Axis13.A13_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A15_Basic" Source="BagMachine_Section.HotMicroPerf.Axis15.A15_Basic.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A1_Automat" Source="BagMachine_Section.Perf.Axis1.A1_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A1_Automa1" Source="BagMachine_Section.Perf.Axis1.A1_Automat2.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A11_Automa" Source="BagMachine_Section.Perf.Axis11_VirtualAxis.A11_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A2_Automat" Source="BagMachine_Section.FP.Axis2.A2_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A3_Automat" Source="BagMachine_Section.Holding.Axis3.A3_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A4_Automat" Source="BagMachine_Section.Tearing.Axis4.A4_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A5_Automat" Source="BagMachine_Section.EntryPull.Axis5.A5_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A6_Automat" Source="BagMachine_Section.ExitPull.Axis6.A6_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A7_Automat" Source="BagMachine_Section.Drum.Axis7.A7_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A8_Automat" Source="BagMachine_Section.ColdMicroPerf.Axis8.A8_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A12_Automa" Source="BagMachine_Section.EnvBag.Axis12.A12_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A13_Automa" Source="BagMachine_Section.EnvBag.Axis13.A13_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A15_Automa" Source="BagMachine_Section.HotMicroPerf.Axis15.A15_Automat.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="Count" Source="BagMachine_Section.Count.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="SpeedLimit" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2">
    <Task Name="A1_Control" Source="BagMachine_Section.Perf.Axis1.A1_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A1_Ref" Source="BagMachine_Section.Perf.Axis1.A1_Ref.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A1_Cycle" Source="BagMachine_Section.Perf.Axis1.A1_Cycle.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A11_Contro" Source="BagMachine_Section.Perf.Axis11_VirtualAxis.A11_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A2_Control" Source="BagMachine_Section.FP.Axis2.A2_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A2_Ref" Source="BagMachine_Section.FP.Axis2.A2_Ref.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A2_Cycle" Source="BagMachine_Section.FP.Axis2.A2_Cycle.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A3_Control" Source="BagMachine_Section.Holding.Axis3.A3_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A3_Ref" Source="BagMachine_Section.Holding.Axis3.A3_Ref.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A3_Cycle" Source="BagMachine_Section.Holding.Axis3.A3_Cycle.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A4_Control" Source="BagMachine_Section.Tearing.Axis4.A4_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A4_Ref" Source="BagMachine_Section.Tearing.Axis4.A4_Ref.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A4_Cycle" Source="BagMachine_Section.Tearing.Axis4.A4_Cycle.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A5_Control" Source="BagMachine_Section.EntryPull.Axis5.A5_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A5_Draw" Source="BagMachine_Section.EntryPull.Axis5.A5_Draw.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A5_Reg2" Source="BagMachine_Section.EntryPull.Registration.A5_Reg2.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A6_Control" Source="BagMachine_Section.ExitPull.Axis6.A6_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A6_Draw" Source="BagMachine_Section.ExitPull.Axis6.A6_Draw.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A7_Control" Source="BagMachine_Section.Drum.Axis7.A7_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A7_Ref" Source="BagMachine_Section.Drum.Axis7.A7_Ref.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A7_Cycle" Source="BagMachine_Section.Drum.Axis7.A7_Cycle.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A9_Control" Source="BagMachine_Section.MasterAxis.A9_Init.A9_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="A8_Control" Source="BagMachine_Section.ColdMicroPerf.Axis8.A8_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A8_Draw" Source="BagMachine_Section.ColdMicroPerf.Axis8.A8_Draw.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="CMPerf_Gen" Source="BagMachine_Section.ColdMicroPerf.CMPerf_Gen.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A12_Contro" Source="BagMachine_Section.EnvBag.Axis12.A12_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A12_Ref" Source="BagMachine_Section.EnvBag.Axis12.A12_Ref.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A12_Cycle" Source="BagMachine_Section.EnvBag.Axis12.A12_Cycle.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A13_Contro" Source="BagMachine_Section.EnvBag.Axis13.A13_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A13_Ref" Source="BagMachine_Section.EnvBag.Axis13.A13_Ref.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A13_Cycle" Source="BagMachine_Section.EnvBag.Axis13.A13_Cycle.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A15_Contro" Source="BagMachine_Section.HotMicroPerf.Axis15.A15_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A15_Ref" Source="BagMachine_Section.HotMicroPerf.Axis15.A15_Ref.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A15_Cycle" Source="BagMachine_Section.HotMicroPerf.Axis15.A15_Cycle.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="A15_Motion" Source="BagMachine_Section.HotMicroPerf.Axis15.A15_MotionCycle.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="HMPerf_Gen" Source="BagMachine_Section.HotMicroPerf.HMPerf_Gen.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="Vacuum" Source="BagMachine_Section.Vacuum.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Setup" Source="SupervisoryControl_Section.Setup.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="EntryNip" Source="BagMachine_Section.EntryPull.EntryNip.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ExitNip" Source="BagMachine_Section.ExitPull.ExitNip.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="GlueTray" Source="BagMachine_Section.GlueTray.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ColdGlue" Source="BagMachine_Section.ColdGlue.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="HotGlue" Source="BagMachine_Section.HotGlue.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="RS_Glue" Source="BagMachine_Section.RS_Glue.prg" Memory="UserROM" Language="IEC" Debugging="true" Disabled="true" />
    <Task Name="Unw_3W_Glu" Source="BagMachine_Section.Unw_3W_Glue.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="EB_Gen" Source="BagMachine_Section.EnvBag.EB_Gen.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Guard_Mon" Source="SupervisoryControl_Section.Guard_Mon.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Stop_Mon" Source="SupervisoryControl_Section.Stop_Mon.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Servo_Mon" Source="SupervisoryControl_Section.Servo_Mon.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="EStopReset" Source="SupervisoryControl_Section.Alarm_Section.EStopReset.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Jog" Source="SupervisoryControl_Section.Jog.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Run" Source="SupervisoryControl_Section.Run.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Warn_Horn" Source="SupervisoryControl_Section.Warn_Horn.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Control" Source="BagMachine_Section.BagBundler.Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Tilter" Source="BagMachine_Section.BagBundler.Tilter.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Separator" Source="BagMachine_Section.BagBundler.Separator.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#3">
    <Task Name="FP_Heater" Source="BagMachine_Section.FP.FP_Heater.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#4">
    <Task Name="A1_CamProf" Source="BagMachine_Section.Perf.Axis1.A1_CamProfCalc.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="HMI_Contro" Source="HMI.HMI_Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Units" Source="HMI.Units.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Language" Source="HMI.Language.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Splash" Source="HMI.Splash.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Cmd_Trace" Source="HMI.Cmd_Trace.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Recipe_1" Source="HMI.Recipe_1.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Recipe_2" Source="HMI.Recipe_2.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Message_1" Source="HMI.Message_1.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Message_2" Source="HMI.Message_2.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Password" Source="HMI.Password.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="PowerTimer" Source="SupervisoryControl_Section.PowerTimer.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="BackUp" Source="HMI.BackUp.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Revision" Source="SupervisoryControl_Section.Revision.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Speed" Source="SupervisoryControl_Section.Speed.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="CPURestart" Source="HMI.CPURestart.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="SetSpeedMo" Source="BagMachine_Section.MasterAxis.A9_Init.SetSpeedMode.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ManMode" Source="SupervisoryControl_Section.ManMode.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ExitTable" Source="BagMachine_Section.ExitTable.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="FP_Gen" Source="BagMachine_Section.FP.FP_Gen.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Unwinder" Source="BagMachine_Section.Unwinder.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="3Web_Unit" Source="BagMachine_Section.3Web_Unit.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="FP_Dryer" Source="BagMachine_Section.FP.FP_Dryer.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7">
    <Task Name="HourMeter" Source="SupervisoryControl_Section.HourMeter.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#8" />
  <DataObjects>
    <DataObject Name="arsdmsvg" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="arsdmhtm" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="arsdmsvp" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="Acp10sys" Source="" Memory="UserROM" Language="Binary" />
  </DataObjects>
  <NcDataObjects>
    <NcDataObject Name="Error_Eng" Source="Error_Eng.dob" Memory="UserROM" Language="Ett" />
    <NcDataObject Name="A0_Init" Source="BagMachine_Section.Servo_Power_Supply.Axis0.A0_Init.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="A0_Par" Source="BagMachine_Section.Servo_Power_Supply.Axis0.A0_Par.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="A1_Init" Source="BagMachine_Section.Perf.Axis1.A1_Init.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="A1_Par" Source="BagMachine_Section.Perf.Axis1.A1_Par.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="A2_Init" Source="BagMachine_Section.FP.Axis2.A2_Init.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="A2_Par" Source="BagMachine_Section.FP.Axis2.A2_Par.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="A3_Init" Source="BagMachine_Section.Holding.Axis3.A3_Init.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="A3_Par" Source="BagMachine_Section.Holding.Axis3.A3_Par.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="A4_Init" Source="BagMachine_Section.Tearing.Axis4.A4_Init.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="A4_Par" Source="BagMachine_Section.Tearing.Axis4.A4_Par.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="A5_Init" Source="BagMachine_Section.EntryPull.Axis5.A5_Init.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="A5_Par" Source="BagMachine_Section.EntryPull.Axis5.A5_Par.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="A6_Init" Source="BagMachine_Section.ExitPull.Axis6.A6_Init.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="A6_Par" Source="BagMachine_Section.ExitPull.Axis6.A6_Par.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="A7_Init" Source="BagMachine_Section.Drum.Axis7.A7_Init.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="A7_Par" Source="BagMachine_Section.Drum.Axis7.A7_Par.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="A8_Init" Source="BagMachine_Section.ColdMicroPerf.Axis8.A8_Init.dob" Memory="UserROM" Language="Ax" Disabled="true" />
    <NcDataObject Name="A8_Par" Source="BagMachine_Section.ColdMicroPerf.Axis8.A8_Par.dob" Memory="UserROM" Language="Apt" Disabled="true" />
    <NcDataObject Name="A9_Init" Source="BagMachine_Section.MasterAxis.A9_Init.A9_Init.dob" Memory="UserROM" Language="Vax" />
    <NcDataObject Name="A9_Par" Source="BagMachine_Section.MasterAxis.A9_Init.A9_Par.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="A11_Init" Source="BagMachine_Section.Perf.Axis11_VirtualAxis.A11_Init.dob" Memory="UserROM" Language="Vax" />
    <NcDataObject Name="A11_Par" Source="BagMachine_Section.Perf.Axis11_VirtualAxis.A11_Par.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="A12_Init" Source="BagMachine_Section.EnvBag.Axis12.A12_Init.dob" Memory="UserROM" Language="Ax" Disabled="true" />
    <NcDataObject Name="A12_Par" Source="BagMachine_Section.EnvBag.Axis12.A12_Par.dob" Memory="UserROM" Language="Apt" Disabled="true" />
    <NcDataObject Name="A13_Init" Source="BagMachine_Section.EnvBag.Axis13.A13_Init.dob" Memory="UserROM" Language="Ax" Disabled="true" />
    <NcDataObject Name="A13_Par" Source="BagMachine_Section.EnvBag.Axis13.A13_Par.dob" Memory="UserROM" Language="Apt" Disabled="true" />
    <NcDataObject Name="A15_Init" Source="BagMachine_Section.HotMicroPerf.Axis15.A15_Init.dob" Memory="UserROM" Language="Ax" Disabled="true" />
    <NcDataObject Name="A15_Par" Source="BagMachine_Section.HotMicroPerf.Axis15.A15_Par.dob" Memory="UserROM" Language="Apt" Disabled="true" />
    <NcDataObject Name="Axis1_Init" Source="" Memory="UserROM" Language="Binary" />
    <NcDataObject Name="Axis1_par" Source="" Memory="UserROM" Language="Binary" />
    <NcDataObject Name="Error_Engl" Source="" Memory="UserROM" Language="Binary" />
    <NcDataObject Name="A0_Init1" Source="" Memory="UserROM" Language="Binary" />
    <NcDataObject Name="A0_Par1" Source="" Memory="UserROM" Language="Binary" />
  </NcDataObjects>
  <VcDataObjects>
    <VcDataObject Name="HMI_10" Source="HMI.HMI_10.dob" Memory="UserROM" Language="Vc" WarningLevel="2" Compress="false" />
  </VcDataObjects>
  <Binaries>
    <BinaryObject Name="HMI_1002" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_1001" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_1003" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcbclass" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdpp30" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdsw" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcshared" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccdt" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="visvc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arialbi" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcresman" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcmgr" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcdsloc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcptelo" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="webserv" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arialbd" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcchspot" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccshape" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccpopup" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcdsint" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcalarm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccddbox" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcnet" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcfntttf" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbmp" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcclbox" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcctext" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcrt" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbtn" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccstr" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcgclass" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arial" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccline" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpfmtcx" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcfile" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpfpp30" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccovl" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccalarm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vctcal" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdvnc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccnum" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arsdm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="Acp10map" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Acp10cfg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_1502" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_1503" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_1501" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccpwd" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_601" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_602" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_603" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcvisapi" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_15" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_6" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arialu_1" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_3" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_301" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="viscomp" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ddpcxlk" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="aplib" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMI_302" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcinter" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="Brsystem" Source="Libraries.Brsystem.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsMath" Source="Libraries.AsMath.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="asstring" Source="Libraries.asstring.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="astime" Source="Libraries.astime.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="FileIO" Source="Libraries.FileIO.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="powerlnk" Source="Libraries.powerlnk.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="Visapi" Source="Libraries.Visapi.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="HGWeber" Source="Libraries.HGWeber.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="Runtime" Source="Libraries.Runtime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsMem" Source="Libraries.AsMem.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="CSV_File" Source="Libraries.CSV_File.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="AsIOAcc" Source="Libraries.AsIOAcc.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsARCfg" Source="Libraries.AsARCfg.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="standard" Source="Libraries.standard.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="Libraries.sys_lib.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="convert" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="dataobj" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10man" Source="Libraries.Acp10man.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10par" Source="Libraries.Acp10par.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="NcGlobal" Source="Libraries.NcGlobal.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10_MC" Source="Libraries.Acp10_MC.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astcp" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="LoopConR" Source="Libraries.LoopConR.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10sdc" Source="Libraries.Acp10sdc.lby" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>