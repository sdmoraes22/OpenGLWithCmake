cmake_minimum_required(VERSION 3.26.0)
project(cmake_test VERSION 1.0.0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

add_executable(cmake_test 
    src/main.cpp
)

target_include_directories(cmake_test PRIVATE dependencies)
