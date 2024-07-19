// Auto-generated. Do not edit!

// (in-package bioin_tacto.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let raw_imu = require('./raw_imu.js');

//-----------------------------------------------------------

class raw_imu_serial {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.imus = null;
    }
    else {
      if (initObj.hasOwnProperty('imus')) {
        this.imus = initObj.imus
      }
      else {
        this.imus = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type raw_imu_serial
    // Serialize message field [imus]
    // Serialize the length for message field [imus]
    bufferOffset = _serializer.uint32(obj.imus.length, buffer, bufferOffset);
    obj.imus.forEach((val) => {
      bufferOffset = raw_imu.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type raw_imu_serial
    let len;
    let data = new raw_imu_serial(null);
    // Deserialize message field [imus]
    // Deserialize array length for message field [imus]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.imus = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.imus[i] = raw_imu.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.imus.forEach((val) => {
      length += raw_imu.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'bioin_tacto/raw_imu_serial';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bf6b782ad59ebe5fad0f029c0e04fc49';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bioin_tacto/raw_imu[] imus
    
    ================================================================================
    MSG: bioin_tacto/raw_imu
    Header header
    int16 sensor_id
    float32 tempe
    float32 ax
    float32 ay
    float32 az
    float32 gx
    float32 gy
    float32 gz
    float32 mx
    float32 my
    float32 mz
    
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
    const resolved = new raw_imu_serial(null);
    if (msg.imus !== undefined) {
      resolved.imus = new Array(msg.imus.length);
      for (let i = 0; i < resolved.imus.length; ++i) {
        resolved.imus[i] = raw_imu.Resolve(msg.imus[i]);
      }
    }
    else {
      resolved.imus = []
    }

    return resolved;
    }
};

module.exports = raw_imu_serial;
