cmake_minimum_required(VERSION 3.26.0)

project(Textures VERSION 1.0.0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
set(CMAKE_THIRD_PARTY_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../thirdparty)
set(CMAKE_COMMON_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../common)
set(SHADERS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/shaders")


add_executable(Textures 
    src/main.cpp
    ${CMAKE_THIRD_PARTY_PATH}/glad/src/glad.c
    ${CMAKE_COMMON_PATH}/shader_class.cpp
)

add_custom_command(
    TARGET Textures
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
            "${SHADERS_DIR}"
            "${CMAKE_CURRENT_BINARY_DIR}/shaders"
    COMMENT "Copying shaders to the build directory"
)

target_include_directories(Textures PRIVATE ${CMAKE_THIRD_PARTY_PATH}/glad/include)
target_include_directories(Textures PRIVATE ${CMAKE_THIRD_PARTY_PATH}/GLFW/include)
target_include_directories(Textures PRIVATE ${CMAKE_COMMON_PATH})
target_link_directories(Textures PRIVATE "${CMAKE_THIRD_PARTY_PATH}/GLFW/libs")

target_link_libraries(Textures PRIVATE glfw3)