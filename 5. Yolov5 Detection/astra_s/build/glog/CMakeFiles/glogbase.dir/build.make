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
include CMakeFiles/glogbase.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/glogbase.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/glogbase.dir/flags.make

CMakeFiles/glogbase.dir/src/demangle.cc.o: CMakeFiles/glogbase.dir/flags.make
CMakeFiles/glogbase.dir/src/demangle.cc.o: /home/jeni/astra_s/glog-0.6.0/src/demangle.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeni/astra_s/build/glog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/glogbase.dir/src/demangle.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/glogbase.dir/src/demangle.cc.o -c /home/jeni/astra_s/glog-0.6.0/src/demangle.cc

CMakeFiles/glogbase.dir/src/demangle.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/glogbase.dir/src/demangle.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jeni/astra_s/glog-0.6.0/src/demangle.cc > CMakeFiles/glogbase.dir/src/demangle.cc.i

CMakeFiles/glogbase.dir/src/demangle.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/glogbase.dir/src/demangle.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jeni/astra_s/glog-0.6.0/src/demangle.cc -o CMakeFiles/glogbase.dir/src/demangle.cc.s

CMakeFiles/glogbase.dir/src/logging.cc.o: CMakeFiles/glogbase.dir/flags.make
CMakeFiles/glogbase.dir/src/logging.cc.o: /home/jeni/astra_s/glog-0.6.0/src/logging.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeni/astra_s/build/glog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/glogbase.dir/src/logging.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/glogbase.dir/src/logging.cc.o -c /home/jeni/astra_s/glog-0.6.0/src/logging.cc

CMakeFiles/glogbase.dir/src/logging.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/glogbase.dir/src/logging.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jeni/astra_s/glog-0.6.0/src/logging.cc > CMakeFiles/glogbase.dir/src/logging.cc.i

CMakeFiles/glogbase.dir/src/logging.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/glogbase.dir/src/logging.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jeni/astra_s/glog-0.6.0/src/logging.cc -o CMakeFiles/glogbase.dir/src/logging.cc.s

CMakeFiles/glogbase.dir/src/raw_logging.cc.o: CMakeFiles/glogbase.dir/flags.make
CMakeFiles/glogbase.dir/src/raw_logging.cc.o: /home/jeni/astra_s/glog-0.6.0/src/raw_logging.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeni/astra_s/build/glog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/glogbase.dir/src/raw_logging.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/glogbase.dir/src/raw_logging.cc.o -c /home/jeni/astra_s/glog-0.6.0/src/raw_logging.cc

CMakeFiles/glogbase.dir/src/raw_logging.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/glogbase.dir/src/raw_logging.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jeni/astra_s/glog-0.6.0/src/raw_logging.cc > CMakeFiles/glogbase.dir/src/raw_logging.cc.i

CMakeFiles/glogbase.dir/src/raw_logging.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/glogbase.dir/src/raw_logging.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jeni/astra_s/glog-0.6.0/src/raw_logging.cc -o CMakeFiles/glogbase.dir/src/raw_logging.cc.s

CMakeFiles/glogbase.dir/src/symbolize.cc.o: CMakeFiles/glogbase.dir/flags.make
CMakeFiles/glogbase.dir/src/symbolize.cc.o: /home/jeni/astra_s/glog-0.6.0/src/symbolize.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeni/astra_s/build/glog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/glogbase.dir/src/symbolize.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/glogbase.dir/src/symbolize.cc.o -c /home/jeni/astra_s/glog-0.6.0/src/symbolize.cc

CMakeFiles/glogbase.dir/src/symbolize.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/glogbase.dir/src/symbolize.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jeni/astra_s/glog-0.6.0/src/symbolize.cc > CMakeFiles/glogbase.dir/src/symbolize.cc.i

CMakeFiles/glogbase.dir/src/symbolize.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/glogbase.dir/src/symbolize.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jeni/astra_s/glog-0.6.0/src/symbolize.cc -o CMakeFiles/glogbase.dir/src/symbolize.cc.s

CMakeFiles/glogbase.dir/src/utilities.cc.o: CMakeFiles/glogbase.dir/flags.make
CMakeFiles/glogbase.dir/src/utilities.cc.o: /home/jeni/astra_s/glog-0.6.0/src/utilities.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeni/astra_s/build/glog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/glogbase.dir/src/utilities.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/glogbase.dir/src/utilities.cc.o -c /home/jeni/astra_s/glog-0.6.0/src/utilities.cc

CMakeFiles/glogbase.dir/src/utilities.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/glogbase.dir/src/utilities.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jeni/astra_s/glog-0.6.0/src/utilities.cc > CMakeFiles/glogbase.dir/src/utilities.cc.i

CMakeFiles/glogbase.dir/src/utilities.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/glogbase.dir/src/utilities.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jeni/astra_s/glog-0.6.0/src/utilities.cc -o CMakeFiles/glogbase.dir/src/utilities.cc.s

CMakeFiles/glogbase.dir/src/vlog_is_on.cc.o: CMakeFiles/glogbase.dir/flags.make
CMakeFiles/glogbase.dir/src/vlog_is_on.cc.o: /home/jeni/astra_s/glog-0.6.0/src/vlog_is_on.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeni/astra_s/build/glog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/glogbase.dir/src/vlog_is_on.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/glogbase.dir/src/vlog_is_on.cc.o -c /home/jeni/astra_s/glog-0.6.0/src/vlog_is_on.cc

CMakeFiles/glogbase.dir/src/vlog_is_on.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/glogbase.dir/src/vlog_is_on.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jeni/astra_s/glog-0.6.0/src/vlog_is_on.cc > CMakeFiles/glogbase.dir/src/vlog_is_on.cc.i

CMakeFiles/glogbase.dir/src/vlog_is_on.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/glogbase.dir/src/vlog_is_on.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jeni/astra_s/glog-0.6.0/src/vlog_is_on.cc -o CMakeFiles/glogbase.dir/src/vlog_is_on.cc.s

CMakeFiles/glogbase.dir/src/signalhandler.cc.o: CMakeFiles/glogbase.dir/flags.make
CMakeFiles/glogbase.dir/src/signalhandler.cc.o: /home/jeni/astra_s/glog-0.6.0/src/signalhandler.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jeni/astra_s/build/glog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/glogbase.dir/src/signalhandler.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/glogbase.dir/src/signalhandler.cc.o -c /home/jeni/astra_s/glog-0.6.0/src/signalhandler.cc

CMakeFiles/glogbase.dir/src/signalhandler.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/glogbase.dir/src/signalhandler.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jeni/astra_s/glog-0.6.0/src/signalhandler.cc > CMakeFiles/glogbase.dir/src/signalhandler.cc.i

CMakeFiles/glogbase.dir/src/signalhandler.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/glogbase.dir/src/signalhandler.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jeni/astra_s/glog-0.6.0/src/signalhandler.cc -o CMakeFiles/glogbase.dir/src/signalhandler.cc.s

glogbase: CMakeFiles/glogbase.dir/src/demangle.cc.o
glogbase: CMakeFiles/glogbase.dir/src/logging.cc.o
glogbase: CMakeFiles/glogbase.dir/src/raw_logging.cc.o
glogbase: CMakeFiles/glogbase.dir/src/symbolize.cc.o
glogbase: CMakeFiles/glogbase.dir/src/utilities.cc.o
glogbase: CMakeFiles/glogbase.dir/src/vlog_is_on.cc.o
glogbase: CMakeFiles/glogbase.dir/src/signalhandler.cc.o
glogbase: CMakeFiles/glogbase.dir/build.make

.PHONY : glogbase

# Rule to build all files generated by this target.
CMakeFiles/glogbase.dir/build: glogbase

.PHONY : CMakeFiles/glogbase.dir/build

CMakeFiles/glogbase.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/glogbase.dir/cmake_clean.cmake
.PHONY : CMakeFiles/glogbase.dir/clean

CMakeFiles/glogbase.dir/depend:
	cd /home/jeni/astra_s/build/glog && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jeni/astra_s/glog-0.6.0 /home/jeni/astra_s/glog-0.6.0 /home/jeni/astra_s/build/glog /home/jeni/astra_s/build/glog /home/jeni/astra_s/build/glog/CMakeFiles/glogbase.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/glogbase.dir/depend

