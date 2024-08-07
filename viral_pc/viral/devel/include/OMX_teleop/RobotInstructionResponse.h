// Generated by gencpp from file OMX_teleop/RobotInstructionResponse.msg
// DO NOT EDIT!


#ifndef OMX_TELEOP_MESSAGE_ROBOTINSTRUCTIONRESPONSE_H
#define OMX_TELEOP_MESSAGE_ROBOTINSTRUCTIONRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace OMX_teleop
{
template <class ContainerAllocator>
struct RobotInstructionResponse_
{
  typedef RobotInstructionResponse_<ContainerAllocator> Type;

  RobotInstructionResponse_()
    : response_message(false)  {
    }
  RobotInstructionResponse_(const ContainerAllocator& _alloc)
    : response_message(false)  {
  (void)_alloc;
    }



   typedef uint8_t _response_message_type;
  _response_message_type response_message;





  typedef boost::shared_ptr< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> const> ConstPtr;

}; // struct RobotInstructionResponse_

typedef ::OMX_teleop::RobotInstructionResponse_<std::allocator<void> > RobotInstructionResponse;

typedef boost::shared_ptr< ::OMX_teleop::RobotInstructionResponse > RobotInstructionResponsePtr;
typedef boost::shared_ptr< ::OMX_teleop::RobotInstructionResponse const> RobotInstructionResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator1> & lhs, const ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator2> & rhs)
{
  return lhs.response_message == rhs.response_message;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator1> & lhs, const ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace OMX_teleop

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "85493243225dd12d7bf006be7e978996";
  }

  static const char* value(const ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x85493243225dd12dULL;
  static const uint64_t static_value2 = 0x7bf006be7e978996ULL;
};

template<class ContainerAllocator>
struct DataType< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "OMX_teleop/RobotInstructionResponse";
  }

  static const char* value(const ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool response_message\n"
"\n"
;
  }

  static const char* value(const ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.response_message);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RobotInstructionResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::OMX_teleop::RobotInstructionResponse_<ContainerAllocator>& v)
  {
    s << indent << "response_message: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.response_message);
  }
};

} // namespace message_operations
} // namespace ros

#endif // OMX_TELEOP_MESSAGE_ROBOTINSTRUCTIONRESPONSE_H
