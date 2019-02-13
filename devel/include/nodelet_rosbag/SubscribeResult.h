// Generated by gencpp from file nodelet_rosbag/SubscribeResult.msg
// DO NOT EDIT!


#ifndef NODELET_ROSBAG_MESSAGE_SUBSCRIBERESULT_H
#define NODELET_ROSBAG_MESSAGE_SUBSCRIBERESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace nodelet_rosbag
{
template <class ContainerAllocator>
struct SubscribeResult_
{
  typedef SubscribeResult_<ContainerAllocator> Type;

  SubscribeResult_()
    {
    }
  SubscribeResult_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> const> ConstPtr;

}; // struct SubscribeResult_

typedef ::nodelet_rosbag::SubscribeResult_<std::allocator<void> > SubscribeResult;

typedef boost::shared_ptr< ::nodelet_rosbag::SubscribeResult > SubscribeResultPtr;
typedef boost::shared_ptr< ::nodelet_rosbag::SubscribeResult const> SubscribeResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace nodelet_rosbag

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'nodelet_rosbag': ['/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::nodelet_rosbag::SubscribeResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nodelet_rosbag/SubscribeResult";
  }

  static const char* value(const ::nodelet_rosbag::SubscribeResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
";
  }

  static const char* value(const ::nodelet_rosbag::SubscribeResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SubscribeResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nodelet_rosbag::SubscribeResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::nodelet_rosbag::SubscribeResult_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // NODELET_ROSBAG_MESSAGE_SUBSCRIBERESULT_H