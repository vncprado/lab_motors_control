
"use strict";

let SetTorqueLimit = require('./SetTorqueLimit.js')
let RestartController = require('./RestartController.js')
let StopController = require('./StopController.js')
let StartController = require('./StartController.js')
let SetComplianceSlope = require('./SetComplianceSlope.js')
let SetSpeed = require('./SetSpeed.js')
let SetCompliancePunch = require('./SetCompliancePunch.js')
let SetComplianceMargin = require('./SetComplianceMargin.js')
let TorqueEnable = require('./TorqueEnable.js')

module.exports = {
  SetTorqueLimit: SetTorqueLimit,
  RestartController: RestartController,
  StopController: StopController,
  StartController: StartController,
  SetComplianceSlope: SetComplianceSlope,
  SetSpeed: SetSpeed,
  SetCompliancePunch: SetCompliancePunch,
  SetComplianceMargin: SetComplianceMargin,
  TorqueEnable: TorqueEnable,
};
