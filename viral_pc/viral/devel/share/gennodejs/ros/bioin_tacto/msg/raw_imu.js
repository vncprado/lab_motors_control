// Auto-generated. Do not edit!

// (in-package bioin_tacto.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class raw_imu {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.sensor_id = null;
      this.tempe = null;
      this.ax = null;
      this.ay = null;
      this.az = null;
      this.gx = null;
      this.gy = null;
      this.gz = null;
      this.mx = null;
      this.my = null;
      this.mz = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('sensor_id')) {
        this.sensor_id = initObj.sensor_id
      }
      else {
        this.sensor_id = 0;
      }
      if (initObj.hasOwnProperty('tempe')) {
        this.tempe = initObj.tempe
      }
      else {
        this.tempe = 0.0;
      }
      if (initObj.hasOwnProperty('ax')) {
        this.ax = initObj.ax
      }
      else {
        this.ax = 0.0;
      }
      if (initObj.hasOwnProperty('ay')) {
        this.ay = initObj.ay
      }
      else {
        this.ay = 0.0;
      }
      if (initObj.hasOwnProperty('az')) {
        this.az = initObj.az
      }
      else {
        this.az = 0.0;
      }
      if (initObj.hasOwnProperty('gx')) {
        this.gx = initObj.gx
      }
      else {
        this.gx = 0.0;
      }
      if (initObj.hasOwnProperty('gy')) {
        this.gy = initObj.gy
      }
      else {
        this.gy = 0.0;
      }
      if (initObj.hasOwnProperty('gz')) {
        this.gz = initObj.gz
      }
      else {
        this.gz = 0.0;
      }
      if (initObj.hasOwnProperty('mx')) {
        this.mx = initObj.mx
      }
      else {
        this.mx = 0.0;
      }
      if (initObj.hasOwnProperty('my')) {
        this.my = initObj.my
      }
      else {
        this.my = 0.0;
      }
      if (initObj.hasOwnProperty('mz')) {
        this.mz = initObj.mz
      }
      else {
        this.mz = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type raw_imu
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [sensor_id]
    bufferOffset = _serializer.int16(obj.sensor_id, buffer, bufferOffset);
    // Serialize message field [tempe]
    bufferOffset = _serializer.float32(obj.tempe, buffer, bufferOffset);
    // Serialize message field [ax]
    bufferOffset = _serializer.float32(obj.ax, buffer, bufferOffset);
    // Serialize message field [ay]
    bufferOffset = _serializer.float32(obj.ay, buffer, bufferOffset);
    // Serialize message field [az]
    bufferOffset = _serializer.float32(obj.az, buffer, bufferOffset);
    // Serialize message field [gx]
    bufferOffset = _serializer.float32(obj.gx, buffer, bufferOffset);
    // Serialize message field [gy]
    bufferOffset = _serializer.float32(obj.gy, buffer, bufferOffset);
    // Serialize message field [gz]
    bufferOffset = _serializer.float32(obj.gz, buffer, bufferOffset);
    // Serialize message field [mx]
    bufferOffset = _serializer.float32(obj.mx, buffer, bufferOffset);
    // Serialize message field [my]
    bufferOffset = _serializer.float32(obj.my, buffer, bufferOffset);
    // Serialize message field [mz]
    bufferOffset = _serializer.float32(obj.mz, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type raw_imu
    let len;
    let data = new raw_imu(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [sensor_id]
    data.sensor_id = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [tempe]
    data.tempe = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ax]
    data.ax = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ay]
    data.ay = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [az]
    data.az = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gx]
    data.gx = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gy]
    data.gy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gz]
    data.gz = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mx]
    data.mx = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [my]
    data.my = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mz]
    data.mz = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 42;
  }

  static datatype() {
    // Returns string type for a message object
    return 'bioin_tacto/raw_imu';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '51eb1d8b736b5695bb58dc3c4b5e4c55';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new raw_imu(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.sensor_id !== undefined) {
      resolved.sensor_id = msg.sensor_id;
    }
    else {
      resolved.sensor_id = 0
    }

    if (msg.tempe !== undefined) {
      resolved.tempe = msg.tempe;
    }
    else {
      resolved.tempe = 0.0
    }

    if (msg.ax !== undefined) {
      resolved.ax = msg.ax;
    }
    else {
      resolved.ax = 0.0
    }

    if (msg.ay !== undefined) {
      resolved.ay = msg.ay;
    }
    else {
      resolved.ay = 0.0
    }

    if (msg.az !== undefined) {
      resolved.az = msg.az;
    }
    else {
      resolved.az = 0.0
    }

    if (msg.gx !== undefined) {
      resolved.gx = msg.gx;
    }
    else {
      resolved.gx = 0.0
    }

    if (msg.gy !== undefined) {
      resolved.gy = msg.gy;
    }
    else {
      resolved.gy = 0.0
    }

    if (msg.gz !== undefined) {
      resolved.gz = msg.gz;
    }
    else {
      resolved.gz = 0.0
    }

    if (msg.mx !== undefined) {
      resolved.mx = msg.mx;
    }
    else {
      resolved.mx = 0.0
    }

    if (msg.my !== undefined) {
      resolved.my = msg.my;
    }
    else {
      resolved.my = 0.0
    }

    if (msg.mz !== undefined) {
      resolved.mz = msg.mz;
    }
    else {
      resolved.mz = 0.0
    }

    return resolved;
    }
};

module.exports = raw_imu;
