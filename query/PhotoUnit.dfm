object PhotoForm: TPhotoForm
  Left = 278
  Top = 11
  BorderStyle = bsNone
  Caption = #26597#30475#29031#29255
  ClientHeight = 723
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 723
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    OnMouseDown = MainPanelMouseDown
    object Label1: TLabel
      Left = 8
      Top = 7
      Width = 370
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = #31532#19968#36335' '#27611#37325#29031#29255
      Color = clSkyBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      OnMouseDown = MainPanelMouseDown
    end
    object Label2: TLabel
      Left = 383
      Top = 7
      Width = 370
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = #31532#20108#36335' '#27611#37325#29031#29255
      Color = clSkyBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      OnMouseDown = MainPanelMouseDown
    end
    object Label3: TLabel
      Left = 7
      Top = 348
      Width = 370
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = #31532#19968#36335' '#31354#37325#29031#29255
      Color = clSkyBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      OnMouseDown = MainPanelMouseDown
    end
    object Label4: TLabel
      Left = 382
      Top = 348
      Width = 370
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = #31532#20108#36335' '#31354#37325#29031#29255
      Color = clSkyBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      OnMouseDown = MainPanelMouseDown
    end
    object CloseBtn: TSpeedButton
      Left = 756
      Top = 7
      Width = 22
      Height = 20
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7F0000000000000000
        00000000FF7FFF7F00006B794A792A752975E76C000000004260856864646364
        42600000FF7FFF7FFF7F00006B792A754A7929756364004C2A75AD7DAD7D6464
        0000FF7FFF7FFF7FFF7FFF7F00006B792A754A79297563642A75AD7DA5680000
        FF7FFF7FFF7FFF7FFF7FFF7FFF7F00006B792A754A7908718C7DE76C0000FF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00006B792A754A7908710000FF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00006B7D29752A7529750000FF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000AD7DE7706B7D29754A7529750000FF7F
        FF7FFF7FFF7FFF7FFF7FFF7F0000AD7DC66CAD7D63646B7D29754A7529750000
        FF7FFF7FFF7FFF7FFF7F0000AD7D8568A568AD7D004CE7706B7D29754A752975
        0000FF7FFF7FFF7F0000AD7DAD7DAD7DAD7DAD7D00000000AD7D6B7D6B792A75
        29750000FF7FFF7F000000000000000000000000FF7FFF7F0000000000000000
        00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F}
      OnClick = CloseBtnClick
    end
    object CongealFormBtn: TSpeedButton
      Left = 1124
      Top = 248
      Width = 22
      Height = 20
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000212121737B7B
        FFFFFFFFFFFFF7FFF7F7F7F7FFF7F7F7F7F7FFFFF7F7F7F7FFFFF7F7F7F7F7FF
        F7FFFFFFFFFFFF636363FFFFFF391008180000637373FFFFFFFFFFFFF7F7FFF7
        F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFF73736B000000D6CECEFFF7F7FFFFFF
        394A428C3939180000637373FFFFFFFFFFFFFFF7F7FFFFFFFFFFFF6B6B6B0000
        004A4A52CECECEFFFFFFF7F7FFF7F7F7FFFFFF313931949CA58C31311000006B
        7B7BFFFFFF6B6B6B00000073736B7B7B84BDBDBDFFFFFFF7F7F7F7FFF7F7F7F7
        FFF7F7FFFFFF3131318C949C9CADAD290000000000636363D6D6CE8C8C8CBDBD
        B5FFFFFFFFFFF7F7F7F7F7F7FFF7F7F7F7F7FFFFFFFFFFFFFF0000000000006B
        7373C6C6C6D6D6D68C8C946B7373FFFFFFFFFFFFF7F7FFF7F7F7FFF7F7FFFFFF
        FFFFFF6B6B6B0000006B7373C6C6C6CECECED6CECE8C94945229295200004218
        18BDCECEFFFFFFFFFFFFFFFFFF6B6B630000006B6B63C6C6CECECECEBDBDC6CE
        CEC68C8C944A4A4A848C8C84948C84636B4A0000310810CED6CE080808737373
        E7E7DEC6CECEC6C6BDBDBDBDCECECE8C8C9452524A848C8C84847B7B7B847B84
        7B848C8CC6C6C6000000FFFFFFBDBDB552525AADADA5DEDEE7CECECE8C8C944A
        4A4A84848C84847B7B7B7B84847BB5B5B54242395A5A63FFFFFFFFF7F7FFFFFF
        FFFFFFB5B5B56B636363636B52525284848C847B7B7B7B84BDBDB54A4A4A635A
        5AFFFFFFFFFFFFF7F7F7F7F7FFF7F7F7F7F7F7FFFFFFCECED64A4A4A84848484
        847BB5ADB552524A42424A5A5A52FFFFFFF7F7F7F7F7F7F7F7F7F7FFF7F7F7F7
        FFFFFFBDBDC6424239848C8CB5B5B53939426B6B6B636363FFFFFFD6D6DE3939
        31FFFFFFFFFFF7F7F7F7F7F7FFFFFFFFBDBDBD424242BDBDBD4242395A5A63FF
        FFFFFFFFFFFFFFFF524A525A5A52FFFFFF394239FFFFFFF7F7F7FFFFFFBDBDC6
        7B7B73424242635A5AFFFFFFFFFFFFF7F7F7FFF7F7F7F7F7FFFFFFFFFFFF5252
        526B6B7363635AFFFFFFC6BDC608000073737BFFFFFFFFFFFFF7F7F7F7F7F7F7
        F7F7F7F7FFF7F7F7F7F7F7F7F7F7FFFFFFFFFFFF737373212118}
      Visible = False
      OnClick = CongealFormBtnClick
    end
    object activeFormBtn: TSpeedButton
      Left = 756
      Top = 32
      Width = 22
      Height = 20
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000212121737B7B
        FFFFFFFFFFFFF7FFF7F7F7F7FFF7F7F7F7F7FFFFF7F7F7F7FFFFF7F7F7F7F7FF
        F7FFFFFFFFFFFF636363FFFFFF3910082100006B737BFFFFFFFFFFFFF7F7FFF7
        F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFF7B6B7B000000D6CECEFFF7F7FFFFFF
        104A213939002900006B737BFFFFFFFFFFFFFFF7F7FFFFFFFFFFFF7B6B7B0000
        00007300DECED6FFFFFFF7F7FFF7F7F7FFFFFF183918009C004A31002900006B
        7B7BFFFFFF7B6B7B000000007B0000A500D6B5D6FFFFFFF7F7F7F7FFF7F7F7F7
        FFF7F7FFFFFF21312100940000AD004A0000000000006B0000FF0000C600DEB5
        D6FFFFFFFFFFF7F7F7F7F7F7FFF7F7F7F7F7FFFFFFFFFFFFFF00000000000000
        7B0000EF0000FF0000C600946B9CFFFFFFFFFFFFF7F7FFF7F7F7FFF7F7FFFFFF
        FFFFFF7B6B7B000000007B0000F70000FF0000FF0000C6002921003900004A18
        29BDCED6FFFFFFFFFFFFFFFFFF736B7300000000730000EF0000FF0000F70000
        FF0000BD00004200008C000094001863003900004A0829D6D6D6100810217329
        4AFF4200FF0000FF0000F70000FF0000BD00004200008C00008400007B000084
        0000840000EF00000800FFFFFFC6BDBD6B4A738CB58C39FF4200FF0000BD0000
        4200008400008400007300007B0000D6000063007B5284FFFFFFFFF7F7FFFFFF
        FFFFFFB5B5BD84637B4A7352004A00008400007B00007B0000DE00007300845A
        7BFFFFFFFFFFFFF7F7F7F7F7FFF7F7F7F7F7F7FFFFFFE7CEEF004A00007B0000
        7B0000D600007300006300425A39FFFFFFF7F7F7F7F7F7F7F7F7F7FFF7F7F7F7
        FFFFFFD6BDDE00420000840000DE000063008C6B8C7B5A7B9CFF9C00FF001042
        10FFFFFFFFFFF7F7F7F7F7F7FFFFFFFFD6B5D600390000DE000063007B527BFF
        FFFFFFFFFFFFFFFF5A4A637B4A7B8CFF8C005200FFFFFFF7F7F7FFFFFFCEBDD6
        009C00006B00845A7BFFFFFFFFFFFFF7F7F7FFF7F7F7F7F7FFFFFFFFFFFF6352
        5A736B7363635AFFFFFFC6BDCE001800846B8CFFFFFFFFFFFFF7F7F7F7F7F7F7
        F7F7F7F7FFF7F7F7F7F7F7F7F7F7FFFFFFFFFFFF737373212118}
      OnClick = activeFormBtnClick
    end
    object MSWeightInfo: TRzMarqueeStatus
      Left = 8
      Top = 696
      Width = 745
    end
    object PGrossImage1: TPanel
      Left = 7
      Top = 26
      Width = 370
      Height = 320
      TabOrder = 0
      object GrossImage1: TImage
        Left = 1
        Top = 1
        Width = 368
        Height = 318
        Align = alClient
        Stretch = True
        OnDblClick = GrossImage1DblClick
      end
    end
    object PGrossImage2: TPanel
      Left = 382
      Top = 26
      Width = 370
      Height = 320
      TabOrder = 1
      object GrossImage2: TImage
        Left = 1
        Top = 1
        Width = 368
        Height = 318
        Align = alClient
        Center = True
        Stretch = True
        OnDblClick = GrossImage1DblClick
      end
    end
    object PEmptyImage1: TPanel
      Left = 8
      Top = 368
      Width = 370
      Height = 320
      TabOrder = 2
      object EmptyImage1: TImage
        Left = 1
        Top = 1
        Width = 368
        Height = 318
        Align = alClient
        Center = True
        Stretch = True
        OnDblClick = GrossImage1DblClick
      end
    end
    object PEmptyImage2: TPanel
      Left = 383
      Top = 368
      Width = 370
      Height = 320
      TabOrder = 3
      object EmptyImage2: TImage
        Left = 1
        Top = 1
        Width = 368
        Height = 318
        Align = alClient
        Center = True
        Stretch = True
        OnDblClick = GrossImage1DblClick
      end
    end
    object RzSizePanel1: TRzSizePanel
      Left = 786
      Top = 2
      Width = 8
      Height = 719
      Align = alRight
      HotSpotVisible = True
      Side = sdRight
      SizeBarWidth = 7
      TabOrder = 4
      HotSpotClosed = True
      HotSpotPosition = 762
      object Label5: TLabel
        Left = 14
        Top = 7
        Width = 370
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = #31532#19977#36335' '#27611#37325#29031#29255
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        OnMouseDown = MainPanelMouseDown
      end
      object Label6: TLabel
        Left = 387
        Top = 7
        Width = 370
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = #31532#22235#36335' '#27611#37325#29031#29255
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        OnMouseDown = MainPanelMouseDown
      end
      object Label7: TLabel
        Left = 14
        Top = 348
        Width = 370
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = #31532#19977#36335' '#31354#37325#29031#29255
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        OnMouseDown = MainPanelMouseDown
      end
      object Label8: TLabel
        Left = 387
        Top = 348
        Width = 370
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = #31532#22235#36335' '#31354#37325#29031#29255
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        OnMouseDown = MainPanelMouseDown
      end
      object PGrossImage3: TPanel
        Left = 13
        Top = 26
        Width = 370
        Height = 320
        TabOrder = 0
        object GrossImage3: TImage
          Left = 1
          Top = 1
          Width = 368
          Height = 318
          Align = alClient
          Stretch = True
          OnDblClick = GrossImage1DblClick
        end
      end
      object PGrossImage4: TPanel
        Left = 387
        Top = 26
        Width = 370
        Height = 320
        TabOrder = 1
        object GrossImage4: TImage
          Left = 1
          Top = 1
          Width = 368
          Height = 318
          Align = alClient
          Center = True
          Stretch = True
          OnDblClick = GrossImage1DblClick
        end
      end
      object PEmptyImage3: TPanel
        Left = 14
        Top = 368
        Width = 370
        Height = 320
        TabOrder = 2
        object EmptyImage3: TImage
          Left = 1
          Top = 1
          Width = 368
          Height = 318
          Align = alClient
          Center = True
          Stretch = True
          OnDblClick = GrossImage1DblClick
        end
      end
      object PEmptyImage4: TPanel
        Left = 387
        Top = 368
        Width = 370
        Height = 320
        TabOrder = 3
        object EmptyImage4: TImage
          Left = 1
          Top = 1
          Width = 368
          Height = 318
          Align = alClient
          Center = True
          Stretch = True
          OnDblClick = GrossImage1DblClick
        end
      end
    end
  end
  object PhotoSaveDialog: TSaveDialog
    DefaultExt = 'Jpg'
    Filter = 'JPEG(*.jpg)|*.jpg'
    Left = 402
    Top = 256
  end
end
