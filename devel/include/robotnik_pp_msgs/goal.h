// Generated by gencpp from file robotnik_pp_msgs/goal.msg
// DO NOT EDIT!


#ifndef ROBOTNIK_PP_MSGS_MESSAGE_GOAL_H
#define ROBOTNIK_PP_MSGS_MESSAGE_GOAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Pose2D.h>

namespace robotnik_pp_msgs
{
template <class ContainerAllocator>
struct goal_
{
  typedef goal_<ContainerAllocator> Type;

  goal_()
    : pose()
    , speed(0.0)  {
    }
  goal_(const ContainerAllocator& _alloc)
    : pose(_alloc)
    , speed(0.0)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Pose2D_<ContainerAllocator>  _pose_type;
  _pose_type pose;

   typedef float _speed_type;
  _speed_type speed;





  typedef boost::shared_ptr< ::robotnik_pp_msgs::goal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robotnik_pp_msgs::goal_<ContainerAllocator> const> ConstPtr;

}; // struct goal_

typedef ::robotnik_pp_msgs::goal_<std::allocator<void> > goal;

typedef boost::shared_ptr< ::robotnik_pp_msgs::goal > goalPtr;
typedef boost::shared_ptr< ::robotnik_pp_msgs::goal const> goalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robotnik_pp_msgs::goal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robotnik_pp_msgs::goal_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace robotnik_pp_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'robotnik_pp_msgs': ['/home/punnu/catkin_ws/src/robotnik_purepursuit_planner/robotnik_pp_msgs/msg', '/home/punnu/catkin_ws/devel/share/robotnik_pp_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::robotnik_pp_msgs::goal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotnik_pp_msgs::goal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robotnik_pp_msgs::goal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robotnik_pp_msgs::goal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotnik_pp_msgs::goal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotnik_pp_msgs::goal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robotnik_pp_msgs::goal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0e0e8dfef329b7a976daedf203ce03b5";
  }

  static const char* value(const ::robotnik_pp_msgs::goal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0e0e8dfef329b7a9ULL;
  static const uint64_t static_value2 = 0x76daedf203ce03b5ULL;
};

template<class ContainerAllocator>
struct DataType< ::robotnik_pp_msgs::goal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robotnik_pp_msgs/goal";
  }

  static const char* value(const ::robotnik_pp_msgs::goal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robotnik_pp_msgs::goal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Position \n\
geometry_msgs/Pose2D pose\n\
# Desired speed\n\
float32 speed\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose2D\n\
# Deprecated\n\
# Please use the full 3D pose.\n\
\n\
# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.\n\
\n\
# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.\n\
\n\
\n\
# This expresses a position and orientation on a 2D manifold.\n\
\n\
float64 x\n\
float64 y\n\
float64 theta\n\
";
  }

  static const char* value(const ::robotnik_pp_msgs::goal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robotnik_pp_msgs::goal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pose);
      stream.next(m.speed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct goal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robotnik_pp_msgs::goal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robotnik_pp_msgs::goal_<ContainerAllocator>& v)
  {
    s << indent << "pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose2D_<ContainerAllocator> >::stream(s, indent + "  ", v.pose);
    s << indent << "speed: ";
    Printer<float>::stream(s, indent + "  ", v.speed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOTNIK_PP_MSGS_MESSAGE_GOAL_H