// Auto-generated. Do not edit!

// (in-package OMX_teleop.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class RobotInstructionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input_char = null;
    }
    else {
      if (initObj.hasOwnProperty('input_char')) {
        this.input_char = initObj.input_char
      }
      else {
        this.input_char = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotInstructionRequest
    // Serialize message field [input_char]
    bufferOffset = _serializer.string(obj.input_char, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotInstructionRequest
    let len;
    let data = new RobotInstructionRequest(null);
    // Deserialize message field [input_char]
    data.input_char = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.input_char);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'OMX_teleop/RobotInstructionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3a1638d55a7107e0f1b809aa10f6c3fb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string input_char
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotInstructionRequest(null);
    if (msg.input_char !== undefined) {
      resolved.input_char = msg.input_char;
    }
    else {
      resolved.input_char = ''
    }

    return resolved;
    }
};

class RobotInstructionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.response_message = null;
    }
    else {
      if (initObj.hasOwnProperty('response_message')) {
        this.response_message = initObj.response_message
      }
      else {
        this.response_message = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotInstructionResponse
    // Serialize message field [response_message]
    bufferOffset = _serializer.bool(obj.response_message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotInstructionResponse
    let len;
    let data = new RobotInstructionResponse(null);
    // Deserialize message field [response_message]
    data.response_message = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'OMX_teleop/RobotInstructionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '85493243225dd12d7bf006be7e978996';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool response_message
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotInstructionResponse(null);
    if (msg.response_message !== undefined) {
      resolved.response_message = msg.response_message;
    }
    else {
      resolved.response_message = false
    }

    return resolved;
    }
};

module.exports = {
  Request: RobotInstructionRequest,
  Response: RobotInstructionResponse,
  md5sum() { return 'a2e1ae7e967fda15b1538c5096b55b1f'; },
  datatype() { return 'OMX_teleop/RobotInstruction'; }
};
