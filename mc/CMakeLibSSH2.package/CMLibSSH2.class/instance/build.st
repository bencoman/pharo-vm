generating actions
build

	gen 
		puts:
'
include(ExternalProject)
ExternalProject_Add(
	libssh2 #target name
	URL ${url} #automatically downloads extracts and verifies
	URL_MD5 ${md5sum}
	DOWNLOAD_DIR ${workDir}
	INSTALL_DIR ${installPrefix}
	PREFIX ${workDir} #base directory
	SOURCE_DIR ${libSourcesDir}
	BUILD_COMMAND make
	#external command (not built with cmake)
	CONFIGURE_COMMAND ${libSourcesDir}/configure
		--prefix=${installPrefix}
		CFLAGS=-m32
		LDFLAGS=-m32
)

ExternalProject_Add_Step(libssh2 copy_libssh2_artefacts_to_results
        COMMAND cp ${libSSH2Installed} ${externalModulesDir}/${libraryFileName}
        DEPENDEES install
)

#make sure openssl is built before libgit2
add_dependencies(libssh2 openssl)
'