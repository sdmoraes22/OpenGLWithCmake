cmake_minimum_required(VERSION 3.26.0)

project(Shaders VERSION 1.0.0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
set(CMAKE_TP_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../thirdparty)
set(CMAKE_COMMON_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../common)
set(SHADERS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/shaders")

add_library(glad_lib ${CMAKE_TP_PATH}/glad/src/glad.c)

add_executable(Shaders
    src/main.cpp
    ${CMAKE_COMMON_PATH}/shader_class.cpp
)

add_custom_command(
    TARGET Shaders
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
            "${SHADERS_DIR}"
            "${CMAKE_CURRENT_BINARY_DIR}/shaders"
    COMMENT "Copying shaders to the build directory"
)

target_include_directories(Shaders PRIVATE ${CMAKE_TP_PATH}/glad/include)
target_include_directories(glad_lib PRIVATE ${CMAKE_TP_PATH}/glad/include)
target_include_directories(Shaders PRIVATE ${CMAKE_TP_PATH}/GLFW/include)
target_include_directories(Shaders PRIVATE ${CMAKE_COMMON_PATH})
target_link_directories(Shaders PRIVATE ${CMAKE_TP_PATH}/GLFW/libs)

target_link_libraries(Shaders PRIVATE glad_lib glfw)
