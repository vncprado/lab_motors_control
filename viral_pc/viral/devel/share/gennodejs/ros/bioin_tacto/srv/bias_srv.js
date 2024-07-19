// Auto-generated. Do not edit!

// (in-package bioin_tacto.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class bias_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.num_secs = null;
    }
    else {
      if (initObj.hasOwnProperty('num_secs')) {
        this.num_secs = initObj.num_secs
      }
      else {
        this.num_secs = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type bias_srvRequest
    // Serialize message field [num_secs]
    bufferOffset = _serializer.int16(obj.num_secs, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type bias_srvRequest
    let len;
    let data = new bias_srvRequest(null);
    // Deserialize message field [num_secs]
    data.num_secs = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bioin_tacto/bias_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0ca836a613133c666e1004286aa0e937';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 num_secs
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new bias_srvRequest(null);
    if (msg.num_secs !== undefined) {
      resolved.num_secs = msg.num_secs;
    }
    else {
      resolved.num_secs = 0
    }

    return resolved;
    }
};

class bias_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.b_ax = null;
      this.b_ay = null;
      this.b_az = null;
      this.b_gx = null;
      this.b_gy = null;
      this.b_gz = null;
    }
    else {
      if (initObj.hasOwnProperty('b_ax')) {
        this.b_ax = initObj.b_ax
      }
      else {
        this.b_ax = [];
      }
      if (initObj.hasOwnProperty('b_ay')) {
        this.b_ay = initObj.b_ay
      }
      else {
        this.b_ay = [];
      }
      if (initObj.hasOwnProperty('b_az')) {
        this.b_az = initObj.b_az
      }
      else {
        this.b_az = [];
      }
      if (initObj.hasOwnProperty('b_gx')) {
        this.b_gx = initObj.b_gx
      }
      else {
        this.b_gx = [];
      }
      if (initObj.hasOwnProperty('b_gy')) {
        this.b_gy = initObj.b_gy
      }
      else {
        this.b_gy = [];
      }
      if (initObj.hasOwnProperty('b_gz')) {
        this.b_gz = initObj.b_gz
      }
      else {
        this.b_gz = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type bias_srvResponse
    // Serialize message field [b_ax]
    bufferOffset = _arraySerializer.float32(obj.b_ax, buffer, bufferOffset, null);
    // Serialize message field [b_ay]
    bufferOffset = _arraySerializer.float32(obj.b_ay, buffer, bufferOffset, null);
    // Serialize message field [b_az]
    bufferOffset = _arraySerializer.float32(obj.b_az, buffer, bufferOffset, null);
    // Serialize message field [b_gx]
    bufferOffset = _arraySerializer.float32(obj.b_gx, buffer, bufferOffset, null);
    // Serialize message field [b_gy]
    bufferOffset = _arraySerializer.float32(obj.b_gy, buffer, bufferOffset, null);
    // Serialize message field [b_gz]
    bufferOffset = _arraySerializer.float32(obj.b_gz, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type bias_srvResponse
    let len;
    let data = new bias_srvResponse(null);
    // Deserialize message field [b_ax]
    data.b_ax = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [b_ay]
    data.b_ay = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [b_az]
    data.b_az = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [b_gx]
    data.b_gx = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [b_gy]
    data.b_gy = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [b_gz]
    data.b_gz = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.b_ax.length;
    length += 4 * object.b_ay.length;
    length += 4 * object.b_az.length;
    length += 4 * object.b_gx.length;
    length += 4 * object.b_gy.length;
    length += 4 * object.b_gz.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'bioin_tacto/bias_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2187bf05b0e439632c97738dad2eae32';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] b_ax
    float32[] b_ay
    float32[] b_az
    float32[] b_gx
    float32[] b_gy
    float32[] b_gz
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new bias_srvResponse(null);
    if (msg.b_ax !== undefined) {
      resolved.b_ax = msg.b_ax;
    }
    else {
      resolved.b_ax = []
    }

    if (msg.b_ay !== undefined) {
      resolved.b_ay = msg.b_ay;
    }
    else {
      resolved.b_ay = []
    }

    if (msg.b_az !== undefined) {
      resolved.b_az = msg.b_az;
    }
    else {
      resolved.b_az = []
    }

    if (msg.b_gx !== undefined) {
      resolved.b_gx = msg.b_gx;
    }
    else {
      resolved.b_gx = []
    }

    if (msg.b_gy !== undefined) {
      resolved.b_gy = msg.b_gy;
    }
    else {
      resolved.b_gy = []
    }

    if (msg.b_gz !== undefined) {
      resolved.b_gz = msg.b_gz;
    }
    else {
      resolved.b_gz = []
    }

    return resolved;
    }
};

module.exports = {
  Request: bias_srvRequest,
  Response: bias_srvResponse,
  md5sum() { return '0d0a8123fd19891ee9460281609e26cf'; },
  datatype() { return 'bioin_tacto/bias_srv'; }
};
