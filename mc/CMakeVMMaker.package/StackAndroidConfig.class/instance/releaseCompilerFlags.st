utils - compiler
releaseCompilerFlags
	^#(
	'-DNOEXECINFO'
	'-DANDROID'
	'-DLSB_FIRST=1'
	'-DAVOID_OPENGL_H'
	'-DSTACKVM'
	'-DNO_VM_PROFILE'
	'-DFT2_BUILD_LIBRARY '
	'-DITIMER_HEARTBEAT=1'
	'-DVM_TICKER=1'
)