cmake_minimum_required(VERSION 3.26.0)

project(Shaders VERSION 1.0.0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
set(CMAKE_THIRD_PARTY_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../thirdparty)


add_executable(Shaders 
    src/main.cpp
    ${CMAKE_THIRD_PARTY_PATH}/glad/src/glad.c
)

target_include_directories(Shaders PRIVATE ${CMAKE_THIRD_PARTY_PATH}/glad/include)
target_include_directories(Shaders PRIVATE ${CMAKE_THIRD_PARTY_PATH}/GLFW/include)
target_link_directories(Shaders PRIVATE "${CMAKE_THIRD_PARTY_PATH}/GLFW/libs")

target_link_libraries(Shaders PRIVATE glfw3)