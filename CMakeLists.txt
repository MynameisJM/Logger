cmake_minimum_required(VERSION 3.0)

#添加源文件
aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}/source" DIR_SRC)
aux_source_directory("${CMAKE_CURRENT_SOURCE_DIR}" DIR_SRC)
#添加头文件
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

project(logger)

add_executable(log ${DIR_SRC})