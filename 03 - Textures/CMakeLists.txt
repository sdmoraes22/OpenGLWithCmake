cmake_minimum_required(VERSION 3.26.0)

project(Textures VERSION 1.0.0)

set(CMAKE_EXPORT_COMPILE_COMMANDS)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
set(CMAKE_TP_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../thirdparty)
set(CMAKE_COMMON_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../common)
set(SHADERS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/shaders")
set(TEXTURES_DIR "${CMAKE_CURRENT_SOURCE_DIR}/textures")

add_library(glad_lib ${CMAKE_TP_PATH}/glad/src/glad.c)

add_executable(Textures
    src/main.cpp
    ${CMAKE_COMMON_PATH}/shader_class.cpp
)

add_custom_command(
    TARGET Textures
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
            "${SHADERS_DIR}"
            "${CMAKE_CURRENT_BINARY_DIR}/shaders"
    COMMAND ${CMAKE_COMMAND} -E copy_directory
            "${TEXTURES_DIR}"
            "${CMAKE_CURRENT_BINARY_DIR}/textures"
    COMMENT "Copying shaders and textures to the build directory"
)

target_include_directories(Textures PRIVATE ${CMAKE_TP_PATH}/glad/include)
target_include_directories(glad_lib PRIVATE ${CMAKE_TP_PATH}/glad/include)
target_include_directories(Textures PRIVATE ${CMAKE_TP_PATH}/GLFW/include)
target_include_directories(Textures PRIVATE ${CMAKE_COMMON_PATH})
target_link_directories(Textures PRIVATE ${CMAKE_TP_PATH}/GLFW/libs)

target_link_libraries(Textures PRIVATE glad_lib glfw)
