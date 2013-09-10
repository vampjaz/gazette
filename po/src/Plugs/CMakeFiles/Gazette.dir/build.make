# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/julia/gazette

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/julia/gazette/po

# Include any dependencies generated for this target.
include src/Plugs/CMakeFiles/Gazette.dir/depend.make

# Include the progress variables for this target.
include src/Plugs/CMakeFiles/Gazette.dir/progress.make

# Include the compile flags for this target's objects.
include src/Plugs/CMakeFiles/Gazette.dir/flags.make

src/Plugs/main.c: ../src/Plugs/main.vala
src/Plugs/main.c: ../src/Plugs/Service.vala
src/Plugs/main.c: ../src/Plugs/RSS.vala
src/Plugs/main.c: ../src/Plugs/Weather.vala
src/Plugs/main.c: ../src/Plugs/RecentFiles.vala
	$(CMAKE_COMMAND) -E cmake_progress_report /home/julia/gazette/po/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating main.c, Service.c, RSS.c, Weather.c, RecentFiles.c"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/valac -C -b /home/julia/gazette/src/Plugs -d /home/julia/gazette/po/src/Plugs --pkg=gtk+-3.0 --pkg=granite --pkg=pantheon --thread /home/julia/gazette/src/Plugs/main.vala /home/julia/gazette/src/Plugs/Service.vala /home/julia/gazette/src/Plugs/RSS.vala /home/julia/gazette/src/Plugs/Weather.vala /home/julia/gazette/src/Plugs/RecentFiles.vala

src/Plugs/Service.c: src/Plugs/main.c

src/Plugs/RSS.c: src/Plugs/main.c

src/Plugs/Weather.c: src/Plugs/main.c

src/Plugs/RecentFiles.c: src/Plugs/main.c

src/Plugs/CMakeFiles/Gazette.dir/main.c.o: src/Plugs/CMakeFiles/Gazette.dir/flags.make
src/Plugs/CMakeFiles/Gazette.dir/main.c.o: src/Plugs/main.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/julia/gazette/po/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/Plugs/CMakeFiles/Gazette.dir/main.c.o"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/Gazette.dir/main.c.o   -c /home/julia/gazette/po/src/Plugs/main.c

src/Plugs/CMakeFiles/Gazette.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Gazette.dir/main.c.i"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/julia/gazette/po/src/Plugs/main.c > CMakeFiles/Gazette.dir/main.c.i

src/Plugs/CMakeFiles/Gazette.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Gazette.dir/main.c.s"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/julia/gazette/po/src/Plugs/main.c -o CMakeFiles/Gazette.dir/main.c.s

src/Plugs/CMakeFiles/Gazette.dir/main.c.o.requires:
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/main.c.o.requires

src/Plugs/CMakeFiles/Gazette.dir/main.c.o.provides: src/Plugs/CMakeFiles/Gazette.dir/main.c.o.requires
	$(MAKE) -f src/Plugs/CMakeFiles/Gazette.dir/build.make src/Plugs/CMakeFiles/Gazette.dir/main.c.o.provides.build
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/main.c.o.provides

src/Plugs/CMakeFiles/Gazette.dir/main.c.o.provides.build: src/Plugs/CMakeFiles/Gazette.dir/main.c.o

src/Plugs/CMakeFiles/Gazette.dir/Service.c.o: src/Plugs/CMakeFiles/Gazette.dir/flags.make
src/Plugs/CMakeFiles/Gazette.dir/Service.c.o: src/Plugs/Service.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/julia/gazette/po/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/Plugs/CMakeFiles/Gazette.dir/Service.c.o"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/Gazette.dir/Service.c.o   -c /home/julia/gazette/po/src/Plugs/Service.c

src/Plugs/CMakeFiles/Gazette.dir/Service.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Gazette.dir/Service.c.i"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/julia/gazette/po/src/Plugs/Service.c > CMakeFiles/Gazette.dir/Service.c.i

src/Plugs/CMakeFiles/Gazette.dir/Service.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Gazette.dir/Service.c.s"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/julia/gazette/po/src/Plugs/Service.c -o CMakeFiles/Gazette.dir/Service.c.s

src/Plugs/CMakeFiles/Gazette.dir/Service.c.o.requires:
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/Service.c.o.requires

src/Plugs/CMakeFiles/Gazette.dir/Service.c.o.provides: src/Plugs/CMakeFiles/Gazette.dir/Service.c.o.requires
	$(MAKE) -f src/Plugs/CMakeFiles/Gazette.dir/build.make src/Plugs/CMakeFiles/Gazette.dir/Service.c.o.provides.build
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/Service.c.o.provides

src/Plugs/CMakeFiles/Gazette.dir/Service.c.o.provides.build: src/Plugs/CMakeFiles/Gazette.dir/Service.c.o

src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o: src/Plugs/CMakeFiles/Gazette.dir/flags.make
src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o: src/Plugs/RSS.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/julia/gazette/po/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/Gazette.dir/RSS.c.o   -c /home/julia/gazette/po/src/Plugs/RSS.c

src/Plugs/CMakeFiles/Gazette.dir/RSS.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Gazette.dir/RSS.c.i"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/julia/gazette/po/src/Plugs/RSS.c > CMakeFiles/Gazette.dir/RSS.c.i

src/Plugs/CMakeFiles/Gazette.dir/RSS.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Gazette.dir/RSS.c.s"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/julia/gazette/po/src/Plugs/RSS.c -o CMakeFiles/Gazette.dir/RSS.c.s

src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o.requires:
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o.requires

src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o.provides: src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o.requires
	$(MAKE) -f src/Plugs/CMakeFiles/Gazette.dir/build.make src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o.provides.build
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o.provides

src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o.provides.build: src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o

src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o: src/Plugs/CMakeFiles/Gazette.dir/flags.make
src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o: src/Plugs/Weather.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/julia/gazette/po/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/Gazette.dir/Weather.c.o   -c /home/julia/gazette/po/src/Plugs/Weather.c

src/Plugs/CMakeFiles/Gazette.dir/Weather.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Gazette.dir/Weather.c.i"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/julia/gazette/po/src/Plugs/Weather.c > CMakeFiles/Gazette.dir/Weather.c.i

src/Plugs/CMakeFiles/Gazette.dir/Weather.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Gazette.dir/Weather.c.s"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/julia/gazette/po/src/Plugs/Weather.c -o CMakeFiles/Gazette.dir/Weather.c.s

src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o.requires:
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o.requires

src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o.provides: src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o.requires
	$(MAKE) -f src/Plugs/CMakeFiles/Gazette.dir/build.make src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o.provides.build
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o.provides

src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o.provides.build: src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o

src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o: src/Plugs/CMakeFiles/Gazette.dir/flags.make
src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o: src/Plugs/RecentFiles.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/julia/gazette/po/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/Gazette.dir/RecentFiles.c.o   -c /home/julia/gazette/po/src/Plugs/RecentFiles.c

src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Gazette.dir/RecentFiles.c.i"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/julia/gazette/po/src/Plugs/RecentFiles.c > CMakeFiles/Gazette.dir/RecentFiles.c.i

src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Gazette.dir/RecentFiles.c.s"
	cd /home/julia/gazette/po/src/Plugs && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/julia/gazette/po/src/Plugs/RecentFiles.c -o CMakeFiles/Gazette.dir/RecentFiles.c.s

src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o.requires:
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o.requires

src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o.provides: src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o.requires
	$(MAKE) -f src/Plugs/CMakeFiles/Gazette.dir/build.make src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o.provides.build
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o.provides

src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o.provides.build: src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o

# Object files for target Gazette
Gazette_OBJECTS = \
"CMakeFiles/Gazette.dir/main.c.o" \
"CMakeFiles/Gazette.dir/Service.c.o" \
"CMakeFiles/Gazette.dir/RSS.c.o" \
"CMakeFiles/Gazette.dir/Weather.c.o" \
"CMakeFiles/Gazette.dir/RecentFiles.c.o"

# External object files for target Gazette
Gazette_EXTERNAL_OBJECTS =

src/Plugs/Gazette: src/Plugs/CMakeFiles/Gazette.dir/main.c.o
src/Plugs/Gazette: src/Plugs/CMakeFiles/Gazette.dir/Service.c.o
src/Plugs/Gazette: src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o
src/Plugs/Gazette: src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o
src/Plugs/Gazette: src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o
src/Plugs/Gazette: src/Plugs/CMakeFiles/Gazette.dir/build.make
src/Plugs/Gazette: src/Plugs/CMakeFiles/Gazette.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable Gazette"
	cd /home/julia/gazette/po/src/Plugs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Gazette.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/Plugs/CMakeFiles/Gazette.dir/build: src/Plugs/Gazette
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/build

src/Plugs/CMakeFiles/Gazette.dir/requires: src/Plugs/CMakeFiles/Gazette.dir/main.c.o.requires
src/Plugs/CMakeFiles/Gazette.dir/requires: src/Plugs/CMakeFiles/Gazette.dir/Service.c.o.requires
src/Plugs/CMakeFiles/Gazette.dir/requires: src/Plugs/CMakeFiles/Gazette.dir/RSS.c.o.requires
src/Plugs/CMakeFiles/Gazette.dir/requires: src/Plugs/CMakeFiles/Gazette.dir/Weather.c.o.requires
src/Plugs/CMakeFiles/Gazette.dir/requires: src/Plugs/CMakeFiles/Gazette.dir/RecentFiles.c.o.requires
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/requires

src/Plugs/CMakeFiles/Gazette.dir/clean:
	cd /home/julia/gazette/po/src/Plugs && $(CMAKE_COMMAND) -P CMakeFiles/Gazette.dir/cmake_clean.cmake
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/clean

src/Plugs/CMakeFiles/Gazette.dir/depend: src/Plugs/main.c
src/Plugs/CMakeFiles/Gazette.dir/depend: src/Plugs/Service.c
src/Plugs/CMakeFiles/Gazette.dir/depend: src/Plugs/RSS.c
src/Plugs/CMakeFiles/Gazette.dir/depend: src/Plugs/Weather.c
src/Plugs/CMakeFiles/Gazette.dir/depend: src/Plugs/RecentFiles.c
	cd /home/julia/gazette/po && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/julia/gazette /home/julia/gazette/src/Plugs /home/julia/gazette/po /home/julia/gazette/po/src/Plugs /home/julia/gazette/po/src/Plugs/CMakeFiles/Gazette.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/Plugs/CMakeFiles/Gazette.dir/depend

