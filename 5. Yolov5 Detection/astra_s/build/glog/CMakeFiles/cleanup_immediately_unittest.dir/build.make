# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jeni/astra_s/glog-0.6.0

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jeni/astra_s/build/glog

# Include any dependencies generated for this target.
include CMakeFiles/cleanup_immediately_unittest.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/cleanup_immediately_unittest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cleanup_immediately_unittest.dir/flags.make

CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.o: CMakeFiles/cleanup_immediately_unittest.dir/flags.make
CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.o: /home/jeni/astra_s/glog-0.6.0/src/cleanup_immediately_unittest.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeni/astra_s/build/glog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.o -c /home/jeni/astra_s/glog-0.6.0/src/cleanup_immediately_unittest.cc

CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jeni/astra_s/glog-0.6.0/src/cleanup_immediately_unittest.cc > CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.i

CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jeni/astra_s/glog-0.6.0/src/cleanup_immediately_unittest.cc -o CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.s

# Object files for target cleanup_immediately_unittest
cleanup_immediately_unittest_OBJECTS = \
"CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.o"

# External object files for target cleanup_immediately_unittest
cleanup_immediately_unittest_EXTERNAL_OBJECTS =

cleanup_immediately_unittest: CMakeFiles/cleanup_immediately_unittest.dir/src/cleanup_immediately_unittest.cc.o
cleanup_immediately_unittest: CMakeFiles/cleanup_immediately_unittest.dir/build.make
cleanup_immediately_unittest: libglogtest.a
cleanup_immediately_unittest: /usr/lib/x86_64-linux-gnu/libgflags.so.2.2.2
cleanup_immediately_unittest: CMakeFiles/cleanup_immediately_unittest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jeni/astra_s/build/glog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable cleanup_immediately_unittest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cleanup_immediately_unittest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cleanup_immediately_unittest.dir/build: cleanup_immediately_unittest

.PHONY : CMakeFiles/cleanup_immediately_unittest.dir/build

CMakeFiles/cleanup_immediately_unittest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cleanup_immediately_unittest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cleanup_immediately_unittest.dir/clean

CMakeFiles/cleanup_immediately_unittest.dir/depend:
	cd /home/jeni/astra_s/build/glog && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jeni/astra_s/glog-0.6.0 /home/jeni/astra_s/glog-0.6.0 /home/jeni/astra_s/build/glog /home/jeni/astra_s/build/glog /home/jeni/astra_s/build/glog/CMakeFiles/cleanup_immediately_unittest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cleanup_immediately_unittest.dir/depend
