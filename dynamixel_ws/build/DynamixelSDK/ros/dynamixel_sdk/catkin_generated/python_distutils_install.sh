#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/bioinlab/lab_dynamixel_contol/dynamixel_ws/src/DynamixelSDK/ros/dynamixel_sdk"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/bioinlab/lab_dynamixel_contol/dynamixel_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/bioinlab/lab_dynamixel_contol/dynamixel_ws/install/lib/python3/dist-packages:/home/bioinlab/lab_dynamixel_contol/dynamixel_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/bioinlab/lab_dynamixel_contol/dynamixel_ws/build" \
    "/usr/bin/python3" \
    "/home/bioinlab/lab_dynamixel_contol/dynamixel_ws/src/DynamixelSDK/ros/dynamixel_sdk/setup.py" \
     \
    build --build-base "/home/bioinlab/lab_dynamixel_contol/dynamixel_ws/build/DynamixelSDK/ros/dynamixel_sdk" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/bioinlab/lab_dynamixel_contol/dynamixel_ws/install" --install-scripts="/home/bioinlab/lab_dynamixel_contol/dynamixel_ws/install/bin"
