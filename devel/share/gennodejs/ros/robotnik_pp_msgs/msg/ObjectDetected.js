// Auto-generated. Do not edit!

// (in-package robotnik_pp_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ObjectDetected {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.front = null;
      this.back = null;
    }
    else {
      if (initObj.hasOwnProperty('front')) {
        this.front = initObj.front
      }
      else {
        this.front = false;
      }
      if (initObj.hasOwnProperty('back')) {
        this.back = initObj.back
      }
      else {
        this.back = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObjectDetected
    // Serialize message field [front]
    bufferOffset = _serializer.bool(obj.front, buffer, bufferOffset);
    // Serialize message field [back]
    bufferOffset = _serializer.bool(obj.back, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObjectDetected
    let len;
    let data = new ObjectDetected(null);
    // Deserialize message field [front]
    data.front = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [back]
    data.back = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robotnik_pp_msgs/ObjectDetected';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '73a2bd721b4a3b8685cf760b8c3d9be8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Boolean variable, True if object has been detected
    bool front
    bool back
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObjectDetected(null);
    if (msg.front !== undefined) {
      resolved.front = msg.front;
    }
    else {
      resolved.front = false
    }

    if (msg.back !== undefined) {
      resolved.back = msg.back;
    }
    else {
      resolved.back = false
    }

    return resolved;
    }
};

module.exports = ObjectDetected;
