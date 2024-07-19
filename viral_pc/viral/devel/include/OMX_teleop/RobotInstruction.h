// Generated by gencpp from file OMX_teleop/RobotInstruction.msg
// DO NOT EDIT!


#ifndef OMX_TELEOP_MESSAGE_ROBOTINSTRUCTION_H
#define OMX_TELEOP_MESSAGE_ROBOTINSTRUCTION_H

#include <ros/service_traits.h>


#include <OMX_teleop/RobotInstructionRequest.h>
#include <OMX_teleop/RobotInstructionResponse.h>


namespace OMX_teleop
{

struct RobotInstruction
{

typedef RobotInstructionRequest Request;
typedef RobotInstructionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct RobotInstruction
} // namespace OMX_teleop


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::OMX_teleop::RobotInstruction > {
  static const char* value()
  {
    return "a2e1ae7e967fda15b1538c5096b55b1f";
  }

  static const char* value(const ::OMX_teleop::RobotInstruction&) { return value(); }
};

template<>
struct DataType< ::OMX_teleop::RobotInstruction > {
  static const char* value()
  {
    return "OMX_teleop/RobotInstruction";
  }

  static const char* value(const ::OMX_teleop::RobotInstruction&) { return value(); }
};


// service_traits::MD5Sum< ::OMX_teleop::RobotInstructionRequest> should match
// service_traits::MD5Sum< ::OMX_teleop::RobotInstruction >
template<>
struct MD5Sum< ::OMX_teleop::RobotInstructionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::OMX_teleop::RobotInstruction >::value();
  }
  static const char* value(const ::OMX_teleop::RobotInstructionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::OMX_teleop::RobotInstructionRequest> should match
// service_traits::DataType< ::OMX_teleop::RobotInstruction >
template<>
struct DataType< ::OMX_teleop::RobotInstructionRequest>
{
  static const char* value()
  {
    return DataType< ::OMX_teleop::RobotInstruction >::value();
  }
  static const char* value(const ::OMX_teleop::RobotInstructionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::OMX_teleop::RobotInstructionResponse> should match
// service_traits::MD5Sum< ::OMX_teleop::RobotInstruction >
template<>
struct MD5Sum< ::OMX_teleop::RobotInstructionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::OMX_teleop::RobotInstruction >::value();
  }
  static const char* value(const ::OMX_teleop::RobotInstructionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::OMX_teleop::RobotInstructionResponse> should match
// service_traits::DataType< ::OMX_teleop::RobotInstruction >
template<>
struct DataType< ::OMX_teleop::RobotInstructionResponse>
{
  static const char* value()
  {
    return DataType< ::OMX_teleop::RobotInstruction >::value();
  }
  static const char* value(const ::OMX_teleop::RobotInstructionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // OMX_TELEOP_MESSAGE_ROBOTINSTRUCTION_H