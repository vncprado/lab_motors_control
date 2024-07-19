// Auto-generated. Do not edit!

// (in-package bioin_tacto.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let raw_barometer = require('./raw_barometer.js');

//-----------------------------------------------------------

class raw_barometer_serial {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.baros = null;
    }
    else {
      if (initObj.hasOwnProperty('baros')) {
        this.baros = initObj.baros
      }
      else {
        this.baros = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type raw_barometer_serial
    // Serialize message field [baros]
    // Serialize the length for message field [baros]
    bufferOffset = _serializer.uint32(obj.baros.length, buffer, bufferOffset);
    obj.baros.forEach((val) => {
      bufferOffset = raw_barometer.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type raw_barometer_serial
    let len;
    let data = new raw_barometer_serial(null);
    // Deserialize message field [baros]
    // Deserialize array length for message field [baros]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.baros = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.baros[i] = raw_barometer.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.baros.forEach((val) => {
      length += raw_barometer.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'bioin_tacto/raw_barometer_serial';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7f630d488162f2fb9ae8cc4e653b1937';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bioin_tacto/raw_barometer[] baros
    
    ================================================================================
    MSG: bioin_tacto/raw_barometer
    Header header
    int16 sensor_id
    float32 tempe
    float32 baro_level
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new raw_barometer_serial(null);
    if (msg.baros !== undefined) {
      resolved.baros = new Array(msg.baros.length);
      for (let i = 0; i < resolved.baros.length; ++i) {
        resolved.baros[i] = raw_barometer.Resolve(msg.baros[i]);
      }
    }
    else {
      resolved.baros = []
    }

    return resolved;
    }
};

module.exports = raw_barometer_serial;
