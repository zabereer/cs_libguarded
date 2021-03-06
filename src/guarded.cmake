add_library(CsLibGuarded INTERFACE)

target_include_directories(
   CsLibGuarded
   INTERFACE
   $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
   $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

target_compile_features(
   CsLibGuarded
   INTERFACE
   cxx_std_17
)

set(CS_LIBGUARDED_INCLUDE
   ${CMAKE_CURRENT_SOURCE_DIR}/src/cow_guarded.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/src/deferred_guarded.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/src/guarded.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/src/lr_guarded.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/src/ordered_guarded.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/src/rcu_guarded.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/src/rcu_list.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/src/shared_guarded.hpp
)


install(
   FILES ${CS_LIBGUARDED_INCLUDE}
   DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
   COMPONENT CsLibGuarded
)

install(
   TARGETS CsLibGuarded
   EXPORT CsLibGuarded-export
   DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
   COMPONENT CsLibGuarded
)

install(
   EXPORT CsLibGuarded-export
   FILE CsLibGuarded.cmake
   DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/CsLibGuarded
   )
