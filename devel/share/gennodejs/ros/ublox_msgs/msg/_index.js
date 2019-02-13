
"use strict";

let UpdSOS = require('./UpdSOS.js');
let NavVELNED = require('./NavVELNED.js');
let CfgINF = require('./CfgINF.js');
let EsfINS = require('./EsfINS.js');
let NavRELPOSNED = require('./NavRELPOSNED.js');
let MgaGAL = require('./MgaGAL.js');
let CfgNAVX5 = require('./CfgNAVX5.js');
let NavTIMEGPS = require('./NavTIMEGPS.js');
let CfgUSB = require('./CfgUSB.js');
let MonHW6 = require('./MonHW6.js');
let Ack = require('./Ack.js');
let CfgNMEA = require('./CfgNMEA.js');
let CfgTMODE3 = require('./CfgTMODE3.js');
let MonHW = require('./MonHW.js');
let NavTIMEUTC = require('./NavTIMEUTC.js');
let CfgNMEA6 = require('./CfgNMEA6.js');
let NavPVT = require('./NavPVT.js');
let CfgPRT = require('./CfgPRT.js');
let NavSTATUS = require('./NavSTATUS.js');
let NavDGPS = require('./NavDGPS.js');
let NavPOSLLH = require('./NavPOSLLH.js');
let CfgGNSS = require('./CfgGNSS.js');
let RxmRAW_SV = require('./RxmRAW_SV.js');
let MonVER_Extension = require('./MonVER_Extension.js');
let EsfSTATUS_Sens = require('./EsfSTATUS_Sens.js');
let CfgINF_Block = require('./CfgINF_Block.js');
let UpdSOS_Ack = require('./UpdSOS_Ack.js');
let NavSVINFO = require('./NavSVINFO.js');
let AidALM = require('./AidALM.js');
let CfgDGNSS = require('./CfgDGNSS.js');
let NavPVT7 = require('./NavPVT7.js');
let CfgSBAS = require('./CfgSBAS.js');
let HnrPVT = require('./HnrPVT.js');
let NavPOSECEF = require('./NavPOSECEF.js');
let CfgHNR = require('./CfgHNR.js');
let MonVER = require('./MonVER.js');
let RxmRAWX = require('./RxmRAWX.js');
let NavSAT_SV = require('./NavSAT_SV.js');
let CfgRATE = require('./CfgRATE.js');
let CfgNMEA7 = require('./CfgNMEA7.js');
let TimTM2 = require('./TimTM2.js');
let NavDOP = require('./NavDOP.js');
let RxmRTCM = require('./RxmRTCM.js');
let RxmSFRB = require('./RxmSFRB.js');
let CfgDAT = require('./CfgDAT.js');
let RxmRAWX_Meas = require('./RxmRAWX_Meas.js');
let NavSOL = require('./NavSOL.js');
let CfgMSG = require('./CfgMSG.js');
let NavDGPS_SV = require('./NavDGPS_SV.js');
let AidHUI = require('./AidHUI.js');
let EsfRAW = require('./EsfRAW.js');
let MonGNSS = require('./MonGNSS.js');
let EsfSTATUS = require('./EsfSTATUS.js');
let AidEPH = require('./AidEPH.js');
let CfgGNSS_Block = require('./CfgGNSS_Block.js');
let RxmSVSI_SV = require('./RxmSVSI_SV.js');
let RxmEPH = require('./RxmEPH.js');
let CfgCFG = require('./CfgCFG.js');
let NavSBAS_SV = require('./NavSBAS_SV.js');
let NavCLOCK = require('./NavCLOCK.js');
let CfgNAV5 = require('./CfgNAV5.js');
let RxmALM = require('./RxmALM.js');
let NavSAT = require('./NavSAT.js');
let CfgRST = require('./CfgRST.js');
let NavATT = require('./NavATT.js');
let NavSVIN = require('./NavSVIN.js');
let EsfMEAS = require('./EsfMEAS.js');
let EsfRAW_Block = require('./EsfRAW_Block.js');
let NavVELECEF = require('./NavVELECEF.js');
let RxmRAW = require('./RxmRAW.js');
let RxmSFRBX = require('./RxmSFRBX.js');
let RxmSVSI = require('./RxmSVSI.js');
let Inf = require('./Inf.js');
let CfgANT = require('./CfgANT.js');
let NavSBAS = require('./NavSBAS.js');
let NavSVINFO_SV = require('./NavSVINFO_SV.js');

module.exports = {
  UpdSOS: UpdSOS,
  NavVELNED: NavVELNED,
  CfgINF: CfgINF,
  EsfINS: EsfINS,
  NavRELPOSNED: NavRELPOSNED,
  MgaGAL: MgaGAL,
  CfgNAVX5: CfgNAVX5,
  NavTIMEGPS: NavTIMEGPS,
  CfgUSB: CfgUSB,
  MonHW6: MonHW6,
  Ack: Ack,
  CfgNMEA: CfgNMEA,
  CfgTMODE3: CfgTMODE3,
  MonHW: MonHW,
  NavTIMEUTC: NavTIMEUTC,
  CfgNMEA6: CfgNMEA6,
  NavPVT: NavPVT,
  CfgPRT: CfgPRT,
  NavSTATUS: NavSTATUS,
  NavDGPS: NavDGPS,
  NavPOSLLH: NavPOSLLH,
  CfgGNSS: CfgGNSS,
  RxmRAW_SV: RxmRAW_SV,
  MonVER_Extension: MonVER_Extension,
  EsfSTATUS_Sens: EsfSTATUS_Sens,
  CfgINF_Block: CfgINF_Block,
  UpdSOS_Ack: UpdSOS_Ack,
  NavSVINFO: NavSVINFO,
  AidALM: AidALM,
  CfgDGNSS: CfgDGNSS,
  NavPVT7: NavPVT7,
  CfgSBAS: CfgSBAS,
  HnrPVT: HnrPVT,
  NavPOSECEF: NavPOSECEF,
  CfgHNR: CfgHNR,
  MonVER: MonVER,
  RxmRAWX: RxmRAWX,
  NavSAT_SV: NavSAT_SV,
  CfgRATE: CfgRATE,
  CfgNMEA7: CfgNMEA7,
  TimTM2: TimTM2,
  NavDOP: NavDOP,
  RxmRTCM: RxmRTCM,
  RxmSFRB: RxmSFRB,
  CfgDAT: CfgDAT,
  RxmRAWX_Meas: RxmRAWX_Meas,
  NavSOL: NavSOL,
  CfgMSG: CfgMSG,
  NavDGPS_SV: NavDGPS_SV,
  AidHUI: AidHUI,
  EsfRAW: EsfRAW,
  MonGNSS: MonGNSS,
  EsfSTATUS: EsfSTATUS,
  AidEPH: AidEPH,
  CfgGNSS_Block: CfgGNSS_Block,
  RxmSVSI_SV: RxmSVSI_SV,
  RxmEPH: RxmEPH,
  CfgCFG: CfgCFG,
  NavSBAS_SV: NavSBAS_SV,
  NavCLOCK: NavCLOCK,
  CfgNAV5: CfgNAV5,
  RxmALM: RxmALM,
  NavSAT: NavSAT,
  CfgRST: CfgRST,
  NavATT: NavATT,
  NavSVIN: NavSVIN,
  EsfMEAS: EsfMEAS,
  EsfRAW_Block: EsfRAW_Block,
  NavVELECEF: NavVELECEF,
  RxmRAW: RxmRAW,
  RxmSFRBX: RxmSFRBX,
  RxmSVSI: RxmSVSI,
  Inf: Inf,
  CfgANT: CfgANT,
  NavSBAS: NavSBAS,
  NavSVINFO_SV: NavSVINFO_SV,
};
