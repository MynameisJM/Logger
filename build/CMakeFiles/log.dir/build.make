# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "C:/Program Files/CMake/bin/cmake.exe"

# The command to remove a file.
RM = "C:/Program Files/CMake/bin/cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:/vscode/logger

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:/vscode/logger/build

# Include any dependencies generated for this target.
include CMakeFiles/log.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/log.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/log.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/log.dir/flags.make

CMakeFiles/log.dir/source/logger.cpp.obj: CMakeFiles/log.dir/flags.make
CMakeFiles/log.dir/source/logger.cpp.obj: CMakeFiles/log.dir/includes_CXX.rsp
CMakeFiles/log.dir/source/logger.cpp.obj: C:/vscode/logger/source/logger.cpp
CMakeFiles/log.dir/source/logger.cpp.obj: CMakeFiles/log.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:/vscode/logger/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/log.dir/source/logger.cpp.obj"
	C:/360/mingw64/ucrt64/bin/g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/log.dir/source/logger.cpp.obj -MF CMakeFiles/log.dir/source/logger.cpp.obj.d -o CMakeFiles/log.dir/source/logger.cpp.obj -c C:/vscode/logger/source/logger.cpp

CMakeFiles/log.dir/source/logger.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log.dir/source/logger.cpp.i"
	C:/360/mingw64/ucrt64/bin/g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:/vscode/logger/source/logger.cpp > CMakeFiles/log.dir/source/logger.cpp.i

CMakeFiles/log.dir/source/logger.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log.dir/source/logger.cpp.s"
	C:/360/mingw64/ucrt64/bin/g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:/vscode/logger/source/logger.cpp -o CMakeFiles/log.dir/source/logger.cpp.s

CMakeFiles/log.dir/main.cpp.obj: CMakeFiles/log.dir/flags.make
CMakeFiles/log.dir/main.cpp.obj: CMakeFiles/log.dir/includes_CXX.rsp
CMakeFiles/log.dir/main.cpp.obj: C:/vscode/logger/main.cpp
CMakeFiles/log.dir/main.cpp.obj: CMakeFiles/log.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:/vscode/logger/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/log.dir/main.cpp.obj"
	C:/360/mingw64/ucrt64/bin/g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/log.dir/main.cpp.obj -MF CMakeFiles/log.dir/main.cpp.obj.d -o CMakeFiles/log.dir/main.cpp.obj -c C:/vscode/logger/main.cpp

CMakeFiles/log.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log.dir/main.cpp.i"
	C:/360/mingw64/ucrt64/bin/g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:/vscode/logger/main.cpp > CMakeFiles/log.dir/main.cpp.i

CMakeFiles/log.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log.dir/main.cpp.s"
	C:/360/mingw64/ucrt64/bin/g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:/vscode/logger/main.cpp -o CMakeFiles/log.dir/main.cpp.s

# Object files for target log
log_OBJECTS = \
"CMakeFiles/log.dir/source/logger.cpp.obj" \
"CMakeFiles/log.dir/main.cpp.obj"

# External object files for target log
log_EXTERNAL_OBJECTS =

log.exe: CMakeFiles/log.dir/source/logger.cpp.obj
log.exe: CMakeFiles/log.dir/main.cpp.obj
log.exe: CMakeFiles/log.dir/build.make
log.exe: CMakeFiles/log.dir/linklibs.rsp
log.exe: CMakeFiles/log.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:/vscode/logger/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable log.exe"
	"C:/Program Files/CMake/bin/cmake.exe" -E rm -f CMakeFiles/log.dir/objects.a
	C:/360/mingw64/ucrt64/bin/ar.exe qc CMakeFiles/log.dir/objects.a @CMakeFiles/log.dir/objects1.rsp
	C:/360/mingw64/ucrt64/bin/g++.exe -g -Wl,--whole-archive CMakeFiles/log.dir/objects.a -Wl,--no-whole-archive -o log.exe -Wl,--out-implib,liblog.dll.a -Wl,--major-image-version,0,--minor-image-version,0 @CMakeFiles/log.dir/linklibs.rsp

# Rule to build all files generated by this target.
CMakeFiles/log.dir/build: log.exe
.PHONY : CMakeFiles/log.dir/build

CMakeFiles/log.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/log.dir/cmake_clean.cmake
.PHONY : CMakeFiles/log.dir/clean

CMakeFiles/log.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/vscode/logger C:/vscode/logger C:/vscode/logger/build C:/vscode/logger/build C:/vscode/logger/build/CMakeFiles/log.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/log.dir/depend
