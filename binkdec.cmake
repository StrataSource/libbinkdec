# BINKDEC.cmake

set(BINKDEC_DIR "${CMAKE_CURRENT_LIST_DIR}")
set(BINKDEC_SRC_DIR "${BINKDEC_DIR}/src")
set(BINKDEC_INC_DIR "${BINKDEC_DIR}/include")

set(BINKDEC_SRCS
	"${BINKDEC_SRC_DIR}/avfft.c"
	"${BINKDEC_SRC_DIR}/BinkAudio.cpp"
	"${BINKDEC_SRC_DIR}/BinkDecoder.cpp"
	"${BINKDEC_SRC_DIR}/BinkVideo.cpp"
	"${BINKDEC_SRC_DIR}/BitReader.cpp"
	"${BINKDEC_SRC_DIR}/dct.c"
	"${BINKDEC_SRC_DIR}/dct32.c"
	"${BINKDEC_SRC_DIR}/fft.c"
	"${BINKDEC_SRC_DIR}/FileStream.cpp"
	"${BINKDEC_SRC_DIR}/HuffmanVLC.cpp"
	"${BINKDEC_SRC_DIR}/interface.cpp"
	"${BINKDEC_SRC_DIR}/mdct.c"
	"${BINKDEC_SRC_DIR}/rdft.c"
	"${BINKDEC_SRC_DIR}/Util.cpp"
)

set(BINKDEC_HEADERS
	"${BINKDEC_INC_DIR}/avfft.h"
	"${BINKDEC_INC_DIR}/BinkAudio.h"
	"${BINKDEC_INC_DIR}/binkdata.h"
	"${BINKDEC_INC_DIR}/BinkDecoder.h"
	"${BINKDEC_INC_DIR}/BinkVideo.h"
	"${BINKDEC_INC_DIR}/BitReader.h"
	"${BINKDEC_INC_DIR}/dct.h"
	"${BINKDEC_INC_DIR}/dct32.h"
	"${BINKDEC_INC_DIR}/FFmpeg_includes.h"
	"${BINKDEC_INC_DIR}/fft.h"
	"${BINKDEC_INC_DIR}/fft-internal.h"
	"${BINKDEC_INC_DIR}/FileStream.h"
	"${BINKDEC_INC_DIR}/HuffmanVLC.h"
	"${BINKDEC_INC_DIR}/LogError.h"
	"${BINKDEC_INC_DIR}/rdft.h"
	"${BINKDEC_INC_DIR}/Util.h"
	"${BINKDEC_DIR}/interface/binkdec_interface.h"
)

set(
	binkdec_exclude_lib
	tier0
	tier1
	vstdlib
	interfaces
	mathlib
)

set(
	binkdec_exclude_source
	"${SRCDIR}/public/tier0/memoverride.cpp"
	"${SRCDIR}/public/tier0/crtoverride.cpp"
	"${SRCDIR}/public/tier0/logging_local.cpp"
)

add_library(binkdec SHARED ${BINKDEC_SRCS} ${BINKDEC_HEADERS})
set_property(TARGET binkdec PROPERTY FOLDER "${SLN_FOLDER_PREFIX}Libs")

target_compile_definitions(
	binkdec PRIVATE
	BINKDEC_EXPORT
)

target_include_directories(
	binkdec PUBLIC
	"${BINKDEC_DIR}/interface"
)

target_include_directories(
	binkdec PRIVATE
	"${BINKDEC_INC_DIR}"
)

set(binkdec_disable_wrap ON)
