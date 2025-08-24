cmake_minimum_required(VERSION 3.26.0)

project(EstudoOpenGL VERSION 1.0.0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
set(CMAKE_THIRD_PARTY_PATH ${CMAKE_CURRENT_SOURCE_DIR}/thirdparty)


add_executable(EstudoOpenGL 
    src/main.cpp
    ${CMAKE_THIRD_PARTY_PATH}/glad/src/glad.c
)

target_include_directories(EstudoOpenGL PRIVATE ${CMAKE_THIRD_PARTY_PATH}/glad/include)
target_include_directories(EstudoOpenGL PRIVATE ${CMAKE_THIRD_PARTY_PATH}/GLFW/include)
target_link_directories(EstudoOpenGL PRIVATE "${CMAKE_THIRD_PARTY_PATH}/GLFW/libs")

target_link_libraries(EstudoOpenGL PRIVATE glfw3)