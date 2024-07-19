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

echo_and_run cd "/home/bioinlab/viral_pc/viral/src/rosserial/rosserial_arduino"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/bioinlab/viral_pc/viral/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/bioinlab/viral_pc/viral/install/lib/python3/dist-packages:/home/bioinlab/viral_pc/viral/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/bioinlab/viral_pc/viral/build" \
    "/usr/bin/python3" \
    "/home/bioinlab/viral_pc/viral/src/rosserial/rosserial_arduino/setup.py" \
     \
    build --build-base "/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_arduino" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/bioinlab/viral_pc/viral/install" --install-scripts="/home/bioinlab/viral_pc/viral/install/bin"
