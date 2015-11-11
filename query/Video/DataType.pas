unit DataType;

///////////////////////////////////////////////////////////////////////////
// DS-40xxHC/HF BOARD SYSTEM SDK								 //
///////////////////////////////////////////////////////////////////////////

interface

const FRAME_HEAD_MAGIC = $03211546;
const SYSTEM_SYNC_ID = 2;

type
  tagFrameInfo = record
    SyncId: Cardinal; // 00000000000000000000000000010b */
    Magic: Cardinal;
    FrameType: Integer; //* I frames , P frames or BBP frames Audio frames or dsp status etc */
    Length: Cardinal; //*lenth include this header */
    FrameNumber: Cardinal; //* serial number of this frame */
    Breakable: Byte; //* indicate if stream breakable, you could restart new file(with PktSysHeader) if True */
   //*ULONG   Ack;*/
    PTS: Cardinal; //* system clock when this frames is processed */
  end;
  TMFRAME_HEADER = tagFrameInfo;
  PTMFRAME_HEADER = ^TMFRAME_HEADER;

  TVideoStandard = (
    StandardNone = $80000000,
    StandardNTSC = $00000001,
    StandardPAL = $00000002,
    StandardSECAM = $00000004
    );

  TFrameType = (
    PktError = 0,
    PktIFrames = $0001,
    PktPFrames = $0002,
    PktBBPFrames = $0004,
    PktAudioFrames = $0008,
    PktMotionDetection = $00010,
    PktDspStatus = $00020,
    PktOrigImage = $00040,
    PktSysHeader = $00080,
    PktBPFrames = $00100,
    PktSFrames = $00200,
    PktSubIFrames = $00400,
    PktSubPFrames = $00800,
    PktSubBBPFrames = $01000,
    PktSubSysHeader = $02000
    );

  tagVersion = record
    DspVersion: LongWord;
    DspBuildNum: LongWord;
    DriverVersion: LongWord;
    DriverBuildNum: LongWord;
    SDKVersion: LongWord;
    SDKBuildNum: LongWord;
  end;
  TVERSION_INFO = tagVersion;
  PVERSION_INFO = ^TVERSION_INFO;

  TPictureFormat = (
    ENC_CIF_FORMAT = 0,
    ENC_QCIF_FORMAT = 1,
    ENC_2CIF_FORMAT = 2,
    ENC_4CIF_FORMAT = 3,
    ENC_QQCIF_FORMAT = 4,
    ENC_CIFQCIF_FORMAT = 5,
    ENC_CIFQQCIF_FORMAT = 6,
    ENC_DCIF_FORMAT = 7
    );

  tagMotionData = record
    PicFormat: TPictureFormat;
    HorizeBlocks: Cardinal;
    VerticalBlocks: Cardinal;
    BlockSize: Cardinal;
  end;
  TMOTION_DATA_HEADER = tagMotionData;
  PMOTION_DATA_HEADER = ^TMOTION_DATA_HEADER;

const _OSD_BASE = $9000;
  _OSD_YEAR4 = _OSD_BASE + 0;
  _OSD_YEAR2 = _OSD_BASE + 1;
  _OSD_MONTH3 = _OSD_BASE + 2;
  _OSD_MONTH2 = _OSD_BASE + 3;
  _OSD_DAY = _OSD_BASE + 4;
  _OSD_WEEK3 = _OSD_BASE + 5;
  _OSD_CWEEK1 = _OSD_BASE + 6;
  _OSD_HOUR24 = _OSD_BASE + 7;
  _OSD_HOUR12 = _OSD_BASE + 8;
  _OSD_MINUTE = _OSD_BASE + 9;
  _OSD_SECOND = _OSD_BASE + 10;

implementation

end.
d.

