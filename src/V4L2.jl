module V4L2

# V4L2.jl generated via Clang.Generators
# To generate this file, run the script in V4L2/src/generator.jl

## BEGIN prologue.jl

# additional methods to handle type punning in macros (e.g. C character literals)

CharToCuint(c::Char) = (isascii(c) ? Cuint(c) : error("Cannot convert non-ASCII Char to Cuint"))

Base.:<<(v::Char, s::Integer) = CharToCuint(v) << s
Base.:>>(v::Char, s::Integer) = CharToCuint(v) >> s

Base.:&(v::Char, s::Integer) = CharToCuint(v) & s
Base.:|(v::Char, s::Integer) = CharToCuint(v) & s

## END prologue.jl


const __fd_mask = Clong

struct fd_set
    __fds_bits::NTuple{16, __fd_mask}
end

const __u64 = Culonglong

const __be64 = __u64

const __le64 = __u64

const __u32 = Cuint

const v4l2_std_id = __u64

const __u_char = Cuchar

const __u_short = Cushort

const __u_int = Cuint

const __u_long = Culong

const __int8_t = Int8

const __uint8_t = Cuchar

const __int16_t = Cshort

const __uint16_t = Cushort

const __int32_t = Cint

const __uint32_t = Cuint

const __int64_t = Clong

const __uint64_t = Culong

const __quad_t = Clong

const __u_quad_t = Culong

const __dev_t = Culong

const __uid_t = Cuint

const __gid_t = Cuint

const __ino_t = Culong

const __ino64_t = Culong

const __mode_t = Cuint

const __nlink_t = Cuint

const __off_t = Clong

const __off64_t = Clong

const __pid_t = Cint

struct __fsid_t
    __val::NTuple{2, Cint}
end

const __clock_t = Clong

const __rlim_t = Culong

const __rlim64_t = Culong

const __id_t = Cuint

const __time_t = Clong

const __useconds_t = Cuint

const __suseconds_t = Clong

const __daddr_t = Cint

const __key_t = Cint

const __clockid_t = Cint

const __timer_t = Ptr{Cvoid}

const __blksize_t = Cint

const __blkcnt_t = Clong

const __blkcnt64_t = Clong

const __fsblkcnt_t = Culong

const __fsblkcnt64_t = Culong

const __fsfilcnt_t = Culong

const __fsfilcnt64_t = Culong

const __fsword_t = Clong

const __ssize_t = Clong

const __syscall_slong_t = Clong

const __syscall_ulong_t = Culong

const __loff_t = __off64_t

const __qaddr_t = Ptr{__quad_t}

const __caddr_t = Ptr{Cchar}

const __intptr_t = Clong

const __socklen_t = Cuint

const time_t = __time_t

struct timeval
    tv_sec::__time_t
    tv_usec::__suseconds_t
end

const __sig_atomic_t = Cint

struct __sigset_t
    __val::NTuple{16, Culong}
end

const sigset_t = __sigset_t

struct timespec
    tv_sec::__time_t
    tv_nsec::__syscall_slong_t
end

const suseconds_t = __suseconds_t

const fd_mask = __fd_mask

function select(__nfds::Cint, __readfds, __writefds, __exceptfds, __timeout)
    @ccall libc.select(__nfds::Cint, __readfds::Ptr{fd_set}, __writefds::Ptr{fd_set}, __exceptfds::Ptr{fd_set}, __timeout::Ptr{timeval})::Cint
end

function pselect(__nfds::Cint, __readfds, __writefds, __exceptfds, __timeout, __sigmask)
    @ccall libc.pselect(__nfds::Cint, __readfds::Ptr{fd_set}, __writefds::Ptr{fd_set}, __exceptfds::Ptr{fd_set}, __timeout::Ptr{timespec}, __sigmask::Ptr{__sigset_t})::Cint
end

struct timezone
    tz_minuteswest::Cint
    tz_dsttime::Cint
end

const __timezone_ptr_t = Ptr{timezone}

function gettimeofday(__tv, __tz::__timezone_ptr_t)
    @ccall libc.gettimeofday(__tv::Ptr{timeval}, __tz::__timezone_ptr_t)::Cint
end

function settimeofday(__tv, __tz)
    @ccall libc.settimeofday(__tv::Ptr{timeval}, __tz::Ptr{timezone})::Cint
end

function adjtime(__delta, __olddelta)
    @ccall libc.adjtime(__delta::Ptr{timeval}, __olddelta::Ptr{timeval})::Cint
end

@enum __itimer_which::UInt32 begin
    ITIMER_REAL = 0
    ITIMER_VIRTUAL = 1
    ITIMER_PROF = 2
end

struct itimerval
    it_interval::timeval
    it_value::timeval
end

const __itimer_which_t = Cint

function getitimer(__which::__itimer_which_t, __value)
    @ccall libc.getitimer(__which::__itimer_which_t, __value::Ptr{itimerval})::Cint
end

function setitimer(__which::__itimer_which_t, __new, __old)
    @ccall libc.setitimer(__which::__itimer_which_t, __new::Ptr{itimerval}, __old::Ptr{itimerval})::Cint
end

function utimes(__file, __tvp)
    @ccall libc.utimes(__file::Ptr{Cchar}, __tvp::Ptr{timeval})::Cint
end

function lutimes(__file, __tvp)
    @ccall libc.lutimes(__file::Ptr{Cchar}, __tvp::Ptr{timeval})::Cint
end

function futimes(__fd::Cint, __tvp)
    @ccall libc.futimes(__fd::Cint, __tvp::Ptr{timeval})::Cint
end

const __s8 = Int8

const __u8 = Cuchar

const __s16 = Cshort

const __u16 = Cushort

const __s32 = Cint

const __s64 = Clonglong

struct __kernel_fd_set
    fds_bits::NTuple{16, Culong}
end

# typedef void ( * __kernel_sighandler_t ) ( int )
const __kernel_sighandler_t = Ptr{Cvoid}

const __kernel_key_t = Cint

const __kernel_mqd_t = Cint

const __kernel_old_uid_t = Cushort

const __kernel_old_gid_t = Cushort

const __kernel_long_t = Clong

const __kernel_ulong_t = Culong

const __kernel_ino_t = __kernel_ulong_t

const __kernel_mode_t = Cuint

const __kernel_pid_t = Cint

const __kernel_ipc_pid_t = Cint

const __kernel_uid_t = Cuint

const __kernel_gid_t = Cuint

const __kernel_suseconds_t = __kernel_long_t

const __kernel_daddr_t = Cint

const __kernel_uid32_t = Cuint

const __kernel_gid32_t = Cuint

const __kernel_old_dev_t = Cuint

const __kernel_size_t = __kernel_ulong_t

const __kernel_ssize_t = __kernel_long_t

const __kernel_ptrdiff_t = __kernel_long_t

struct __kernel_fsid_t
    val::NTuple{2, Cint}
end

const __kernel_off_t = __kernel_long_t

const __kernel_loff_t = Clonglong

const __kernel_time_t = __kernel_long_t

const __kernel_time64_t = Clonglong

const __kernel_clock_t = __kernel_long_t

const __kernel_timer_t = Cint

const __kernel_clockid_t = Cint

const __kernel_caddr_t = Ptr{Cchar}

const __kernel_uid16_t = Cushort

const __kernel_gid16_t = Cushort

const __le16 = __u16

const __be16 = __u16

const __le32 = __u32

const __be32 = __u32

const __sum16 = __u16

const __wsum = __u32

const __poll_t = Cuint

struct v4l2_edid
    pad::__u32
    start_block::__u32
    blocks::__u32
    reserved::NTuple{5, __u32}
    edid::Ptr{__u8}
end

@enum v4l2_power_line_frequency::UInt32 begin
    V4L2_CID_POWER_LINE_FREQUENCY_DISABLED = 0
    V4L2_CID_POWER_LINE_FREQUENCY_50HZ = 1
    V4L2_CID_POWER_LINE_FREQUENCY_60HZ = 2
    V4L2_CID_POWER_LINE_FREQUENCY_AUTO = 3
end

@enum v4l2_colorfx::UInt32 begin
    V4L2_COLORFX_NONE = 0
    V4L2_COLORFX_BW = 1
    V4L2_COLORFX_SEPIA = 2
    V4L2_COLORFX_NEGATIVE = 3
    V4L2_COLORFX_EMBOSS = 4
    V4L2_COLORFX_SKETCH = 5
    V4L2_COLORFX_SKY_BLUE = 6
    V4L2_COLORFX_GRASS_GREEN = 7
    V4L2_COLORFX_SKIN_WHITEN = 8
    V4L2_COLORFX_VIVID = 9
    V4L2_COLORFX_AQUA = 10
    V4L2_COLORFX_ART_FREEZE = 11
    V4L2_COLORFX_SILHOUETTE = 12
    V4L2_COLORFX_SOLARIZATION = 13
    V4L2_COLORFX_ANTIQUE = 14
    V4L2_COLORFX_SET_CBCR = 15
end

@enum v4l2_mpeg_stream_type::UInt32 begin
    V4L2_MPEG_STREAM_TYPE_MPEG2_PS = 0
    V4L2_MPEG_STREAM_TYPE_MPEG2_TS = 1
    V4L2_MPEG_STREAM_TYPE_MPEG1_SS = 2
    V4L2_MPEG_STREAM_TYPE_MPEG2_DVD = 3
    V4L2_MPEG_STREAM_TYPE_MPEG1_VCD = 4
    V4L2_MPEG_STREAM_TYPE_MPEG2_SVCD = 5
end

@enum v4l2_mpeg_stream_vbi_fmt::UInt32 begin
    V4L2_MPEG_STREAM_VBI_FMT_NONE = 0
    V4L2_MPEG_STREAM_VBI_FMT_IVTV = 1
end

@enum v4l2_mpeg_audio_sampling_freq::UInt32 begin
    V4L2_MPEG_AUDIO_SAMPLING_FREQ_44100 = 0
    V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000 = 1
    V4L2_MPEG_AUDIO_SAMPLING_FREQ_32000 = 2
end

@enum v4l2_mpeg_audio_encoding::UInt32 begin
    V4L2_MPEG_AUDIO_ENCODING_LAYER_1 = 0
    V4L2_MPEG_AUDIO_ENCODING_LAYER_2 = 1
    V4L2_MPEG_AUDIO_ENCODING_LAYER_3 = 2
    V4L2_MPEG_AUDIO_ENCODING_AAC = 3
    V4L2_MPEG_AUDIO_ENCODING_AC3 = 4
end

@enum v4l2_mpeg_audio_l1_bitrate::UInt32 begin
    V4L2_MPEG_AUDIO_L1_BITRATE_32K = 0
    V4L2_MPEG_AUDIO_L1_BITRATE_64K = 1
    V4L2_MPEG_AUDIO_L1_BITRATE_96K = 2
    V4L2_MPEG_AUDIO_L1_BITRATE_128K = 3
    V4L2_MPEG_AUDIO_L1_BITRATE_160K = 4
    V4L2_MPEG_AUDIO_L1_BITRATE_192K = 5
    V4L2_MPEG_AUDIO_L1_BITRATE_224K = 6
    V4L2_MPEG_AUDIO_L1_BITRATE_256K = 7
    V4L2_MPEG_AUDIO_L1_BITRATE_288K = 8
    V4L2_MPEG_AUDIO_L1_BITRATE_320K = 9
    V4L2_MPEG_AUDIO_L1_BITRATE_352K = 10
    V4L2_MPEG_AUDIO_L1_BITRATE_384K = 11
    V4L2_MPEG_AUDIO_L1_BITRATE_416K = 12
    V4L2_MPEG_AUDIO_L1_BITRATE_448K = 13
end

@enum v4l2_mpeg_audio_l2_bitrate::UInt32 begin
    V4L2_MPEG_AUDIO_L2_BITRATE_32K = 0
    V4L2_MPEG_AUDIO_L2_BITRATE_48K = 1
    V4L2_MPEG_AUDIO_L2_BITRATE_56K = 2
    V4L2_MPEG_AUDIO_L2_BITRATE_64K = 3
    V4L2_MPEG_AUDIO_L2_BITRATE_80K = 4
    V4L2_MPEG_AUDIO_L2_BITRATE_96K = 5
    V4L2_MPEG_AUDIO_L2_BITRATE_112K = 6
    V4L2_MPEG_AUDIO_L2_BITRATE_128K = 7
    V4L2_MPEG_AUDIO_L2_BITRATE_160K = 8
    V4L2_MPEG_AUDIO_L2_BITRATE_192K = 9
    V4L2_MPEG_AUDIO_L2_BITRATE_224K = 10
    V4L2_MPEG_AUDIO_L2_BITRATE_256K = 11
    V4L2_MPEG_AUDIO_L2_BITRATE_320K = 12
    V4L2_MPEG_AUDIO_L2_BITRATE_384K = 13
end

@enum v4l2_mpeg_audio_l3_bitrate::UInt32 begin
    V4L2_MPEG_AUDIO_L3_BITRATE_32K = 0
    V4L2_MPEG_AUDIO_L3_BITRATE_40K = 1
    V4L2_MPEG_AUDIO_L3_BITRATE_48K = 2
    V4L2_MPEG_AUDIO_L3_BITRATE_56K = 3
    V4L2_MPEG_AUDIO_L3_BITRATE_64K = 4
    V4L2_MPEG_AUDIO_L3_BITRATE_80K = 5
    V4L2_MPEG_AUDIO_L3_BITRATE_96K = 6
    V4L2_MPEG_AUDIO_L3_BITRATE_112K = 7
    V4L2_MPEG_AUDIO_L3_BITRATE_128K = 8
    V4L2_MPEG_AUDIO_L3_BITRATE_160K = 9
    V4L2_MPEG_AUDIO_L3_BITRATE_192K = 10
    V4L2_MPEG_AUDIO_L3_BITRATE_224K = 11
    V4L2_MPEG_AUDIO_L3_BITRATE_256K = 12
    V4L2_MPEG_AUDIO_L3_BITRATE_320K = 13
end

@enum v4l2_mpeg_audio_mode::UInt32 begin
    V4L2_MPEG_AUDIO_MODE_STEREO = 0
    V4L2_MPEG_AUDIO_MODE_JOINT_STEREO = 1
    V4L2_MPEG_AUDIO_MODE_DUAL = 2
    V4L2_MPEG_AUDIO_MODE_MONO = 3
end

@enum v4l2_mpeg_audio_mode_extension::UInt32 begin
    V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_4 = 0
    V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_8 = 1
    V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_12 = 2
    V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_16 = 3
end

@enum v4l2_mpeg_audio_emphasis::UInt32 begin
    V4L2_MPEG_AUDIO_EMPHASIS_NONE = 0
    V4L2_MPEG_AUDIO_EMPHASIS_50_DIV_15_uS = 1
    V4L2_MPEG_AUDIO_EMPHASIS_CCITT_J17 = 2
end

@enum v4l2_mpeg_audio_crc::UInt32 begin
    V4L2_MPEG_AUDIO_CRC_NONE = 0
    V4L2_MPEG_AUDIO_CRC_CRC16 = 1
end

@enum v4l2_mpeg_audio_ac3_bitrate::UInt32 begin
    V4L2_MPEG_AUDIO_AC3_BITRATE_32K = 0
    V4L2_MPEG_AUDIO_AC3_BITRATE_40K = 1
    V4L2_MPEG_AUDIO_AC3_BITRATE_48K = 2
    V4L2_MPEG_AUDIO_AC3_BITRATE_56K = 3
    V4L2_MPEG_AUDIO_AC3_BITRATE_64K = 4
    V4L2_MPEG_AUDIO_AC3_BITRATE_80K = 5
    V4L2_MPEG_AUDIO_AC3_BITRATE_96K = 6
    V4L2_MPEG_AUDIO_AC3_BITRATE_112K = 7
    V4L2_MPEG_AUDIO_AC3_BITRATE_128K = 8
    V4L2_MPEG_AUDIO_AC3_BITRATE_160K = 9
    V4L2_MPEG_AUDIO_AC3_BITRATE_192K = 10
    V4L2_MPEG_AUDIO_AC3_BITRATE_224K = 11
    V4L2_MPEG_AUDIO_AC3_BITRATE_256K = 12
    V4L2_MPEG_AUDIO_AC3_BITRATE_320K = 13
    V4L2_MPEG_AUDIO_AC3_BITRATE_384K = 14
    V4L2_MPEG_AUDIO_AC3_BITRATE_448K = 15
    V4L2_MPEG_AUDIO_AC3_BITRATE_512K = 16
    V4L2_MPEG_AUDIO_AC3_BITRATE_576K = 17
    V4L2_MPEG_AUDIO_AC3_BITRATE_640K = 18
end

@enum v4l2_mpeg_audio_dec_playback::UInt32 begin
    V4L2_MPEG_AUDIO_DEC_PLAYBACK_AUTO = 0
    V4L2_MPEG_AUDIO_DEC_PLAYBACK_STEREO = 1
    V4L2_MPEG_AUDIO_DEC_PLAYBACK_LEFT = 2
    V4L2_MPEG_AUDIO_DEC_PLAYBACK_RIGHT = 3
    V4L2_MPEG_AUDIO_DEC_PLAYBACK_MONO = 4
    V4L2_MPEG_AUDIO_DEC_PLAYBACK_SWAPPED_STEREO = 5
end

@enum v4l2_mpeg_video_encoding::UInt32 begin
    V4L2_MPEG_VIDEO_ENCODING_MPEG_1 = 0
    V4L2_MPEG_VIDEO_ENCODING_MPEG_2 = 1
    V4L2_MPEG_VIDEO_ENCODING_MPEG_4_AVC = 2
end

@enum v4l2_mpeg_video_aspect::UInt32 begin
    V4L2_MPEG_VIDEO_ASPECT_1x1 = 0
    V4L2_MPEG_VIDEO_ASPECT_4x3 = 1
    V4L2_MPEG_VIDEO_ASPECT_16x9 = 2
    V4L2_MPEG_VIDEO_ASPECT_221x100 = 3
end

@enum v4l2_mpeg_video_bitrate_mode::UInt32 begin
    V4L2_MPEG_VIDEO_BITRATE_MODE_VBR = 0
    V4L2_MPEG_VIDEO_BITRATE_MODE_CBR = 1
end

@enum v4l2_mpeg_video_header_mode::UInt32 begin
    V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE = 0
    V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME = 1
end

@enum v4l2_mpeg_video_multi_slice_mode::UInt32 begin
    V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE = 0
    V4L2_MPEG_VIDEO_MULTI_SICE_MODE_MAX_MB = 1
    V4L2_MPEG_VIDEO_MULTI_SICE_MODE_MAX_BYTES = 2
end

@enum v4l2_mpeg_video_h264_entropy_mode::UInt32 begin
    V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC = 0
    V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC = 1
end

@enum v4l2_mpeg_video_h264_level::UInt32 begin
    V4L2_MPEG_VIDEO_H264_LEVEL_1_0 = 0
    V4L2_MPEG_VIDEO_H264_LEVEL_1B = 1
    V4L2_MPEG_VIDEO_H264_LEVEL_1_1 = 2
    V4L2_MPEG_VIDEO_H264_LEVEL_1_2 = 3
    V4L2_MPEG_VIDEO_H264_LEVEL_1_3 = 4
    V4L2_MPEG_VIDEO_H264_LEVEL_2_0 = 5
    V4L2_MPEG_VIDEO_H264_LEVEL_2_1 = 6
    V4L2_MPEG_VIDEO_H264_LEVEL_2_2 = 7
    V4L2_MPEG_VIDEO_H264_LEVEL_3_0 = 8
    V4L2_MPEG_VIDEO_H264_LEVEL_3_1 = 9
    V4L2_MPEG_VIDEO_H264_LEVEL_3_2 = 10
    V4L2_MPEG_VIDEO_H264_LEVEL_4_0 = 11
    V4L2_MPEG_VIDEO_H264_LEVEL_4_1 = 12
    V4L2_MPEG_VIDEO_H264_LEVEL_4_2 = 13
    V4L2_MPEG_VIDEO_H264_LEVEL_5_0 = 14
    V4L2_MPEG_VIDEO_H264_LEVEL_5_1 = 15
end

@enum v4l2_mpeg_video_h264_loop_filter_mode::UInt32 begin
    V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED = 0
    V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED = 1
    V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY = 2
end

@enum v4l2_mpeg_video_h264_profile::UInt32 begin
    V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE = 0
    V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE = 1
    V4L2_MPEG_VIDEO_H264_PROFILE_MAIN = 2
    V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED = 3
    V4L2_MPEG_VIDEO_H264_PROFILE_HIGH = 4
    V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10 = 5
    V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422 = 6
    V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE = 7
    V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10_INTRA = 8
    V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA = 9
    V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_INTRA = 10
    V4L2_MPEG_VIDEO_H264_PROFILE_CAVLC_444_INTRA = 11
    V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_BASELINE = 12
    V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH = 13
    V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA = 14
    V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH = 15
    V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH = 16
end

@enum v4l2_mpeg_video_h264_vui_sar_idc::UInt32 begin
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED = 0
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_1x1 = 1
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_12x11 = 2
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_10x11 = 3
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_16x11 = 4
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_40x33 = 5
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_24x11 = 6
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_20x11 = 7
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_32x11 = 8
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_80x33 = 9
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_18x11 = 10
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_15x11 = 11
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_64x33 = 12
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_160x99 = 13
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_4x3 = 14
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_3x2 = 15
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_2x1 = 16
    V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED = 17
end

@enum v4l2_mpeg_video_h264_sei_fp_arrangement_type::UInt32 begin
    V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_CHECKERBOARD = 0
    V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_COLUMN = 1
    V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_ROW = 2
    V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_SIDE_BY_SIDE = 3
    V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TOP_BOTTOM = 4
    V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TEMPORAL = 5
end

@enum v4l2_mpeg_video_h264_fmo_map_type::UInt32 begin
    V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_INTERLEAVED_SLICES = 0
    V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_SCATTERED_SLICES = 1
    V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_FOREGROUND_WITH_LEFT_OVER = 2
    V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_BOX_OUT = 3
    V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_RASTER_SCAN = 4
    V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_WIPE_SCAN = 5
    V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_EXPLICIT = 6
end

@enum v4l2_mpeg_video_h264_fmo_change_dir::UInt32 begin
    V4L2_MPEG_VIDEO_H264_FMO_CHANGE_DIR_RIGHT = 0
    V4L2_MPEG_VIDEO_H264_FMO_CHANGE_DIR_LEFT = 1
end

@enum v4l2_mpeg_video_h264_hierarchical_coding_type::UInt32 begin
    V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B = 0
    V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P = 1
end

@enum v4l2_mpeg_video_mpeg4_level::UInt32 begin
    V4L2_MPEG_VIDEO_MPEG4_LEVEL_0 = 0
    V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B = 1
    V4L2_MPEG_VIDEO_MPEG4_LEVEL_1 = 2
    V4L2_MPEG_VIDEO_MPEG4_LEVEL_2 = 3
    V4L2_MPEG_VIDEO_MPEG4_LEVEL_3 = 4
    V4L2_MPEG_VIDEO_MPEG4_LEVEL_3B = 5
    V4L2_MPEG_VIDEO_MPEG4_LEVEL_4 = 6
    V4L2_MPEG_VIDEO_MPEG4_LEVEL_5 = 7
end

@enum v4l2_mpeg_video_mpeg4_profile::UInt32 begin
    V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE = 0
    V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE = 1
    V4L2_MPEG_VIDEO_MPEG4_PROFILE_CORE = 2
    V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE_SCALABLE = 3
    V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY = 4
end

@enum v4l2_vp8_num_partitions::UInt32 begin
    V4L2_CID_MPEG_VIDEO_VPX_1_PARTITION = 0
    V4L2_CID_MPEG_VIDEO_VPX_2_PARTITIONS = 1
    V4L2_CID_MPEG_VIDEO_VPX_4_PARTITIONS = 2
    V4L2_CID_MPEG_VIDEO_VPX_8_PARTITIONS = 3
end

@enum v4l2_vp8_num_ref_frames::UInt32 begin
    V4L2_CID_MPEG_VIDEO_VPX_1_REF_FRAME = 0
    V4L2_CID_MPEG_VIDEO_VPX_2_REF_FRAME = 1
    V4L2_CID_MPEG_VIDEO_VPX_3_REF_FRAME = 2
end

@enum v4l2_vp8_golden_frame_sel::UInt32 begin
    V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_USE_PREV = 0
    V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_USE_REF_PERIOD = 1
end

@enum v4l2_mpeg_video_vp8_profile::UInt32 begin
    V4L2_MPEG_VIDEO_VP8_PROFILE_0 = 0
    V4L2_MPEG_VIDEO_VP8_PROFILE_1 = 1
    V4L2_MPEG_VIDEO_VP8_PROFILE_2 = 2
    V4L2_MPEG_VIDEO_VP8_PROFILE_3 = 3
end

@enum v4l2_mpeg_video_vp9_profile::UInt32 begin
    V4L2_MPEG_VIDEO_VP9_PROFILE_0 = 0
    V4L2_MPEG_VIDEO_VP9_PROFILE_1 = 1
    V4L2_MPEG_VIDEO_VP9_PROFILE_2 = 2
    V4L2_MPEG_VIDEO_VP9_PROFILE_3 = 3
end

@enum v4l2_mpeg_video_hevc_hier_coding_type::UInt32 begin
    V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B = 0
    V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P = 1
end

@enum v4l2_mpeg_video_hevc_profile::UInt32 begin
    V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN = 0
    V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE = 1
    V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 = 2
end

@enum v4l2_mpeg_video_hevc_level::UInt32 begin
    V4L2_MPEG_VIDEO_HEVC_LEVEL_1 = 0
    V4L2_MPEG_VIDEO_HEVC_LEVEL_2 = 1
    V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1 = 2
    V4L2_MPEG_VIDEO_HEVC_LEVEL_3 = 3
    V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1 = 4
    V4L2_MPEG_VIDEO_HEVC_LEVEL_4 = 5
    V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1 = 6
    V4L2_MPEG_VIDEO_HEVC_LEVEL_5 = 7
    V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1 = 8
    V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2 = 9
    V4L2_MPEG_VIDEO_HEVC_LEVEL_6 = 10
    V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1 = 11
    V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2 = 12
end

@enum v4l2_mpeg_video_hevc_tier::UInt32 begin
    V4L2_MPEG_VIDEO_HEVC_TIER_MAIN = 0
    V4L2_MPEG_VIDEO_HEVC_TIER_HIGH = 1
end

@enum v4l2_cid_mpeg_video_hevc_loop_filter_mode::UInt32 begin
    V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED = 0
    V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED = 1
    V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY = 2
end

@enum v4l2_cid_mpeg_video_hevc_refresh_type::UInt32 begin
    V4L2_MPEG_VIDEO_HEVC_REFRESH_NONE = 0
    V4L2_MPEG_VIDEO_HEVC_REFRESH_CRA = 1
    V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR = 2
end

@enum v4l2_cid_mpeg_video_hevc_size_of_length_field::UInt32 begin
    V4L2_MPEG_VIDEO_HEVC_SIZE_0 = 0
    V4L2_MPEG_VIDEO_HEVC_SIZE_1 = 1
    V4L2_MPEG_VIDEO_HEVC_SIZE_2 = 2
    V4L2_MPEG_VIDEO_HEVC_SIZE_4 = 3
end

@enum v4l2_mpeg_cx2341x_video_spatial_filter_mode::UInt32 begin
    V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL = 0
    V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO = 1
end

@enum v4l2_mpeg_cx2341x_video_luma_spatial_filter_type::UInt32 begin
    V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_OFF = 0
    V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_HOR = 1
    V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_VERT = 2
    V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_HV_SEPARABLE = 3
    V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_SYM_NON_SEPARABLE = 4
end

@enum v4l2_mpeg_cx2341x_video_chroma_spatial_filter_type::UInt32 begin
    V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_OFF = 0
    V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR = 1
end

@enum v4l2_mpeg_cx2341x_video_temporal_filter_mode::UInt32 begin
    V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL = 0
    V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO = 1
end

@enum v4l2_mpeg_cx2341x_video_median_filter_type::UInt32 begin
    V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF = 0
    V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_HOR = 1
    V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_VERT = 2
    V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_HOR_VERT = 3
    V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_DIAG = 4
end

@enum v4l2_mpeg_mfc51_video_frame_skip_mode::UInt32 begin
    V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED = 0
    V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT = 1
    V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT = 2
end

@enum v4l2_mpeg_mfc51_video_force_frame_type::UInt32 begin
    V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_DISABLED = 0
    V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_I_FRAME = 1
    V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_NOT_CODED = 2
end

@enum v4l2_exposure_auto_type::UInt32 begin
    V4L2_EXPOSURE_AUTO = 0
    V4L2_EXPOSURE_MANUAL = 1
    V4L2_EXPOSURE_SHUTTER_PRIORITY = 2
    V4L2_EXPOSURE_APERTURE_PRIORITY = 3
end

@enum v4l2_auto_n_preset_white_balance::UInt32 begin
    V4L2_WHITE_BALANCE_MANUAL = 0
    V4L2_WHITE_BALANCE_AUTO = 1
    V4L2_WHITE_BALANCE_INCANDESCENT = 2
    V4L2_WHITE_BALANCE_FLUORESCENT = 3
    V4L2_WHITE_BALANCE_FLUORESCENT_H = 4
    V4L2_WHITE_BALANCE_HORIZON = 5
    V4L2_WHITE_BALANCE_DAYLIGHT = 6
    V4L2_WHITE_BALANCE_FLASH = 7
    V4L2_WHITE_BALANCE_CLOUDY = 8
    V4L2_WHITE_BALANCE_SHADE = 9
end

@enum v4l2_iso_sensitivity_auto_type::UInt32 begin
    V4L2_ISO_SENSITIVITY_MANUAL = 0
    V4L2_ISO_SENSITIVITY_AUTO = 1
end

@enum v4l2_exposure_metering::UInt32 begin
    V4L2_EXPOSURE_METERING_AVERAGE = 0
    V4L2_EXPOSURE_METERING_CENTER_WEIGHTED = 1
    V4L2_EXPOSURE_METERING_SPOT = 2
    V4L2_EXPOSURE_METERING_MATRIX = 3
end

@enum v4l2_scene_mode::UInt32 begin
    V4L2_SCENE_MODE_NONE = 0
    V4L2_SCENE_MODE_BACKLIGHT = 1
    V4L2_SCENE_MODE_BEACH_SNOW = 2
    V4L2_SCENE_MODE_CANDLE_LIGHT = 3
    V4L2_SCENE_MODE_DAWN_DUSK = 4
    V4L2_SCENE_MODE_FALL_COLORS = 5
    V4L2_SCENE_MODE_FIREWORKS = 6
    V4L2_SCENE_MODE_LANDSCAPE = 7
    V4L2_SCENE_MODE_NIGHT = 8
    V4L2_SCENE_MODE_PARTY_INDOOR = 9
    V4L2_SCENE_MODE_PORTRAIT = 10
    V4L2_SCENE_MODE_SPORTS = 11
    V4L2_SCENE_MODE_SUNSET = 12
    V4L2_SCENE_MODE_TEXT = 13
end

@enum v4l2_auto_focus_range::UInt32 begin
    V4L2_AUTO_FOCUS_RANGE_AUTO = 0
    V4L2_AUTO_FOCUS_RANGE_NORMAL = 1
    V4L2_AUTO_FOCUS_RANGE_MACRO = 2
    V4L2_AUTO_FOCUS_RANGE_INFINITY = 3
end

@enum v4l2_preemphasis::UInt32 begin
    V4L2_PREEMPHASIS_DISABLED = 0
    V4L2_PREEMPHASIS_50_uS = 1
    V4L2_PREEMPHASIS_75_uS = 2
end

@enum v4l2_flash_led_mode::UInt32 begin
    V4L2_FLASH_LED_MODE_NONE = 0
    V4L2_FLASH_LED_MODE_FLASH = 1
    V4L2_FLASH_LED_MODE_TORCH = 2
end

@enum v4l2_flash_strobe_source::UInt32 begin
    V4L2_FLASH_STROBE_SOURCE_SOFTWARE = 0
    V4L2_FLASH_STROBE_SOURCE_EXTERNAL = 1
end

@enum v4l2_jpeg_chroma_subsampling::UInt32 begin
    V4L2_JPEG_CHROMA_SUBSAMPLING_444 = 0
    V4L2_JPEG_CHROMA_SUBSAMPLING_422 = 1
    V4L2_JPEG_CHROMA_SUBSAMPLING_420 = 2
    V4L2_JPEG_CHROMA_SUBSAMPLING_411 = 3
    V4L2_JPEG_CHROMA_SUBSAMPLING_410 = 4
    V4L2_JPEG_CHROMA_SUBSAMPLING_GRAY = 5
end

@enum v4l2_dv_tx_mode::UInt32 begin
    V4L2_DV_TX_MODE_DVI_D = 0
    V4L2_DV_TX_MODE_HDMI = 1
end

@enum v4l2_dv_rgb_range::UInt32 begin
    V4L2_DV_RGB_RANGE_AUTO = 0
    V4L2_DV_RGB_RANGE_LIMITED = 1
    V4L2_DV_RGB_RANGE_FULL = 2
end

@enum v4l2_dv_it_content_type::UInt32 begin
    V4L2_DV_IT_CONTENT_TYPE_GRAPHICS = 0
    V4L2_DV_IT_CONTENT_TYPE_PHOTO = 1
    V4L2_DV_IT_CONTENT_TYPE_CINEMA = 2
    V4L2_DV_IT_CONTENT_TYPE_GAME = 3
    V4L2_DV_IT_CONTENT_TYPE_NO_ITC = 4
end

@enum v4l2_deemphasis::UInt32 begin
    V4L2_DEEMPHASIS_DISABLED = 0
    V4L2_DEEMPHASIS_50_uS = 1
    V4L2_DEEMPHASIS_75_uS = 2
end

@enum v4l2_detect_md_mode::UInt32 begin
    V4L2_DETECT_MD_MODE_DISABLED = 0
    V4L2_DETECT_MD_MODE_GLOBAL = 1
    V4L2_DETECT_MD_MODE_THRESHOLD_GRID = 2
    V4L2_DETECT_MD_MODE_REGION_GRID = 3
end

@enum v4l2_field::UInt32 begin
    V4L2_FIELD_ANY = 0
    V4L2_FIELD_NONE = 1
    V4L2_FIELD_TOP = 2
    V4L2_FIELD_BOTTOM = 3
    V4L2_FIELD_INTERLACED = 4
    V4L2_FIELD_SEQ_TB = 5
    V4L2_FIELD_SEQ_BT = 6
    V4L2_FIELD_ALTERNATE = 7
    V4L2_FIELD_INTERLACED_TB = 8
    V4L2_FIELD_INTERLACED_BT = 9
end

@enum v4l2_buf_type::UInt32 begin
    V4L2_BUF_TYPE_VIDEO_CAPTURE = 1
    V4L2_BUF_TYPE_VIDEO_OUTPUT = 2
    V4L2_BUF_TYPE_VIDEO_OVERLAY = 3
    V4L2_BUF_TYPE_VBI_CAPTURE = 4
    V4L2_BUF_TYPE_VBI_OUTPUT = 5
    V4L2_BUF_TYPE_SLICED_VBI_CAPTURE = 6
    V4L2_BUF_TYPE_SLICED_VBI_OUTPUT = 7
    V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY = 8
    V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE = 9
    V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE = 10
    V4L2_BUF_TYPE_SDR_CAPTURE = 11
    V4L2_BUF_TYPE_SDR_OUTPUT = 12
    V4L2_BUF_TYPE_META_CAPTURE = 13
    V4L2_BUF_TYPE_META_OUTPUT = 14
    V4L2_BUF_TYPE_PRIVATE = 128
end

@enum v4l2_tuner_type::UInt32 begin
    V4L2_TUNER_RADIO = 1
    V4L2_TUNER_ANALOG_TV = 2
    V4L2_TUNER_DIGITAL_TV = 3
    V4L2_TUNER_SDR = 4
    V4L2_TUNER_RF = 5
end

@enum v4l2_memory::UInt32 begin
    V4L2_MEMORY_MMAP = 1
    V4L2_MEMORY_USERPTR = 2
    V4L2_MEMORY_OVERLAY = 3
    V4L2_MEMORY_DMABUF = 4
end

@enum v4l2_colorspace::UInt32 begin
    V4L2_COLORSPACE_DEFAULT = 0
    V4L2_COLORSPACE_SMPTE170M = 1
    V4L2_COLORSPACE_SMPTE240M = 2
    V4L2_COLORSPACE_REC709 = 3
    V4L2_COLORSPACE_BT878 = 4
    V4L2_COLORSPACE_470_SYSTEM_M = 5
    V4L2_COLORSPACE_470_SYSTEM_BG = 6
    V4L2_COLORSPACE_JPEG = 7
    V4L2_COLORSPACE_SRGB = 8
    V4L2_COLORSPACE_OPRGB = 9
    V4L2_COLORSPACE_BT2020 = 10
    V4L2_COLORSPACE_RAW = 11
    V4L2_COLORSPACE_DCI_P3 = 12
end

@enum v4l2_xfer_func::UInt32 begin
    V4L2_XFER_FUNC_DEFAULT = 0
    V4L2_XFER_FUNC_709 = 1
    V4L2_XFER_FUNC_SRGB = 2
    V4L2_XFER_FUNC_OPRGB = 3
    V4L2_XFER_FUNC_SMPTE240M = 4
    V4L2_XFER_FUNC_NONE = 5
    V4L2_XFER_FUNC_DCI_P3 = 6
    V4L2_XFER_FUNC_SMPTE2084 = 7
end

@enum v4l2_ycbcr_encoding::UInt32 begin
    V4L2_YCBCR_ENC_DEFAULT = 0
    V4L2_YCBCR_ENC_601 = 1
    V4L2_YCBCR_ENC_709 = 2
    V4L2_YCBCR_ENC_XV601 = 3
    V4L2_YCBCR_ENC_XV709 = 4
    V4L2_YCBCR_ENC_SYCC = 5
    V4L2_YCBCR_ENC_BT2020 = 6
    V4L2_YCBCR_ENC_BT2020_CONST_LUM = 7
    V4L2_YCBCR_ENC_SMPTE240M = 8
end

@enum v4l2_hsv_encoding::UInt32 begin
    V4L2_HSV_ENC_180 = 128
    V4L2_HSV_ENC_256 = 129
end

@enum v4l2_quantization::UInt32 begin
    V4L2_QUANTIZATION_DEFAULT = 0
    V4L2_QUANTIZATION_FULL_RANGE = 1
    V4L2_QUANTIZATION_LIM_RANGE = 2
end

@enum v4l2_priority::UInt32 begin
    V4L2_PRIORITY_UNSET = 0
    V4L2_PRIORITY_BACKGROUND = 1
    V4L2_PRIORITY_INTERACTIVE = 2
    V4L2_PRIORITY_RECORD = 3
    # V4L2_PRIORITY_DEFAULT = 2
end

struct v4l2_rect
    left::__s32
    top::__s32
    width::__u32
    height::__u32
end

struct v4l2_fract
    numerator::__u32
    denominator::__u32
end

struct v4l2_area
    width::__u32
    height::__u32
end

"""
    v4l2_capability

struct [`v4l2_capability`](@ref) - Describes V4L2 device caps returned by [`VIDIOC_QUERYCAP`](@ref)

:	name of the driver module (e.g. "bttv") :	name of the card (e.g. "Hauppauge WinTV")

\\bug \\_info:	name of the bus (e.g. "PCI:" + pci\\_name(pci\\_dev) )

\\version :	KERNEL\\_VERSION : capabilities of the physical device as a whole \\_caps: capabilities accessed via this particular device (node) :	reserved fields for future extensions
"""
struct v4l2_capability
    driver::NTuple{16, __u8}
    card::NTuple{32, __u8}
    bus_info::NTuple{32, __u8}
    version::__u32
    capabilities::__u32
    device_caps::__u32
    reserved::NTuple{3, __u32}
end

struct v4l2_pix_format
    data::NTuple{48, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_pix_format}, f::Symbol)
    f === :width && return Ptr{__u32}(x + 0)
    f === :height && return Ptr{__u32}(x + 4)
    f === :pixelformat && return Ptr{__u32}(x + 8)
    f === :field && return Ptr{__u32}(x + 12)
    f === :bytesperline && return Ptr{__u32}(x + 16)
    f === :sizeimage && return Ptr{__u32}(x + 20)
    f === :colorspace && return Ptr{__u32}(x + 24)
    f === :priv && return Ptr{__u32}(x + 28)
    f === :flags && return Ptr{__u32}(x + 32)
    f === :ycbcr_enc && return Ptr{__u32}(x + 36)
    f === :hsv_enc && return Ptr{__u32}(x + 36)
    f === :quantization && return Ptr{__u32}(x + 40)
    f === :xfer_func && return Ptr{__u32}(x + 44)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_pix_format, f::Symbol)
    r = Ref{v4l2_pix_format}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_pix_format}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_pix_format}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_fmtdesc
    index::__u32
    type::__u32
    flags::__u32
    description::NTuple{32, __u8}
    pixelformat::__u32
    mbus_code::__u32
    reserved::NTuple{3, __u32}
end

@enum v4l2_frmsizetypes::UInt32 begin
    V4L2_FRMSIZE_TYPE_DISCRETE = 1
    V4L2_FRMSIZE_TYPE_CONTINUOUS = 2
    V4L2_FRMSIZE_TYPE_STEPWISE = 3
end

struct v4l2_frmsize_discrete
    width::__u32
    height::__u32
end

struct v4l2_frmsize_stepwise
    min_width::__u32
    max_width::__u32
    step_width::__u32
    min_height::__u32
    max_height::__u32
    step_height::__u32
end

struct v4l2_frmsizeenum
    data::NTuple{44, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_frmsizeenum}, f::Symbol)
    f === :index && return Ptr{__u32}(x + 0)
    f === :pixel_format && return Ptr{__u32}(x + 4)
    f === :type && return Ptr{__u32}(x + 8)
    f === :discrete && return Ptr{v4l2_frmsize_discrete}(x + 12)
    f === :stepwise && return Ptr{v4l2_frmsize_stepwise}(x + 12)
    f === :reserved && return Ptr{NTuple{2, __u32}}(x + 36)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_frmsizeenum, f::Symbol)
    r = Ref{v4l2_frmsizeenum}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_frmsizeenum}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_frmsizeenum}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@enum v4l2_frmivaltypes::UInt32 begin
    V4L2_FRMIVAL_TYPE_DISCRETE = 1
    V4L2_FRMIVAL_TYPE_CONTINUOUS = 2
    V4L2_FRMIVAL_TYPE_STEPWISE = 3
end

struct v4l2_frmival_stepwise
    min::v4l2_fract
    max::v4l2_fract
    step::v4l2_fract
end

struct v4l2_frmivalenum
    data::NTuple{52, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_frmivalenum}, f::Symbol)
    f === :index && return Ptr{__u32}(x + 0)
    f === :pixel_format && return Ptr{__u32}(x + 4)
    f === :width && return Ptr{__u32}(x + 8)
    f === :height && return Ptr{__u32}(x + 12)
    f === :type && return Ptr{__u32}(x + 16)
    f === :discrete && return Ptr{v4l2_fract}(x + 20)
    f === :stepwise && return Ptr{v4l2_frmival_stepwise}(x + 20)
    f === :reserved && return Ptr{NTuple{2, __u32}}(x + 44)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_frmivalenum, f::Symbol)
    r = Ref{v4l2_frmivalenum}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_frmivalenum}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_frmivalenum}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_timecode
    type::__u32
    flags::__u32
    frames::__u8
    seconds::__u8
    minutes::__u8
    hours::__u8
    userbits::NTuple{4, __u8}
end

struct v4l2_jpegcompression
    quality::Cint
    APPn::Cint
    APP_len::Cint
    APP_data::NTuple{60, Cchar}
    COM_len::Cint
    COM_data::NTuple{60, Cchar}
    jpeg_markers::__u32
end

struct v4l2_requestbuffers
    count::__u32
    type::__u32
    memory::__u32
    capabilities::__u32
    reserved::NTuple{1, __u32}
end

struct __JL_Ctag_9
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_9}, f::Symbol)
    f === :mem_offset && return Ptr{__u32}(x + 0)
    f === :userptr && return Ptr{Culong}(x + 0)
    f === :fd && return Ptr{__s32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_9, f::Symbol)
    r = Ref{__JL_Ctag_9}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_9}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_9}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_plane

struct [`v4l2_plane`](@ref) - plane info for multi-planar buffers :	number of bytes occupied by data in the plane (payload) :	size of this plane (NOT the payload) in bytes *_offset*:	when memory in the associated struct [`v4l2_buffer`](@ref) is	V4L2\\_MEMORY\\_MMAP, equals the offset from the start of	the device memory for this plane (or is a "cookie" that	should be passed to mmap() called on the video node) :	when memory is V4L2\\_MEMORY\\_USERPTR, a userspace pointer	pointing to this plane :	when memory is V4L2\\_MEMORY\\_DMABUF, a userspace file	descriptor associated with this plane :	union of *_offset*,  and

\\date \\_offset:	offset in the plane to the start of data; usually 0,	unless there is a header in front of the data :	drivers and applications must zero this array

Multi-planar buffers consist of one or more planes, e.g. an YCbCr buffer with two planes can have one plane for Y, and another for interleaved CbCr components. Each plane can reside in a separate memory buffer, or even in a completely separate memory node (e.g. in embedded devices).
"""
struct v4l2_plane
    data::NTuple{64, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_plane}, f::Symbol)
    f === :bytesused && return Ptr{__u32}(x + 0)
    f === :length && return Ptr{__u32}(x + 4)
    f === :m && return Ptr{__JL_Ctag_9}(x + 8)
    f === :data_offset && return Ptr{__u32}(x + 16)
    f === :reserved && return Ptr{NTuple{11, __u32}}(x + 20)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_plane, f::Symbol)
    r = Ref{v4l2_plane}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_plane}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_plane}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_6
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_6}, f::Symbol)
    f === :offset && return Ptr{__u32}(x + 0)
    f === :userptr && return Ptr{Culong}(x + 0)
    f === :planes && return Ptr{Ptr{v4l2_plane}}(x + 0)
    f === :fd && return Ptr{__s32}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_6, f::Symbol)
    r = Ref{__JL_Ctag_6}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_6}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_6}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_buffer

struct [`v4l2_buffer`](@ref) - video buffer info :	id number of the buffer :	enum [`v4l2_buf_type`](@ref); buffer type (type == *\\_MPLANE for	multiplanar buffers); :	number of bytes occupied by data in the buffer (payload);	unused (set to 0) for multiplanar buffers :	buffer informational flags :	enum [`v4l2_field`](@ref); field order of the image in the buffer :	frame timestamp :	frame timecode :	sequence count of this frame :	enum [`v4l2_memory`](@ref); the method, in which the actual video data is	passed :	for non-multiplanar buffers with memory == V4L2\\_MEMORY\\_MMAP;	offset from the start of the device memory for this plane,	(or a "cookie" that should be passed to mmap() as offset) :	for non-multiplanar buffers with memory == V4L2\\_MEMORY\\_USERPTR;	a userspace pointer pointing to this buffer :	for non-multiplanar buffers with memory == V4L2\\_MEMORY\\_DMABUF;	a userspace file descriptor associated with this buffer :	for multiplanar buffers; userspace pointer to the array of plane	info structs for this buffer :	union of , ,  and  :	size in bytes of the buffer (NOT its payload) for single-plane	buffers (when type != *\\_MPLANE); number of elements in the	planes array for multi-plane buffers :	drivers and applications must zero this field \\_fd: fd of the request that this buffer should use :	for backwards compatibility with applications that do not know	about \\_fd

Contains data exchanged by application and driver using one of the Streaming I/O methods.
"""
struct v4l2_buffer
    data::NTuple{88, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_buffer}, f::Symbol)
    f === :index && return Ptr{__u32}(x + 0)
    f === :type && return Ptr{__u32}(x + 4)
    f === :bytesused && return Ptr{__u32}(x + 8)
    f === :flags && return Ptr{__u32}(x + 12)
    f === :field && return Ptr{__u32}(x + 16)
    f === :timestamp && return Ptr{timeval}(x + 24)
    f === :timecode && return Ptr{v4l2_timecode}(x + 40)
    f === :sequence && return Ptr{__u32}(x + 56)
    f === :memory && return Ptr{__u32}(x + 60)
    f === :m && return Ptr{__JL_Ctag_6}(x + 64)
    f === :length && return Ptr{__u32}(x + 72)
    f === :reserved2 && return Ptr{__u32}(x + 76)
    f === :request_fd && return Ptr{__s32}(x + 80)
    f === :reserved && return Ptr{__u32}(x + 80)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_buffer, f::Symbol)
    r = Ref{v4l2_buffer}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_buffer}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_buffer}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_timeval_to_ns(tv)

[`v4l2_timeval_to_ns`](@ref) - Convert [`timeval`](@ref) to nanoseconds :	pointer to the [`timeval`](@ref) variable to be converted

Returns the scalar nanosecond representation of the [`timeval`](@ref) parameter.
"""
function v4l2_timeval_to_ns(tv)
    @ccall libc.v4l2_timeval_to_ns(tv::Ptr{timeval})::__u64
end

"""
    v4l2_exportbuffer

struct [`v4l2_exportbuffer`](@ref) - export of video buffer as DMABUF file descriptor

:	id number of the buffer :	enum [`v4l2_buf_type`](@ref); buffer type (type == *\\_MPLANE for	multiplanar buffers); :	index of the plane to be exported, 0 for single plane queues :	flags for newly created file, currently only O\\_CLOEXEC is	supported, refer to manual of open syscall for more details :	file descriptor associated with DMABUF (set by driver) :	drivers and applications must zero this array

Contains data used for exporting a video buffer as DMABUF file descriptor. The buffer is identified by a 'cookie' returned by [`VIDIOC_QUERYBUF`](@ref) (identical to the cookie used to mmap() the buffer to userspace). All reserved fields must be set to zero. The field reserved0 is expected to become a structure 'type' allowing an alternative layout of the structure content. Therefore this field should not be used for any other extensions.
"""
struct v4l2_exportbuffer
    type::__u32
    index::__u32
    plane::__u32
    flags::__u32
    fd::__s32
    reserved::NTuple{11, __u32}
end

struct __JL_Ctag_7
    width::__u32
    height::__u32
    pixelformat::__u32
    field::__u32
    bytesperline::__u32
    sizeimage::__u32
    colorspace::__u32
    priv::__u32
end
function Base.getproperty(x::Ptr{__JL_Ctag_7}, f::Symbol)
    f === :width && return Ptr{__u32}(x + 0)
    f === :height && return Ptr{__u32}(x + 4)
    f === :pixelformat && return Ptr{__u32}(x + 8)
    f === :field && return Ptr{__u32}(x + 12)
    f === :bytesperline && return Ptr{__u32}(x + 16)
    f === :sizeimage && return Ptr{__u32}(x + 20)
    f === :colorspace && return Ptr{__u32}(x + 24)
    f === :priv && return Ptr{__u32}(x + 28)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_7, f::Symbol)
    r = Ref{__JL_Ctag_7}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_7}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_7}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct v4l2_framebuffer
    data::NTuple{48, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_framebuffer}, f::Symbol)
    f === :capability && return Ptr{__u32}(x + 0)
    f === :flags && return Ptr{__u32}(x + 4)
    f === :base && return Ptr{Ptr{Cvoid}}(x + 8)
    f === :fmt && return Ptr{__JL_Ctag_7}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_framebuffer, f::Symbol)
    r = Ref{v4l2_framebuffer}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_framebuffer}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_framebuffer}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_clip
    c::v4l2_rect
    next::Ptr{v4l2_clip}
end

struct v4l2_window
    w::v4l2_rect
    field::__u32
    chromakey::__u32
    clips::Ptr{v4l2_clip}
    clipcount::__u32
    bitmap::Ptr{Cvoid}
    global_alpha::__u8
end

struct v4l2_captureparm
    capability::__u32
    capturemode::__u32
    timeperframe::v4l2_fract
    extendedmode::__u32
    readbuffers::__u32
    reserved::NTuple{4, __u32}
end

struct v4l2_outputparm
    capability::__u32
    outputmode::__u32
    timeperframe::v4l2_fract
    extendedmode::__u32
    writebuffers::__u32
    reserved::NTuple{4, __u32}
end

struct v4l2_cropcap
    type::__u32
    bounds::v4l2_rect
    defrect::v4l2_rect
    pixelaspect::v4l2_fract
end

struct v4l2_crop
    type::__u32
    c::v4l2_rect
end

"""
    v4l2_selection

struct [`v4l2_selection`](@ref) - selection info :	buffer type (do not use *\\_MPLANE types) :	Selection target, used to choose one of possible rectangles;	defined in v4l2-common.h; V4L2\\_SEL\\_TGT\\_* . :	constraints flags, defined in v4l2-common.h; V4L2\\_SEL\\_FLAG\\_*. :	coordinates of selection window :	for future use, rounds structure size to 64 bytes, set to zero

Hardware may use multiple helper windows to process a video stream. The structure is used to exchange this selection areas between an application and a driver.
"""
struct v4l2_selection
    type::__u32
    target::__u32
    flags::__u32
    r::v4l2_rect
    reserved::NTuple{9, __u32}
end

struct v4l2_standard
    index::__u32
    id::v4l2_std_id
    name::NTuple{24, __u8}
    frameperiod::v4l2_fract
    framelines::__u32
    reserved::NTuple{4, __u32}
end

"""
    v4l2_bt_timings

struct [`v4l2_bt_timings`](@ref) - BT.656/BT.1120 timing data :	total width of the active video in pixels :	total height of the active video in lines :	Interlaced or progressive :	Positive or negative polarities :	Pixel clock in HZ. Ex. 74.25MHz->74250000 :Horizontal front porch in pixels :	Horizontal Sync length in pixels :	Horizontal back porch in pixels :Vertical front porch in lines :	Vertical Sync length in lines :	Vertical back porch in lines

`_vfrontporch:Vertical front porch for the even field`

(aka field 2) of interlaced field formats

`_vsync:	Vertical Sync length for the even field`

(aka field 2) of interlaced field formats

`_vbackporch:Vertical back porch for the even field`

(aka field 2) of interlaced field formats :	Standards the timing belongs to :	Flags \\_aspect: The picture aspect ratio (hor/vert). \\_vic:	VIC code as per the CEA-861 standard. \\_vic:	VIC code as per the HDMI standard. :	Reserved fields, must be zeroed.

A note regarding vertical interlaced timings: height refers to the total height of the active video frame (= two fields). The blanking timings refer to the blanking of each field. So the height of the total frame is calculated as follows:

tot\\_height = height + vfrontporch + vsync + vbackporch + il\\_vfrontporch + il\\_vsync + il\\_vbackporch

The active height of each field is height / 2.
"""
struct v4l2_bt_timings
    data::NTuple{124, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_bt_timings}, f::Symbol)
    f === :width && return Ptr{__u32}(x + 0)
    f === :height && return Ptr{__u32}(x + 4)
    f === :interlaced && return Ptr{__u32}(x + 8)
    f === :polarities && return Ptr{__u32}(x + 12)
    f === :pixelclock && return Ptr{__u64}(x + 16)
    f === :hfrontporch && return Ptr{__u32}(x + 24)
    f === :hsync && return Ptr{__u32}(x + 28)
    f === :hbackporch && return Ptr{__u32}(x + 32)
    f === :vfrontporch && return Ptr{__u32}(x + 36)
    f === :vsync && return Ptr{__u32}(x + 40)
    f === :vbackporch && return Ptr{__u32}(x + 44)
    f === :il_vfrontporch && return Ptr{__u32}(x + 48)
    f === :il_vsync && return Ptr{__u32}(x + 52)
    f === :il_vbackporch && return Ptr{__u32}(x + 56)
    f === :standards && return Ptr{__u32}(x + 60)
    f === :flags && return Ptr{__u32}(x + 64)
    f === :picture_aspect && return Ptr{v4l2_fract}(x + 68)
    f === :cea861_vic && return Ptr{__u8}(x + 76)
    f === :hdmi_vic && return Ptr{__u8}(x + 77)
    f === :reserved && return Ptr{NTuple{46, __u8}}(x + 78)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_bt_timings, f::Symbol)
    r = Ref{v4l2_bt_timings}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_bt_timings}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_bt_timings}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_dv_timings

struct [`v4l2_dv_timings`](@ref) - DV timings :	the type of the timings **:**	BT656/1120 timings
"""
struct v4l2_dv_timings
    data::NTuple{132, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_dv_timings}, f::Symbol)
    f === :type && return Ptr{__u32}(x + 0)
    f === :bt && return Ptr{v4l2_bt_timings}(x + 4)
    f === :reserved && return Ptr{NTuple{32, __u32}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_dv_timings, f::Symbol)
    r = Ref{v4l2_dv_timings}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_dv_timings}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_dv_timings}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_enum_dv_timings

struct [`v4l2_enum_dv_timings`](@ref) - DV timings enumeration :	enumeration index

\\par :	the pad number for which to enumerate timings (used with	v4l-subdev nodes only) :	must be zeroed :	the timings for the given index
"""
struct v4l2_enum_dv_timings
    data::NTuple{148, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_enum_dv_timings}, f::Symbol)
    f === :index && return Ptr{__u32}(x + 0)
    f === :pad && return Ptr{__u32}(x + 4)
    f === :reserved && return Ptr{NTuple{2, __u32}}(x + 8)
    f === :timings && return Ptr{v4l2_dv_timings}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_enum_dv_timings, f::Symbol)
    r = Ref{v4l2_enum_dv_timings}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_enum_dv_timings}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_enum_dv_timings}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_bt_timings_cap

struct [`v4l2_bt_timings_cap`](@ref) - BT.656/BT.1120 timing capabilities \\_width:	width in pixels \\_width:	width in pixels \\_height:	height in lines \\_height:	height in lines \\_pixelclock:	Pixel clock in HZ. Ex. 74.25MHz->74250000 \\_pixelclock:	Pixel clock in HZ. Ex. 74.25MHz->74250000 :	Supported standards :	Supported capabilities :	Must be zeroed
"""
struct v4l2_bt_timings_cap
    data::NTuple{104, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_bt_timings_cap}, f::Symbol)
    f === :min_width && return Ptr{__u32}(x + 0)
    f === :max_width && return Ptr{__u32}(x + 4)
    f === :min_height && return Ptr{__u32}(x + 8)
    f === :max_height && return Ptr{__u32}(x + 12)
    f === :min_pixelclock && return Ptr{__u64}(x + 16)
    f === :max_pixelclock && return Ptr{__u64}(x + 24)
    f === :standards && return Ptr{__u32}(x + 32)
    f === :capabilities && return Ptr{__u32}(x + 36)
    f === :reserved && return Ptr{NTuple{16, __u32}}(x + 40)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_bt_timings_cap, f::Symbol)
    r = Ref{v4l2_bt_timings_cap}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_bt_timings_cap}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_bt_timings_cap}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_dv_timings_cap

struct [`v4l2_dv_timings_cap`](@ref) - DV timings capabilities :	the type of the timings (same as in struct [`v4l2_dv_timings`](@ref))

\\par :	the pad number for which to query capabilities (used with	v4l-subdev nodes only) **:**	the BT656/1120 timings capabilities
"""
struct v4l2_dv_timings_cap
    data::NTuple{144, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_dv_timings_cap}, f::Symbol)
    f === :type && return Ptr{__u32}(x + 0)
    f === :pad && return Ptr{__u32}(x + 4)
    f === :reserved && return Ptr{NTuple{2, __u32}}(x + 8)
    f === :bt && return Ptr{v4l2_bt_timings_cap}(x + 16)
    f === :raw_data && return Ptr{NTuple{32, __u32}}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_dv_timings_cap, f::Symbol)
    r = Ref{v4l2_dv_timings_cap}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_dv_timings_cap}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_dv_timings_cap}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_input
    index::__u32
    name::NTuple{32, __u8}
    type::__u32
    audioset::__u32
    tuner::__u32
    std::v4l2_std_id
    status::__u32
    capabilities::__u32
    reserved::NTuple{3, __u32}
end

struct v4l2_output
    index::__u32
    name::NTuple{32, __u8}
    type::__u32
    audioset::__u32
    modulator::__u32
    std::v4l2_std_id
    capabilities::__u32
    reserved::NTuple{3, __u32}
end

struct v4l2_control
    id::__u32
    value::__s32
end

struct v4l2_ext_control
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_ext_control}, f::Symbol)
    f === :id && return Ptr{__u32}(x + 0)
    f === :size && return Ptr{__u32}(x + 4)
    f === :reserved2 && return Ptr{NTuple{1, __u32}}(x + 8)
    f === :value && return Ptr{__s32}(x + 12)
    f === :value64 && return Ptr{__s64}(x + 12)
    f === :string && return Ptr{Ptr{Cchar}}(x + 12)
    f === :p_u8 && return Ptr{Ptr{__u8}}(x + 12)
    f === :p_u16 && return Ptr{Ptr{__u16}}(x + 12)
    f === :p_u32 && return Ptr{Ptr{__u32}}(x + 12)
    f === :p_area && return Ptr{Ptr{v4l2_area}}(x + 12)
    f === :p_h264_sps && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :p_h264_pps && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :p_h264_scaling_matrix && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :p_h264_pred_weights && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :p_h264_slice_params && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :p_h264_decode_params && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :p_fwht_params && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :p_vp8_frame && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :p_mpeg2_sequence && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :p_mpeg2_picture && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :p_mpeg2_quantisation && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :ptr && return Ptr{Ptr{Cvoid}}(x + 12)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_ext_control, f::Symbol)
    r = Ref{v4l2_ext_control}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_ext_control}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_ext_control}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_ext_controls
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_ext_controls}, f::Symbol)
    f === :ctrl_class && return Ptr{__u32}(x + 0)
    f === :which && return Ptr{__u32}(x + 0)
    f === :count && return Ptr{__u32}(x + 4)
    f === :error_idx && return Ptr{__u32}(x + 8)
    f === :request_fd && return Ptr{__s32}(x + 12)
    f === :reserved && return Ptr{NTuple{1, __u32}}(x + 16)
    f === :controls && return Ptr{Ptr{v4l2_ext_control}}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_ext_controls, f::Symbol)
    r = Ref{v4l2_ext_controls}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_ext_controls}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_ext_controls}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@enum v4l2_ctrl_type::UInt32 begin
    V4L2_CTRL_TYPE_INTEGER = 1
    V4L2_CTRL_TYPE_BOOLEAN = 2
    V4L2_CTRL_TYPE_MENU = 3
    V4L2_CTRL_TYPE_BUTTON = 4
    V4L2_CTRL_TYPE_INTEGER64 = 5
    V4L2_CTRL_TYPE_CTRL_CLASS = 6
    V4L2_CTRL_TYPE_STRING = 7
    V4L2_CTRL_TYPE_BITMASK = 8
    V4L2_CTRL_TYPE_INTEGER_MENU = 9
    V4L2_CTRL_COMPOUND_TYPES = 256
    # V4L2_CTRL_TYPE_U8 = 256
    V4L2_CTRL_TYPE_U16 = 257
    V4L2_CTRL_TYPE_U32 = 258
    V4L2_CTRL_TYPE_AREA = 262
    V4L2_CTRL_TYPE_HDR10_CLL_INFO = 272
    V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY = 273
    V4L2_CTRL_TYPE_H264_SPS = 512
    V4L2_CTRL_TYPE_H264_PPS = 513
    V4L2_CTRL_TYPE_H264_SCALING_MATRIX = 514
    V4L2_CTRL_TYPE_H264_SLICE_PARAMS = 515
    V4L2_CTRL_TYPE_H264_DECODE_PARAMS = 516
    V4L2_CTRL_TYPE_H264_PRED_WEIGHTS = 517
    V4L2_CTRL_TYPE_FWHT_PARAMS = 544
    V4L2_CTRL_TYPE_VP8_FRAME = 576
    V4L2_CTRL_TYPE_MPEG2_QUANTISATION = 592
    V4L2_CTRL_TYPE_MPEG2_SEQUENCE = 593
    V4L2_CTRL_TYPE_MPEG2_PICTURE = 594
end

struct v4l2_queryctrl
    id::__u32
    type::__u32
    name::NTuple{32, __u8}
    minimum::__s32
    maximum::__s32
    step::__s32
    default_value::__s32
    flags::__u32
    reserved::NTuple{2, __u32}
end

struct v4l2_query_ext_ctrl
    id::__u32
    type::__u32
    name::NTuple{32, Cchar}
    minimum::__s64
    maximum::__s64
    step::__u64
    default_value::__s64
    flags::__u32
    elem_size::__u32
    elems::__u32
    nr_of_dims::__u32
    dims::NTuple{4, __u32}
    reserved::NTuple{32, __u32}
end

struct v4l2_querymenu
    data::NTuple{44, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_querymenu}, f::Symbol)
    f === :id && return Ptr{__u32}(x + 0)
    f === :index && return Ptr{__u32}(x + 4)
    f === :name && return Ptr{NTuple{32, __u8}}(x + 8)
    f === :value && return Ptr{__s64}(x + 8)
    f === :reserved && return Ptr{__u32}(x + 40)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_querymenu, f::Symbol)
    r = Ref{v4l2_querymenu}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_querymenu}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_querymenu}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_tuner
    index::__u32
    name::NTuple{32, __u8}
    type::__u32
    capability::__u32
    rangelow::__u32
    rangehigh::__u32
    rxsubchans::__u32
    audmode::__u32
    signal::__s32
    afc::__s32
    reserved::NTuple{4, __u32}
end

struct v4l2_modulator
    index::__u32
    name::NTuple{32, __u8}
    capability::__u32
    rangelow::__u32
    rangehigh::__u32
    txsubchans::__u32
    type::__u32
    reserved::NTuple{3, __u32}
end

struct v4l2_frequency
    tuner::__u32
    type::__u32
    frequency::__u32
    reserved::NTuple{8, __u32}
end

struct v4l2_frequency_band
    tuner::__u32
    type::__u32
    index::__u32
    capability::__u32
    rangelow::__u32
    rangehigh::__u32
    modulation::__u32
    reserved::NTuple{9, __u32}
end

struct v4l2_hw_freq_seek
    tuner::__u32
    type::__u32
    seek_upward::__u32
    wrap_around::__u32
    spacing::__u32
    rangelow::__u32
    rangehigh::__u32
    reserved::NTuple{5, __u32}
end

struct v4l2_rds_data
    data::NTuple{3, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_rds_data}, f::Symbol)
    f === :lsb && return Ptr{__u8}(x + 0)
    f === :msb && return Ptr{__u8}(x + 1)
    f === :block && return Ptr{__u8}(x + 2)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_rds_data, f::Symbol)
    r = Ref{v4l2_rds_data}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_rds_data}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_rds_data}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_audio
    index::__u32
    name::NTuple{32, __u8}
    capability::__u32
    mode::__u32
    reserved::NTuple{2, __u32}
end

struct v4l2_audioout
    index::__u32
    name::NTuple{32, __u8}
    capability::__u32
    mode::__u32
    reserved::NTuple{2, __u32}
end

struct v4l2_enc_idx_entry
    offset::__u64
    pts::__u64
    length::__u32
    flags::__u32
    reserved::NTuple{2, __u32}
end

struct v4l2_enc_idx
    entries::__u32
    entries_cap::__u32
    reserved::NTuple{4, __u32}
    entry::NTuple{64, v4l2_enc_idx_entry}
end

struct v4l2_encoder_cmd
    data::NTuple{40, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_encoder_cmd}, f::Symbol)
    f === :cmd && return Ptr{__u32}(x + 0)
    f === :flags && return Ptr{__u32}(x + 4)
    f === :raw && return Ptr{Cvoid}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_encoder_cmd, f::Symbol)
    r = Ref{v4l2_encoder_cmd}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_encoder_cmd}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_encoder_cmd}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_decoder_cmd
    data::NTuple{72, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_decoder_cmd}, f::Symbol)
    f === :cmd && return Ptr{__u32}(x + 0)
    f === :flags && return Ptr{__u32}(x + 4)
    f === :stop && return Ptr{Cvoid}(x + 8)
    f === :start && return Ptr{Cvoid}(x + 8)
    f === :raw && return Ptr{Cvoid}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_decoder_cmd, f::Symbol)
    r = Ref{v4l2_decoder_cmd}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_decoder_cmd}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_decoder_cmd}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_vbi_format
    sampling_rate::__u32
    offset::__u32
    samples_per_line::__u32
    sample_format::__u32
    start::NTuple{2, __s32}
    count::NTuple{2, __u32}
    flags::__u32
    reserved::NTuple{2, __u32}
end

struct v4l2_sliced_vbi_format
    service_set::__u16
    service_lines::NTuple{2, NTuple{24, __u16}}
    io_size::__u32
    reserved::NTuple{2, __u32}
end

struct v4l2_sliced_vbi_cap
    service_set::__u16
    service_lines::NTuple{2, NTuple{24, __u16}}
    type::__u32
    reserved::NTuple{3, __u32}
end

struct v4l2_sliced_vbi_data
    id::__u32
    field::__u32
    line::__u32
    reserved::__u32
    data::NTuple{48, __u8}
end

struct v4l2_mpeg_vbi_itv0_line
    data::NTuple{43, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_mpeg_vbi_itv0_line}, f::Symbol)
    f === :id && return Ptr{__u8}(x + 0)
    f === :data && return Ptr{NTuple{42, __u8}}(x + 1)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_mpeg_vbi_itv0_line, f::Symbol)
    r = Ref{v4l2_mpeg_vbi_itv0_line}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_mpeg_vbi_itv0_line}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_mpeg_vbi_itv0_line}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_mpeg_vbi_itv0
    data::NTuple{1513, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_mpeg_vbi_itv0}, f::Symbol)
    f === :linemask && return Ptr{NTuple{2, __le32}}(x + 0)
    f === :line && return Ptr{NTuple{35, v4l2_mpeg_vbi_itv0_line}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_mpeg_vbi_itv0, f::Symbol)
    r = Ref{v4l2_mpeg_vbi_itv0}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_mpeg_vbi_itv0}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_mpeg_vbi_itv0}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_mpeg_vbi_ITV0
    data::NTuple{1548, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_mpeg_vbi_ITV0}, f::Symbol)
    f === :line && return Ptr{NTuple{36, v4l2_mpeg_vbi_itv0_line}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_mpeg_vbi_ITV0, f::Symbol)
    r = Ref{v4l2_mpeg_vbi_ITV0}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_mpeg_vbi_ITV0}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_mpeg_vbi_ITV0}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_mpeg_vbi_fmt_ivtv
    data::NTuple{1552, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_mpeg_vbi_fmt_ivtv}, f::Symbol)
    f === :magic && return Ptr{NTuple{4, __u8}}(x + 0)
    f === :itv0 && return Ptr{v4l2_mpeg_vbi_itv0}(x + 4)
    f === :ITV0 && return Ptr{v4l2_mpeg_vbi_ITV0}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_mpeg_vbi_fmt_ivtv, f::Symbol)
    r = Ref{v4l2_mpeg_vbi_fmt_ivtv}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_mpeg_vbi_fmt_ivtv}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_mpeg_vbi_fmt_ivtv}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_plane_pix_format

struct [`v4l2_plane_pix_format`](@ref) - additional, per-plane format definition :	maximum size in bytes required for data, for which	this plane will be used :	distance in bytes between the leftmost pixels in two	adjacent lines :	drivers and applications must zero this array
"""
struct v4l2_plane_pix_format
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_plane_pix_format}, f::Symbol)
    f === :sizeimage && return Ptr{__u32}(x + 0)
    f === :bytesperline && return Ptr{__u32}(x + 4)
    f === :reserved && return Ptr{NTuple{6, __u16}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_plane_pix_format, f::Symbol)
    r = Ref{v4l2_plane_pix_format}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_plane_pix_format}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_plane_pix_format}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_pix_format_mplane

struct [`v4l2_pix_format_mplane`](@ref) - multiplanar format definition :	image width in pixels :	image height in pixels :	little endian four character code (fourcc) :	enum [`v4l2_field`](@ref); field order (for interlaced video) :	enum [`v4l2_colorspace`](@ref); supplemental to pixelformat \\_fmt:	per-plane information

`_planes:		number of planes for this format`

:	format flags (V4L2\\_PIX\\_FMT\\_FLAG\\_*) \\_enc:	enum [`v4l2_ycbcr_encoding`](@ref), Y'CbCr encoding \\_enc:	enum [`v4l2_hsv_encoding`](@ref), HSV encoding :	enum [`v4l2_quantization`](@ref), colorspace quantization \\_func:	enum [`v4l2_xfer_func`](@ref), colorspace transfer function :	drivers and applications must zero this array
"""
struct v4l2_pix_format_mplane
    data::NTuple{192, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_pix_format_mplane}, f::Symbol)
    f === :width && return Ptr{__u32}(x + 0)
    f === :height && return Ptr{__u32}(x + 4)
    f === :pixelformat && return Ptr{__u32}(x + 8)
    f === :field && return Ptr{__u32}(x + 12)
    f === :colorspace && return Ptr{__u32}(x + 16)
    f === :plane_fmt && return Ptr{NTuple{8, v4l2_plane_pix_format}}(x + 20)
    f === :num_planes && return Ptr{__u8}(x + 180)
    f === :flags && return Ptr{__u8}(x + 181)
    f === :ycbcr_enc && return Ptr{__u8}(x + 182)
    f === :hsv_enc && return Ptr{__u8}(x + 182)
    f === :quantization && return Ptr{__u8}(x + 183)
    f === :xfer_func && return Ptr{__u8}(x + 184)
    f === :reserved && return Ptr{NTuple{7, __u8}}(x + 185)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_pix_format_mplane, f::Symbol)
    r = Ref{v4l2_pix_format_mplane}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_pix_format_mplane}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_pix_format_mplane}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_sdr_format

struct [`v4l2_sdr_format`](@ref) - SDR format definition :	little endian four character code (fourcc) :	maximum size in bytes required for data :	drivers and applications must zero this array
"""
struct v4l2_sdr_format
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_sdr_format}, f::Symbol)
    f === :pixelformat && return Ptr{__u32}(x + 0)
    f === :buffersize && return Ptr{__u32}(x + 4)
    f === :reserved && return Ptr{NTuple{24, __u8}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_sdr_format, f::Symbol)
    r = Ref{v4l2_sdr_format}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_sdr_format}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_sdr_format}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_meta_format

struct [`v4l2_meta_format`](@ref) - metadata format definition :	little endian four character code (fourcc) :	maximum size in bytes required for data
"""
struct v4l2_meta_format
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_meta_format}, f::Symbol)
    f === :dataformat && return Ptr{__u32}(x + 0)
    f === :buffersize && return Ptr{__u32}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_meta_format, f::Symbol)
    r = Ref{v4l2_meta_format}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_meta_format}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_meta_format}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_8
    data::NTuple{200, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_8}, f::Symbol)
    f === :pix && return Ptr{v4l2_pix_format}(x + 0)
    f === :pix_mp && return Ptr{v4l2_pix_format_mplane}(x + 0)
    f === :win && return Ptr{v4l2_window}(x + 0)
    f === :vbi && return Ptr{v4l2_vbi_format}(x + 0)
    f === :sliced && return Ptr{v4l2_sliced_vbi_format}(x + 0)
    f === :sdr && return Ptr{v4l2_sdr_format}(x + 0)
    f === :meta && return Ptr{v4l2_meta_format}(x + 0)
    f === :raw_data && return Ptr{NTuple{200, __u8}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_8, f::Symbol)
    r = Ref{__JL_Ctag_8}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_8}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_8}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_format

struct [`v4l2_format`](@ref) - stream data format :	enum [`v4l2_buf_type`](@ref); type of the data stream :	definition of an image format \\_mp:	definition of a multiplanar image format :	definition of an overlaid image :	raw VBI capture or output parameters :	sliced VBI capture or output parameters \\_data:	placeholder for future extensions and custom formats :	union of , \\_mp, , , , , 	and \\_data
"""
struct v4l2_format
    data::NTuple{208, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_format}, f::Symbol)
    f === :type && return Ptr{__u32}(x + 0)
    f === :fmt && return Ptr{__JL_Ctag_8}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_format, f::Symbol)
    r = Ref{v4l2_format}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_format}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_format}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct __JL_Ctag_10
    data::NTuple{200, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_10}, f::Symbol)
    f === :capture && return Ptr{v4l2_captureparm}(x + 0)
    f === :output && return Ptr{v4l2_outputparm}(x + 0)
    f === :raw_data && return Ptr{NTuple{200, __u8}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_10, f::Symbol)
    r = Ref{__JL_Ctag_10}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_10}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_10}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_streamparm
    data::NTuple{204, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_streamparm}, f::Symbol)
    f === :type && return Ptr{__u32}(x + 0)
    f === :parm && return Ptr{__JL_Ctag_10}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_streamparm, f::Symbol)
    r = Ref{v4l2_streamparm}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_streamparm}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_streamparm}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_event_vsync
    data::NTuple{1, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_event_vsync}, f::Symbol)
    f === :field && return Ptr{__u8}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_event_vsync, f::Symbol)
    r = Ref{v4l2_event_vsync}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_event_vsync}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_event_vsync}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_event_ctrl
    data::NTuple{40, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_event_ctrl}, f::Symbol)
    f === :changes && return Ptr{__u32}(x + 0)
    f === :type && return Ptr{__u32}(x + 4)
    f === :value && return Ptr{__s32}(x + 8)
    f === :value64 && return Ptr{__s64}(x + 8)
    f === :flags && return Ptr{__u32}(x + 16)
    f === :minimum && return Ptr{__s32}(x + 20)
    f === :maximum && return Ptr{__s32}(x + 24)
    f === :step && return Ptr{__s32}(x + 28)
    f === :default_value && return Ptr{__s32}(x + 32)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_event_ctrl, f::Symbol)
    r = Ref{v4l2_event_ctrl}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_event_ctrl}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_event_ctrl}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_event_frame_sync
    frame_sequence::__u32
end

struct v4l2_event_src_change
    changes::__u32
end

"""
    v4l2_event_motion_det

struct [`v4l2_event_motion_det`](@ref) - motion detection event : if [`V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ`](@ref) is set, then the frame\\_sequence field is valid. \\_sequence: the frame sequence number associated with this event. \\_mask: which regions detected motion.
"""
struct v4l2_event_motion_det
    flags::__u32
    frame_sequence::__u32
    region_mask::__u32
end

struct __JL_Ctag_11
    data::NTuple{64, UInt8}
end

function Base.getproperty(x::Ptr{__JL_Ctag_11}, f::Symbol)
    f === :vsync && return Ptr{v4l2_event_vsync}(x + 0)
    f === :ctrl && return Ptr{v4l2_event_ctrl}(x + 0)
    f === :frame_sync && return Ptr{v4l2_event_frame_sync}(x + 0)
    f === :src_change && return Ptr{v4l2_event_src_change}(x + 0)
    f === :motion_det && return Ptr{v4l2_event_motion_det}(x + 0)
    f === :data && return Ptr{NTuple{64, __u8}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_11, f::Symbol)
    r = Ref{__JL_Ctag_11}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_11}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_11}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_event
    data::NTuple{136, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_event}, f::Symbol)
    f === :type && return Ptr{__u32}(x + 0)
    f === :u && return Ptr{__JL_Ctag_11}(x + 8)
    f === :pending && return Ptr{__u32}(x + 72)
    f === :sequence && return Ptr{__u32}(x + 76)
    f === :timestamp && return Ptr{timespec}(x + 80)
    f === :id && return Ptr{__u32}(x + 96)
    f === :reserved && return Ptr{NTuple{8, __u32}}(x + 100)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_event, f::Symbol)
    r = Ref{v4l2_event}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_event}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_event}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_event_subscription
    type::__u32
    id::__u32
    flags::__u32
    reserved::NTuple{5, __u32}
end

struct v4l2_dbg_match
    data::NTuple{36, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_dbg_match}, f::Symbol)
    f === :type && return Ptr{__u32}(x + 0)
    f === :addr && return Ptr{__u32}(x + 4)
    f === :name && return Ptr{NTuple{32, Cchar}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_dbg_match, f::Symbol)
    r = Ref{v4l2_dbg_match}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_dbg_match}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_dbg_match}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_dbg_register
    data::NTuple{56, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_dbg_register}, f::Symbol)
    f === :match && return Ptr{v4l2_dbg_match}(x + 0)
    f === :size && return Ptr{__u32}(x + 36)
    f === :reg && return Ptr{__u64}(x + 40)
    f === :val && return Ptr{__u64}(x + 48)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_dbg_register, f::Symbol)
    r = Ref{v4l2_dbg_register}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_dbg_register}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_dbg_register}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct v4l2_dbg_chip_info
    data::NTuple{200, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_dbg_chip_info}, f::Symbol)
    f === :match && return Ptr{v4l2_dbg_match}(x + 0)
    f === :name && return Ptr{NTuple{32, Cchar}}(x + 36)
    f === :flags && return Ptr{__u32}(x + 68)
    f === :reserved && return Ptr{NTuple{32, __u32}}(x + 72)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_dbg_chip_info, f::Symbol)
    r = Ref{v4l2_dbg_chip_info}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_dbg_chip_info}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_dbg_chip_info}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

"""
    v4l2_create_buffers

struct [`v4l2_create_buffers`](@ref) - [`VIDIOC_CREATE_BUFS`](@ref) argument :	on return, index of the first created buffer :	entry: number of requested buffers,	return: number of created buffers :	enum [`v4l2_memory`](@ref); buffer memory type :	frame format, for which buffers are requested : capabilities of this buffer type. :	future extensions
"""
struct v4l2_create_buffers
    data::NTuple{256, UInt8}
end

function Base.getproperty(x::Ptr{v4l2_create_buffers}, f::Symbol)
    f === :index && return Ptr{__u32}(x + 0)
    f === :count && return Ptr{__u32}(x + 4)
    f === :memory && return Ptr{__u32}(x + 8)
    f === :format && return Ptr{v4l2_format}(x + 16)
    f === :capabilities && return Ptr{__u32}(x + 224)
    f === :reserved && return Ptr{NTuple{7, __u32}}(x + 228)
    return getfield(x, f)
end

function Base.getproperty(x::v4l2_create_buffers, f::Symbol)
    r = Ref{v4l2_create_buffers}(x)
    ptr = Base.unsafe_convert(Ptr{v4l2_create_buffers}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{v4l2_create_buffers}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const __LINUX_VIDEODEV2_H = nothing

const _SYS_TIME_H = 1

const _FEATURES_H = 1

const __KERNEL_STRICT_NAMES = nothing

__GNUC_PREREQ(maj, min) = __GNUC__ << 16 + __GNUC_MINOR__ >= maj << 16 + min

const _DEFAULT_SOURCE = 1

const _BSD_SOURCE = 1

const _SVID_SOURCE = 1

const __USE_ISOC11 = 1

const __USE_ISOC99 = 1

const __USE_ISOC95 = 1

const __USE_POSIX_IMPLICITLY = 1

const _POSIX_SOURCE = 1

const _POSIX_C_SOURCE = Clong(200809)

const __USE_POSIX = 1

const __USE_POSIX2 = 1

const __USE_POSIX199309 = 1

const __USE_POSIX199506 = 1

const __USE_XOPEN2K = 1

const __USE_XOPEN2K8 = 1

const _ATFILE_SOURCE = 1

const __USE_MISC = 1

const __USE_BSD = 1

const __USE_SVID = 1

const __USE_ATFILE = 1

const __USE_FORTIFY_LEVEL = 0

const _STDC_PREDEF_H = 1

const __STDC_IEC_559__ = 1

const __STDC_IEC_559_COMPLEX__ = 1

const __STDC_ISO_10646__ = Clong(201103)

const __STDC_NO_THREADS__ = 1

const __GNU_LIBRARY__ = 6

const __GLIBC__ = 2

const __GLIBC_MINOR__ = 19

__GLIBC_PREREQ(maj, min) = __GLIBC__ << 16 + __GLIBC_MINOR__ >= maj << 16 + min

const _SYS_CDEFS_H = 1

const __LEAF = nothing

const __LEAF_ATTR = nothing

# Skipping MacroDefinition: __THROW __attribute__ ( ( __nothrow__ __LEAF ) )

# Skipping MacroDefinition: __THROWNL __attribute__ ( ( __nothrow__ ) )

__NTH(fct) = (__attribute__(__nothrow__(__LEAF)))(fct)

__P(args) = args

__PMT(args) = args

__CONCAT(x, y) = x

__STRING(x) = nothing

const __ptr_t = Ptr{Cvoid}

# Skipping MacroDefinition: __long_double_t long double

const __BEGIN_DECLS = nothing

const __END_DECLS = nothing

const __BEGIN_NAMESPACE_STD = nothing

const __END_NAMESPACE_STD = nothing

__USING_NAMESPACE_STD(name) = nothing

const __BEGIN_NAMESPACE_C99 = nothing

const __END_NAMESPACE_C99 = nothing

__USING_NAMESPACE_C99(name) = nothing

__bos(ptr) = __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > 1)

__bos0(ptr) = __builtin_object_size(ptr, 0)

# Skipping MacroDefinition: __always_inline __inline __attribute__ ( ( __always_inline__ ) )

const __attribute_artificial__ = nothing

# Skipping MacroDefinition: __warndecl ( name , msg ) extern void name ( void )

__warnattr(msg) = nothing

# Skipping MacroDefinition: __errordecl ( name , msg ) extern void name ( void )

const __flexarr = []

__ASMNAME2(prefix, cname) = (__STRING(prefix))(cname)

__ASMNAME(cname) = __ASMNAME2(__USER_LABEL_PREFIX__, cname)

# Skipping MacroDefinition: __REDIRECT ( name , proto , alias ) name proto __asm__ ( __ASMNAME ( # alias ) )

# Skipping MacroDefinition: __REDIRECT_NTH ( name , proto , alias ) name proto __asm__ ( __ASMNAME ( # alias ) ) __THROW

# Skipping MacroDefinition: __REDIRECT_NTHNL ( name , proto , alias ) name proto __asm__ ( __ASMNAME ( # alias ) ) __THROWNL

# Skipping MacroDefinition: __attribute_malloc__ __attribute__ ( ( __malloc__ ) )

__attribute_alloc_size__(params) = nothing

# Skipping MacroDefinition: __attribute_pure__ __attribute__ ( ( __pure__ ) )

# Skipping MacroDefinition: __attribute_const__ __attribute__ ( ( __const__ ) )

# Skipping MacroDefinition: __attribute_used__ __attribute__ ( ( __used__ ) )

# Skipping MacroDefinition: __attribute_noinline__ __attribute__ ( ( __noinline__ ) )

# Skipping MacroDefinition: __attribute_deprecated__ __attribute__ ( ( __deprecated__ ) )

__attribute_format_arg__(x) = __attribute__(__format_arg__(x))

__attribute_format_strfmon__(a, b) = __attribute__(__format__(__strfmon__, a, b))

__nonnull(params) = __attribute__(__nonnull__(params))

# Skipping MacroDefinition: __attribute_warn_unused_result__ __attribute__ ( ( __warn_unused_result__ ) )

const __wur = nothing

# Skipping MacroDefinition: __extern_inline extern __inline __attribute__ ( ( __gnu_inline__ ) )

# Skipping MacroDefinition: __restrict_arr __restrict

__glibc_unlikely(cond) = __builtin_expect(cond, 0)

__glibc_likely(cond) = __builtin_expect(cond, 1)

const __WORDSIZE = 64

__LDBL_REDIR1(name, proto, alias) = name(proto)

__LDBL_REDIR(name, proto) = name(proto)

__LDBL_REDIR1_NTH(name, proto, alias) = (name(proto))(__THROW)

__LDBL_REDIR_NTH(name, proto) = (name(proto))(__THROW)

__LDBL_REDIR_DECL(name) = nothing

__REDIRECT_LDBL(name, proto, alias) = __REDIRECT(name, proto, alias)

__REDIRECT_NTH_LDBL(name, proto, alias) = __REDIRECT_NTH(name, proto, alias)

const _BITS_TYPES_H = 1

const __S16_TYPE = Cshort

const __U16_TYPE = Cushort

const __S32_TYPE = Cint

const __U32_TYPE = Cuint

const __SLONGWORD_TYPE = Clong

const __ULONGWORD_TYPE = Culong

const __SQUAD_TYPE = Clong

const __UQUAD_TYPE = Culong

const __SWORD_TYPE = Clong

const __UWORD_TYPE = Culong

const __SLONG32_TYPE = Cint

const __ULONG32_TYPE = Cuint

const __S64_TYPE = Clong

const __U64_TYPE = Culong

# Skipping MacroDefinition: __STD_TYPE typedef

const _BITS_TYPESIZES_H = 1

const __DEV_T_TYPE = __UQUAD_TYPE

const __UID_T_TYPE = __U32_TYPE

const __GID_T_TYPE = __U32_TYPE

const __INO_T_TYPE = __ULONGWORD_TYPE

const __INO64_T_TYPE = __UQUAD_TYPE

const __MODE_T_TYPE = __U32_TYPE

const __NLINK_T_TYPE = __U32_TYPE

const __OFF_T_TYPE = __SLONGWORD_TYPE

const __OFF64_T_TYPE = __SQUAD_TYPE

const __PID_T_TYPE = __S32_TYPE

const __RLIM_T_TYPE = __ULONGWORD_TYPE

const __RLIM64_T_TYPE = __UQUAD_TYPE

const __BLKCNT_T_TYPE = __SLONGWORD_TYPE

const __BLKCNT64_T_TYPE = __SQUAD_TYPE

const __FSBLKCNT_T_TYPE = __ULONGWORD_TYPE

const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE

const __FSFILCNT_T_TYPE = __ULONGWORD_TYPE

const __FSFILCNT64_T_TYPE = __UQUAD_TYPE

const __FSWORD_T_TYPE = __SWORD_TYPE

const __ID_T_TYPE = __U32_TYPE

const __CLOCK_T_TYPE = __SLONGWORD_TYPE

const __TIME_T_TYPE = __SLONGWORD_TYPE

const __USECONDS_T_TYPE = __U32_TYPE

const __SUSECONDS_T_TYPE = __SLONGWORD_TYPE

const __DADDR_T_TYPE = __S32_TYPE

const __KEY_T_TYPE = __S32_TYPE

const __CLOCKID_T_TYPE = __S32_TYPE

const __TIMER_T_TYPE = Ptr{Cvoid}

const __BLKSIZE_T_TYPE = __S32_TYPE

# Skipping MacroDefinition: __FSID_T_TYPE struct { int __val [ 2 ] ; }

const __SSIZE_T_TYPE = __SWORD_TYPE

const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE

const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE

const __OFF_T_MATCHES_OFF64_T = 1

const __INO_T_MATCHES_INO64_T = 1

const __FD_SETSIZE = 1024

const __need_time_t = nothing

const __time_t_defined = 1

const __need_timeval = nothing

const _STRUCT_TIMEVAL = 1

const _SYS_SELECT_H = 1

__FDS_BITS(set) = (set->begin
            #= none:1 =#
            __fds_bits
        end)

# Skipping MacroDefinition: __FD_ZERO ( s ) do { unsigned int __i ; fd_set * __arr = ( s ) ; for ( __i = 0 ; __i < sizeof ( fd_set ) / sizeof ( __fd_mask ) ; ++ __i ) __FDS_BITS ( __arr ) [ __i ] = 0 ; } while ( 0 )

# Skipping MacroDefinition: __NFDBITS ( 8 * ( int ) sizeof ( __fd_mask ) )

__FD_ELT(d) = d ÷ __NFDBITS

__FD_MASK(d) = __fd_mask(1) << (d % __NFDBITS)

# Skipping MacroDefinition: __FD_SET ( d , s ) ( ( void ) ( __FDS_BITS ( s ) [ __FD_ELT ( d ) ] |= __FD_MASK ( d ) ) )

# Skipping MacroDefinition: __FD_CLR ( d , s ) ( ( void ) ( __FDS_BITS ( s ) [ __FD_ELT ( d ) ] &= ~ __FD_MASK ( d ) ) )

# Skipping MacroDefinition: __FD_ISSET ( d , s ) ( ( __FDS_BITS ( s ) [ __FD_ELT ( d ) ] & __FD_MASK ( d ) ) != 0 )

const _SIGSET_H_types = 1

# Skipping MacroDefinition: _SIGSET_NWORDS ( 1024 / ( 8 * sizeof ( unsigned long int ) ) )

const __sigset_t_defined = nothing

const __need_timespec = nothing

const __timespec_defined = 1

const __suseconds_t_defined = nothing

const FD_SETSIZE = __FD_SETSIZE

FD_SET(fd, fdsetp) = __FD_SET(fd, fdsetp)

FD_CLR(fd, fdsetp) = __FD_CLR(fd, fdsetp)

FD_ISSET(fd, fdsetp) = __FD_ISSET(fd, fdsetp)

FD_ZERO(fdsetp) = __FD_ZERO(fdsetp)

timerisset(tvp) = (tvp->begin
            #= none:1 =#
            tv_sec || (tvp->begin
                        #= none:1 =#
                        tv_usec
                    end)
        end)

timerclear(tvp) = (tvp->begin
            #= none:1 =#
            tv_sec = (tvp->begin
                        #= none:1 =#
                        tv_usec = 0
                    end)
        end)

# Skipping MacroDefinition: timeradd ( a , b , result ) do { ( result ) -> tv_sec = ( a ) -> tv_sec + ( b ) -> tv_sec ; ( result ) -> tv_usec = ( a ) -> tv_usec + ( b ) -> tv_usec ; if ( ( result ) -> tv_usec >= 1000000 ) { ++ ( result ) -> tv_sec ; ( result ) -> tv_usec -= 1000000 ; } } while ( 0 )

# Skipping MacroDefinition: timersub ( a , b , result ) do { ( result ) -> tv_sec = ( a ) -> tv_sec - ( b ) -> tv_sec ; ( result ) -> tv_usec = ( a ) -> tv_usec - ( b ) -> tv_usec ; if ( ( result ) -> tv_usec < 0 ) { -- ( result ) -> tv_sec ; ( result ) -> tv_usec += 1000000 ; } } while ( 0 )

const _LINUX_IOCTL_H = nothing

const _ASM_GENERIC_IOCTL_H = nothing

const _IOC_NRBITS = 8

const _IOC_TYPEBITS = 8

const _IOC_SIZEBITS = 14

const _IOC_DIRBITS = 2

const _IOC_NRMASK = 1 << _IOC_NRBITS - 1

const _IOC_TYPEMASK = 1 << _IOC_TYPEBITS - 1

const _IOC_SIZEMASK = 1 << _IOC_SIZEBITS - 1

const _IOC_DIRMASK = 1 << _IOC_DIRBITS - 1

const _IOC_NRSHIFT = 0

const _IOC_TYPESHIFT = _IOC_NRSHIFT + _IOC_NRBITS

const _IOC_SIZESHIFT = _IOC_TYPESHIFT + _IOC_TYPEBITS

const _IOC_DIRSHIFT = _IOC_SIZESHIFT + _IOC_SIZEBITS

const _IOC_NONE = Cuint(0)

const _IOC_WRITE = Cuint(1)

const _IOC_READ = Cuint(2)

_IOC(dir, type, nr, size) = ((dir << _IOC_DIRSHIFT | type << _IOC_TYPESHIFT) | nr << _IOC_NRSHIFT) | size << _IOC_SIZESHIFT

_IOC_TYPECHECK(t) = sizeof(t)

_IO(type, nr) = _IOC(_IOC_NONE, type, nr, 0)

_IOR(type, nr, size) = _IOC(_IOC_READ, type, nr, _IOC_TYPECHECK(size))

_IOW(type, nr, size) = _IOC(_IOC_WRITE, type, nr, _IOC_TYPECHECK(size))

_IOWR(type, nr, size) = _IOC(_IOC_READ | _IOC_WRITE, type, nr, _IOC_TYPECHECK(size))

_IOR_BAD(type, nr, size) = _IOC(_IOC_READ, type, nr, sizeof(size))

_IOW_BAD(type, nr, size) = _IOC(_IOC_WRITE, type, nr, sizeof(size))

_IOWR_BAD(type, nr, size) = _IOC(_IOC_READ | _IOC_WRITE, type, nr, sizeof(size))

_IOC_DIR(nr) = nr >> _IOC_DIRSHIFT & _IOC_DIRMASK

_IOC_TYPE(nr) = nr >> _IOC_TYPESHIFT & _IOC_TYPEMASK

_IOC_NR(nr) = nr >> _IOC_NRSHIFT & _IOC_NRMASK

_IOC_SIZE(nr) = nr >> _IOC_SIZESHIFT & _IOC_SIZEMASK

const IOC_IN = _IOC_WRITE << _IOC_DIRSHIFT

const IOC_OUT = _IOC_READ << _IOC_DIRSHIFT

const IOC_INOUT = (_IOC_WRITE | _IOC_READ) << _IOC_DIRSHIFT

const IOCSIZE_MASK = _IOC_SIZEMASK << _IOC_SIZESHIFT

const IOCSIZE_SHIFT = _IOC_SIZESHIFT

const _LINUX_TYPES_H = nothing

const _ASM_GENERIC_TYPES_H = nothing

const _ASM_GENERIC_INT_LL64_H = nothing

const __ASM_BITSPERLONG_H = nothing

const __BITS_PER_LONG = 64

const __ASM_GENERIC_BITS_PER_LONG = nothing

const _LINUX_POSIX_TYPES_H = nothing

const __ASM_POSIX_TYPES_H = nothing

const __ASM_GENERIC_POSIX_TYPES_H = nothing

const __bitwise__ = nothing

const __bitwise = __bitwise__

# Skipping MacroDefinition: __aligned_u64 __u64 __attribute__ ( ( aligned ( 8 ) ) )

# Skipping MacroDefinition: __aligned_be64 __be64 __attribute__ ( ( aligned ( 8 ) ) )

# Skipping MacroDefinition: __aligned_le64 __le64 __attribute__ ( ( aligned ( 8 ) ) )

const __V4L2_COMMON__ = nothing

const V4L2_SEL_TGT_CROP = 0x0000

const V4L2_SEL_TGT_CROP_DEFAULT = 0x0001

const V4L2_SEL_TGT_CROP_BOUNDS = 0x0002

const V4L2_SEL_TGT_NATIVE_SIZE = 0x0003

const V4L2_SEL_TGT_COMPOSE = 0x0100

const V4L2_SEL_TGT_COMPOSE_DEFAULT = 0x0101

const V4L2_SEL_TGT_COMPOSE_BOUNDS = 0x0102

const V4L2_SEL_TGT_COMPOSE_PADDED = 0x0103

const V4L2_SEL_TGT_CROP_ACTIVE = V4L2_SEL_TGT_CROP

const V4L2_SEL_TGT_COMPOSE_ACTIVE = V4L2_SEL_TGT_COMPOSE

const V4L2_SUBDEV_SEL_TGT_CROP_ACTUAL = V4L2_SEL_TGT_CROP

const V4L2_SUBDEV_SEL_TGT_COMPOSE_ACTUAL = V4L2_SEL_TGT_COMPOSE

const V4L2_SUBDEV_SEL_TGT_CROP_BOUNDS = V4L2_SEL_TGT_CROP_BOUNDS

const V4L2_SUBDEV_SEL_TGT_COMPOSE_BOUNDS = V4L2_SEL_TGT_COMPOSE_BOUNDS

const V4L2_SEL_FLAG_GE = 1 << 0

const V4L2_SEL_FLAG_LE = 1 << 1

const V4L2_SEL_FLAG_KEEP_CONFIG = 1 << 2

const V4L2_SUBDEV_SEL_FLAG_SIZE_GE = V4L2_SEL_FLAG_GE

const V4L2_SUBDEV_SEL_FLAG_SIZE_LE = V4L2_SEL_FLAG_LE

const V4L2_SUBDEV_SEL_FLAG_KEEP_CONFIG = V4L2_SEL_FLAG_KEEP_CONFIG

const __LINUX_V4L2_CONTROLS_H = nothing

const V4L2_CTRL_CLASS_USER = 0x00980000

const V4L2_CTRL_CLASS_MPEG = 0x00990000

const V4L2_CTRL_CLASS_CAMERA = 0x009a0000

const V4L2_CTRL_CLASS_FM_TX = 0x009b0000

const V4L2_CTRL_CLASS_FLASH = 0x009c0000

const V4L2_CTRL_CLASS_JPEG = 0x009d0000

const V4L2_CTRL_CLASS_IMAGE_SOURCE = 0x009e0000

const V4L2_CTRL_CLASS_IMAGE_PROC = 0x009f0000

const V4L2_CTRL_CLASS_DV = 0x00a00000

const V4L2_CTRL_CLASS_FM_RX = 0x00a10000

const V4L2_CTRL_CLASS_RF_TUNER = 0x00a20000

const V4L2_CTRL_CLASS_DETECT = 0x00a30000

const V4L2_CID_BASE = V4L2_CTRL_CLASS_USER | 0x0900

const V4L2_CID_USER_BASE = V4L2_CID_BASE

const V4L2_CID_USER_CLASS = V4L2_CTRL_CLASS_USER | 1

const V4L2_CID_BRIGHTNESS = V4L2_CID_BASE + 0

const V4L2_CID_CONTRAST = V4L2_CID_BASE + 1

const V4L2_CID_SATURATION = V4L2_CID_BASE + 2

const V4L2_CID_HUE = V4L2_CID_BASE + 3

const V4L2_CID_AUDIO_VOLUME = V4L2_CID_BASE + 5

const V4L2_CID_AUDIO_BALANCE = V4L2_CID_BASE + 6

const V4L2_CID_AUDIO_BASS = V4L2_CID_BASE + 7

const V4L2_CID_AUDIO_TREBLE = V4L2_CID_BASE + 8

const V4L2_CID_AUDIO_MUTE = V4L2_CID_BASE + 9

const V4L2_CID_AUDIO_LOUDNESS = V4L2_CID_BASE + 10

const V4L2_CID_BLACK_LEVEL = V4L2_CID_BASE + 11

const V4L2_CID_AUTO_WHITE_BALANCE = V4L2_CID_BASE + 12

const V4L2_CID_DO_WHITE_BALANCE = V4L2_CID_BASE + 13

const V4L2_CID_RED_BALANCE = V4L2_CID_BASE + 14

const V4L2_CID_BLUE_BALANCE = V4L2_CID_BASE + 15

const V4L2_CID_GAMMA = V4L2_CID_BASE + 16

const V4L2_CID_WHITENESS = V4L2_CID_GAMMA

const V4L2_CID_EXPOSURE = V4L2_CID_BASE + 17

const V4L2_CID_AUTOGAIN = V4L2_CID_BASE + 18

const V4L2_CID_GAIN = V4L2_CID_BASE + 19

const V4L2_CID_HFLIP = V4L2_CID_BASE + 20

const V4L2_CID_VFLIP = V4L2_CID_BASE + 21

const V4L2_CID_POWER_LINE_FREQUENCY = V4L2_CID_BASE + 24

const V4L2_CID_HUE_AUTO = V4L2_CID_BASE + 25

const V4L2_CID_WHITE_BALANCE_TEMPERATURE = V4L2_CID_BASE + 26

const V4L2_CID_SHARPNESS = V4L2_CID_BASE + 27

const V4L2_CID_BACKLIGHT_COMPENSATION = V4L2_CID_BASE + 28

const V4L2_CID_CHROMA_AGC = V4L2_CID_BASE + 29

const V4L2_CID_COLOR_KILLER = V4L2_CID_BASE + 30

const V4L2_CID_COLORFX = V4L2_CID_BASE + 31

const V4L2_CID_AUTOBRIGHTNESS = V4L2_CID_BASE + 32

const V4L2_CID_BAND_STOP_FILTER = V4L2_CID_BASE + 33

const V4L2_CID_ROTATE = V4L2_CID_BASE + 34

const V4L2_CID_BG_COLOR = V4L2_CID_BASE + 35

const V4L2_CID_CHROMA_GAIN = V4L2_CID_BASE + 36

const V4L2_CID_ILLUMINATORS_1 = V4L2_CID_BASE + 37

const V4L2_CID_ILLUMINATORS_2 = V4L2_CID_BASE + 38

const V4L2_CID_MIN_BUFFERS_FOR_CAPTURE = V4L2_CID_BASE + 39

const V4L2_CID_MIN_BUFFERS_FOR_OUTPUT = V4L2_CID_BASE + 40

const V4L2_CID_ALPHA_COMPONENT = V4L2_CID_BASE + 41

const V4L2_CID_COLORFX_CBCR = V4L2_CID_BASE + 42

const V4L2_CID_LASTP1 = V4L2_CID_BASE + 43

const V4L2_CID_USER_MEYE_BASE = V4L2_CID_USER_BASE + 0x1000

const V4L2_CID_USER_BTTV_BASE = V4L2_CID_USER_BASE + 0x1010

const V4L2_CID_USER_S2255_BASE = V4L2_CID_USER_BASE + 0x1030

const V4L2_CID_USER_SI476X_BASE = V4L2_CID_USER_BASE + 0x1040

const V4L2_CID_USER_TI_VPE_BASE = V4L2_CID_USER_BASE + 0x1050

const V4L2_CID_USER_SAA7134_BASE = V4L2_CID_USER_BASE + 0x1060

const V4L2_CID_USER_ADV7180_BASE = V4L2_CID_USER_BASE + 0x1070

const V4L2_CID_USER_TC358743_BASE = V4L2_CID_USER_BASE + 0x1080

const V4L2_CID_USER_MAX217X_BASE = V4L2_CID_USER_BASE + 0x1090

const V4L2_CID_USER_IMX_BASE = V4L2_CID_USER_BASE + 0x10b0

const V4L2_CID_MPEG_BASE = V4L2_CTRL_CLASS_MPEG | 0x0900

const V4L2_CID_MPEG_CLASS = V4L2_CTRL_CLASS_MPEG | 1

const V4L2_CID_MPEG_STREAM_TYPE = V4L2_CID_MPEG_BASE + 0

const V4L2_CID_MPEG_STREAM_PID_PMT = V4L2_CID_MPEG_BASE + 1

const V4L2_CID_MPEG_STREAM_PID_AUDIO = V4L2_CID_MPEG_BASE + 2

const V4L2_CID_MPEG_STREAM_PID_VIDEO = V4L2_CID_MPEG_BASE + 3

const V4L2_CID_MPEG_STREAM_PID_PCR = V4L2_CID_MPEG_BASE + 4

const V4L2_CID_MPEG_STREAM_PES_ID_AUDIO = V4L2_CID_MPEG_BASE + 5

const V4L2_CID_MPEG_STREAM_PES_ID_VIDEO = V4L2_CID_MPEG_BASE + 6

const V4L2_CID_MPEG_STREAM_VBI_FMT = V4L2_CID_MPEG_BASE + 7

const V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ = V4L2_CID_MPEG_BASE + 100

const V4L2_CID_MPEG_AUDIO_ENCODING = V4L2_CID_MPEG_BASE + 101

const V4L2_CID_MPEG_AUDIO_L1_BITRATE = V4L2_CID_MPEG_BASE + 102

const V4L2_CID_MPEG_AUDIO_L2_BITRATE = V4L2_CID_MPEG_BASE + 103

const V4L2_CID_MPEG_AUDIO_L3_BITRATE = V4L2_CID_MPEG_BASE + 104

const V4L2_CID_MPEG_AUDIO_MODE = V4L2_CID_MPEG_BASE + 105

const V4L2_CID_MPEG_AUDIO_MODE_EXTENSION = V4L2_CID_MPEG_BASE + 106

const V4L2_CID_MPEG_AUDIO_EMPHASIS = V4L2_CID_MPEG_BASE + 107

const V4L2_CID_MPEG_AUDIO_CRC = V4L2_CID_MPEG_BASE + 108

const V4L2_CID_MPEG_AUDIO_MUTE = V4L2_CID_MPEG_BASE + 109

const V4L2_CID_MPEG_AUDIO_AAC_BITRATE = V4L2_CID_MPEG_BASE + 110

const V4L2_CID_MPEG_AUDIO_AC3_BITRATE = V4L2_CID_MPEG_BASE + 111

const V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK = V4L2_CID_MPEG_BASE + 112

const V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK = V4L2_CID_MPEG_BASE + 113

const V4L2_CID_MPEG_VIDEO_ENCODING = V4L2_CID_MPEG_BASE + 200

const V4L2_CID_MPEG_VIDEO_ASPECT = V4L2_CID_MPEG_BASE + 201

const V4L2_CID_MPEG_VIDEO_B_FRAMES = V4L2_CID_MPEG_BASE + 202

const V4L2_CID_MPEG_VIDEO_GOP_SIZE = V4L2_CID_MPEG_BASE + 203

const V4L2_CID_MPEG_VIDEO_GOP_CLOSURE = V4L2_CID_MPEG_BASE + 204

const V4L2_CID_MPEG_VIDEO_PULLDOWN = V4L2_CID_MPEG_BASE + 205

const V4L2_CID_MPEG_VIDEO_BITRATE_MODE = V4L2_CID_MPEG_BASE + 206

const V4L2_CID_MPEG_VIDEO_BITRATE = V4L2_CID_MPEG_BASE + 207

const V4L2_CID_MPEG_VIDEO_BITRATE_PEAK = V4L2_CID_MPEG_BASE + 208

const V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION = V4L2_CID_MPEG_BASE + 209

const V4L2_CID_MPEG_VIDEO_MUTE = V4L2_CID_MPEG_BASE + 210

const V4L2_CID_MPEG_VIDEO_MUTE_YUV = V4L2_CID_MPEG_BASE + 211

const V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE = V4L2_CID_MPEG_BASE + 212

const V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER = V4L2_CID_MPEG_BASE + 213

const V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB = V4L2_CID_MPEG_BASE + 214

const V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE = V4L2_CID_MPEG_BASE + 215

const V4L2_CID_MPEG_VIDEO_HEADER_MODE = V4L2_CID_MPEG_BASE + 216

const V4L2_CID_MPEG_VIDEO_MAX_REF_PIC = V4L2_CID_MPEG_BASE + 217

const V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE = V4L2_CID_MPEG_BASE + 218

const V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES = V4L2_CID_MPEG_BASE + 219

const V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB = V4L2_CID_MPEG_BASE + 220

const V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE = V4L2_CID_MPEG_BASE + 221

const V4L2_CID_MPEG_VIDEO_VBV_SIZE = V4L2_CID_MPEG_BASE + 222

const V4L2_CID_MPEG_VIDEO_DEC_PTS = V4L2_CID_MPEG_BASE + 223

const V4L2_CID_MPEG_VIDEO_DEC_FRAME = V4L2_CID_MPEG_BASE + 224

const V4L2_CID_MPEG_VIDEO_VBV_DELAY = V4L2_CID_MPEG_BASE + 225

const V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER = V4L2_CID_MPEG_BASE + 226

const V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE = V4L2_CID_MPEG_BASE + 227

const V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE = V4L2_CID_MPEG_BASE + 228

const V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME = V4L2_CID_MPEG_BASE + 229

const V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP = V4L2_CID_MPEG_BASE + 300

const V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP = V4L2_CID_MPEG_BASE + 301

const V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP = V4L2_CID_MPEG_BASE + 302

const V4L2_CID_MPEG_VIDEO_H263_MIN_QP = V4L2_CID_MPEG_BASE + 303

const V4L2_CID_MPEG_VIDEO_H263_MAX_QP = V4L2_CID_MPEG_BASE + 304

const V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP = V4L2_CID_MPEG_BASE + 350

const V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP = V4L2_CID_MPEG_BASE + 351

const V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP = V4L2_CID_MPEG_BASE + 352

const V4L2_CID_MPEG_VIDEO_H264_MIN_QP = V4L2_CID_MPEG_BASE + 353

const V4L2_CID_MPEG_VIDEO_H264_MAX_QP = V4L2_CID_MPEG_BASE + 354

const V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM = V4L2_CID_MPEG_BASE + 355

const V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE = V4L2_CID_MPEG_BASE + 356

const V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE = V4L2_CID_MPEG_BASE + 357

const V4L2_CID_MPEG_VIDEO_H264_I_PERIOD = V4L2_CID_MPEG_BASE + 358

const V4L2_CID_MPEG_VIDEO_H264_LEVEL = V4L2_CID_MPEG_BASE + 359

const V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA = V4L2_CID_MPEG_BASE + 360

const V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA = V4L2_CID_MPEG_BASE + 361

const V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE = V4L2_CID_MPEG_BASE + 362

const V4L2_CID_MPEG_VIDEO_H264_PROFILE = V4L2_CID_MPEG_BASE + 363

const V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT = V4L2_CID_MPEG_BASE + 364

const V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH = V4L2_CID_MPEG_BASE + 365

const V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE = V4L2_CID_MPEG_BASE + 366

const V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC = V4L2_CID_MPEG_BASE + 367

const V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING = V4L2_CID_MPEG_BASE + 368

const V4L2_CID_MPEG_VIDEO_H264_SEI_FP_CURRENT_FRAME_0 = V4L2_CID_MPEG_BASE + 369

const V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE = V4L2_CID_MPEG_BASE + 370

const V4L2_CID_MPEG_VIDEO_H264_FMO = V4L2_CID_MPEG_BASE + 371

const V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE = V4L2_CID_MPEG_BASE + 372

const V4L2_CID_MPEG_VIDEO_H264_FMO_SLICE_GROUP = V4L2_CID_MPEG_BASE + 373

const V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_DIRECTION = V4L2_CID_MPEG_BASE + 374

const V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_RATE = V4L2_CID_MPEG_BASE + 375

const V4L2_CID_MPEG_VIDEO_H264_FMO_RUN_LENGTH = V4L2_CID_MPEG_BASE + 376

const V4L2_CID_MPEG_VIDEO_H264_ASO = V4L2_CID_MPEG_BASE + 377

const V4L2_CID_MPEG_VIDEO_H264_ASO_SLICE_ORDER = V4L2_CID_MPEG_BASE + 378

const V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING = V4L2_CID_MPEG_BASE + 379

const V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE = V4L2_CID_MPEG_BASE + 380

const V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER = V4L2_CID_MPEG_BASE + 381

const V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP = V4L2_CID_MPEG_BASE + 382

const V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP = V4L2_CID_MPEG_BASE + 400

const V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP = V4L2_CID_MPEG_BASE + 401

const V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP = V4L2_CID_MPEG_BASE + 402

const V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP = V4L2_CID_MPEG_BASE + 403

const V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP = V4L2_CID_MPEG_BASE + 404

const V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL = V4L2_CID_MPEG_BASE + 405

const V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE = V4L2_CID_MPEG_BASE + 406

const V4L2_CID_MPEG_VIDEO_MPEG4_QPEL = V4L2_CID_MPEG_BASE + 407

const V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS = V4L2_CID_MPEG_BASE + 500

const V4L2_CID_MPEG_VIDEO_VPX_IMD_DISABLE_4X4 = V4L2_CID_MPEG_BASE + 501

const V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES = V4L2_CID_MPEG_BASE + 502

const V4L2_CID_MPEG_VIDEO_VPX_FILTER_LEVEL = V4L2_CID_MPEG_BASE + 503

const V4L2_CID_MPEG_VIDEO_VPX_FILTER_SHARPNESS = V4L2_CID_MPEG_BASE + 504

const V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD = V4L2_CID_MPEG_BASE + 505

const V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL = V4L2_CID_MPEG_BASE + 506

const V4L2_CID_MPEG_VIDEO_VPX_MIN_QP = V4L2_CID_MPEG_BASE + 507

const V4L2_CID_MPEG_VIDEO_VPX_MAX_QP = V4L2_CID_MPEG_BASE + 508

const V4L2_CID_MPEG_VIDEO_VPX_I_FRAME_QP = V4L2_CID_MPEG_BASE + 509

const V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP = V4L2_CID_MPEG_BASE + 510

const V4L2_CID_MPEG_VIDEO_VP8_PROFILE = V4L2_CID_MPEG_BASE + 511

const V4L2_CID_MPEG_VIDEO_VPX_PROFILE = V4L2_CID_MPEG_VIDEO_VP8_PROFILE

const V4L2_CID_MPEG_VIDEO_VP9_PROFILE = V4L2_CID_MPEG_BASE + 512

const V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP = V4L2_CID_MPEG_BASE + 600

const V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP = V4L2_CID_MPEG_BASE + 601

const V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP = V4L2_CID_MPEG_BASE + 602

const V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP = V4L2_CID_MPEG_BASE + 603

const V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP = V4L2_CID_MPEG_BASE + 604

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP = V4L2_CID_MPEG_BASE + 605

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE = V4L2_CID_MPEG_BASE + 606

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER = V4L2_CID_MPEG_BASE + 607

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP = V4L2_CID_MPEG_BASE + 608

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP = V4L2_CID_MPEG_BASE + 609

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP = V4L2_CID_MPEG_BASE + 610

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP = V4L2_CID_MPEG_BASE + 611

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP = V4L2_CID_MPEG_BASE + 612

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP = V4L2_CID_MPEG_BASE + 613

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP = V4L2_CID_MPEG_BASE + 614

const V4L2_CID_MPEG_VIDEO_HEVC_PROFILE = V4L2_CID_MPEG_BASE + 615

const V4L2_CID_MPEG_VIDEO_HEVC_LEVEL = V4L2_CID_MPEG_BASE + 616

const V4L2_CID_MPEG_VIDEO_HEVC_FRAME_RATE_RESOLUTION = V4L2_CID_MPEG_BASE + 617

const V4L2_CID_MPEG_VIDEO_HEVC_TIER = V4L2_CID_MPEG_BASE + 618

const V4L2_CID_MPEG_VIDEO_HEVC_MAX_PARTITION_DEPTH = V4L2_CID_MPEG_BASE + 619

const V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE = V4L2_CID_MPEG_BASE + 620

const V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2 = V4L2_CID_MPEG_BASE + 621

const V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2 = V4L2_CID_MPEG_BASE + 622

const V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE = V4L2_CID_MPEG_BASE + 623

const V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD = V4L2_CID_MPEG_BASE + 624

const V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU = V4L2_CID_MPEG_BASE + 625

const V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED = V4L2_CID_MPEG_BASE + 626

const V4L2_CID_MPEG_VIDEO_HEVC_WAVEFRONT = V4L2_CID_MPEG_BASE + 627

const V4L2_CID_MPEG_VIDEO_HEVC_GENERAL_PB = V4L2_CID_MPEG_BASE + 628

const V4L2_CID_MPEG_VIDEO_HEVC_TEMPORAL_ID = V4L2_CID_MPEG_BASE + 629

const V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING = V4L2_CID_MPEG_BASE + 630

const V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1 = V4L2_CID_MPEG_BASE + 631

const V4L2_CID_MPEG_VIDEO_HEVC_INTRA_PU_SPLIT = V4L2_CID_MPEG_BASE + 632

const V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION = V4L2_CID_MPEG_BASE + 633

const V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE = V4L2_CID_MPEG_BASE + 634

const V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD = V4L2_CID_MPEG_BASE + 635

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR = V4L2_CID_MPEG_BASE + 636

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR = V4L2_CID_MPEG_BASE + 637

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR = V4L2_CID_MPEG_BASE + 638

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR = V4L2_CID_MPEG_BASE + 639

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR = V4L2_CID_MPEG_BASE + 640

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR = V4L2_CID_MPEG_BASE + 641

const V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR = V4L2_CID_MPEG_BASE + 642

const V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES = V4L2_CID_MPEG_BASE + 643

const V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR = V4L2_CID_MPEG_BASE + 644

const V4L2_CID_MPEG_CX2341X_BASE = V4L2_CTRL_CLASS_MPEG | 0x1000

const V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE = V4L2_CID_MPEG_CX2341X_BASE + 0

const V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER = V4L2_CID_MPEG_CX2341X_BASE + 1

const V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE = V4L2_CID_MPEG_CX2341X_BASE + 2

const V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE = V4L2_CID_MPEG_CX2341X_BASE + 3

const V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE = V4L2_CID_MPEG_CX2341X_BASE + 4

const V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER = V4L2_CID_MPEG_CX2341X_BASE + 5

const V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE = V4L2_CID_MPEG_CX2341X_BASE + 6

const V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM = V4L2_CID_MPEG_CX2341X_BASE + 7

const V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP = V4L2_CID_MPEG_CX2341X_BASE + 8

const V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM = V4L2_CID_MPEG_CX2341X_BASE + 9

const V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP = V4L2_CID_MPEG_CX2341X_BASE + 10

const V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS = V4L2_CID_MPEG_CX2341X_BASE + 11

const V4L2_CID_MPEG_MFC51_BASE = V4L2_CTRL_CLASS_MPEG | 0x1100

const V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY = V4L2_CID_MPEG_MFC51_BASE + 0

const V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE = V4L2_CID_MPEG_MFC51_BASE + 1

const V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE = V4L2_CID_MPEG_MFC51_BASE + 2

const V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE = V4L2_CID_MPEG_MFC51_BASE + 3

const V4L2_CID_MPEG_MFC51_VIDEO_PADDING = V4L2_CID_MPEG_MFC51_BASE + 4

const V4L2_CID_MPEG_MFC51_VIDEO_PADDING_YUV = V4L2_CID_MPEG_MFC51_BASE + 5

const V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT = V4L2_CID_MPEG_MFC51_BASE + 6

const V4L2_CID_MPEG_MFC51_VIDEO_RC_REACTION_COEFF = V4L2_CID_MPEG_MFC51_BASE + 7

const V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY = V4L2_CID_MPEG_MFC51_BASE + 50

const V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK = V4L2_CID_MPEG_MFC51_BASE + 51

const V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH = V4L2_CID_MPEG_MFC51_BASE + 52

const V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC = V4L2_CID_MPEG_MFC51_BASE + 53

const V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P = V4L2_CID_MPEG_MFC51_BASE + 54

const V4L2_CID_CAMERA_CLASS_BASE = V4L2_CTRL_CLASS_CAMERA | 0x0900

const V4L2_CID_CAMERA_CLASS = V4L2_CTRL_CLASS_CAMERA | 1

const V4L2_CID_EXPOSURE_AUTO = V4L2_CID_CAMERA_CLASS_BASE + 1

const V4L2_CID_EXPOSURE_ABSOLUTE = V4L2_CID_CAMERA_CLASS_BASE + 2

const V4L2_CID_EXPOSURE_AUTO_PRIORITY = V4L2_CID_CAMERA_CLASS_BASE + 3

const V4L2_CID_PAN_RELATIVE = V4L2_CID_CAMERA_CLASS_BASE + 4

const V4L2_CID_TILT_RELATIVE = V4L2_CID_CAMERA_CLASS_BASE + 5

const V4L2_CID_PAN_RESET = V4L2_CID_CAMERA_CLASS_BASE + 6

const V4L2_CID_TILT_RESET = V4L2_CID_CAMERA_CLASS_BASE + 7

const V4L2_CID_PAN_ABSOLUTE = V4L2_CID_CAMERA_CLASS_BASE + 8

const V4L2_CID_TILT_ABSOLUTE = V4L2_CID_CAMERA_CLASS_BASE + 9

const V4L2_CID_FOCUS_ABSOLUTE = V4L2_CID_CAMERA_CLASS_BASE + 10

const V4L2_CID_FOCUS_RELATIVE = V4L2_CID_CAMERA_CLASS_BASE + 11

const V4L2_CID_FOCUS_AUTO = V4L2_CID_CAMERA_CLASS_BASE + 12

const V4L2_CID_ZOOM_ABSOLUTE = V4L2_CID_CAMERA_CLASS_BASE + 13

const V4L2_CID_ZOOM_RELATIVE = V4L2_CID_CAMERA_CLASS_BASE + 14

const V4L2_CID_ZOOM_CONTINUOUS = V4L2_CID_CAMERA_CLASS_BASE + 15

const V4L2_CID_PRIVACY = V4L2_CID_CAMERA_CLASS_BASE + 16

const V4L2_CID_IRIS_ABSOLUTE = V4L2_CID_CAMERA_CLASS_BASE + 17

const V4L2_CID_IRIS_RELATIVE = V4L2_CID_CAMERA_CLASS_BASE + 18

const V4L2_CID_AUTO_EXPOSURE_BIAS = V4L2_CID_CAMERA_CLASS_BASE + 19

const V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE = V4L2_CID_CAMERA_CLASS_BASE + 20

const V4L2_CID_WIDE_DYNAMIC_RANGE = V4L2_CID_CAMERA_CLASS_BASE + 21

const V4L2_CID_IMAGE_STABILIZATION = V4L2_CID_CAMERA_CLASS_BASE + 22

const V4L2_CID_ISO_SENSITIVITY = V4L2_CID_CAMERA_CLASS_BASE + 23

const V4L2_CID_ISO_SENSITIVITY_AUTO = V4L2_CID_CAMERA_CLASS_BASE + 24

const V4L2_CID_EXPOSURE_METERING = V4L2_CID_CAMERA_CLASS_BASE + 25

const V4L2_CID_SCENE_MODE = V4L2_CID_CAMERA_CLASS_BASE + 26

const V4L2_CID_3A_LOCK = V4L2_CID_CAMERA_CLASS_BASE + 27

const V4L2_LOCK_EXPOSURE = 1 << 0

const V4L2_LOCK_WHITE_BALANCE = 1 << 1

const V4L2_LOCK_FOCUS = 1 << 2

const V4L2_CID_AUTO_FOCUS_START = V4L2_CID_CAMERA_CLASS_BASE + 28

const V4L2_CID_AUTO_FOCUS_STOP = V4L2_CID_CAMERA_CLASS_BASE + 29

const V4L2_CID_AUTO_FOCUS_STATUS = V4L2_CID_CAMERA_CLASS_BASE + 30

const V4L2_AUTO_FOCUS_STATUS_IDLE = 0 << 0

const V4L2_AUTO_FOCUS_STATUS_BUSY = 1 << 0

const V4L2_AUTO_FOCUS_STATUS_REACHED = 1 << 1

const V4L2_AUTO_FOCUS_STATUS_FAILED = 1 << 2

const V4L2_CID_AUTO_FOCUS_RANGE = V4L2_CID_CAMERA_CLASS_BASE + 31

const V4L2_CID_PAN_SPEED = V4L2_CID_CAMERA_CLASS_BASE + 32

const V4L2_CID_TILT_SPEED = V4L2_CID_CAMERA_CLASS_BASE + 33

const V4L2_CID_FM_TX_CLASS_BASE = V4L2_CTRL_CLASS_FM_TX | 0x0900

const V4L2_CID_FM_TX_CLASS = V4L2_CTRL_CLASS_FM_TX | 1

const V4L2_CID_RDS_TX_DEVIATION = V4L2_CID_FM_TX_CLASS_BASE + 1

const V4L2_CID_RDS_TX_PI = V4L2_CID_FM_TX_CLASS_BASE + 2

const V4L2_CID_RDS_TX_PTY = V4L2_CID_FM_TX_CLASS_BASE + 3

const V4L2_CID_RDS_TX_PS_NAME = V4L2_CID_FM_TX_CLASS_BASE + 5

const V4L2_CID_RDS_TX_RADIO_TEXT = V4L2_CID_FM_TX_CLASS_BASE + 6

const V4L2_CID_RDS_TX_MONO_STEREO = V4L2_CID_FM_TX_CLASS_BASE + 7

const V4L2_CID_RDS_TX_ARTIFICIAL_HEAD = V4L2_CID_FM_TX_CLASS_BASE + 8

const V4L2_CID_RDS_TX_COMPRESSED = V4L2_CID_FM_TX_CLASS_BASE + 9

const V4L2_CID_RDS_TX_DYNAMIC_PTY = V4L2_CID_FM_TX_CLASS_BASE + 10

const V4L2_CID_RDS_TX_TRAFFIC_ANNOUNCEMENT = V4L2_CID_FM_TX_CLASS_BASE + 11

const V4L2_CID_RDS_TX_TRAFFIC_PROGRAM = V4L2_CID_FM_TX_CLASS_BASE + 12

const V4L2_CID_RDS_TX_MUSIC_SPEECH = V4L2_CID_FM_TX_CLASS_BASE + 13

const V4L2_CID_RDS_TX_ALT_FREQS_ENABLE = V4L2_CID_FM_TX_CLASS_BASE + 14

const V4L2_CID_RDS_TX_ALT_FREQS = V4L2_CID_FM_TX_CLASS_BASE + 15

const V4L2_CID_AUDIO_LIMITER_ENABLED = V4L2_CID_FM_TX_CLASS_BASE + 64

const V4L2_CID_AUDIO_LIMITER_RELEASE_TIME = V4L2_CID_FM_TX_CLASS_BASE + 65

const V4L2_CID_AUDIO_LIMITER_DEVIATION = V4L2_CID_FM_TX_CLASS_BASE + 66

const V4L2_CID_AUDIO_COMPRESSION_ENABLED = V4L2_CID_FM_TX_CLASS_BASE + 80

const V4L2_CID_AUDIO_COMPRESSION_GAIN = V4L2_CID_FM_TX_CLASS_BASE + 81

const V4L2_CID_AUDIO_COMPRESSION_THRESHOLD = V4L2_CID_FM_TX_CLASS_BASE + 82

const V4L2_CID_AUDIO_COMPRESSION_ATTACK_TIME = V4L2_CID_FM_TX_CLASS_BASE + 83

const V4L2_CID_AUDIO_COMPRESSION_RELEASE_TIME = V4L2_CID_FM_TX_CLASS_BASE + 84

const V4L2_CID_PILOT_TONE_ENABLED = V4L2_CID_FM_TX_CLASS_BASE + 96

const V4L2_CID_PILOT_TONE_DEVIATION = V4L2_CID_FM_TX_CLASS_BASE + 97

const V4L2_CID_PILOT_TONE_FREQUENCY = V4L2_CID_FM_TX_CLASS_BASE + 98

const V4L2_CID_TUNE_PREEMPHASIS = V4L2_CID_FM_TX_CLASS_BASE + 112

const V4L2_CID_TUNE_POWER_LEVEL = V4L2_CID_FM_TX_CLASS_BASE + 113

const V4L2_CID_TUNE_ANTENNA_CAPACITOR = V4L2_CID_FM_TX_CLASS_BASE + 114

const V4L2_CID_FLASH_CLASS_BASE = V4L2_CTRL_CLASS_FLASH | 0x0900

const V4L2_CID_FLASH_CLASS = V4L2_CTRL_CLASS_FLASH | 1

const V4L2_CID_FLASH_LED_MODE = V4L2_CID_FLASH_CLASS_BASE + 1

const V4L2_CID_FLASH_STROBE_SOURCE = V4L2_CID_FLASH_CLASS_BASE + 2

const V4L2_CID_FLASH_STROBE = V4L2_CID_FLASH_CLASS_BASE + 3

const V4L2_CID_FLASH_STROBE_STOP = V4L2_CID_FLASH_CLASS_BASE + 4

const V4L2_CID_FLASH_STROBE_STATUS = V4L2_CID_FLASH_CLASS_BASE + 5

const V4L2_CID_FLASH_TIMEOUT = V4L2_CID_FLASH_CLASS_BASE + 6

const V4L2_CID_FLASH_INTENSITY = V4L2_CID_FLASH_CLASS_BASE + 7

const V4L2_CID_FLASH_TORCH_INTENSITY = V4L2_CID_FLASH_CLASS_BASE + 8

const V4L2_CID_FLASH_INDICATOR_INTENSITY = V4L2_CID_FLASH_CLASS_BASE + 9

const V4L2_CID_FLASH_FAULT = V4L2_CID_FLASH_CLASS_BASE + 10

const V4L2_FLASH_FAULT_OVER_VOLTAGE = 1 << 0

const V4L2_FLASH_FAULT_TIMEOUT = 1 << 1

const V4L2_FLASH_FAULT_OVER_TEMPERATURE = 1 << 2

const V4L2_FLASH_FAULT_SHORT_CIRCUIT = 1 << 3

const V4L2_FLASH_FAULT_OVER_CURRENT = 1 << 4

const V4L2_FLASH_FAULT_INDICATOR = 1 << 5

const V4L2_FLASH_FAULT_UNDER_VOLTAGE = 1 << 6

const V4L2_FLASH_FAULT_INPUT_VOLTAGE = 1 << 7

const V4L2_FLASH_FAULT_LED_OVER_TEMPERATURE = 1 << 8

const V4L2_CID_FLASH_CHARGE = V4L2_CID_FLASH_CLASS_BASE + 11

const V4L2_CID_FLASH_READY = V4L2_CID_FLASH_CLASS_BASE + 12

const V4L2_CID_JPEG_CLASS_BASE = V4L2_CTRL_CLASS_JPEG | 0x0900

const V4L2_CID_JPEG_CLASS = V4L2_CTRL_CLASS_JPEG | 1

const V4L2_CID_JPEG_CHROMA_SUBSAMPLING = V4L2_CID_JPEG_CLASS_BASE + 1

const V4L2_CID_JPEG_RESTART_INTERVAL = V4L2_CID_JPEG_CLASS_BASE + 2

const V4L2_CID_JPEG_COMPRESSION_QUALITY = V4L2_CID_JPEG_CLASS_BASE + 3

const V4L2_CID_JPEG_ACTIVE_MARKER = V4L2_CID_JPEG_CLASS_BASE + 4

const V4L2_JPEG_ACTIVE_MARKER_APP0 = 1 << 0

const V4L2_JPEG_ACTIVE_MARKER_APP1 = 1 << 1

const V4L2_JPEG_ACTIVE_MARKER_COM = 1 << 16

const V4L2_JPEG_ACTIVE_MARKER_DQT = 1 << 17

const V4L2_JPEG_ACTIVE_MARKER_DHT = 1 << 18

const V4L2_CID_IMAGE_SOURCE_CLASS_BASE = V4L2_CTRL_CLASS_IMAGE_SOURCE | 0x0900

const V4L2_CID_IMAGE_SOURCE_CLASS = V4L2_CTRL_CLASS_IMAGE_SOURCE | 1

const V4L2_CID_VBLANK = V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 1

const V4L2_CID_HBLANK = V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 2

const V4L2_CID_ANALOGUE_GAIN = V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 3

const V4L2_CID_TEST_PATTERN_RED = V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 4

const V4L2_CID_TEST_PATTERN_GREENR = V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 5

const V4L2_CID_TEST_PATTERN_BLUE = V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6

const V4L2_CID_TEST_PATTERN_GREENB = V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7

const V4L2_CID_IMAGE_PROC_CLASS_BASE = V4L2_CTRL_CLASS_IMAGE_PROC | 0x0900

const V4L2_CID_IMAGE_PROC_CLASS = V4L2_CTRL_CLASS_IMAGE_PROC | 1

const V4L2_CID_LINK_FREQ = V4L2_CID_IMAGE_PROC_CLASS_BASE + 1

const V4L2_CID_PIXEL_RATE = V4L2_CID_IMAGE_PROC_CLASS_BASE + 2

const V4L2_CID_TEST_PATTERN = V4L2_CID_IMAGE_PROC_CLASS_BASE + 3

const V4L2_CID_DEINTERLACING_MODE = V4L2_CID_IMAGE_PROC_CLASS_BASE + 4

const V4L2_CID_DIGITAL_GAIN = V4L2_CID_IMAGE_PROC_CLASS_BASE + 5

const V4L2_CID_DV_CLASS_BASE = V4L2_CTRL_CLASS_DV | 0x0900

const V4L2_CID_DV_CLASS = V4L2_CTRL_CLASS_DV | 1

const V4L2_CID_DV_TX_HOTPLUG = V4L2_CID_DV_CLASS_BASE + 1

const V4L2_CID_DV_TX_RXSENSE = V4L2_CID_DV_CLASS_BASE + 2

const V4L2_CID_DV_TX_EDID_PRESENT = V4L2_CID_DV_CLASS_BASE + 3

const V4L2_CID_DV_TX_MODE = V4L2_CID_DV_CLASS_BASE + 4

const V4L2_CID_DV_TX_RGB_RANGE = V4L2_CID_DV_CLASS_BASE + 5

const V4L2_CID_DV_TX_IT_CONTENT_TYPE = V4L2_CID_DV_CLASS_BASE + 6

const V4L2_CID_DV_RX_POWER_PRESENT = V4L2_CID_DV_CLASS_BASE + 100

const V4L2_CID_DV_RX_RGB_RANGE = V4L2_CID_DV_CLASS_BASE + 101

const V4L2_CID_DV_RX_IT_CONTENT_TYPE = V4L2_CID_DV_CLASS_BASE + 102

const V4L2_CID_FM_RX_CLASS_BASE = V4L2_CTRL_CLASS_FM_RX | 0x0900

const V4L2_CID_FM_RX_CLASS = V4L2_CTRL_CLASS_FM_RX | 1

const V4L2_CID_TUNE_DEEMPHASIS = V4L2_CID_FM_RX_CLASS_BASE + 1

const V4L2_CID_RDS_RECEPTION = V4L2_CID_FM_RX_CLASS_BASE + 2

const V4L2_CID_RDS_RX_PTY = V4L2_CID_FM_RX_CLASS_BASE + 3

const V4L2_CID_RDS_RX_PS_NAME = V4L2_CID_FM_RX_CLASS_BASE + 4

const V4L2_CID_RDS_RX_RADIO_TEXT = V4L2_CID_FM_RX_CLASS_BASE + 5

const V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT = V4L2_CID_FM_RX_CLASS_BASE + 6

const V4L2_CID_RDS_RX_TRAFFIC_PROGRAM = V4L2_CID_FM_RX_CLASS_BASE + 7

const V4L2_CID_RDS_RX_MUSIC_SPEECH = V4L2_CID_FM_RX_CLASS_BASE + 8

const V4L2_CID_RF_TUNER_CLASS_BASE = V4L2_CTRL_CLASS_RF_TUNER | 0x0900

const V4L2_CID_RF_TUNER_CLASS = V4L2_CTRL_CLASS_RF_TUNER | 1

const V4L2_CID_RF_TUNER_BANDWIDTH_AUTO = V4L2_CID_RF_TUNER_CLASS_BASE + 11

const V4L2_CID_RF_TUNER_BANDWIDTH = V4L2_CID_RF_TUNER_CLASS_BASE + 12

const V4L2_CID_RF_TUNER_RF_GAIN = V4L2_CID_RF_TUNER_CLASS_BASE + 32

const V4L2_CID_RF_TUNER_LNA_GAIN_AUTO = V4L2_CID_RF_TUNER_CLASS_BASE + 41

const V4L2_CID_RF_TUNER_LNA_GAIN = V4L2_CID_RF_TUNER_CLASS_BASE + 42

const V4L2_CID_RF_TUNER_MIXER_GAIN_AUTO = V4L2_CID_RF_TUNER_CLASS_BASE + 51

const V4L2_CID_RF_TUNER_MIXER_GAIN = V4L2_CID_RF_TUNER_CLASS_BASE + 52

const V4L2_CID_RF_TUNER_IF_GAIN_AUTO = V4L2_CID_RF_TUNER_CLASS_BASE + 61

const V4L2_CID_RF_TUNER_IF_GAIN = V4L2_CID_RF_TUNER_CLASS_BASE + 62

const V4L2_CID_RF_TUNER_PLL_LOCK = V4L2_CID_RF_TUNER_CLASS_BASE + 91

const V4L2_CID_DETECT_CLASS_BASE = V4L2_CTRL_CLASS_DETECT | 0x0900

const V4L2_CID_DETECT_CLASS = V4L2_CTRL_CLASS_DETECT | 1

const V4L2_CID_DETECT_MD_MODE = V4L2_CID_DETECT_CLASS_BASE + 1

const V4L2_CID_DETECT_MD_GLOBAL_THRESHOLD = V4L2_CID_DETECT_CLASS_BASE + 2

const V4L2_CID_DETECT_MD_THRESHOLD_GRID = V4L2_CID_DETECT_CLASS_BASE + 3

const V4L2_CID_DETECT_MD_REGION_GRID = V4L2_CID_DETECT_CLASS_BASE + 4

const VIDEO_MAX_FRAME = 32

const VIDEO_MAX_PLANES = 8

v4l2_fourcc(a, b, c, d) = ((__u32(a) | __u32(b) << 8) | __u32(c) << 16) | __u32(d) << 24

v4l2_fourcc_be(a, b, c, d) = v4l2_fourcc(a, b, c, d) | Cuint(1) << 31

const V4L2_FOURCC_CONV = "%c%c%c%c%s"

V4L2_FOURCC_CONV_ARGS(fourcc) = (fourcc & 0x7f, fourcc >> 8 & 0x7f, fourcc >> 16 & 0x7f, fourcc >> 24 & 0x7f, if fourcc & BIT(31)
            "-BE"
        else
            ""
        end)

V4L2_FIELD_HAS_TOP(field) = field == V4L2_FIELD_TOP || (field == V4L2_FIELD_INTERLACED || (field == V4L2_FIELD_INTERLACED_TB || (field == V4L2_FIELD_INTERLACED_BT || (field == V4L2_FIELD_SEQ_TB || field == V4L2_FIELD_SEQ_BT))))

V4L2_FIELD_HAS_BOTTOM(field) = field == V4L2_FIELD_BOTTOM || (field == V4L2_FIELD_INTERLACED || (field == V4L2_FIELD_INTERLACED_TB || (field == V4L2_FIELD_INTERLACED_BT || (field == V4L2_FIELD_SEQ_TB || field == V4L2_FIELD_SEQ_BT))))

V4L2_FIELD_HAS_BOTH(field) = field == V4L2_FIELD_INTERLACED || (field == V4L2_FIELD_INTERLACED_TB || (field == V4L2_FIELD_INTERLACED_BT || (field == V4L2_FIELD_SEQ_TB || field == V4L2_FIELD_SEQ_BT)))

V4L2_FIELD_HAS_T_OR_B(field) = field == V4L2_FIELD_BOTTOM || (field == V4L2_FIELD_TOP || field == V4L2_FIELD_ALTERNATE)

V4L2_FIELD_IS_INTERLACED(field) = field == V4L2_FIELD_INTERLACED || (field == V4L2_FIELD_INTERLACED_TB || field == V4L2_FIELD_INTERLACED_BT)

V4L2_FIELD_IS_SEQUENTIAL(field) = field == V4L2_FIELD_SEQ_TB || field == V4L2_FIELD_SEQ_BT

V4L2_TYPE_IS_MULTIPLANAR(type) = type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE || type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE

V4L2_TYPE_IS_OUTPUT(type) = type == V4L2_BUF_TYPE_VIDEO_OUTPUT || (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE || (type == V4L2_BUF_TYPE_VIDEO_OVERLAY || (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY || (type == V4L2_BUF_TYPE_VBI_OUTPUT || (type == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT || (type == V4L2_BUF_TYPE_SDR_OUTPUT || type == V4L2_BUF_TYPE_META_OUTPUT))))))

V4L2_TYPE_IS_CAPTURE(type) = !(V4L2_TYPE_IS_OUTPUT(type))

const V4L2_TUNER_ADC = V4L2_TUNER_SDR

V4L2_MAP_COLORSPACE_DEFAULT(is_sdtv, is_hdtv) = if is_sdtv
        V4L2_COLORSPACE_SMPTE170M
    else
        if is_hdtv
            V4L2_COLORSPACE_REC709
        else
            V4L2_COLORSPACE_SRGB
        end
    end

V4L2_MAP_XFER_FUNC_DEFAULT(colsp) = if colsp == V4L2_COLORSPACE_OPRGB
        V4L2_XFER_FUNC_OPRGB
    else
        if colsp == V4L2_COLORSPACE_SMPTE240M
            V4L2_XFER_FUNC_SMPTE240M
        else
            if colsp == V4L2_COLORSPACE_DCI_P3
                V4L2_XFER_FUNC_DCI_P3
            else
                if colsp == V4L2_COLORSPACE_RAW
                    V4L2_XFER_FUNC_NONE
                else
                    if colsp == V4L2_COLORSPACE_SRGB || colsp == V4L2_COLORSPACE_JPEG
                        V4L2_XFER_FUNC_SRGB
                    else
                        V4L2_XFER_FUNC_709
                    end
                end
            end
        end
    end

V4L2_MAP_YCBCR_ENC_DEFAULT(colsp) = if colsp == V4L2_COLORSPACE_REC709 || colsp == V4L2_COLORSPACE_DCI_P3
        V4L2_YCBCR_ENC_709
    else
        if colsp == V4L2_COLORSPACE_BT2020
            V4L2_YCBCR_ENC_BT2020
        else
            if colsp == V4L2_COLORSPACE_SMPTE240M
                V4L2_YCBCR_ENC_SMPTE240M
            else
                V4L2_YCBCR_ENC_601
            end
        end
    end

V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb_or_hsv, colsp, ycbcr_enc) = if is_rgb_or_hsv || colsp == V4L2_COLORSPACE_JPEG
        V4L2_QUANTIZATION_FULL_RANGE
    else
        V4L2_QUANTIZATION_LIM_RANGE
    end

const V4L2_COLORSPACE_ADOBERGB = V4L2_COLORSPACE_OPRGB

const V4L2_XFER_FUNC_ADOBERGB = V4L2_XFER_FUNC_OPRGB

const V4L2_CAP_VIDEO_CAPTURE = 0x00000001

const V4L2_CAP_VIDEO_OUTPUT = 0x00000002

const V4L2_CAP_VIDEO_OVERLAY = 0x00000004

const V4L2_CAP_VBI_CAPTURE = 0x00000010

const V4L2_CAP_VBI_OUTPUT = 0x00000020

const V4L2_CAP_SLICED_VBI_CAPTURE = 0x00000040

const V4L2_CAP_SLICED_VBI_OUTPUT = 0x00000080

const V4L2_CAP_RDS_CAPTURE = 0x00000100

const V4L2_CAP_VIDEO_OUTPUT_OVERLAY = 0x00000200

const V4L2_CAP_HW_FREQ_SEEK = 0x00000400

const V4L2_CAP_RDS_OUTPUT = 0x00000800

const V4L2_CAP_VIDEO_CAPTURE_MPLANE = 0x00001000

const V4L2_CAP_VIDEO_OUTPUT_MPLANE = 0x00002000

const V4L2_CAP_VIDEO_M2M_MPLANE = 0x00004000

const V4L2_CAP_VIDEO_M2M = 0x00008000

const V4L2_CAP_TUNER = 0x00010000

const V4L2_CAP_AUDIO = 0x00020000

const V4L2_CAP_RADIO = 0x00040000

const V4L2_CAP_MODULATOR = 0x00080000

const V4L2_CAP_SDR_CAPTURE = 0x00100000

const V4L2_CAP_EXT_PIX_FORMAT = 0x00200000

const V4L2_CAP_SDR_OUTPUT = 0x00400000

const V4L2_CAP_META_CAPTURE = 0x00800000

const V4L2_CAP_READWRITE = 0x01000000

const V4L2_CAP_ASYNCIO = 0x02000000

const V4L2_CAP_STREAMING = 0x04000000

const V4L2_CAP_META_OUTPUT = 0x08000000

const V4L2_CAP_TOUCH = 0x10000000

const V4L2_CAP_IO_MC = 0x20000000

const V4L2_CAP_DEVICE_CAPS = 0x80000000

const V4L2_PIX_FMT_RGB332 = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('B'), Cchar('1'))

const V4L2_PIX_FMT_RGB444 = v4l2_fourcc(Cchar('R'), Cchar('4'), Cchar('4'), Cchar('4'))

const V4L2_PIX_FMT_ARGB444 = v4l2_fourcc(Cchar('A'), Cchar('R'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_XRGB444 = v4l2_fourcc(Cchar('X'), Cchar('R'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_RGBA444 = v4l2_fourcc(Cchar('R'), Cchar('A'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_RGBX444 = v4l2_fourcc(Cchar('R'), Cchar('X'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_ABGR444 = v4l2_fourcc(Cchar('A'), Cchar('B'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_XBGR444 = v4l2_fourcc(Cchar('X'), Cchar('B'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_BGRA444 = v4l2_fourcc(Cchar('G'), Cchar('A'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_BGRX444 = v4l2_fourcc(Cchar('B'), Cchar('X'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_RGB555 = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('B'), Cchar('O'))

const V4L2_PIX_FMT_ARGB555 = v4l2_fourcc(Cchar('A'), Cchar('R'), Cchar('1'), Cchar('5'))

const V4L2_PIX_FMT_XRGB555 = v4l2_fourcc(Cchar('X'), Cchar('R'), Cchar('1'), Cchar('5'))

const V4L2_PIX_FMT_RGBA555 = v4l2_fourcc(Cchar('R'), Cchar('A'), Cchar('1'), Cchar('5'))

const V4L2_PIX_FMT_RGBX555 = v4l2_fourcc(Cchar('R'), Cchar('X'), Cchar('1'), Cchar('5'))

const V4L2_PIX_FMT_ABGR555 = v4l2_fourcc(Cchar('A'), Cchar('B'), Cchar('1'), Cchar('5'))

const V4L2_PIX_FMT_XBGR555 = v4l2_fourcc(Cchar('X'), Cchar('B'), Cchar('1'), Cchar('5'))

const V4L2_PIX_FMT_BGRA555 = v4l2_fourcc(Cchar('B'), Cchar('A'), Cchar('1'), Cchar('5'))

const V4L2_PIX_FMT_BGRX555 = v4l2_fourcc(Cchar('B'), Cchar('X'), Cchar('1'), Cchar('5'))

const V4L2_PIX_FMT_RGB565 = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('B'), Cchar('P'))

const V4L2_PIX_FMT_RGB555X = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('B'), Cchar('Q'))

const V4L2_PIX_FMT_ARGB555X = v4l2_fourcc_be(Cchar('A'), Cchar('R'), Cchar('1'), Cchar('5'))

const V4L2_PIX_FMT_XRGB555X = v4l2_fourcc_be(Cchar('X'), Cchar('R'), Cchar('1'), Cchar('5'))

const V4L2_PIX_FMT_RGB565X = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('B'), Cchar('R'))

const V4L2_PIX_FMT_BGR666 = v4l2_fourcc(Cchar('B'), Cchar('G'), Cchar('R'), Cchar('H'))

const V4L2_PIX_FMT_BGR24 = v4l2_fourcc(Cchar('B'), Cchar('G'), Cchar('R'), Cchar('3'))

const V4L2_PIX_FMT_RGB24 = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('B'), Cchar('3'))

const V4L2_PIX_FMT_BGR32 = v4l2_fourcc(Cchar('B'), Cchar('G'), Cchar('R'), Cchar('4'))

const V4L2_PIX_FMT_ABGR32 = v4l2_fourcc(Cchar('A'), Cchar('R'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_XBGR32 = v4l2_fourcc(Cchar('X'), Cchar('R'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_BGRA32 = v4l2_fourcc(Cchar('R'), Cchar('A'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_BGRX32 = v4l2_fourcc(Cchar('R'), Cchar('X'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_RGB32 = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('B'), Cchar('4'))

const V4L2_PIX_FMT_RGBA32 = v4l2_fourcc(Cchar('A'), Cchar('B'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_RGBX32 = v4l2_fourcc(Cchar('X'), Cchar('B'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_ARGB32 = v4l2_fourcc(Cchar('B'), Cchar('A'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_XRGB32 = v4l2_fourcc(Cchar('B'), Cchar('X'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_GREY = v4l2_fourcc(Cchar('G'), Cchar('R'), Cchar('E'), Cchar('Y'))

const V4L2_PIX_FMT_Y4 = v4l2_fourcc(Cchar('Y'), Cchar('0'), Cchar('4'), Cchar(' '))

const V4L2_PIX_FMT_Y6 = v4l2_fourcc(Cchar('Y'), Cchar('0'), Cchar('6'), Cchar(' '))

const V4L2_PIX_FMT_Y10 = v4l2_fourcc(Cchar('Y'), Cchar('1'), Cchar('0'), Cchar(' '))

const V4L2_PIX_FMT_Y12 = v4l2_fourcc(Cchar('Y'), Cchar('1'), Cchar('2'), Cchar(' '))

const V4L2_PIX_FMT_Y14 = v4l2_fourcc(Cchar('Y'), Cchar('1'), Cchar('4'), Cchar(' '))

const V4L2_PIX_FMT_Y16 = v4l2_fourcc(Cchar('Y'), Cchar('1'), Cchar('6'), Cchar(' '))

const V4L2_PIX_FMT_Y16_BE = v4l2_fourcc_be(Cchar('Y'), Cchar('1'), Cchar('6'), Cchar(' '))

const V4L2_PIX_FMT_Y10BPACK = v4l2_fourcc(Cchar('Y'), Cchar('1'), Cchar('0'), Cchar('B'))

const V4L2_PIX_FMT_Y10P = v4l2_fourcc(Cchar('Y'), Cchar('1'), Cchar('0'), Cchar('P'))

const V4L2_PIX_FMT_Y12P = v4l2_fourcc(Cchar('Y'), Cchar('1'), Cchar('2'), Cchar('P'))

const V4L2_PIX_FMT_Y14P = v4l2_fourcc(Cchar('Y'), Cchar('1'), Cchar('4'), Cchar('P'))

const V4L2_PIX_FMT_PAL8 = v4l2_fourcc(Cchar('P'), Cchar('A'), Cchar('L'), Cchar('8'))

const V4L2_PIX_FMT_UV8 = v4l2_fourcc(Cchar('U'), Cchar('V'), Cchar('8'), Cchar(' '))

const V4L2_PIX_FMT_YUYV = v4l2_fourcc(Cchar('Y'), Cchar('U'), Cchar('Y'), Cchar('V'))

const V4L2_PIX_FMT_YYUV = v4l2_fourcc(Cchar('Y'), Cchar('Y'), Cchar('U'), Cchar('V'))

const V4L2_PIX_FMT_YVYU = v4l2_fourcc(Cchar('Y'), Cchar('V'), Cchar('Y'), Cchar('U'))

const V4L2_PIX_FMT_UYVY = v4l2_fourcc(Cchar('U'), Cchar('Y'), Cchar('V'), Cchar('Y'))

const V4L2_PIX_FMT_VYUY = v4l2_fourcc(Cchar('V'), Cchar('Y'), Cchar('U'), Cchar('Y'))

const V4L2_PIX_FMT_Y41P = v4l2_fourcc(Cchar('Y'), Cchar('4'), Cchar('1'), Cchar('P'))

const V4L2_PIX_FMT_YUV444 = v4l2_fourcc(Cchar('Y'), Cchar('4'), Cchar('4'), Cchar('4'))

const V4L2_PIX_FMT_YUV555 = v4l2_fourcc(Cchar('Y'), Cchar('U'), Cchar('V'), Cchar('O'))

const V4L2_PIX_FMT_YUV565 = v4l2_fourcc(Cchar('Y'), Cchar('U'), Cchar('V'), Cchar('P'))

const V4L2_PIX_FMT_YUV24 = v4l2_fourcc(Cchar('Y'), Cchar('U'), Cchar('V'), Cchar('3'))

const V4L2_PIX_FMT_YUV32 = v4l2_fourcc(Cchar('Y'), Cchar('U'), Cchar('V'), Cchar('4'))

const V4L2_PIX_FMT_AYUV32 = v4l2_fourcc(Cchar('A'), Cchar('Y'), Cchar('U'), Cchar('V'))

const V4L2_PIX_FMT_XYUV32 = v4l2_fourcc(Cchar('X'), Cchar('Y'), Cchar('U'), Cchar('V'))

const V4L2_PIX_FMT_VUYA32 = v4l2_fourcc(Cchar('V'), Cchar('U'), Cchar('Y'), Cchar('A'))

const V4L2_PIX_FMT_VUYX32 = v4l2_fourcc(Cchar('V'), Cchar('U'), Cchar('Y'), Cchar('X'))

const V4L2_PIX_FMT_M420 = v4l2_fourcc(Cchar('M'), Cchar('4'), Cchar('2'), Cchar('0'))

const V4L2_PIX_FMT_NV12 = v4l2_fourcc(Cchar('N'), Cchar('V'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_NV21 = v4l2_fourcc(Cchar('N'), Cchar('V'), Cchar('2'), Cchar('1'))

const V4L2_PIX_FMT_NV16 = v4l2_fourcc(Cchar('N'), Cchar('V'), Cchar('1'), Cchar('6'))

const V4L2_PIX_FMT_NV61 = v4l2_fourcc(Cchar('N'), Cchar('V'), Cchar('6'), Cchar('1'))

const V4L2_PIX_FMT_NV24 = v4l2_fourcc(Cchar('N'), Cchar('V'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_NV42 = v4l2_fourcc(Cchar('N'), Cchar('V'), Cchar('4'), Cchar('2'))

const V4L2_PIX_FMT_HM12 = v4l2_fourcc(Cchar('H'), Cchar('M'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_NV12M = v4l2_fourcc(Cchar('N'), Cchar('M'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_NV21M = v4l2_fourcc(Cchar('N'), Cchar('M'), Cchar('2'), Cchar('1'))

const V4L2_PIX_FMT_NV16M = v4l2_fourcc(Cchar('N'), Cchar('M'), Cchar('1'), Cchar('6'))

const V4L2_PIX_FMT_NV61M = v4l2_fourcc(Cchar('N'), Cchar('M'), Cchar('6'), Cchar('1'))

const V4L2_PIX_FMT_NV12MT = v4l2_fourcc(Cchar('T'), Cchar('M'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_NV12MT_16X16 = v4l2_fourcc(Cchar('V'), Cchar('M'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_YUV410 = v4l2_fourcc(Cchar('Y'), Cchar('U'), Cchar('V'), Cchar('9'))

const V4L2_PIX_FMT_YVU410 = v4l2_fourcc(Cchar('Y'), Cchar('V'), Cchar('U'), Cchar('9'))

const V4L2_PIX_FMT_YUV411P = v4l2_fourcc(Cchar('4'), Cchar('1'), Cchar('1'), Cchar('P'))

const V4L2_PIX_FMT_YUV420 = v4l2_fourcc(Cchar('Y'), Cchar('U'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_YVU420 = v4l2_fourcc(Cchar('Y'), Cchar('V'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_YUV422P = v4l2_fourcc(Cchar('4'), Cchar('2'), Cchar('2'), Cchar('P'))

const V4L2_PIX_FMT_YUV420M = v4l2_fourcc(Cchar('Y'), Cchar('M'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_YVU420M = v4l2_fourcc(Cchar('Y'), Cchar('M'), Cchar('2'), Cchar('1'))

const V4L2_PIX_FMT_YUV422M = v4l2_fourcc(Cchar('Y'), Cchar('M'), Cchar('1'), Cchar('6'))

const V4L2_PIX_FMT_YVU422M = v4l2_fourcc(Cchar('Y'), Cchar('M'), Cchar('6'), Cchar('1'))

const V4L2_PIX_FMT_YUV444M = v4l2_fourcc(Cchar('Y'), Cchar('M'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_YVU444M = v4l2_fourcc(Cchar('Y'), Cchar('M'), Cchar('4'), Cchar('2'))

const V4L2_PIX_FMT_SBGGR8 = v4l2_fourcc(Cchar('B'), Cchar('A'), Cchar('8'), Cchar('1'))

const V4L2_PIX_FMT_SGBRG8 = v4l2_fourcc(Cchar('G'), Cchar('B'), Cchar('R'), Cchar('G'))

const V4L2_PIX_FMT_SGRBG8 = v4l2_fourcc(Cchar('G'), Cchar('R'), Cchar('B'), Cchar('G'))

const V4L2_PIX_FMT_SRGGB8 = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('G'), Cchar('B'))

const V4L2_PIX_FMT_SBGGR10 = v4l2_fourcc(Cchar('B'), Cchar('G'), Cchar('1'), Cchar('0'))

const V4L2_PIX_FMT_SGBRG10 = v4l2_fourcc(Cchar('G'), Cchar('B'), Cchar('1'), Cchar('0'))

const V4L2_PIX_FMT_SGRBG10 = v4l2_fourcc(Cchar('B'), Cchar('A'), Cchar('1'), Cchar('0'))

const V4L2_PIX_FMT_SRGGB10 = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('1'), Cchar('0'))

const V4L2_PIX_FMT_SBGGR10P = v4l2_fourcc(Cchar('p'), Cchar('B'), Cchar('A'), Cchar('A'))

const V4L2_PIX_FMT_SGBRG10P = v4l2_fourcc(Cchar('p'), Cchar('G'), Cchar('A'), Cchar('A'))

const V4L2_PIX_FMT_SGRBG10P = v4l2_fourcc(Cchar('p'), Cchar('g'), Cchar('A'), Cchar('A'))

const V4L2_PIX_FMT_SRGGB10P = v4l2_fourcc(Cchar('p'), Cchar('R'), Cchar('A'), Cchar('A'))

const V4L2_PIX_FMT_SBGGR10ALAW8 = v4l2_fourcc(Cchar('a'), Cchar('B'), Cchar('A'), Cchar('8'))

const V4L2_PIX_FMT_SGBRG10ALAW8 = v4l2_fourcc(Cchar('a'), Cchar('G'), Cchar('A'), Cchar('8'))

const V4L2_PIX_FMT_SGRBG10ALAW8 = v4l2_fourcc(Cchar('a'), Cchar('g'), Cchar('A'), Cchar('8'))

const V4L2_PIX_FMT_SRGGB10ALAW8 = v4l2_fourcc(Cchar('a'), Cchar('R'), Cchar('A'), Cchar('8'))

const V4L2_PIX_FMT_SBGGR10DPCM8 = v4l2_fourcc(Cchar('b'), Cchar('B'), Cchar('A'), Cchar('8'))

const V4L2_PIX_FMT_SGBRG10DPCM8 = v4l2_fourcc(Cchar('b'), Cchar('G'), Cchar('A'), Cchar('8'))

const V4L2_PIX_FMT_SGRBG10DPCM8 = v4l2_fourcc(Cchar('B'), Cchar('D'), Cchar('1'), Cchar('0'))

const V4L2_PIX_FMT_SRGGB10DPCM8 = v4l2_fourcc(Cchar('b'), Cchar('R'), Cchar('A'), Cchar('8'))

const V4L2_PIX_FMT_SBGGR12 = v4l2_fourcc(Cchar('B'), Cchar('G'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_SGBRG12 = v4l2_fourcc(Cchar('G'), Cchar('B'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_SGRBG12 = v4l2_fourcc(Cchar('B'), Cchar('A'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_SRGGB12 = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_SBGGR12P = v4l2_fourcc(Cchar('p'), Cchar('B'), Cchar('C'), Cchar('C'))

const V4L2_PIX_FMT_SGBRG12P = v4l2_fourcc(Cchar('p'), Cchar('G'), Cchar('C'), Cchar('C'))

const V4L2_PIX_FMT_SGRBG12P = v4l2_fourcc(Cchar('p'), Cchar('g'), Cchar('C'), Cchar('C'))

const V4L2_PIX_FMT_SRGGB12P = v4l2_fourcc(Cchar('p'), Cchar('R'), Cchar('C'), Cchar('C'))

const V4L2_PIX_FMT_SBGGR14 = v4l2_fourcc(Cchar('B'), Cchar('G'), Cchar('1'), Cchar('4'))

const V4L2_PIX_FMT_SGBRG14 = v4l2_fourcc(Cchar('G'), Cchar('B'), Cchar('1'), Cchar('4'))

const V4L2_PIX_FMT_SGRBG14 = v4l2_fourcc(Cchar('G'), Cchar('R'), Cchar('1'), Cchar('4'))

const V4L2_PIX_FMT_SRGGB14 = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('1'), Cchar('4'))

const V4L2_PIX_FMT_SBGGR14P = v4l2_fourcc(Cchar('p'), Cchar('B'), Cchar('E'), Cchar('E'))

const V4L2_PIX_FMT_SGBRG14P = v4l2_fourcc(Cchar('p'), Cchar('G'), Cchar('E'), Cchar('E'))

const V4L2_PIX_FMT_SGRBG14P = v4l2_fourcc(Cchar('p'), Cchar('g'), Cchar('E'), Cchar('E'))

const V4L2_PIX_FMT_SRGGB14P = v4l2_fourcc(Cchar('p'), Cchar('R'), Cchar('E'), Cchar('E'))

const V4L2_PIX_FMT_SBGGR16 = v4l2_fourcc(Cchar('B'), Cchar('Y'), Cchar('R'), Cchar('2'))

const V4L2_PIX_FMT_SGBRG16 = v4l2_fourcc(Cchar('G'), Cchar('B'), Cchar('1'), Cchar('6'))

const V4L2_PIX_FMT_SGRBG16 = v4l2_fourcc(Cchar('G'), Cchar('R'), Cchar('1'), Cchar('6'))

const V4L2_PIX_FMT_SRGGB16 = v4l2_fourcc(Cchar('R'), Cchar('G'), Cchar('1'), Cchar('6'))

const V4L2_PIX_FMT_HSV24 = v4l2_fourcc(Cchar('H'), Cchar('S'), Cchar('V'), Cchar('3'))

const V4L2_PIX_FMT_HSV32 = v4l2_fourcc(Cchar('H'), Cchar('S'), Cchar('V'), Cchar('4'))

const V4L2_PIX_FMT_MJPEG = v4l2_fourcc(Cchar('M'), Cchar('J'), Cchar('P'), Cchar('G'))

const V4L2_PIX_FMT_JPEG = v4l2_fourcc(Cchar('J'), Cchar('P'), Cchar('E'), Cchar('G'))

const V4L2_PIX_FMT_DV = v4l2_fourcc(Cchar('d'), Cchar('v'), Cchar('s'), Cchar('d'))

const V4L2_PIX_FMT_MPEG = v4l2_fourcc(Cchar('M'), Cchar('P'), Cchar('E'), Cchar('G'))

const V4L2_PIX_FMT_H264 = v4l2_fourcc(Cchar('H'), Cchar('2'), Cchar('6'), Cchar('4'))

const V4L2_PIX_FMT_H264_NO_SC = v4l2_fourcc(Cchar('A'), Cchar('V'), Cchar('C'), Cchar('1'))

const V4L2_PIX_FMT_H264_MVC = v4l2_fourcc(Cchar('M'), Cchar('2'), Cchar('6'), Cchar('4'))

const V4L2_PIX_FMT_H263 = v4l2_fourcc(Cchar('H'), Cchar('2'), Cchar('6'), Cchar('3'))

const V4L2_PIX_FMT_MPEG1 = v4l2_fourcc(Cchar('M'), Cchar('P'), Cchar('G'), Cchar('1'))

const V4L2_PIX_FMT_MPEG2 = v4l2_fourcc(Cchar('M'), Cchar('P'), Cchar('G'), Cchar('2'))

const V4L2_PIX_FMT_MPEG2_SLICE = v4l2_fourcc(Cchar('M'), Cchar('G'), Cchar('2'), Cchar('S'))

const V4L2_PIX_FMT_MPEG4 = v4l2_fourcc(Cchar('M'), Cchar('P'), Cchar('G'), Cchar('4'))

const V4L2_PIX_FMT_XVID = v4l2_fourcc(Cchar('X'), Cchar('V'), Cchar('I'), Cchar('D'))

const V4L2_PIX_FMT_VC1_ANNEX_G = v4l2_fourcc(Cchar('V'), Cchar('C'), Cchar('1'), Cchar('G'))

const V4L2_PIX_FMT_VC1_ANNEX_L = v4l2_fourcc(Cchar('V'), Cchar('C'), Cchar('1'), Cchar('L'))

const V4L2_PIX_FMT_VP8 = v4l2_fourcc(Cchar('V'), Cchar('P'), Cchar('8'), Cchar('0'))

const V4L2_PIX_FMT_VP8_FRAME = v4l2_fourcc(Cchar('V'), Cchar('P'), Cchar('8'), Cchar('F'))

const V4L2_PIX_FMT_VP9 = v4l2_fourcc(Cchar('V'), Cchar('P'), Cchar('9'), Cchar('0'))

const V4L2_PIX_FMT_HEVC = v4l2_fourcc(Cchar('H'), Cchar('E'), Cchar('V'), Cchar('C'))

const V4L2_PIX_FMT_FWHT = v4l2_fourcc(Cchar('F'), Cchar('W'), Cchar('H'), Cchar('T'))

const V4L2_PIX_FMT_FWHT_STATELESS = v4l2_fourcc(Cchar('S'), Cchar('F'), Cchar('W'), Cchar('H'))

const V4L2_PIX_FMT_H264_SLICE = v4l2_fourcc(Cchar('S'), Cchar('2'), Cchar('6'), Cchar('4'))

const V4L2_PIX_FMT_CPIA1 = v4l2_fourcc(Cchar('C'), Cchar('P'), Cchar('I'), Cchar('A'))

const V4L2_PIX_FMT_WNVA = v4l2_fourcc(Cchar('W'), Cchar('N'), Cchar('V'), Cchar('A'))

const V4L2_PIX_FMT_SN9C10X = v4l2_fourcc(Cchar('S'), Cchar('9'), Cchar('1'), Cchar('0'))

const V4L2_PIX_FMT_SN9C20X_I420 = v4l2_fourcc(Cchar('S'), Cchar('9'), Cchar('2'), Cchar('0'))

const V4L2_PIX_FMT_PWC1 = v4l2_fourcc(Cchar('P'), Cchar('W'), Cchar('C'), Cchar('1'))

const V4L2_PIX_FMT_PWC2 = v4l2_fourcc(Cchar('P'), Cchar('W'), Cchar('C'), Cchar('2'))

const V4L2_PIX_FMT_ET61X251 = v4l2_fourcc(Cchar('E'), Cchar('6'), Cchar('2'), Cchar('5'))

const V4L2_PIX_FMT_SPCA501 = v4l2_fourcc(Cchar('S'), Cchar('5'), Cchar('0'), Cchar('1'))

const V4L2_PIX_FMT_SPCA505 = v4l2_fourcc(Cchar('S'), Cchar('5'), Cchar('0'), Cchar('5'))

const V4L2_PIX_FMT_SPCA508 = v4l2_fourcc(Cchar('S'), Cchar('5'), Cchar('0'), Cchar('8'))

const V4L2_PIX_FMT_SPCA561 = v4l2_fourcc(Cchar('S'), Cchar('5'), Cchar('6'), Cchar('1'))

const V4L2_PIX_FMT_PAC207 = v4l2_fourcc(Cchar('P'), Cchar('2'), Cchar('0'), Cchar('7'))

const V4L2_PIX_FMT_MR97310A = v4l2_fourcc(Cchar('M'), Cchar('3'), Cchar('1'), Cchar('0'))

const V4L2_PIX_FMT_JL2005BCD = v4l2_fourcc(Cchar('J'), Cchar('L'), Cchar('2'), Cchar('0'))

const V4L2_PIX_FMT_SN9C2028 = v4l2_fourcc(Cchar('S'), Cchar('O'), Cchar('N'), Cchar('X'))

const V4L2_PIX_FMT_SQ905C = v4l2_fourcc(Cchar('9'), Cchar('0'), Cchar('5'), Cchar('C'))

const V4L2_PIX_FMT_PJPG = v4l2_fourcc(Cchar('P'), Cchar('J'), Cchar('P'), Cchar('G'))

const V4L2_PIX_FMT_OV511 = v4l2_fourcc(Cchar('O'), Cchar('5'), Cchar('1'), Cchar('1'))

const V4L2_PIX_FMT_OV518 = v4l2_fourcc(Cchar('O'), Cchar('5'), Cchar('1'), Cchar('8'))

const V4L2_PIX_FMT_STV0680 = v4l2_fourcc(Cchar('S'), Cchar('6'), Cchar('8'), Cchar('0'))

const V4L2_PIX_FMT_TM6000 = v4l2_fourcc(Cchar('T'), Cchar('M'), Cchar('6'), Cchar('0'))

const V4L2_PIX_FMT_CIT_YYVYUY = v4l2_fourcc(Cchar('C'), Cchar('I'), Cchar('T'), Cchar('V'))

const V4L2_PIX_FMT_KONICA420 = v4l2_fourcc(Cchar('K'), Cchar('O'), Cchar('N'), Cchar('I'))

const V4L2_PIX_FMT_JPGL = v4l2_fourcc(Cchar('J'), Cchar('P'), Cchar('G'), Cchar('L'))

const V4L2_PIX_FMT_SE401 = v4l2_fourcc(Cchar('S'), Cchar('4'), Cchar('0'), Cchar('1'))

const V4L2_PIX_FMT_S5C_UYVY_JPG = v4l2_fourcc(Cchar('S'), Cchar('5'), Cchar('C'), Cchar('I'))

const V4L2_PIX_FMT_Y8I = v4l2_fourcc(Cchar('Y'), Cchar('8'), Cchar('I'), Cchar(' '))

const V4L2_PIX_FMT_Y12I = v4l2_fourcc(Cchar('Y'), Cchar('1'), Cchar('2'), Cchar('I'))

const V4L2_PIX_FMT_Z16 = v4l2_fourcc(Cchar('Z'), Cchar('1'), Cchar('6'), Cchar(' '))

const V4L2_PIX_FMT_MT21C = v4l2_fourcc(Cchar('M'), Cchar('T'), Cchar('2'), Cchar('1'))

const V4L2_PIX_FMT_INZI = v4l2_fourcc(Cchar('I'), Cchar('N'), Cchar('Z'), Cchar('I'))

const V4L2_PIX_FMT_SUNXI_TILED_NV12 = v4l2_fourcc(Cchar('S'), Cchar('T'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_CNF4 = v4l2_fourcc(Cchar('C'), Cchar('N'), Cchar('F'), Cchar('4'))

const V4L2_PIX_FMT_HI240 = v4l2_fourcc(Cchar('H'), Cchar('I'), Cchar('2'), Cchar('4'))

const V4L2_PIX_FMT_NV12_COL128 = v4l2_fourcc(Cchar('N'), Cchar('C'), Cchar('1'), Cchar('2'))

const V4L2_PIX_FMT_NV12_10_COL128 = v4l2_fourcc(Cchar('N'), Cchar('C'), Cchar('3'), Cchar('0'))

const V4L2_PIX_FMT_IPU3_SBGGR10 = v4l2_fourcc(Cchar('i'), Cchar('p'), Cchar('3'), Cchar('b'))

const V4L2_PIX_FMT_IPU3_SGBRG10 = v4l2_fourcc(Cchar('i'), Cchar('p'), Cchar('3'), Cchar('g'))

const V4L2_PIX_FMT_IPU3_SGRBG10 = v4l2_fourcc(Cchar('i'), Cchar('p'), Cchar('3'), Cchar('G'))

const V4L2_PIX_FMT_IPU3_SRGGB10 = v4l2_fourcc(Cchar('i'), Cchar('p'), Cchar('3'), Cchar('r'))

const V4L2_SDR_FMT_CU8 = v4l2_fourcc(Cchar('C'), Cchar('U'), Cchar('0'), Cchar('8'))

const V4L2_SDR_FMT_CU16LE = v4l2_fourcc(Cchar('C'), Cchar('U'), Cchar('1'), Cchar('6'))

const V4L2_SDR_FMT_CS8 = v4l2_fourcc(Cchar('C'), Cchar('S'), Cchar('0'), Cchar('8'))

const V4L2_SDR_FMT_CS14LE = v4l2_fourcc(Cchar('C'), Cchar('S'), Cchar('1'), Cchar('4'))

const V4L2_SDR_FMT_RU12LE = v4l2_fourcc(Cchar('R'), Cchar('U'), Cchar('1'), Cchar('2'))

const V4L2_SDR_FMT_PCU16BE = v4l2_fourcc(Cchar('P'), Cchar('C'), Cchar('1'), Cchar('6'))

const V4L2_SDR_FMT_PCU18BE = v4l2_fourcc(Cchar('P'), Cchar('C'), Cchar('1'), Cchar('8'))

const V4L2_SDR_FMT_PCU20BE = v4l2_fourcc(Cchar('P'), Cchar('C'), Cchar('2'), Cchar('0'))

const V4L2_TCH_FMT_DELTA_TD16 = v4l2_fourcc(Cchar('T'), Cchar('D'), Cchar('1'), Cchar('6'))

const V4L2_TCH_FMT_DELTA_TD08 = v4l2_fourcc(Cchar('T'), Cchar('D'), Cchar('0'), Cchar('8'))

const V4L2_TCH_FMT_TU16 = v4l2_fourcc(Cchar('T'), Cchar('U'), Cchar('1'), Cchar('6'))

const V4L2_TCH_FMT_TU08 = v4l2_fourcc(Cchar('T'), Cchar('U'), Cchar('0'), Cchar('8'))

const V4L2_META_FMT_VSP1_HGO = v4l2_fourcc(Cchar('V'), Cchar('S'), Cchar('P'), Cchar('H'))

const V4L2_META_FMT_VSP1_HGT = v4l2_fourcc(Cchar('V'), Cchar('S'), Cchar('P'), Cchar('T'))

const V4L2_META_FMT_UVC = v4l2_fourcc(Cchar('U'), Cchar('V'), Cchar('C'), Cchar('H'))

const V4L2_META_FMT_D4XX = v4l2_fourcc(Cchar('D'), Cchar('4'), Cchar('X'), Cchar('X'))

const V4L2_META_FMT_VIVID = v4l2_fourcc(Cchar('V'), Cchar('I'), Cchar('V'), Cchar('D'))

const V4L2_META_FMT_SENSOR_DATA = v4l2_fourcc(Cchar('S'), Cchar('E'), Cchar('N'), Cchar('S'))

const V4L2_META_FMT_BCM2835_ISP_STATS = v4l2_fourcc(Cchar('B'), Cchar('S'), Cchar('T'), Cchar('A'))

const V4L2_META_FMT_RK_ISP1_PARAMS = v4l2_fourcc(Cchar('R'), Cchar('K'), Cchar('1'), Cchar('P'))

const V4L2_META_FMT_RK_ISP1_STAT_3A = v4l2_fourcc(Cchar('R'), Cchar('K'), Cchar('1'), Cchar('S'))

const V4L2_PIX_FMT_PRIV_MAGIC = 0xfeedcafe

const V4L2_PIX_FMT_FLAG_PREMUL_ALPHA = 0x00000001

const V4L2_PIX_FMT_FLAG_SET_CSC = 0x00000002

const V4L2_FMT_FLAG_COMPRESSED = 0x0001

const V4L2_FMT_FLAG_EMULATED = 0x0002

const V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM = 0x0004

const V4L2_FMT_FLAG_DYN_RESOLUTION = 0x0008

const V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL = 0x0010

const V4L2_FMT_FLAG_CSC_COLORSPACE = 0x0020

const V4L2_FMT_FLAG_CSC_XFER_FUNC = 0x0040

const V4L2_FMT_FLAG_CSC_YCBCR_ENC = 0x0080

const V4L2_FMT_FLAG_CSC_HSV_ENC = V4L2_FMT_FLAG_CSC_YCBCR_ENC

const V4L2_FMT_FLAG_CSC_QUANTIZATION = 0x0100

const V4L2_TC_TYPE_24FPS = 1

const V4L2_TC_TYPE_25FPS = 2

const V4L2_TC_TYPE_30FPS = 3

const V4L2_TC_TYPE_50FPS = 4

const V4L2_TC_TYPE_60FPS = 5

const V4L2_TC_FLAG_DROPFRAME = 0x0001

const V4L2_TC_FLAG_COLORFRAME = 0x0002

const V4L2_TC_USERBITS_field = 0x000c

const V4L2_TC_USERBITS_USERDEFINED = 0x0000

const V4L2_TC_USERBITS_8BITCHARS = 0x0008

const V4L2_JPEG_MARKER_DHT = 1 << 3

const V4L2_JPEG_MARKER_DQT = 1 << 4

const V4L2_JPEG_MARKER_DRI = 1 << 5

const V4L2_JPEG_MARKER_COM = 1 << 6

const V4L2_JPEG_MARKER_APP = 1 << 7

const V4L2_BUF_CAP_SUPPORTS_MMAP = 1 << 0

const V4L2_BUF_CAP_SUPPORTS_USERPTR = 1 << 1

const V4L2_BUF_CAP_SUPPORTS_DMABUF = 1 << 2

const V4L2_BUF_CAP_SUPPORTS_REQUESTS = 1 << 3

const V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS = 1 << 4

const V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF = 1 << 5

const V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS = 1 << 6

const V4L2_BUF_FLAG_MAPPED = 0x00000001

const V4L2_BUF_FLAG_QUEUED = 0x00000002

const V4L2_BUF_FLAG_DONE = 0x00000004

const V4L2_BUF_FLAG_KEYFRAME = 0x00000008

const V4L2_BUF_FLAG_PFRAME = 0x00000010

const V4L2_BUF_FLAG_BFRAME = 0x00000020

const V4L2_BUF_FLAG_ERROR = 0x00000040

const V4L2_BUF_FLAG_IN_REQUEST = 0x00000080

const V4L2_BUF_FLAG_TIMECODE = 0x00000100

const V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF = 0x00000200

const V4L2_BUF_FLAG_PREPARED = 0x00000400

const V4L2_BUF_FLAG_NO_CACHE_INVALIDATE = 0x00000800

const V4L2_BUF_FLAG_NO_CACHE_CLEAN = 0x00001000

const V4L2_BUF_FLAG_TIMESTAMP_MASK = 0x0000e000

const V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN = 0x00000000

const V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC = 0x00002000

const V4L2_BUF_FLAG_TIMESTAMP_COPY = 0x00004000

const V4L2_BUF_FLAG_TSTAMP_SRC_MASK = 0x00070000

const V4L2_BUF_FLAG_TSTAMP_SRC_EOF = 0x00000000

const V4L2_BUF_FLAG_TSTAMP_SRC_SOE = 0x00010000

const V4L2_BUF_FLAG_LAST = 0x00100000

const V4L2_BUF_FLAG_REQUEST_FD = 0x00800000

const V4L2_FBUF_CAP_EXTERNOVERLAY = 0x0001

const V4L2_FBUF_CAP_CHROMAKEY = 0x0002

const V4L2_FBUF_CAP_LIST_CLIPPING = 0x0004

const V4L2_FBUF_CAP_BITMAP_CLIPPING = 0x0008

const V4L2_FBUF_CAP_LOCAL_ALPHA = 0x0010

const V4L2_FBUF_CAP_GLOBAL_ALPHA = 0x0020

const V4L2_FBUF_CAP_LOCAL_INV_ALPHA = 0x0040

const V4L2_FBUF_CAP_SRC_CHROMAKEY = 0x0080

const V4L2_FBUF_FLAG_PRIMARY = 0x0001

const V4L2_FBUF_FLAG_OVERLAY = 0x0002

const V4L2_FBUF_FLAG_CHROMAKEY = 0x0004

const V4L2_FBUF_FLAG_LOCAL_ALPHA = 0x0008

const V4L2_FBUF_FLAG_GLOBAL_ALPHA = 0x0010

const V4L2_FBUF_FLAG_LOCAL_INV_ALPHA = 0x0020

const V4L2_FBUF_FLAG_SRC_CHROMAKEY = 0x0040

const V4L2_MODE_HIGHQUALITY = 0x0001

const V4L2_CAP_TIMEPERFRAME = 0x1000

const V4L2_STD_PAL_B = v4l2_std_id(0x00000001)

const V4L2_STD_PAL_B1 = v4l2_std_id(0x00000002)

const V4L2_STD_PAL_G = v4l2_std_id(0x00000004)

const V4L2_STD_PAL_H = v4l2_std_id(0x00000008)

const V4L2_STD_PAL_I = v4l2_std_id(0x00000010)

const V4L2_STD_PAL_D = v4l2_std_id(0x00000020)

const V4L2_STD_PAL_D1 = v4l2_std_id(0x00000040)

const V4L2_STD_PAL_K = v4l2_std_id(0x00000080)

const V4L2_STD_PAL_M = v4l2_std_id(0x00000100)

const V4L2_STD_PAL_N = v4l2_std_id(0x00000200)

const V4L2_STD_PAL_Nc = v4l2_std_id(0x00000400)

const V4L2_STD_PAL_60 = v4l2_std_id(0x00000800)

const V4L2_STD_NTSC_M = v4l2_std_id(0x00001000)

const V4L2_STD_NTSC_M_JP = v4l2_std_id(0x00002000)

const V4L2_STD_NTSC_443 = v4l2_std_id(0x00004000)

const V4L2_STD_NTSC_M_KR = v4l2_std_id(0x00008000)

const V4L2_STD_SECAM_B = v4l2_std_id(0x00010000)

const V4L2_STD_SECAM_D = v4l2_std_id(0x00020000)

const V4L2_STD_SECAM_G = v4l2_std_id(0x00040000)

const V4L2_STD_SECAM_H = v4l2_std_id(0x00080000)

const V4L2_STD_SECAM_K = v4l2_std_id(0x00100000)

const V4L2_STD_SECAM_K1 = v4l2_std_id(0x00200000)

const V4L2_STD_SECAM_L = v4l2_std_id(0x00400000)

const V4L2_STD_SECAM_LC = v4l2_std_id(0x00800000)

const V4L2_STD_ATSC_8_VSB = v4l2_std_id(0x01000000)

const V4L2_STD_ATSC_16_VSB = v4l2_std_id(0x02000000)

const V4L2_STD_NTSC = (V4L2_STD_NTSC_M | V4L2_STD_NTSC_M_JP) | V4L2_STD_NTSC_M_KR

const V4L2_STD_SECAM_DK = (V4L2_STD_SECAM_D | V4L2_STD_SECAM_K) | V4L2_STD_SECAM_K1

const V4L2_STD_SECAM = ((((V4L2_STD_SECAM_B | V4L2_STD_SECAM_G) | V4L2_STD_SECAM_H) | V4L2_STD_SECAM_DK) | V4L2_STD_SECAM_L) | V4L2_STD_SECAM_LC

const V4L2_STD_PAL_BG = (V4L2_STD_PAL_B | V4L2_STD_PAL_B1) | V4L2_STD_PAL_G

const V4L2_STD_PAL_DK = (V4L2_STD_PAL_D | V4L2_STD_PAL_D1) | V4L2_STD_PAL_K

const V4L2_STD_PAL = ((V4L2_STD_PAL_BG | V4L2_STD_PAL_DK) | V4L2_STD_PAL_H) | V4L2_STD_PAL_I

const V4L2_STD_B = (V4L2_STD_PAL_B | V4L2_STD_PAL_B1) | V4L2_STD_SECAM_B

const V4L2_STD_G = V4L2_STD_PAL_G | V4L2_STD_SECAM_G

const V4L2_STD_H = V4L2_STD_PAL_H | V4L2_STD_SECAM_H

const V4L2_STD_L = V4L2_STD_SECAM_L | V4L2_STD_SECAM_LC

const V4L2_STD_GH = V4L2_STD_G | V4L2_STD_H

const V4L2_STD_DK = V4L2_STD_PAL_DK | V4L2_STD_SECAM_DK

const V4L2_STD_BG = V4L2_STD_B | V4L2_STD_G

const V4L2_STD_MN = ((V4L2_STD_PAL_M | V4L2_STD_PAL_N) | V4L2_STD_PAL_Nc) | V4L2_STD_NTSC

const V4L2_STD_MTS = ((V4L2_STD_NTSC_M | V4L2_STD_PAL_M) | V4L2_STD_PAL_N) | V4L2_STD_PAL_Nc

const V4L2_STD_525_60 = ((V4L2_STD_PAL_M | V4L2_STD_PAL_60) | V4L2_STD_NTSC) | V4L2_STD_NTSC_443

const V4L2_STD_625_50 = ((V4L2_STD_PAL | V4L2_STD_PAL_N) | V4L2_STD_PAL_Nc) | V4L2_STD_SECAM

const V4L2_STD_ATSC = V4L2_STD_ATSC_8_VSB | V4L2_STD_ATSC_16_VSB

const V4L2_STD_UNKNOWN = 0

const V4L2_STD_ALL = V4L2_STD_525_60 | V4L2_STD_625_50

const V4L2_DV_PROGRESSIVE = 0

const V4L2_DV_INTERLACED = 1

const V4L2_DV_VSYNC_POS_POL = 0x00000001

const V4L2_DV_HSYNC_POS_POL = 0x00000002

const V4L2_DV_BT_STD_CEA861 = 1 << 0

const V4L2_DV_BT_STD_DMT = 1 << 1

const V4L2_DV_BT_STD_CVT = 1 << 2

const V4L2_DV_BT_STD_GTF = 1 << 3

const V4L2_DV_BT_STD_SDI = 1 << 4

const V4L2_DV_FL_REDUCED_BLANKING = 1 << 0

const V4L2_DV_FL_CAN_REDUCE_FPS = 1 << 1

const V4L2_DV_FL_REDUCED_FPS = 1 << 2

const V4L2_DV_FL_HALF_LINE = 1 << 3

const V4L2_DV_FL_IS_CE_VIDEO = 1 << 4

const V4L2_DV_FL_FIRST_FIELD_EXTRA_LINE = 1 << 5

const V4L2_DV_FL_HAS_PICTURE_ASPECT = 1 << 6

const V4L2_DV_FL_HAS_CEA861_VIC = 1 << 7

const V4L2_DV_FL_HAS_HDMI_VIC = 1 << 8

const V4L2_DV_FL_CAN_DETECT_REDUCED_FPS = 1 << 9

V4L2_DV_BT_BLANKING_WIDTH(bt) = (bt->begin
            #= none:1 =#
            hfrontporch + (bt->begin
                        #= none:1 =#
                        hsync + (bt->begin
                                    #= none:1 =#
                                    hbackporch
                                end)
                    end)
        end)

V4L2_DV_BT_FRAME_WIDTH(bt) = (bt->begin
            #= none:1 =#
            width + V4L2_DV_BT_BLANKING_WIDTH(bt)
        end)

V4L2_DV_BT_BLANKING_HEIGHT(bt) = (bt->begin
            #= none:1 =#
            vfrontporch + (bt->begin
                        #= none:1 =#
                        vsync + (bt->begin
                                    #= none:1 =#
                                    vbackporch + (bt->begin
                                                #= none:1 =#
                                                if interlaced
                                                    bt->begin
                                                            #= none:1 =#
                                                            il_vfrontporch + (bt->begin
                                                                        #= none:1 =#
                                                                        il_vsync + (bt->begin
                                                                                    #= none:1 =#
                                                                                    il_vbackporch
                                                                                end)
                                                                    end)
                                                        end
                                                else
                                                    0
                                                end
                                            end)
                                end)
                    end)
        end)

V4L2_DV_BT_FRAME_HEIGHT(bt) = (bt->begin
            #= none:1 =#
            height + V4L2_DV_BT_BLANKING_HEIGHT(bt)
        end)

const V4L2_DV_BT_656_1120 = 0

const V4L2_DV_BT_CAP_INTERLACED = 1 << 0

const V4L2_DV_BT_CAP_PROGRESSIVE = 1 << 1

const V4L2_DV_BT_CAP_REDUCED_BLANKING = 1 << 2

const V4L2_DV_BT_CAP_CUSTOM = 1 << 3

const V4L2_INPUT_TYPE_TUNER = 1

const V4L2_INPUT_TYPE_CAMERA = 2

const V4L2_INPUT_TYPE_TOUCH = 3

const V4L2_IN_ST_NO_POWER = 0x00000001

const V4L2_IN_ST_NO_SIGNAL = 0x00000002

const V4L2_IN_ST_NO_COLOR = 0x00000004

const V4L2_IN_ST_HFLIP = 0x00000010

const V4L2_IN_ST_VFLIP = 0x00000020

const V4L2_IN_ST_NO_H_LOCK = 0x00000100

const V4L2_IN_ST_COLOR_KILL = 0x00000200

const V4L2_IN_ST_NO_V_LOCK = 0x00000400

const V4L2_IN_ST_NO_STD_LOCK = 0x00000800

const V4L2_IN_ST_NO_SYNC = 0x00010000

const V4L2_IN_ST_NO_EQU = 0x00020000

const V4L2_IN_ST_NO_CARRIER = 0x00040000

const V4L2_IN_ST_MACROVISION = 0x01000000

const V4L2_IN_ST_NO_ACCESS = 0x02000000

const V4L2_IN_ST_VTR = 0x04000000

const V4L2_IN_CAP_DV_TIMINGS = 0x00000002

const V4L2_IN_CAP_CUSTOM_TIMINGS = V4L2_IN_CAP_DV_TIMINGS

const V4L2_IN_CAP_STD = 0x00000004

const V4L2_IN_CAP_NATIVE_SIZE = 0x00000008

const V4L2_OUTPUT_TYPE_MODULATOR = 1

const V4L2_OUTPUT_TYPE_ANALOG = 2

const V4L2_OUTPUT_TYPE_ANALOGVGAOVERLAY = 3

const V4L2_OUT_CAP_DV_TIMINGS = 0x00000002

const V4L2_OUT_CAP_CUSTOM_TIMINGS = V4L2_OUT_CAP_DV_TIMINGS

const V4L2_OUT_CAP_STD = 0x00000004

const V4L2_OUT_CAP_NATIVE_SIZE = 0x00000008

const V4L2_CTRL_ID_MASK = 0x0fffffff

V4L2_CTRL_ID2CLASS(id) = id & Culong(0x0fff0000)

V4L2_CTRL_ID2WHICH(id) = id & Culong(0x0fff0000)

V4L2_CTRL_DRIVER_PRIV(id) = id & 0xffff >= 0x1000

const V4L2_CTRL_MAX_DIMS = 4

const V4L2_CTRL_WHICH_CUR_VAL = 0

const V4L2_CTRL_WHICH_DEF_VAL = 0x0f000000

const V4L2_CTRL_WHICH_REQUEST_VAL = 0x0f010000

const V4L2_CTRL_FLAG_DISABLED = 0x0001

const V4L2_CTRL_FLAG_GRABBED = 0x0002

const V4L2_CTRL_FLAG_READ_ONLY = 0x0004

const V4L2_CTRL_FLAG_UPDATE = 0x0008

const V4L2_CTRL_FLAG_INACTIVE = 0x0010

const V4L2_CTRL_FLAG_SLIDER = 0x0020

const V4L2_CTRL_FLAG_WRITE_ONLY = 0x0040

const V4L2_CTRL_FLAG_VOLATILE = 0x0080

const V4L2_CTRL_FLAG_HAS_PAYLOAD = 0x0100

const V4L2_CTRL_FLAG_EXECUTE_ON_WRITE = 0x0200

const V4L2_CTRL_FLAG_MODIFY_LAYOUT = 0x0400

const V4L2_CTRL_FLAG_DYNAMIC_ARRAY = 0x0800

const V4L2_CTRL_FLAG_NEXT_CTRL = 0x80000000

const V4L2_CTRL_FLAG_NEXT_COMPOUND = 0x40000000

const V4L2_CID_MAX_CTRLS = 1024

const V4L2_CID_PRIVATE_BASE = 0x08000000

const V4L2_TUNER_CAP_LOW = 0x0001

const V4L2_TUNER_CAP_NORM = 0x0002

const V4L2_TUNER_CAP_HWSEEK_BOUNDED = 0x0004

const V4L2_TUNER_CAP_HWSEEK_WRAP = 0x0008

const V4L2_TUNER_CAP_STEREO = 0x0010

const V4L2_TUNER_CAP_LANG2 = 0x0020

const V4L2_TUNER_CAP_SAP = 0x0020

const V4L2_TUNER_CAP_LANG1 = 0x0040

const V4L2_TUNER_CAP_RDS = 0x0080

const V4L2_TUNER_CAP_RDS_BLOCK_IO = 0x0100

const V4L2_TUNER_CAP_RDS_CONTROLS = 0x0200

const V4L2_TUNER_CAP_FREQ_BANDS = 0x0400

const V4L2_TUNER_CAP_HWSEEK_PROG_LIM = 0x0800

const V4L2_TUNER_CAP_1HZ = 0x1000

const V4L2_TUNER_SUB_MONO = 0x0001

const V4L2_TUNER_SUB_STEREO = 0x0002

const V4L2_TUNER_SUB_LANG2 = 0x0004

const V4L2_TUNER_SUB_SAP = 0x0004

const V4L2_TUNER_SUB_LANG1 = 0x0008

const V4L2_TUNER_SUB_RDS = 0x0010

const V4L2_TUNER_MODE_MONO = 0x0000

const V4L2_TUNER_MODE_STEREO = 0x0001

const V4L2_TUNER_MODE_LANG2 = 0x0002

const V4L2_TUNER_MODE_SAP = 0x0002

const V4L2_TUNER_MODE_LANG1 = 0x0003

const V4L2_TUNER_MODE_LANG1_LANG2 = 0x0004

const V4L2_BAND_MODULATION_VSB = 1 << 1

const V4L2_BAND_MODULATION_FM = 1 << 2

const V4L2_BAND_MODULATION_AM = 1 << 3

const V4L2_RDS_BLOCK_MSK = 0x07

const V4L2_RDS_BLOCK_A = 0

const V4L2_RDS_BLOCK_B = 1

const V4L2_RDS_BLOCK_C = 2

const V4L2_RDS_BLOCK_D = 3

const V4L2_RDS_BLOCK_C_ALT = 4

const V4L2_RDS_BLOCK_INVALID = 7

const V4L2_RDS_BLOCK_CORRECTED = 0x40

const V4L2_RDS_BLOCK_ERROR = 0x80

const V4L2_AUDCAP_STEREO = 0x00000001

const V4L2_AUDCAP_AVL = 0x00000002

const V4L2_AUDMODE_AVL = 0x00000001

const V4L2_ENC_IDX_FRAME_I = 0

const V4L2_ENC_IDX_FRAME_P = 1

const V4L2_ENC_IDX_FRAME_B = 2

const V4L2_ENC_IDX_FRAME_MASK = 0x0f

const V4L2_ENC_IDX_ENTRIES = 64

const V4L2_ENC_CMD_START = 0

const V4L2_ENC_CMD_STOP = 1

const V4L2_ENC_CMD_PAUSE = 2

const V4L2_ENC_CMD_RESUME = 3

const V4L2_ENC_CMD_STOP_AT_GOP_END = 1 << 0

const V4L2_DEC_CMD_START = 0

const V4L2_DEC_CMD_STOP = 1

const V4L2_DEC_CMD_PAUSE = 2

const V4L2_DEC_CMD_RESUME = 3

const V4L2_DEC_CMD_FLUSH = 4

const V4L2_DEC_CMD_START_MUTE_AUDIO = 1 << 0

const V4L2_DEC_CMD_PAUSE_TO_BLACK = 1 << 0

const V4L2_DEC_CMD_STOP_TO_BLACK = 1 << 0

const V4L2_DEC_CMD_STOP_IMMEDIATELY = 1 << 1

const V4L2_DEC_START_FMT_NONE = 0

const V4L2_DEC_START_FMT_GOP = 1

const V4L2_VBI_UNSYNC = 1 << 0

const V4L2_VBI_INTERLACED = 1 << 1

const V4L2_VBI_ITU_525_F1_START = 1

const V4L2_VBI_ITU_525_F2_START = 264

const V4L2_VBI_ITU_625_F1_START = 1

const V4L2_VBI_ITU_625_F2_START = 314

const V4L2_SLICED_TELETEXT_B = 0x0001

const V4L2_SLICED_VPS = 0x0400

const V4L2_SLICED_CAPTION_525 = 0x1000

const V4L2_SLICED_WSS_625 = 0x4000

const V4L2_SLICED_VBI_525 = V4L2_SLICED_CAPTION_525

const V4L2_SLICED_VBI_625 = (V4L2_SLICED_TELETEXT_B | V4L2_SLICED_VPS) | V4L2_SLICED_WSS_625

const V4L2_MPEG_VBI_IVTV_TELETEXT_B = 1

const V4L2_MPEG_VBI_IVTV_CAPTION_525 = 4

const V4L2_MPEG_VBI_IVTV_WSS_625 = 5

const V4L2_MPEG_VBI_IVTV_VPS = 7

const V4L2_MPEG_VBI_IVTV_MAGIC0 = "itv0"

const V4L2_MPEG_VBI_IVTV_MAGIC1 = "ITV0"

const V4L2_EVENT_ALL = 0

const V4L2_EVENT_VSYNC = 1

const V4L2_EVENT_EOS = 2

const V4L2_EVENT_CTRL = 3

const V4L2_EVENT_FRAME_SYNC = 4

const V4L2_EVENT_SOURCE_CHANGE = 5

const V4L2_EVENT_MOTION_DET = 6

const V4L2_EVENT_PRIVATE_START = 0x08000000

const V4L2_EVENT_CTRL_CH_VALUE = 1 << 0

const V4L2_EVENT_CTRL_CH_FLAGS = 1 << 1

const V4L2_EVENT_CTRL_CH_RANGE = 1 << 2

const V4L2_EVENT_SRC_CH_RESOLUTION = 1 << 0

const V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ = 1 << 0

const V4L2_EVENT_SUB_FL_SEND_INITIAL = 1 << 0

const V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK = 1 << 1

const V4L2_CHIP_MATCH_BRIDGE = 0

const V4L2_CHIP_MATCH_SUBDEV = 4

const V4L2_CHIP_MATCH_HOST = V4L2_CHIP_MATCH_BRIDGE

const V4L2_CHIP_MATCH_I2C_DRIVER = 1

const V4L2_CHIP_MATCH_I2C_ADDR = 2

const V4L2_CHIP_MATCH_AC97 = 3

const V4L2_CHIP_FL_READABLE = 1 << 0

const V4L2_CHIP_FL_WRITABLE = 1 << 1

# Skipping MacroDefinition: VIDIOC_QUERYCAP _IOR ( 'V' , 0 , struct v4l2_capability )

# Skipping MacroDefinition: VIDIOC_ENUM_FMT _IOWR ( 'V' , 2 , struct v4l2_fmtdesc )

# Skipping MacroDefinition: VIDIOC_G_FMT _IOWR ( 'V' , 4 , struct v4l2_format )

# Skipping MacroDefinition: VIDIOC_S_FMT _IOWR ( 'V' , 5 , struct v4l2_format )

# Skipping MacroDefinition: VIDIOC_REQBUFS _IOWR ( 'V' , 8 , struct v4l2_requestbuffers )

# Skipping MacroDefinition: VIDIOC_QUERYBUF _IOWR ( 'V' , 9 , struct v4l2_buffer )

# Skipping MacroDefinition: VIDIOC_G_FBUF _IOR ( 'V' , 10 , struct v4l2_framebuffer )

# Skipping MacroDefinition: VIDIOC_S_FBUF _IOW ( 'V' , 11 , struct v4l2_framebuffer )

const VIDIOC_OVERLAY = _IOW(Cchar('V'), 14, Cint)

# Skipping MacroDefinition: VIDIOC_QBUF _IOWR ( 'V' , 15 , struct v4l2_buffer )

# Skipping MacroDefinition: VIDIOC_EXPBUF _IOWR ( 'V' , 16 , struct v4l2_exportbuffer )

# Skipping MacroDefinition: VIDIOC_DQBUF _IOWR ( 'V' , 17 , struct v4l2_buffer )

const VIDIOC_STREAMON = _IOW(Cchar('V'), 18, Cint)

const VIDIOC_STREAMOFF = _IOW(Cchar('V'), 19, Cint)

# Skipping MacroDefinition: VIDIOC_G_PARM _IOWR ( 'V' , 21 , struct v4l2_streamparm )

# Skipping MacroDefinition: VIDIOC_S_PARM _IOWR ( 'V' , 22 , struct v4l2_streamparm )

const VIDIOC_G_STD = _IOR(Cchar('V'), 23, v4l2_std_id)

const VIDIOC_S_STD = _IOW(Cchar('V'), 24, v4l2_std_id)

# Skipping MacroDefinition: VIDIOC_ENUMSTD _IOWR ( 'V' , 25 , struct v4l2_standard )

# Skipping MacroDefinition: VIDIOC_ENUMINPUT _IOWR ( 'V' , 26 , struct v4l2_input )

# Skipping MacroDefinition: VIDIOC_G_CTRL _IOWR ( 'V' , 27 , struct v4l2_control )

# Skipping MacroDefinition: VIDIOC_S_CTRL _IOWR ( 'V' , 28 , struct v4l2_control )

# Skipping MacroDefinition: VIDIOC_G_TUNER _IOWR ( 'V' , 29 , struct v4l2_tuner )

# Skipping MacroDefinition: VIDIOC_S_TUNER _IOW ( 'V' , 30 , struct v4l2_tuner )

# Skipping MacroDefinition: VIDIOC_G_AUDIO _IOR ( 'V' , 33 , struct v4l2_audio )

# Skipping MacroDefinition: VIDIOC_S_AUDIO _IOW ( 'V' , 34 , struct v4l2_audio )

# Skipping MacroDefinition: VIDIOC_QUERYCTRL _IOWR ( 'V' , 36 , struct v4l2_queryctrl )

# Skipping MacroDefinition: VIDIOC_QUERYMENU _IOWR ( 'V' , 37 , struct v4l2_querymenu )

const VIDIOC_G_INPUT = _IOR(Cchar('V'), 38, Cint)

const VIDIOC_S_INPUT = _IOWR(Cchar('V'), 39, Cint)

# Skipping MacroDefinition: VIDIOC_G_EDID _IOWR ( 'V' , 40 , struct v4l2_edid )

# Skipping MacroDefinition: VIDIOC_S_EDID _IOWR ( 'V' , 41 , struct v4l2_edid )

const VIDIOC_G_OUTPUT = _IOR(Cchar('V'), 46, Cint)

const VIDIOC_S_OUTPUT = _IOWR(Cchar('V'), 47, Cint)

# Skipping MacroDefinition: VIDIOC_ENUMOUTPUT _IOWR ( 'V' , 48 , struct v4l2_output )

# Skipping MacroDefinition: VIDIOC_G_AUDOUT _IOR ( 'V' , 49 , struct v4l2_audioout )

# Skipping MacroDefinition: VIDIOC_S_AUDOUT _IOW ( 'V' , 50 , struct v4l2_audioout )

# Skipping MacroDefinition: VIDIOC_G_MODULATOR _IOWR ( 'V' , 54 , struct v4l2_modulator )

# Skipping MacroDefinition: VIDIOC_S_MODULATOR _IOW ( 'V' , 55 , struct v4l2_modulator )

# Skipping MacroDefinition: VIDIOC_G_FREQUENCY _IOWR ( 'V' , 56 , struct v4l2_frequency )

# Skipping MacroDefinition: VIDIOC_S_FREQUENCY _IOW ( 'V' , 57 , struct v4l2_frequency )

# Skipping MacroDefinition: VIDIOC_CROPCAP _IOWR ( 'V' , 58 , struct v4l2_cropcap )

# Skipping MacroDefinition: VIDIOC_G_CROP _IOWR ( 'V' , 59 , struct v4l2_crop )

# Skipping MacroDefinition: VIDIOC_S_CROP _IOW ( 'V' , 60 , struct v4l2_crop )

# Skipping MacroDefinition: VIDIOC_G_JPEGCOMP _IOR ( 'V' , 61 , struct v4l2_jpegcompression )

# Skipping MacroDefinition: VIDIOC_S_JPEGCOMP _IOW ( 'V' , 62 , struct v4l2_jpegcompression )

const VIDIOC_QUERYSTD = _IOR(Cchar('V'), 63, v4l2_std_id)

# Skipping MacroDefinition: VIDIOC_TRY_FMT _IOWR ( 'V' , 64 , struct v4l2_format )

# Skipping MacroDefinition: VIDIOC_ENUMAUDIO _IOWR ( 'V' , 65 , struct v4l2_audio )

# Skipping MacroDefinition: VIDIOC_ENUMAUDOUT _IOWR ( 'V' , 66 , struct v4l2_audioout )

const VIDIOC_G_PRIORITY = _IOR(Cchar('V'), 67, __u32)

const VIDIOC_S_PRIORITY = _IOW(Cchar('V'), 68, __u32)

# Skipping MacroDefinition: VIDIOC_G_SLICED_VBI_CAP _IOWR ( 'V' , 69 , struct v4l2_sliced_vbi_cap )

const VIDIOC_LOG_STATUS = _IO(Cchar('V'), 70)

# Skipping MacroDefinition: VIDIOC_G_EXT_CTRLS _IOWR ( 'V' , 71 , struct v4l2_ext_controls )

# Skipping MacroDefinition: VIDIOC_S_EXT_CTRLS _IOWR ( 'V' , 72 , struct v4l2_ext_controls )

# Skipping MacroDefinition: VIDIOC_TRY_EXT_CTRLS _IOWR ( 'V' , 73 , struct v4l2_ext_controls )

# Skipping MacroDefinition: VIDIOC_ENUM_FRAMESIZES _IOWR ( 'V' , 74 , struct v4l2_frmsizeenum )

# Skipping MacroDefinition: VIDIOC_ENUM_FRAMEINTERVALS _IOWR ( 'V' , 75 , struct v4l2_frmivalenum )

# Skipping MacroDefinition: VIDIOC_G_ENC_INDEX _IOR ( 'V' , 76 , struct v4l2_enc_idx )

# Skipping MacroDefinition: VIDIOC_ENCODER_CMD _IOWR ( 'V' , 77 , struct v4l2_encoder_cmd )

# Skipping MacroDefinition: VIDIOC_TRY_ENCODER_CMD _IOWR ( 'V' , 78 , struct v4l2_encoder_cmd )

# Skipping MacroDefinition: VIDIOC_DBG_S_REGISTER _IOW ( 'V' , 79 , struct v4l2_dbg_register )

# Skipping MacroDefinition: VIDIOC_DBG_G_REGISTER _IOWR ( 'V' , 80 , struct v4l2_dbg_register )

# Skipping MacroDefinition: VIDIOC_S_HW_FREQ_SEEK _IOW ( 'V' , 82 , struct v4l2_hw_freq_seek )

# Skipping MacroDefinition: VIDIOC_S_DV_TIMINGS _IOWR ( 'V' , 87 , struct v4l2_dv_timings )

# Skipping MacroDefinition: VIDIOC_G_DV_TIMINGS _IOWR ( 'V' , 88 , struct v4l2_dv_timings )

# Skipping MacroDefinition: VIDIOC_DQEVENT _IOR ( 'V' , 89 , struct v4l2_event )

# Skipping MacroDefinition: VIDIOC_SUBSCRIBE_EVENT _IOW ( 'V' , 90 , struct v4l2_event_subscription )

# Skipping MacroDefinition: VIDIOC_UNSUBSCRIBE_EVENT _IOW ( 'V' , 91 , struct v4l2_event_subscription )

# Skipping MacroDefinition: VIDIOC_CREATE_BUFS _IOWR ( 'V' , 92 , struct v4l2_create_buffers )

# Skipping MacroDefinition: VIDIOC_PREPARE_BUF _IOWR ( 'V' , 93 , struct v4l2_buffer )

# Skipping MacroDefinition: VIDIOC_G_SELECTION _IOWR ( 'V' , 94 , struct v4l2_selection )

# Skipping MacroDefinition: VIDIOC_S_SELECTION _IOWR ( 'V' , 95 , struct v4l2_selection )

# Skipping MacroDefinition: VIDIOC_DECODER_CMD _IOWR ( 'V' , 96 , struct v4l2_decoder_cmd )

# Skipping MacroDefinition: VIDIOC_TRY_DECODER_CMD _IOWR ( 'V' , 97 , struct v4l2_decoder_cmd )

# Skipping MacroDefinition: VIDIOC_ENUM_DV_TIMINGS _IOWR ( 'V' , 98 , struct v4l2_enum_dv_timings )

# Skipping MacroDefinition: VIDIOC_QUERY_DV_TIMINGS _IOR ( 'V' , 99 , struct v4l2_dv_timings )

# Skipping MacroDefinition: VIDIOC_DV_TIMINGS_CAP _IOWR ( 'V' , 100 , struct v4l2_dv_timings_cap )

# Skipping MacroDefinition: VIDIOC_ENUM_FREQ_BANDS _IOWR ( 'V' , 101 , struct v4l2_frequency_band )

# Skipping MacroDefinition: VIDIOC_DBG_G_CHIP_INFO _IOWR ( 'V' , 102 , struct v4l2_dbg_chip_info )

# Skipping MacroDefinition: VIDIOC_QUERY_EXT_CTRL _IOWR ( 'V' , 103 , struct v4l2_query_ext_ctrl )

const BASE_VIDIOC_PRIVATE = 192

## BEGIN epilogue.jl

# nothing to see here

## END epilogue.jl


# exports
const PREFIXES = ["V4L2", "v4l2", "VIDIOC", "_IO"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
