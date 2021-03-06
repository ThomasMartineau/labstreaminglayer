# guess default paths for Windows / VC
set(LATEST_QT_VERSION "5.10.0")

if(NOT Qt5_DIR)
	if(WIN32 AND MSVC)
		if (CMAKE_SIZEOF_VOID_P EQUAL 8)
			set(lslplatform 64)
		else()
			set(lslplatform 32)
		endif()

		# see https://cmake.org/cmake/help/latest/variable/MSVC_VERSION.html
		if(MSVC_VERSION EQUAL 1500)
			set(VCYEAR 2008)
		elseif(MSVC_VERSION EQUAL 1600)
			set(VCYEAR 2010)
		elseif(MSVC_VERSION EQUAL 1700)
			set(VCYEAR 2012)
		elseif(MSVC_VERSION EQUAL 1800)
			set(VCYEAR 2013)
		elseif(MSVC_VERSION EQUAL 1900)
			set(VCYEAR 2015)
		elseif(MSVC_VERSION GREATER 1910 AND MSVC_VERSION LESS 1919)
			set(VCYEAR 2017)
		else()
			message(WARNING "You're using an untested Visual C++ compiler.")
		endif()
		set(Qt5_DIR "C:/Qt/${LATEST_QT_VERSION}/msvc${VCYEAR}_${lslplatform}/lib/cmake/Qt5")
	elseif(APPLE)
		set(Qt5_DIR "/usr/local/opt/qt/lib/cmake/Qt5") #"$(brew --prefix qt5)/lib/cmake/Qt5"
	endif()
	message(STATUS "You didn't specify a Qt5_DIR. I'm guessing it's ${Qt5_DIR}.")
	message(STATUS "If you are building Apps that require Qt and if this is wrong then please add the correct dir with -DQt5_DIR=/path/to/Qt5/lib/cmake/Qt5")
endif()

if(MSVC AND (NOT BOOST_ROOT))
    message(STATUS "Attempting to find Boost, whether or not you need it.")
    include(CMakeBoostHelper)
    if(NOT BOOST_ROOT)
        message(STATUS "Did not find Boost. If you need it then set BOOST_ROOT and/or BOOST_LIBRARYDIR")
    endif()
endif()
