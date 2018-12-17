package lime.graphics.opengl;


import haxe.io.Bytes;
import haxe.Int64;
import lime.utils.ArrayBufferView;
import lime.utils.ArrayBuffer;
import lime.utils.BytePointer;
import lime.utils.DataPointer;
import lime.utils.Float32Array;
import lime.utils.Int32Array;

#if (lime_cffi && lime_opengl && !macro)
import lime._backend.native.NativeCFFI;
#end

@:allow(lime.ui.Window)

#if !lime_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end


class GL {
	
	
	public static inline var DEPTH_BUFFER_BIT = 0x00000100;
	public static inline var STENCIL_BUFFER_BIT = 0x00000400;
	public static inline var COLOR_BUFFER_BIT = 0x00004000;
	
	public static inline var POINTS = 0x0000;
	public static inline var LINES = 0x0001;
	public static inline var LINE_LOOP = 0x0002;
	public static inline var LINE_STRIP = 0x0003;
	public static inline var TRIANGLES = 0x0004;
	public static inline var TRIANGLE_STRIP = 0x0005;
	public static inline var TRIANGLE_FAN = 0x0006;
	
	public static inline var ZERO = 0;
	public static inline var ONE = 1;
	public static inline var SRC_COLOR = 0x0300;
	public static inline var ONE_MINUS_SRC_COLOR = 0x0301;
	public static inline var SRC_ALPHA = 0x0302;
	public static inline var ONE_MINUS_SRC_ALPHA = 0x0303;
	public static inline var DST_ALPHA = 0x0304;
	public static inline var ONE_MINUS_DST_ALPHA = 0x0305;
	
	public static inline var DST_COLOR = 0x0306;
	public static inline var ONE_MINUS_DST_COLOR = 0x0307;
	public static inline var SRC_ALPHA_SATURATE = 0x0308;
	
	public static inline var FUNC_ADD = 0x8006;
	public static inline var BLEND_EQUATION = 0x8009;
	public static inline var BLEND_EQUATION_RGB = 0x8009;
	public static inline var BLEND_EQUATION_ALPHA = 0x883D;
	
	public static inline var FUNC_SUBTRACT = 0x800A;
	public static inline var FUNC_REVERSE_SUBTRACT = 0x800B;
	
	public static inline var BLEND_DST_RGB = 0x80C8;
	public static inline var BLEND_SRC_RGB = 0x80C9;
	public static inline var BLEND_DST_ALPHA = 0x80CA;
	public static inline var BLEND_SRC_ALPHA = 0x80CB;
	public static inline var CONSTANT_COLOR = 0x8001;
	public static inline var ONE_MINUS_CONSTANT_COLOR = 0x8002;
	public static inline var CONSTANT_ALPHA = 0x8003;
	public static inline var ONE_MINUS_CONSTANT_ALPHA = 0x8004;
	public static inline var BLEND_COLOR = 0x8005;
	
	public static inline var ARRAY_BUFFER = 0x8892;
	public static inline var ELEMENT_ARRAY_BUFFER = 0x8893;
	public static inline var ARRAY_BUFFER_BINDING = 0x8894;
	public static inline var ELEMENT_ARRAY_BUFFER_BINDING = 0x8895;
	
	public static inline var STREAM_DRAW = 0x88E0;
	public static inline var STATIC_DRAW = 0x88E4;
	public static inline var DYNAMIC_DRAW = 0x88E8;
	
	public static inline var BUFFER_SIZE = 0x8764;
	public static inline var BUFFER_USAGE = 0x8765;
	
	public static inline var CURRENT_VERTEX_ATTRIB = 0x8626;
	
	public static inline var FRONT = 0x0404;
	public static inline var BACK = 0x0405;
	public static inline var FRONT_AND_BACK = 0x0408;
	
	public static inline var CULL_FACE = 0x0B44;
	public static inline var BLEND = 0x0BE2;
	public static inline var DITHER = 0x0BD0;
	public static inline var STENCIL_TEST = 0x0B90;
	public static inline var DEPTH_TEST = 0x0B71;
	public static inline var SCISSOR_TEST = 0x0C11;
	public static inline var POLYGON_OFFSET_FILL = 0x8037;
	public static inline var SAMPLE_ALPHA_TO_COVERAGE = 0x809E;
	public static inline var SAMPLE_COVERAGE = 0x80A0;
	
	public static inline var NO_ERROR = 0;
	public static inline var INVALID_ENUM = 0x0500;
	public static inline var INVALID_VALUE = 0x0501;
	public static inline var INVALID_OPERATION = 0x0502;
	public static inline var OUT_OF_MEMORY = 0x0505;
	
	public static inline var CW  = 0x0900;
	public static inline var CCW = 0x0901;
	
	public static inline var LINE_WIDTH = 0x0B21;
	public static inline var ALIASED_POINT_SIZE_RANGE = 0x846D;
	public static inline var ALIASED_LINE_WIDTH_RANGE = 0x846E;
	public static inline var CULL_FACE_MODE = 0x0B45;
	public static inline var FRONT_FACE = 0x0B46;
	public static inline var DEPTH_RANGE = 0x0B70;
	public static inline var DEPTH_WRITEMASK = 0x0B72;
	public static inline var DEPTH_CLEAR_VALUE = 0x0B73;
	public static inline var DEPTH_FUNC = 0x0B74;
	public static inline var STENCIL_CLEAR_VALUE = 0x0B91;
	public static inline var STENCIL_FUNC = 0x0B92;
	public static inline var STENCIL_FAIL = 0x0B94;
	public static inline var STENCIL_PASS_DEPTH_FAIL = 0x0B95;
	public static inline var STENCIL_PASS_DEPTH_PASS = 0x0B96;
	public static inline var STENCIL_REF = 0x0B97;
	public static inline var STENCIL_VALUE_MASK = 0x0B93;
	public static inline var STENCIL_WRITEMASK = 0x0B98;
	public static inline var STENCIL_BACK_FUNC = 0x8800;
	public static inline var STENCIL_BACK_FAIL = 0x8801;
	public static inline var STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802;
	public static inline var STENCIL_BACK_PASS_DEPTH_PASS = 0x8803;
	public static inline var STENCIL_BACK_REF = 0x8CA3;
	public static inline var STENCIL_BACK_VALUE_MASK = 0x8CA4;
	public static inline var STENCIL_BACK_WRITEMASK = 0x8CA5;
	public static inline var VIEWPORT = 0x0BA2;
	public static inline var SCISSOR_BOX = 0x0C10;
	
	public static inline var COLOR_CLEAR_VALUE = 0x0C22;
	public static inline var COLOR_WRITEMASK = 0x0C23;
	public static inline var UNPACK_ALIGNMENT = 0x0CF5;
	public static inline var PACK_ALIGNMENT = 0x0D05;
	public static inline var MAX_TEXTURE_SIZE = 0x0D33;
	public static inline var MAX_VIEWPORT_DIMS = 0x0D3A;
	public static inline var SUBPIXEL_BITS = 0x0D50;
	public static inline var RED_BITS = 0x0D52;
	public static inline var GREEN_BITS = 0x0D53;
	public static inline var BLUE_BITS = 0x0D54;
	public static inline var ALPHA_BITS = 0x0D55;
	public static inline var DEPTH_BITS = 0x0D56;
	public static inline var STENCIL_BITS = 0x0D57;
	public static inline var POLYGON_OFFSET_UNITS = 0x2A00;
	
	public static inline var POLYGON_OFFSET_FACTOR = 0x8038;
	public static inline var TEXTURE_BINDING_2D = 0x8069;
	public static inline var SAMPLE_BUFFERS = 0x80A8;
	public static inline var SAMPLES = 0x80A9;
	public static inline var SAMPLE_COVERAGE_VALUE = 0x80AA;
	public static inline var SAMPLE_COVERAGE_INVERT = 0x80AB;
	
	public static inline var NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2;
	public static inline var COMPRESSED_TEXTURE_FORMATS = 0x86A3;
	
	public static inline var DONT_CARE = 0x1100;
	public static inline var FASTEST = 0x1101;
	public static inline var NICEST = 0x1102;
	
	public static inline var GENERATE_MIPMAP_HINT = 0x8192;
	
	public static inline var BYTE = 0x1400;
	public static inline var UNSIGNED_BYTE = 0x1401;
	public static inline var SHORT = 0x1402;
	public static inline var UNSIGNED_SHORT = 0x1403;
	public static inline var INT = 0x1404;
	public static inline var UNSIGNED_INT = 0x1405;
	public static inline var FLOAT = 0x1406;
	
	public static inline var DEPTH_COMPONENT = 0x1902;
	public static inline var ALPHA = 0x1906;
	public static inline var RGB = 0x1907;
	public static inline var RGBA = 0x1908;
	public static inline var LUMINANCE = 0x1909;
	public static inline var LUMINANCE_ALPHA = 0x190A;
	
	public static inline var UNSIGNED_SHORT_4_4_4_4 = 0x8033;
	public static inline var UNSIGNED_SHORT_5_5_5_1 = 0x8034;
	public static inline var UNSIGNED_SHORT_5_6_5 = 0x8363;
	
	public static inline var FRAGMENT_SHADER = 0x8B30;
	public static inline var VERTEX_SHADER = 0x8B31;
	public static inline var MAX_VERTEX_ATTRIBS = 0x8869;
	public static inline var MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB;
	public static inline var MAX_VARYING_VECTORS = 0x8DFC;
	public static inline var MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
	public static inline var MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C;
	public static inline var MAX_TEXTURE_IMAGE_UNITS = 0x8872;
	public static inline var MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD;
	public static inline var SHADER_TYPE = 0x8B4F;
	public static inline var DELETE_STATUS = 0x8B80;
	public static inline var LINK_STATUS = 0x8B82;
	public static inline var VALIDATE_STATUS = 0x8B83;
	public static inline var ATTACHED_SHADERS = 0x8B85;
	public static inline var ACTIVE_UNIFORMS = 0x8B86;
	public static inline var ACTIVE_ATTRIBUTES = 0x8B89;
	public static inline var SHADING_LANGUAGE_VERSION = 0x8B8C;
	public static inline var CURRENT_PROGRAM = 0x8B8D;
	
	public static inline var NEVER = 0x0200;
	public static inline var LESS = 0x0201;
	public static inline var EQUAL = 0x0202;
	public static inline var LEQUAL = 0x0203;
	public static inline var GREATER = 0x0204;
	public static inline var NOTEQUAL = 0x0205;
	public static inline var GEQUAL = 0x0206;
	public static inline var ALWAYS = 0x0207;
	
	public static inline var KEEP = 0x1E00;
	public static inline var REPLACE = 0x1E01;
	public static inline var INCR = 0x1E02;
	public static inline var DECR = 0x1E03;
	public static inline var INVERT = 0x150A;
	public static inline var INCR_WRAP = 0x8507;
	public static inline var DECR_WRAP = 0x8508;
	
	public static inline var VENDOR = 0x1F00;
	public static inline var RENDERER = 0x1F01;
	public static inline var VERSION = 0x1F02;
	public static inline var EXTENSIONS = 0x1F03;
	
	public static inline var NEAREST = 0x2600;
	public static inline var LINEAR = 0x2601;
	
	public static inline var NEAREST_MIPMAP_NEAREST = 0x2700;
	public static inline var LINEAR_MIPMAP_NEAREST = 0x2701;
	public static inline var NEAREST_MIPMAP_LINEAR = 0x2702;
	public static inline var LINEAR_MIPMAP_LINEAR = 0x2703;
	
	public static inline var TEXTURE_MAG_FILTER = 0x2800;
	public static inline var TEXTURE_MIN_FILTER = 0x2801;
	public static inline var TEXTURE_WRAP_S = 0x2802;
	public static inline var TEXTURE_WRAP_T = 0x2803;
	
	public static inline var TEXTURE_2D = 0x0DE1;
	public static inline var TEXTURE = 0x1702;
	
	public static inline var TEXTURE_CUBE_MAP = 0x8513;
	public static inline var TEXTURE_BINDING_CUBE_MAP = 0x8514;
	public static inline var TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515;
	public static inline var TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516;
	public static inline var TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517;
	public static inline var TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518;
	public static inline var TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519;
	public static inline var TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A;
	public static inline var MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C;
	
	public static inline var TEXTURE0 = 0x84C0;
	public static inline var TEXTURE1 = 0x84C1;
	public static inline var TEXTURE2 = 0x84C2;
	public static inline var TEXTURE3 = 0x84C3;
	public static inline var TEXTURE4 = 0x84C4;
	public static inline var TEXTURE5 = 0x84C5;
	public static inline var TEXTURE6 = 0x84C6;
	public static inline var TEXTURE7 = 0x84C7;
	public static inline var TEXTURE8 = 0x84C8;
	public static inline var TEXTURE9 = 0x84C9;
	public static inline var TEXTURE10 = 0x84CA;
	public static inline var TEXTURE11 = 0x84CB;
	public static inline var TEXTURE12 = 0x84CC;
	public static inline var TEXTURE13 = 0x84CD;
	public static inline var TEXTURE14 = 0x84CE;
	public static inline var TEXTURE15 = 0x84CF;
	public static inline var TEXTURE16 = 0x84D0;
	public static inline var TEXTURE17 = 0x84D1;
	public static inline var TEXTURE18 = 0x84D2;
	public static inline var TEXTURE19 = 0x84D3;
	public static inline var TEXTURE20 = 0x84D4;
	public static inline var TEXTURE21 = 0x84D5;
	public static inline var TEXTURE22 = 0x84D6;
	public static inline var TEXTURE23 = 0x84D7;
	public static inline var TEXTURE24 = 0x84D8;
	public static inline var TEXTURE25 = 0x84D9;
	public static inline var TEXTURE26 = 0x84DA;
	public static inline var TEXTURE27 = 0x84DB;
	public static inline var TEXTURE28 = 0x84DC;
	public static inline var TEXTURE29 = 0x84DD;
	public static inline var TEXTURE30 = 0x84DE;
	public static inline var TEXTURE31 = 0x84DF;
	public static inline var ACTIVE_TEXTURE = 0x84E0;
	
	public static inline var REPEAT = 0x2901;
	public static inline var CLAMP_TO_EDGE = 0x812F;
	public static inline var MIRRORED_REPEAT = 0x8370;
	
	public static inline var FLOAT_VEC2 = 0x8B50;
	public static inline var FLOAT_VEC3 = 0x8B51;
	public static inline var FLOAT_VEC4 = 0x8B52;
	public static inline var INT_VEC2 = 0x8B53;
	public static inline var INT_VEC3 = 0x8B54;
	public static inline var INT_VEC4 = 0x8B55;
	public static inline var BOOL = 0x8B56;
	public static inline var BOOL_VEC2 = 0x8B57;
	public static inline var BOOL_VEC3 = 0x8B58;
	public static inline var BOOL_VEC4 = 0x8B59;
	public static inline var FLOAT_MAT2 = 0x8B5A;
	public static inline var FLOAT_MAT3 = 0x8B5B;
	public static inline var FLOAT_MAT4 = 0x8B5C;
	public static inline var SAMPLER_2D = 0x8B5E;
	public static inline var SAMPLER_CUBE = 0x8B60;
	
	public static inline var VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622;
	public static inline var VERTEX_ATTRIB_ARRAY_SIZE = 0x8623;
	public static inline var VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624;
	public static inline var VERTEX_ATTRIB_ARRAY_TYPE = 0x8625;
	public static inline var VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A;
	public static inline var VERTEX_ATTRIB_ARRAY_POINTER = 0x8645;
	public static inline var VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;
	
	public static inline var IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A;
	public static inline var IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B;
	
	public static inline var VERTEX_PROGRAM_POINT_SIZE = 0x8642;
	public static inline var POINT_SPRITE = 0x8861;
	
	public static inline var COMPILE_STATUS = 0x8B81;
	
	public static inline var LOW_FLOAT = 0x8DF0;
	public static inline var MEDIUM_FLOAT = 0x8DF1;
	public static inline var HIGH_FLOAT = 0x8DF2;
	public static inline var LOW_INT = 0x8DF3;
	public static inline var MEDIUM_INT = 0x8DF4;
	public static inline var HIGH_INT = 0x8DF5;
	
	public static inline var FRAMEBUFFER = 0x8D40;
	public static inline var RENDERBUFFER = 0x8D41;
	
	public static inline var RGBA4 = 0x8056;
	public static inline var RGB5_A1 = 0x8057;
	public static inline var RGB565 = 0x8D62;
	public static inline var DEPTH_COMPONENT16 = 0x81A5;
	public static inline var STENCIL_INDEX = 0x1901;
	public static inline var STENCIL_INDEX8 = 0x8D48;
	public static inline var DEPTH_STENCIL = 0x84F9;
	
	public static inline var RENDERBUFFER_WIDTH = 0x8D42;
	public static inline var RENDERBUFFER_HEIGHT = 0x8D43;
	public static inline var RENDERBUFFER_INTERNAL_FORMAT = 0x8D44;
	public static inline var RENDERBUFFER_RED_SIZE = 0x8D50;
	public static inline var RENDERBUFFER_GREEN_SIZE = 0x8D51;
	public static inline var RENDERBUFFER_BLUE_SIZE = 0x8D52;
	public static inline var RENDERBUFFER_ALPHA_SIZE = 0x8D53;
	public static inline var RENDERBUFFER_DEPTH_SIZE = 0x8D54;
	public static inline var RENDERBUFFER_STENCIL_SIZE = 0x8D55;
	
	public static inline var FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0;
	public static inline var FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1;
	public static inline var FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2;
	public static inline var FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;
	
	public static inline var COLOR_ATTACHMENT0 = 0x8CE0;
	public static inline var DEPTH_ATTACHMENT = 0x8D00;
	public static inline var STENCIL_ATTACHMENT = 0x8D20;
	public static inline var DEPTH_STENCIL_ATTACHMENT = 0x821A;
	
	public static inline var NONE = 0;
	
	public static inline var FRAMEBUFFER_COMPLETE = 0x8CD5;
	public static inline var FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6;
	public static inline var FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
	public static inline var FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9;
	public static inline var FRAMEBUFFER_UNSUPPORTED = 0x8CDD;
	
	public static inline var FRAMEBUFFER_BINDING = 0x8CA6;
	public static inline var RENDERBUFFER_BINDING = 0x8CA7;
	public static inline var MAX_RENDERBUFFER_SIZE = 0x84E8;
	
	public static inline var INVALID_FRAMEBUFFER_OPERATION = 0x0506;
	
	public static inline var UNPACK_FLIP_Y_WEBGL = 0x9240;
	public static inline var UNPACK_PREMULTIPLY_ALPHA_WEBGL = 0x9241;
	public static inline var CONTEXT_LOST_WEBGL = 0x9242;
	public static inline var UNPACK_COLORSPACE_CONVERSION_WEBGL = 0x9243;
	public static inline var BROWSER_DEFAULT_WEBGL = 0x9244;
	
	public static inline var READ_BUFFER = 0x0C02;
	public static inline var UNPACK_ROW_LENGTH = 0x0CF2;
	public static inline var UNPACK_SKIP_ROWS = 0x0CF3;
	public static inline var UNPACK_SKIP_PIXELS = 0x0CF4;
	public static inline var PACK_ROW_LENGTH = 0x0D02;
	public static inline var PACK_SKIP_ROWS = 0x0D03;
	public static inline var PACK_SKIP_PIXELS = 0x0D04;
	public static inline var TEXTURE_BINDING_3D = 0x806A;
	public static inline var UNPACK_SKIP_IMAGES = 0x806D;
	public static inline var UNPACK_IMAGE_HEIGHT = 0x806E;
	public static inline var MAX_3D_TEXTURE_SIZE = 0x8073;
	public static inline var MAX_ELEMENTS_VERTICES = 0x80E8;
	public static inline var MAX_ELEMENTS_INDICES = 0x80E9;
	public static inline var MAX_TEXTURE_LOD_BIAS = 0x84FD;
	public static inline var MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49;
	public static inline var MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A;
	public static inline var MAX_ARRAY_TEXTURE_LAYERS = 0x88FF;
	public static inline var MIN_PROGRAM_TEXEL_OFFSET = 0x8904;
	public static inline var MAX_PROGRAM_TEXEL_OFFSET = 0x8905;
	public static inline var MAX_VARYING_COMPONENTS = 0x8B4B;
	public static inline var FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B;
	public static inline var RASTERIZER_DISCARD = 0x8C89;
	public static inline var VERTEX_ARRAY_BINDING = 0x85B5;
	public static inline var MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122;
	public static inline var MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125;
	public static inline var MAX_SERVER_WAIT_TIMEOUT = 0x9111;
	public static inline var MAX_ELEMENT_INDEX = 0x8D6B;
	
	public static inline var RED = 0x1903;
	public static inline var RGB8 = 0x8051;
	public static inline var RGBA8 = 0x8058;
	public static inline var RGB10_A2 = 0x8059;
	public static inline var TEXTURE_3D = 0x806F;
	public static inline var TEXTURE_WRAP_R = 0x8072;
	public static inline var TEXTURE_MIN_LOD = 0x813A;
	public static inline var TEXTURE_MAX_LOD = 0x813B;
	public static inline var TEXTURE_BASE_LEVEL = 0x813C;
	public static inline var TEXTURE_MAX_LEVEL = 0x813D;
	public static inline var TEXTURE_COMPARE_MODE = 0x884C;
	public static inline var TEXTURE_COMPARE_FUNC = 0x884D;
	public static inline var SRGB = 0x8C40;
	public static inline var SRGB8 = 0x8C41;
	public static inline var SRGB8_ALPHA8 = 0x8C43;
	public static inline var COMPARE_REF_TO_TEXTURE = 0x884E;
	public static inline var RGBA32F = 0x8814;
	public static inline var RGB32F = 0x8815;
	public static inline var RGBA16F = 0x881A;
	public static inline var RGB16F = 0x881B;
	public static inline var TEXTURE_2D_ARRAY = 0x8C1A;
	public static inline var TEXTURE_BINDING_2D_ARRAY = 0x8C1D;
	public static inline var R11F_G11F_B10F = 0x8C3A;
	public static inline var RGB9_E5 = 0x8C3D;
	public static inline var RGBA32UI = 0x8D70;
	public static inline var RGB32UI = 0x8D71;
	public static inline var RGBA16UI = 0x8D76;
	public static inline var RGB16UI = 0x8D77;
	public static inline var RGBA8UI = 0x8D7C;
	public static inline var RGB8UI = 0x8D7D;
	public static inline var RGBA32I = 0x8D82;
	public static inline var RGB32I = 0x8D83;
	public static inline var RGBA16I = 0x8D88;
	public static inline var RGB16I = 0x8D89;
	public static inline var RGBA8I = 0x8D8E;
	public static inline var RGB8I = 0x8D8F;
	public static inline var RED_INTEGER = 0x8D94;
	public static inline var RGB_INTEGER = 0x8D98;
	public static inline var RGBA_INTEGER = 0x8D99;
	public static inline var R8 = 0x8229;
	public static inline var RG8 = 0x822B;
	public static inline var R16F = 0x822D;
	public static inline var R32F = 0x822E;
	public static inline var RG16F = 0x822F;
	public static inline var RG32F = 0x8230;
	public static inline var R8I = 0x8231;
	public static inline var R8UI = 0x8232;
	public static inline var R16I = 0x8233;
	public static inline var R16UI = 0x8234;
	public static inline var R32I = 0x8235;
	public static inline var R32UI = 0x8236;
	public static inline var RG8I = 0x8237;
	public static inline var RG8UI = 0x8238;
	public static inline var RG16I = 0x8239;
	public static inline var RG16UI = 0x823A;
	public static inline var RG32I = 0x823B;
	public static inline var RG32UI = 0x823C;
	public static inline var R8_SNORM = 0x8F94;
	public static inline var RG8_SNORM = 0x8F95;
	public static inline var RGB8_SNORM = 0x8F96;
	public static inline var RGBA8_SNORM = 0x8F97;
	public static inline var RGB10_A2UI = 0x906F;
	public static inline var TEXTURE_IMMUTABLE_FORMAT = 0x912F;
	public static inline var TEXTURE_IMMUTABLE_LEVELS = 0x82DF;
	
	public static inline var UNSIGNED_INT_2_10_10_10_REV = 0x8368;
	public static inline var UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B;
	public static inline var UNSIGNED_INT_5_9_9_9_REV = 0x8C3E;
	public static inline var FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD;
	public static inline var UNSIGNED_INT_24_8 = 0x84FA;
	public static inline var HALF_FLOAT = 0x140B;
	public static inline var RG = 0x8227;
	public static inline var RG_INTEGER = 0x8228;
	public static inline var INT_2_10_10_10_REV = 0x8D9F;
	
	public static inline var CURRENT_QUERY = 0x8865;
	public static inline var QUERY_RESULT = 0x8866;
	public static inline var QUERY_RESULT_AVAILABLE = 0x8867;
	public static inline var ANY_SAMPLES_PASSED = 0x8C2F;
	public static inline var ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A;
	
	public static inline var MAX_DRAW_BUFFERS = 0x8824;
	public static inline var DRAW_BUFFER0 = 0x8825;
	public static inline var DRAW_BUFFER1 = 0x8826;
	public static inline var DRAW_BUFFER2 = 0x8827;
	public static inline var DRAW_BUFFER3 = 0x8828;
	public static inline var DRAW_BUFFER4 = 0x8829;
	public static inline var DRAW_BUFFER5 = 0x882A;
	public static inline var DRAW_BUFFER6 = 0x882B;
	public static inline var DRAW_BUFFER7 = 0x882C;
	public static inline var DRAW_BUFFER8 = 0x882D;
	public static inline var DRAW_BUFFER9 = 0x882E;
	public static inline var DRAW_BUFFER10 = 0x882F;
	public static inline var DRAW_BUFFER11 = 0x8830;
	public static inline var DRAW_BUFFER12 = 0x8831;
	public static inline var DRAW_BUFFER13 = 0x8832;
	public static inline var DRAW_BUFFER14 = 0x8833;
	public static inline var DRAW_BUFFER15 = 0x8834;
	public static inline var MAX_COLOR_ATTACHMENTS = 0x8CDF;
	public static inline var COLOR_ATTACHMENT1 = 0x8CE1;
	public static inline var COLOR_ATTACHMENT2 = 0x8CE2;
	public static inline var COLOR_ATTACHMENT3 = 0x8CE3;
	public static inline var COLOR_ATTACHMENT4 = 0x8CE4;
	public static inline var COLOR_ATTACHMENT5 = 0x8CE5;
	public static inline var COLOR_ATTACHMENT6 = 0x8CE6;
	public static inline var COLOR_ATTACHMENT7 = 0x8CE7;
	public static inline var COLOR_ATTACHMENT8 = 0x8CE8;
	public static inline var COLOR_ATTACHMENT9 = 0x8CE9;
	public static inline var COLOR_ATTACHMENT10 = 0x8CEA;
	public static inline var COLOR_ATTACHMENT11 = 0x8CEB;
	public static inline var COLOR_ATTACHMENT12 = 0x8CEC;
	public static inline var COLOR_ATTACHMENT13 = 0x8CED;
	public static inline var COLOR_ATTACHMENT14 = 0x8CEE;
	public static inline var COLOR_ATTACHMENT15 = 0x8CEF;
	
	public static inline var SAMPLER_3D = 0x8B5F;
	public static inline var SAMPLER_2D_SHADOW = 0x8B62;
	public static inline var SAMPLER_2D_ARRAY = 0x8DC1;
	public static inline var SAMPLER_2D_ARRAY_SHADOW = 0x8DC4;
	public static inline var SAMPLER_CUBE_SHADOW = 0x8DC5;
	public static inline var INT_SAMPLER_2D = 0x8DCA;
	public static inline var INT_SAMPLER_3D = 0x8DCB;
	public static inline var INT_SAMPLER_CUBE = 0x8DCC;
	public static inline var INT_SAMPLER_2D_ARRAY = 0x8DCF;
	public static inline var UNSIGNED_INT_SAMPLER_2D = 0x8DD2;
	public static inline var UNSIGNED_INT_SAMPLER_3D = 0x8DD3;
	public static inline var UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4;
	public static inline var UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7;
	public static inline var MAX_SAMPLES = 0x8D57;
	public static inline var SAMPLER_BINDING = 0x8919;
	
	public static inline var PIXEL_PACK_BUFFER = 0x88EB;
	public static inline var PIXEL_UNPACK_BUFFER = 0x88EC;
	public static inline var PIXEL_PACK_BUFFER_BINDING = 0x88ED;
	public static inline var PIXEL_UNPACK_BUFFER_BINDING = 0x88EF;
	public static inline var COPY_READ_BUFFER = 0x8F36;
	public static inline var COPY_WRITE_BUFFER = 0x8F37;
	public static inline var COPY_READ_BUFFER_BINDING = 0x8F36;
	public static inline var COPY_WRITE_BUFFER_BINDING = 0x8F37;
	
	public static inline var FLOAT_MAT2x3 = 0x8B65;
	public static inline var FLOAT_MAT2x4 = 0x8B66;
	public static inline var FLOAT_MAT3x2 = 0x8B67;
	public static inline var FLOAT_MAT3x4 = 0x8B68;
	public static inline var FLOAT_MAT4x2 = 0x8B69;
	public static inline var FLOAT_MAT4x3 = 0x8B6A;
	public static inline var UNSIGNED_INT_VEC2 = 0x8DC6;
	public static inline var UNSIGNED_INT_VEC3 = 0x8DC7;
	public static inline var UNSIGNED_INT_VEC4 = 0x8DC8;
	public static inline var UNSIGNED_NORMALIZED = 0x8C17;
	public static inline var SIGNED_NORMALIZED = 0x8F9C;
	
	public static inline var VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD;
	public static inline var VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE;
	
	public static inline var TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F;
	public static inline var MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80;
	public static inline var TRANSFORM_FEEDBACK_VARYINGS = 0x8C83;
	public static inline var TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84;
	public static inline var TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85;
	public static inline var TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88;
	public static inline var MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A;
	public static inline var MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B;
	public static inline var INTERLEAVED_ATTRIBS = 0x8C8C;
	public static inline var SEPARATE_ATTRIBS = 0x8C8D;
	public static inline var TRANSFORM_FEEDBACK_BUFFER = 0x8C8E;
	public static inline var TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F;
	public static inline var TRANSFORM_FEEDBACK = 0x8E22;
	public static inline var TRANSFORM_FEEDBACK_PAUSED = 0x8E23;
	public static inline var TRANSFORM_FEEDBACK_ACTIVE = 0x8E24;
	public static inline var TRANSFORM_FEEDBACK_BINDING = 0x8E25;
	
	public static inline var FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210;
	public static inline var FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211;
	public static inline var FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212;
	public static inline var FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213;
	public static inline var FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214;
	public static inline var FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215;
	public static inline var FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216;
	public static inline var FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217;
	public static inline var FRAMEBUFFER_DEFAULT = 0x8218;
	public static inline var DEPTH24_STENCIL8 = 0x88F0;
	public static inline var DRAW_FRAMEBUFFER_BINDING = 0x8CA6;
	public static inline var READ_FRAMEBUFFER = 0x8CA8;
	public static inline var DRAW_FRAMEBUFFER = 0x8CA9;
	public static inline var READ_FRAMEBUFFER_BINDING = 0x8CAA;
	public static inline var RENDERBUFFER_SAMPLES = 0x8CAB;
	public static inline var FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4;
	public static inline var FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56;
	
	public static inline var UNIFORM_BUFFER = 0x8A11;
	public static inline var UNIFORM_BUFFER_BINDING = 0x8A28;
	public static inline var UNIFORM_BUFFER_START = 0x8A29;
	public static inline var UNIFORM_BUFFER_SIZE = 0x8A2A;
	public static inline var MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B;
	public static inline var MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D;
	public static inline var MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E;
	public static inline var MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F;
	public static inline var MAX_UNIFORM_BLOCK_SIZE = 0x8A30;
	public static inline var MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31;
	public static inline var MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33;
	public static inline var UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34;
	public static inline var ACTIVE_UNIFORM_BLOCKS = 0x8A36;
	public static inline var UNIFORM_TYPE = 0x8A37;
	public static inline var UNIFORM_SIZE = 0x8A38;
	public static inline var UNIFORM_BLOCK_INDEX = 0x8A3A;
	public static inline var UNIFORM_OFFSET = 0x8A3B;
	public static inline var UNIFORM_ARRAY_STRIDE = 0x8A3C;
	public static inline var UNIFORM_MATRIX_STRIDE = 0x8A3D;
	public static inline var UNIFORM_IS_ROW_MAJOR = 0x8A3E;
	public static inline var UNIFORM_BLOCK_BINDING = 0x8A3F;
	public static inline var UNIFORM_BLOCK_DATA_SIZE = 0x8A40;
	public static inline var UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42;
	public static inline var UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43;
	public static inline var UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44;
	public static inline var UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46;
	
	public static inline var OBJECT_TYPE = 0x9112;
	public static inline var SYNC_CONDITION = 0x9113;
	public static inline var SYNC_STATUS = 0x9114;
	public static inline var SYNC_FLAGS = 0x9115;
	public static inline var SYNC_FENCE = 0x9116;
	public static inline var SYNC_GPU_COMMANDS_COMPLETE = 0x9117;
	public static inline var UNSIGNALED = 0x9118;
	public static inline var SIGNALED = 0x9119;
	public static inline var ALREADY_SIGNALED = 0x911A;
	public static inline var TIMEOUT_EXPIRED = 0x911B;
	public static inline var CONDITION_SATISFIED = 0x911C;
	public static inline var WAIT_FAILED = 0x911D;
	public static inline var SYNC_FLUSH_COMMANDS_BIT = 0x00000001;
	
	public static inline var COLOR = 0x1800;
	public static inline var DEPTH = 0x1801;
	public static inline var STENCIL = 0x1802;
	public static inline var MIN = 0x8007;
	public static inline var MAX = 0x8008;
	public static inline var DEPTH_COMPONENT24 = 0x81A6;
	public static inline var STREAM_READ = 0x88E1;
	public static inline var STREAM_COPY = 0x88E2;
	public static inline var STATIC_READ = 0x88E5;
	public static inline var STATIC_COPY = 0x88E6;
	public static inline var DYNAMIC_READ = 0x88E9;
	public static inline var DYNAMIC_COPY = 0x88EA;
	public static inline var DEPTH_COMPONENT32F = 0x8CAC;
	public static inline var DEPTH32F_STENCIL8 = 0x8CAD;
	public static inline var INVALID_INDEX = 0xFFFFFFFF;
	public static inline var TIMEOUT_IGNORED = -1;
	public static inline var MAX_CLIENT_WAIT_TIMEOUT_WEBGL = 0x9247;
	
	public static var context (default, null):GLRenderContext;
	public static var type (get, null):GLContextType;
	public static var version (get, null):Float;
	
	private static var __currentProgram:GLProgram;
	
	
	#if (js && html5)
	static var __lastLoseContextExtension:Dynamic;
	
	@:expose("loseGLContext")
	static function loseContext() {
		__lastLoseContextExtension = context.getExtension('WEBGL_lose_context');
		__lastLoseContextExtension.loseContext();
	}
	
	@:expose("restoreGLContext")
	static function restoreContext() {
		__lastLoseContextExtension.restoreContext();
		__lastLoseContextExtension = null;
	}
	#end
	
	
	#if commonjs
	private static function __init__ () {
		
		untyped Object.defineProperties (GL, {
			"type": { get: function () { return GL.get_type (); } },
			"version": { get: function () { return GL.get_version (); } }
		});
		
	}
	#end
	
	
	private static function get_type ():GLContextType { return context.type; }
	private static function get_version ():Float { return context.version; }
	
	
	private static inline function __getObjectID (object:#if (!js || !html5 || display) GLObject #else Dynamic #end):Int {
		
		return (object == null) ? 0 : @:privateAccess object.id;
		
	}
	
	
}


#if (!js || !html5 || display)
@:access(lime._backend.native.NativeCFFI)
@:dox(hide) @:noCompletion class GLObject {
	
	
	private var id:Int;
	private var refs:Array<GLObject>;
	
	
	private function new (id:Int) {
		
		this.id = id;
		
	}
	
	
	public static function fromInt (type:GLObjectType, id:Int):GLObject {
		
		if (id == 0) return null;
		
		#if (lime_cffi && lime_opengl && !macro)
		var object = NativeCFFI.lime_gl_object_from_id (id, type);
		
		if (object != null) {
			
			return object;
			
		}
		
		object = new GLObject (id);
		NativeCFFI.lime_gl_object_register (id, type, object);
		return object;
		#else
		return null;
		#end
		
	}
	
	
}


@:dox(hide) @:noCompletion @:enum abstract GLObjectType(Int) to Int {
	
	var UNKNOWN = 0;
	var PROGRAM = 1;
	var SHADER = 2;
	var BUFFER = 3;
	var TEXTURE = 4;
	var FRAMEBUFFER = 5;
	var RENDERBUFFER = 6;
	var VERTEX_ARRAY_OBJECT = 7;
	var QUERY = 8;
	var SAMPLER = 9;
	var SYNC = 10;
	var TRANSFORM_FEEDBACK = 11;
	
}
#end