{**************************************************************************************
* Copyright (c)
* All rights reserved.
*
* FileName：
*
* History:
*  ------------------------------------------------------------
*  2009/08/20   modified
*
*******************************************************************************************}
unit helpRy3;

interface

uses
  Windows, WinSock, Nb30;

//错误码
const RY_SUCCESS = $00000000; // 操作成功
const RY_NOT_FOUND = $F0000001; // 未找到指定的设备
const RY_INVALID_PARAMETER = $F0000002; // 参数错误
const RY_COMM_ERROR = $F0000003; // 通讯错误
const RY_INSUFFICIENT_BUFFER = $F0000004; // 缓冲区空间不足
const RY_NO_LIST = $F0000005; // 没有找到设备列表
const RY_DEVPIN_NOT_CHECK = $F0000006; // 开发商口令没有验证
const RY_USERPIN_NOT_CHECK = $F0000007; // 用户口令没有验证
const RY_RSA_FILE_FORMAT_ERROR = $F0000008; // RSA文件格式错误
const RY_DIR_NOT_FOUND = $F0000009; // 目录没有找到
const RY_ACCESS_DENIED = $F000000A; // 访问被拒绝
const RY_ALREADY_INITIALIZED = $F000000B; // 产品已经初始化
const RY_INCORRECT_PIN = $F0000C00; // 密码不正确
const RY_DF_SIZE = $F000000D; // 指定的目录空间大小不够
const RY_FILE_EXIST = $F000000E; // 文件已存在
const RY_UNSUPPORTED = $F000000F; // 功能不支持或尚未建立文件系统
const RY_FILE_NOT_FOUND = $F0000010; // 未找到指定的文件
const RY_ALREADY_OPENED = $F0000011; // 卡已经被打开
const RY_DIRECTORY_EXIST = $F0000012; // 目录已存在
const RY_CODE_RANGE = $F0000013; // 虚拟机内存地址溢出
const RY_INVALID_POINTER = $F0000014; // 虚拟机错误的指针
const RY_GENERAL_FILESYSTEM = $F0000015; // 常规文件系统错误
const RY_OFFSET_BEYOND = $F0000016; // 文件偏移量超出文件大小
const RY_FILE_TYPE_MISMATCH = $F0000017; // 文件类型不匹配
const RY_PIN_BLOCKED = $F0000018; // PIN码锁死
const RY_INVALID_HANDLE = $F0000019; // 无效的句柄
const RY_ERROR_UNKNOWN = $FFFFFFFF; // 未知的错误


const RY_C51_SUCCESS = $00000000; //	成功
const RY_C51_UNKNOWN = $00000001; //	未知错误
const RY_C51_INVALID_PARAMETER = $00000002; //	无效的参数
const RY_C51_INVALID_ADDRESS = $00000003; //	无效的地址,虚拟机地址越界
const RY_C51_INVALID_SIZE = $00000004; //	无效的长度
const RY_C51_FILE_NOT_FOUND = $00000005; //	文件没找到
const RY_C51_ACCESS_DENIED = $00000006; //	访问文件失败
const RY_C51_FILE_SELECT = $00000007; //	文件打开个数已达上限
const RY_C51_INVALID_HANDLE = $00000008; //	无效的文件句柄
const RY_C51_FILE_OUT_OF_RANGE = $00000009; //	文件读写越界
const RY_C51_FILE_TYPE_MISMATCH = $0000000A; //	文件存在但类型不匹配
const RY_C51_FILE_SIZE_MISMATCH = $0000000B; //	文件存在但长度不匹配
const RY_C51_NO_SPACE = $0000000C; //	文件夹空间不足
const RY_C51_FILE_EXIST = $0000000D; //	文件或子目录已存在
const RY_C51_INVALID_KEY_FORMAT = $0000000E; //	无效的RSA密钥文件格式
const RY_C51_KEY_LEN_MISMATCH = $0000000F; //  用户传入的密钥长度与实际长度不匹配
const RY_C51_RSA_INVALID_KEY_FILE = $00000010; //	文件类型不符合要求
const RY_C51_RSA_ENC_DEC_FAILED = $00000011; //	RSA加密解密失败
const RY_C51_RSA_SIGN_VERI_FAILED = $00000012; //	RSA签名验证失败
const RY_C51_SHA1 = $00000013; //  SHA1计算错误
const RY_C51_MD5 = $00000014; //  MD5计算错误
const RY_C51_INVALID_ADDERSS = $00000015; //  无效的内存指针
const RY_C51_EEPROM = $00000016; //  写EEPROM错误

const ET_LED_ON = $1;
const ET_LED_OFF = $2;
const ET_LED_WINK = $3;

const FILE_TYPE_EXE = $0; //可执行文件
const FILE_TYPE_DATA = $1; //数据文件
const FILE_TYPE_RSA_PUBLIC = $2; //RSA 公钥文件
const FILE_TYPE_RSA_PRIVATE = $3; //RSA 私钥文件

const FLAG_ENCODE = $0;
const FLAG_DECODE = $1;

const Data_TYPE_PubKey = $0; //公钥数据
const Data_TYPE_PriKey = $1; //私钥数据
const Data_TYPE_EsKey = $2; //ES密钥数据
const Data_TYPE_Memory = $3; //8192字节数据区

type
  PWord = ^Word;
  PLongword = ^Longword;
  PHIDP_PREPARSED_DATA = ^Byte;
  PPHIDP_PREPARSED_DATA = ^PHIDP_PREPARSED_DATA;
  PCSTR = ^Char;
  PByte = ^Byte;
  psize_t = ^size_t;
  size_t = Cardinal;


//===============================================================================
//查找RY3 (输入VendorID字串, 输出找到的RY3数目)
function RY3_Find(pVendorID: PChar; pCount: Pinteger): integer; stdcall;
{$EXTERNALSYM RY3_Find}

//打开指定条目的RY3 (输入条目,基于1,输出句柄)
function RY3_Open(pHandle: Pinteger; Item: integer): integer; stdcall;
{$EXTERNALSYM RY3_Open}

//关闭RY3
function RY3_Close(handle: integer; IsReset: integer): integer; stdcall;
{$EXTERNALSYM RY3_Close}

//设置VendorID
function RY3_SetVendorID(handle: integer; pSeed: PChar; len: integer; pOutVendorID: PChar): integer; stdcall;
{$EXTERNALSYM RY3_SetVendorID}

//获取硬件序列号(输出16字节的字符串)
function RY3_GetHardID(handle: integer; pbuf: PChar): integer; stdcall;
{$EXTERNALSYM RY3_GetHardID}

//获取随机数(len指定所需的随机数长度)
function RY3_GenRandom(handle: integer; len_need: integer; pOutbuf: PChar): integer; stdcall;
{$EXTERNALSYM RY3_GenRandom}

//获取空闲空间大小
function RY3_GetFreeSize(handle: integer; pSize: Pinteger): integer; stdcall;
{$EXTERNALSYM RY3_GetFreeSize}

//LED控制
function RY3_LEDControl(handle: integer; flag: integer): integer; stdcall;
{$EXTERNALSYM RY3_LEDControl}

//校验开发商密码
//校验成功时返回的RemainCount  0
//校验失败时返回的RemainCount  0:已锁死  1-254:剩余次数  255:无限制
function RY3_VerifyDevPin(handle: integer; pInPin: PChar; pRemainCount: Pinteger): integer; stdcall;
{$EXTERNALSYM RY3_VerifyDevPin}

//更改开发商密码(TryCount取值范围为0-255, 其中0和255表示无限制)
function RY3_ChangeDevPin(handle: integer; pOldPin: PChar; pNewPin: PChar; TryCount: integer): integer; stdcall;
{$EXTERNALSYM RY3_ChangeDevPin}

//读存储区(0-8192字节)
function RY3_Read(handle: integer; offset: integer; pOutbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_Read}

//写存储区(0-7168字节)
function RY3_Write(handle: integer; offset: integer; pInbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_Write}

//开发商写存储区(0-8192字节)
function RY3_VendorWrite(handle: integer; offset: integer; pInbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_VendorWrite}

//读锁共享内存区(0-32字节)
function RY3_ReadShare(handle: integer; offset: integer; pbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_ReadShare}

//写锁共享内存区(0-32字节)
function RY3_WriteShare(handle: integer; offset: integer; pbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_WriteShare}


//创建文件
function RY3_CreateFile(handle: integer; FileID: Word; Size: integer; Type1: integer): integer; stdcall;
{$EXTERNALSYM RY3_CreateFile}

//写文件
function RY3_WriteFile(handle: integer; FileID: Word; offset: integer; pbuf: PByte; Size: integer): integer; stdcall;
{$EXTERNALSYM RY3_WriteFile}

//执行文件
function RY3_ExecuteFile(handle: integer; FileID: Word; pInBuf: PByte; InSize: integer; pOutBuf: PByte; pOutSize: PLongword): integer; stdcall;
{$EXTERNALSYM RY3_ExecuteFile}

//删除所有文件
function RY3_EraseAllFile(handle: integer): integer; stdcall;
{$EXTERNALSYM RY3_EraseAllFile}

//产生RSA公私钥(kid取值范围:0-8, 其中0表示升级公私钥对, 1-8为普通公私钥对)
//pPubBakup中输出140字节的公钥供备份
//pPriBakup中输出340字节的私钥供备份
//pPubBakup或pPriBakup为NULL时表示不备份
function RY3_GenRsaKey(handle: integer; kid: integer; pPubBakup: PByte; pPriBakup: PByte): integer; stdcall;
{$EXTERNALSYM RY3_GenRsaKey}

//设置RSA公私钥(kid取值范围:0-8, 其中0表示升级公私钥对, 1-8为普通公私钥对)
//pPubKey中输入140字节的公钥供写入
//pPriKey中输入340字节的私钥供写入
//pPubKey或pPriKey为NULL时表示不写入
function RY3_SetRsaKey(handle: integer; kid: integer; pPubKey: PByte; pPriKey: PByte): integer; stdcall;
{$EXTERNALSYM RY3_SetRsaKey}

//公钥加密算法(kid取值范围:1-8)
//输入数据长度必须是128的整数倍
function RY3_PublicEncrypt(handle: integer; kid: integer; pBuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_PublicEncrypt}

//私钥解密算法(kid取值范围:1-8)
//输入数据长度必须是128的整数倍
function RY3_PrivateDecrypt(handle: integer; kid: integer; pBuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_PrivateDecrypt}

//MD5签名算法
function RY3_MD5(handle: integer; pBuf: PByte; len: integer; pMD5: PByte): integer; stdcall;
{$EXTERNALSYM RY3_MD5}

//SHA1签名算法
function RY3_SHA1(handle: integer; pBuf: PByte; len: integer; pSHA1: PByte): integer; stdcall;
{$EXTERNALSYM RY3_SHA1}


//设置ES加解密的密钥,密钥长度固定为16字节, (kid取值范围:1-8)
function RY3_Set3DESKey(handle: integer; kid: integer; pKey: PByte): integer; stdcall;
{$EXTERNALSYM RY3_Set3DESKey}

//3DES加解密算法(kid取值范围:1-8)
//输入数据长度必须是8的整数倍
function RY3_3DES(handle: integer; kid: integer; flag: integer; pInBuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_3DES}

//远程升级加密锁内数据(pbuf中是升级公钥加密的UpdateData数据结构, len必须是128字节的整数倍)
function RY3_Update(handle: integer; pbuf: PByte; len: integer): integer; stdcall;
{$EXTERNALSYM RY3_Update}

//产生升级数据包
//pLicSN:     指向允许升级的锁的硬件序列号,如果pLicSN=NULL表示不限制硬件序列号
//type:       要升级的数据类型
//kid_offset: 要升级的数据条目或偏移地址(为条目时,取值范围为1-8, 当type=Data_TYPE_Memory时,kid表示8192数据区的偏移地址)
//pbuf:       要升级的数据地址
//len:        要升级的数据长度(注:len必须为140字节(公钥数据),340字节(私钥数据),16字节(ES密钥数据))
//pUPubKey:   指向升级公钥数据
//pOutData:   输出产生的升级数据包
//pOutLen:    输出升级数据包的长度
function RY3_GenUpdatePacket(handle: integer; pLicSN: PChar; type1: integer; kid_offset: integer; pbuf: PByte; len: integer; pUPubKey: PByte; pOutData: PByte; pOutLen: PLongword): integer; stdcall;
{$EXTERNALSYM RY3_GenUpdatePacket}


type
  GUID = record
    Data1: Longword;
    Data2: Word;
    Data3: Word;
    Data4: array[0..7] of Byte;
  end;

  Array128 = array[0..127] of WORD;
  pArray128 = ^Array128;

  LPGUID = ^GUID;

  HIDP_CAPS = record
    Usage: Word;
    UsagePage: Word;
    InputReportByteLength: Word;
    OutputReportByteLength: Word;
    FeatureReportByteLength: Word;
    Reserved: array[0..16] of Word;
    NumberLinkCollectionNodes: Word;
    NumberInputButtonCaps: Word;
    NumberInputValueCaps: Word;
    NumberInputDataIndices: Word;
    NumberOutputButtonCaps: Word;
    NumberOutputValueCaps: Word;
    NumberOutputDataIndices: Word;
    NumberFeatureButtonCaps: Word;
    NumberFeatureValueCaps: Word;
    NumberFeatureDataIndices: Word;
  end;

  PHIDP_CAPS = ^HIDP_CAPS;

  HIDD_ATTRIBUTES = record
    Size: Longword;
    VendorID: Word;
    ProductID: Word;
    VersionNumber: Word;
  end;

  PHIDD_ATTRIBUTES = ^HIDD_ATTRIBUTES;

  SP_DEVICE_INTERFACE_DATA = record
    cbSize: Longword;
    InterfaceClassGuid: GUID;
    Flags: Longword;
    Reserved: Longword;
  end;

  PSP_DEVICE_INTERFACE_DATA = ^SP_DEVICE_INTERFACE_DATA;

  SP_DEVICE_INTERFACE_DETAIL_DATA_A = record
    cbSize: Longword;
    DevicePath: array[0..4096] of Char;
  end;

  PSP_DEVICE_INTERFACE_DETAIL_DATA_A = ^SP_DEVICE_INTERFACE_DETAIL_DATA_A;
  PSP_DEVICE_INTERFACE_DETAIL_DATA = ^SP_DEVICE_INTERFACE_DETAIL_DATA_A;

  SP_DEVINFO_DATA = record
    cbSize: Longword;
    ClassGuid: GUID;
    DevInst: Longword;
    Reserved: Longword;
  end;

  PSP_DEVINFO_DATA = ^SP_DEVINFO_DATA;
  Feature_Report = packed record
    id: Byte;
    command: array[0..4] of Byte;
    data: array[0..17] of Byte;
    CrcData: Byte;
  end;

  PFeature_Report = ^Feature_Report;

  Device_Descript = record
    device_path: array[0..255] of Char;
    device_handle: THandle;
    uid: Longword;
    hid: Longword;
    hver: Word;
    mutex: THandle;
    KeyPass: array[0..8] of char;
    Encrypt: integer;
  end;
{$EXTERNALSYM HidD_FreePreparsedData}
function HidD_FreePreparsedData(PreparsedData: PHIDP_PREPARSED_DATA): Boolean; cdecl;
{$EXTERNALSYM HidP_GetCaps}
function HidP_GetCaps(PreparsedData: PHIDP_PREPARSED_DATA; Capabilities: PHIDP_CAPS): Longint; cdecl;
{$EXTERNALSYM HidD_GetPreparsedData}
function HidD_GetPreparsedData(HidDeviceObject: THandle; PreparsedData: PPHIDP_PREPARSED_DATA): Boolean; cdecl;
{$EXTERNALSYM HidD_SetFeature}
function HidD_SetFeature(HidDeviceObject: THandle; ReportBuffer: pointer; ReportBufferLength: Longword): Boolean; cdecl;
{$EXTERNALSYM HidD_GetFeature}
function HidD_GetFeature(HidDeviceObject: THandle; ReportBuffer: pointer; ReportBufferLength: Longword): Boolean; cdecl;
{$EXTERNALSYM HidD_FlushQueue}
function HidD_FlushQueue(HidDeviceObject: THandle): Boolean; cdecl;
{$EXTERNALSYM HidD_GetSerialNumberString}
function HidD_GetSerialNumberString(HidDeviceObject: THandle; Buffer: PChar; BufferLength: Longword): Boolean; cdecl;
{$EXTERNALSYM HidD_GetProductString}
function HidD_GetProductString(HidDeviceObject: THandle; Buffer: PChar; BufferLength: Longword): Boolean; cdecl;
{$EXTERNALSYM HidD_GetAttributes}
function HidD_GetAttributes(HidDeviceObject: THandle; Attributes: PHIDD_ATTRIBUTES): Boolean; cdecl;
{$EXTERNALSYM HidD_GetHidGuid}
function HidD_GetHidGuid(HidGuid: LPGUID): integer; cdecl;
{$EXTERNALSYM HidD_GetManufacturerString}
function HidD_GetManufacturerString(HidDeviceObject: THANDLE; Buffer: PCHAR; BufferLength: ULONG): Boolean; cdecl;

{$EXTERNALSYM SetupDiDestroyDeviceInfoList}
function SetupDiDestroyDeviceInfoList(DeviceInfoSet: THandle): Boolean; cdecl;
{$EXTERNALSYM SetupDiGetDeviceInterfaceDetailA}
function SetupDiGetDeviceInterfaceDetailA(DeviceInfoSet: THandle; DeviceInterfaceData: PSP_DEVICE_INTERFACE_DATA; DeviceInterfaceDetailData: PSP_DEVICE_INTERFACE_DETAIL_DATA_A; DeviceInterfaceDetailDataSize: Longword; RequiredSize: PLongword; DeviceInfoData: PSP_DEVINFO_DATA): Boolean; cdecl;
{$EXTERNALSYM SetupDiEnumDeviceInterfaces}
function SetupDiEnumDeviceInterfaces(DeviceInfoSet: THandle; DeviceInfoData: PSP_DEVINFO_DATA; InterfaceClassGuid: LPGUID; MemberIndex: Longword; DeviceInterfaceData: PSP_DEVICE_INTERFACE_DATA): Boolean; cdecl;
{$EXTERNALSYM SetupDiGetClassDevsA}
function SetupDiGetClassDevsA(ClassGuid: LPGUID; Enumerator: PCSTR; hwndParent: HWND; Flags: Longword): THandle; cdecl;

{$EXTERNALSYM _memset}
function _memset(s: Pointer; c: Integer; n: size_t): Pointer; cdecl;
{$EXTERNALSYM _memcpy}
function _memcpy(s1: Pointer; const s2: Pointer; n: size_t): Pointer; cdecl;
{$EXTERNALSYM _memcmp}
function _memcmp(s1: Pointer; const s2: Pointer; n: size_t): Integer; cdecl;
{$EXTERNALSYM _strcpy}
function _strcpy(s1: PChar; const s2: PChar): PChar; cdecl;
{$EXTERNALSYM _strlen}
function _strlen(const s: PChar): size_t; cdecl;
{$EXTERNALSYM _strcmp}
function _strcmp(const s1, s2: PChar): Integer; cdecl;
{$EXTERNALSYM _strncmp}
function _strncmp(const s1, s2: PChar; n: size_t): Integer; cdecl;
{$EXTERNALSYM _strncpy}
function _strncpy(s1: PChar; const s2: PChar; n: size_t): PChar; cdecl;
{$EXTERNALSYM _sscanf}
function _sscanf(const s, format: PChar): Integer; cdecl; varargs;
{$EXTERNALSYM _sprintf}
function _printf(const format: PChar): Integer; cdecl; varargs;
function _sprintf(s: PChar; const format: PChar): Integer; cdecl; varargs;
function _rand(): Integer; cdecl;
procedure _srand(val1: Integer); cdecl;

implementation

const
  msvcrtdll = 'msvcrt.dll';
  hiddll = 'HID.DLL';
  setupapidll = 'SETUPAPI.DLL';
  ws2_32dll = 'WS2_32.DLL';

{$LINK 'Rockey3_Delphi'} //链接外部OBJ文件
function RY3_Find; external;
function RY3_Open; external;
function RY3_Close; external;
function RY3_SetVendorID; external;
function RY3_GetHardID; external;
function RY3_GenRandom; external;
function RY3_GetFreeSize; external;
function RY3_LEDControl; external;
function RY3_VerifyDevPin; external;
function RY3_ChangeDevPin; external;
function RY3_Read; external;
function RY3_Write; external;
function RY3_VendorWrite; external;
function RY3_ReadShare; external;
function RY3_WriteShare; external;
function RY3_CreateFile; external;
function RY3_WriteFile; external;
function RY3_ExecuteFile; external;
function RY3_EraseAllFile; external;
function RY3_GenRsaKey; external;
function RY3_SetRsaKey; external;
function RY3_PublicEncrypt; external;
function RY3_PrivateDecrypt; external;
function RY3_MD5; external;
function RY3_SHA1; external;
function RY3_Set3DESKey; external;
function RY3_3DES; external;
function RY3_Update; external;
function RY3_GenUpdatePacket; external;


//hid function
function HidD_FreePreparsedData; external hiddll name 'HidD_FreePreparsedData';
function HidP_GetCaps; external hiddll name 'HidP_GetCaps';
function HidD_GetPreparsedData; external hiddll name 'HidD_GetPreparsedData';
function HidD_SetFeature; external hiddll name 'HidD_SetFeature';
function HidD_GetFeature; external hiddll name 'HidD_GetFeature';
function HidD_FlushQueue; external hiddll name 'HidD_FlushQueue';
function HidD_GetSerialNumberString; external hiddll name 'HidD_GetSerialNumberString';
function HidD_GetProductString; external hiddll name 'HidD_GetProductString';
function HidD_GetAttributes; external hiddll name 'HidD_GetAttributes';
function HidD_GetHidGuid; external hiddll name 'HidD_GetHidGuid';
function HidD_GetManufacturerString; external hiddll name 'HidD_GetManufacturerString';

//setupapi function
function SetupDiDestroyDeviceInfoList; external setupapidll name 'SetupDiDestroyDeviceInfoList';
function SetupDiGetDeviceInterfaceDetailA; external setupapidll name 'SetupDiGetDeviceInterfaceDetailA';
function SetupDiEnumDeviceInterfaces; external setupapidll name 'SetupDiEnumDeviceInterfaces';
function SetupDiGetClassDevsA; external setupapidll name 'SetupDiGetClassDevsA';

//msvcrt function
function _memset; external msvcrtdll name 'memset';
function _memcpy; external msvcrtdll name 'memcpy';
function _memcmp; external msvcrtdll name 'memcmp';
function _strcpy; external msvcrtdll name 'strcpy';
function _strlen; external msvcrtdll name 'strlen';
function _strcmp; external msvcrtdll name 'strcmp';
function _strncmp; external msvcrtdll name 'strncmp';
function _strncpy; external msvcrtdll name 'strncpy';
function _sscanf; external msvcrtdll name 'sscanf';
function _printf; external msvcrtdll name 'printf';
function _sprintf; external msvcrtdll name 'sprintf';
function _rand; external msvcrtdll name 'rand';
procedure _srand; external msvcrtdll name 'srand';


end.

