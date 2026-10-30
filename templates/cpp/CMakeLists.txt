cmake_minimum_required(VERSION 3.20)
project(PROJECT_NAME LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Set CMAKE_PREFIX_PATH (or source the setup scripts of ROOT and Geant4) beforehand
find_package(Geant4 REQUIRED ui_all vis_all)
find_package(ROOT REQUIRED COMPONENTS Core Hist RIO Tree)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE ${Geant4_LIBRARIES} ROOT::Core ROOT::Hist ROOT::RIO ROOT::Tree)
target_include_directories(${PROJECT_NAME} PRIVATE ${Geant4_INCLUDE_DIRS})
