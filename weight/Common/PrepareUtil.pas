unit PrepareUtil;

interface

uses SysUtils, StdCtrls, DB, RzCmboBx, Classes;

type
  //预置表操作类
  TPrepareUtil = class
  private
  public
    //循环添加发货单位,收货单位，货名，规格
    class procedure addCarStrings(sl: TStrings);
    class procedure addCar(cb: TComboBox); overload;
    class procedure addCar(cb: TRzComboBox); overload;
    class procedure addWeightCarStrings(sl: TStrings);
    class procedure addWeightCar(cb: TComboBox); overload;
    class procedure addWeightCar(cb: TRzComboBox); overload;
    class procedure addFaHuoStrings(sl: TStrings);
    class procedure addFaHuo(cb: TComboBox); overload;
    class procedure addFaHuo(cb: TRzComboBox); overload;
    class procedure addShouHuoStrings(sl: TStrings);
    class procedure addShouHuo(cb: TComboBox); overload;
    class procedure addShouHuo(cb: TRzComboBox); overload;
    class procedure addGoodsStrings(sl: TStrings);
    class procedure addGoods(cb: TComboBox); overload;
    class procedure addGoods(cb: TRzComboBox); overload;
    class procedure addSpecStrings(sl: TStrings);
    class procedure addSpec(cb: TComboBox); overload;
    class procedure addSpec(cb: TRzComboBox); overload;
    class procedure addBackup1Strings(sl: TStrings);
    class procedure addBackup1(cb: TComboBox); overload;
    class procedure addBackup1(cb: TRzComboBox); overload;
    class procedure addBackup2Strings(sl: TStrings);
    class procedure addBackup2(cb: TComboBox); overload;
    class procedure addBackup2(cb: TRzComboBox); overload;
    class procedure addBackup3Strings(sl: TStrings);
    class procedure addBackup3(cb: TComboBox); overload;
    class procedure addBackup3(cb: TRzComboBox); overload;
    class procedure addBackup4Strings(sl: TStrings);
    class procedure addBackup4(cb: TComboBox); overload;
    class procedure addBackup4(cb: TRzComboBox); overload;
    class procedure addBackup5Strings(sl: TStrings);
    class procedure addBackup5(cb: TComboBox); overload;
    class procedure addBackup5(cb: TRzComboBox); overload;
    class procedure addBackup10Strings(sl: TStrings);
    class procedure addBackup10(cb: TComboBox); overload;
    class procedure addBackup10(cb: TRzComboBox); overload;
    class procedure addBackup11Strings(sl: TStrings);
    class procedure addBackup11(cb: TComboBox); overload;
    class procedure addBackup11(cb: TRzComboBox); overload;
    class procedure addBackup12Strings(sl: TStrings);
    class procedure addBackup12(cb: TComboBox); overload;
    class procedure addBackup12(cb: TRzComboBox); overload;
    class procedure addBackup13Strings(sl: TStrings);
    class procedure addBackup13(cb: TComboBox); overload;
    class procedure addBackup13(cb: TRzComboBox); overload;
    class procedure addBackup14Strings(sl: TStrings);
    class procedure addBackup14(cb: TComboBox); overload;
    class procedure addBackup14(cb: TRzComboBox); overload;
    //将输入一次后的车号，货名，发货单位，收货单位写入预置表
    class procedure prepareInfo(Car, faHuo, shouHuo, goods, spec: string);
    class procedure prepareBackupInfo(backup1, backup2, backup3, backup4, backup5: string);
    class procedure prepareBackupInfo2(backup10, backup11, backup12, backup13, backup14: string);
    //获取这个车辆的修正(暗扣)重量
    class function getCarCheat(carNo: string): Double;
    class function getCarTare(carNo: string): Double;
    class function updateCarTare(carNo, tare: string): Boolean; //更新车辆的预置皮重
    class function getBaseInfoByCode(field: string; code: string): string;
    class function getFaHuoByCode(code: string): string; //根据代码取发货单位
    class function getShouHuoByCode(code: string): string; //根据代码取收货单位
    class function getGoodsByCode(code: string): string; //根据代码取货名
    class function getSpecByCode(code: string): string; //根据代码取规格
    class function getBackup1ByCode(code: string): string; //根据代码取备用1
    class function getBackup2ByCode(code: string): string; //根据代码取备用2
    class function getBackup3ByCode(code: string): string; //根据代码取备用3
    class function getBackup4ByCode(code: string): string; //根据代码取备用4
    class function getBackup5ByCode(code: string): string; //根据代码取备用5
    class function getBackup10ByCode(code: string): string; //根据代码取备用10
    class function getBackup11ByCode(code: string): string; //根据代码取备用11
    class function getBackup12ByCode(code: string): string; //根据代码取备用12
    class function getBackup13ByCode(code: string): string; //根据代码取备用13
    class function getBackup14ByCode(code: string): string; //根据代码取备用14
    class function getGoodsInfo(goods: string; var price: Double; var scale: Double): Boolean; //根据货名取单价和折方系数

    class function getGoodsId(goods: string): Integer;

    class function searchCarNo(search: string): Boolean;
    class function searchFaHuo(search: string): Boolean;
    class function searchShouHuo(search: string): Boolean;
    class function searchGoods(search: string): Boolean;
    class function searchSpec(search: string): Boolean;
    class function searchBackup1(search: string): Boolean;
    class function searchBackup2(search: string): Boolean;
    class function searchBackup3(search: string): Boolean;
    class function searchBackup4(search: string): Boolean;
    class function searchBackup5(search: string): Boolean;
    class function searchBackup10(search: string): Boolean;
    class function searchBackup11(search: string): Boolean;
    class function searchBackup12(search: string): Boolean;
    class function searchBackup13(search: string): Boolean;
    class function searchBackup14(search: string): Boolean;

    class function getGoodsCode(goods: string): string;
    class function getShouHuoCode(shouHuo: string): string;

    class function importCar(strCar: string): Boolean;
    class function importFaHuo(strFaHuo: string): Boolean;
    class function importShouHuo(strShouHuo: string): Boolean;
    class function importGoods(strGoods: string): Boolean;
    class function importSpec(strSpec: string): Boolean;
    class function importBackup1(strBackup: string): Boolean;
    class function importBackup2(strBackup: string): Boolean;
    class function importBackup3(strBackup: string): Boolean;
    class function importBackup4(strBackup: string): Boolean;
    class function importBackup5(strBackup: string): Boolean;
    class function importBackup10(strBackup: string): Boolean;
    class function importBackup11(strBackup: string): Boolean;
    class function importBackup12(strBackup: string): Boolean;
    class function importBackup13(strBackup: string): Boolean;
    class function importBackup14(strBackup: string): Boolean;

    class function lookupCarNo(carNo: string): Boolean;
    class function getCarByFilter(code: string): string;
    class function getBaseInfoByFilter(field: string; code: string): string;
  end;

implementation

uses
  QueryDM, Main, Forms, BaseInfoSel, Consts, Controls;

{ TPrepareUtil }

class procedure TPrepareUtil.addBackup1(cb: TComboBox);
begin
  addBackup1Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup1(cb: TRzComboBox);
begin
  addBackup1Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup10(cb: TComboBox);
begin
  addBackup10Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup10(cb: TRzComboBox);
begin
  addBackup10Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup10Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用10 from 备用10 order by 备用10');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用10').AsString <> '' then
          sl.Add(FieldByName('备用10').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup11(cb: TRzComboBox);
begin
  addBackup11Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup11(cb: TComboBox);
begin
  addBackup11Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup11Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用11 from 备用11 order by 备用11');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用11').AsString <> '' then
          sl.Add(FieldByName('备用11').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup12(cb: TComboBox);
begin
  addBackup12Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup12(cb: TRzComboBox);
begin
  addBackup12Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup12Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用12 from 备用12 order by 备用12');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用12').AsString <> '' then
          sl.Add(FieldByName('备用12').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup13(cb: TComboBox);
begin
  addBackup13Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup13(cb: TRzComboBox);
begin
  addBackup13Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup13Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用13 from 备用13 order by 备用13');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用13').AsString <> '' then
          sl.Add(FieldByName('备用13').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup14(cb: TRzComboBox);
begin
  addBackup14Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup14(cb: TComboBox);
begin
  addBackup14Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup14Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用14 from 备用14 order by 备用14');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用14').AsString <> '' then
          sl.Add(FieldByName('备用14').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup1Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用1 from 备用1 order by 备用1');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用1').AsString <> '' then
          sl.Add(FieldByName('备用1').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup2(cb: TComboBox);
begin
  addBackup2Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup2(cb: TRzComboBox);
begin
  addBackup2Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup2Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用2 from 备用2 order by 备用2');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用2').AsString <> '' then
          sl.Add(FieldByName('备用2').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup3(cb: TComboBox);
begin
  addBackup3Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup3(cb: TRzComboBox);
begin
  addBackup3Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup3Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用3 from 备用3 order by 备用3');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用3').AsString <> '' then
          sl.Add(FieldByName('备用3').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup4(cb: TRzComboBox);
begin
  addBackup4Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup4(cb: TComboBox);
begin
  addBackup4Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup4Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用4 from 备用4 order by 备用4');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用4').AsString <> '' then
          sl.Add(FieldByName('备用4').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addBackup5(cb: TRzComboBox);
begin
  addBackup5Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup5(cb: TComboBox);
begin
  addBackup5Strings(cb.Items);
end;

class procedure TPrepareUtil.addBackup5Strings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 备用5 from 备用5 order by 备用5');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('备用5').AsString <> '' then
          sl.Add(FieldByName('备用5').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addCar(cb: TComboBox);
begin
  addCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addCar(cb: TRzComboBox);
begin
  addCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addCarStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;

    sl.Clear;

    SQL.Text := 'select 车号 from 称重信息 where 净重=0 order by 序号';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        sl.Add(FieldByName('车号').AsString);
        Next;
      end;
    end;

    SQL.Clear;
    if MainForm.systemConfig.useLast100CarNo then
      SQL.Add('SELECT DISTINCT TOP 100 车号 FROM ('
        + 'SELECT TOP 100 * FROM 称重信息 ORDER BY 序号 DESC) AS A')
    else
      SQL.Add('Select 车号 from 车号 order by 车号');
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin
        if FieldByName('车号').AsString <> '' then
          sl.Add(FieldByName('车号').AsString);
        Next
      end
    end
  end;
end;

class procedure TPrepareUtil.addFaHuo(cb: TComboBox);
begin
  addFaHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addFaHuo(cb: TRzComboBox);
begin
  addFaHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addFaHuoStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 发货单位 from 发货单位 order by 发货单位');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('发货单位').AsString <> '' then
          sl.Add(FieldByName('发货单位').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addGoods(cb: TComboBox);
begin
  addGoodsStrings(cb.Items);
end;

class procedure TPrepareUtil.addGoods(cb: TRzComboBox);
begin
  addGoodsStrings(cb.Items);
end;

class procedure TPrepareUtil.addGoodsStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 货名 from 货名 order by 货名');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('货名').AsString <> '' then
          sl.Add(FieldByName('货名').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addShouHuo(cb: TRzComboBox);
begin
  addShouHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addShouHuo(cb: TComboBox);
begin
  addShouHuoStrings(cb.Items);
end;

class procedure TPrepareUtil.addShouHuoStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select 收货单位 from 收货单位 order by 收货单位');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('收货单位').AsString <> '' then
          sl.Add(FieldByName('收货单位').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addSpec(cb: TComboBox);
begin
  addSpecStrings(cb.Items);
end;

class procedure TPrepareUtil.addSpec(cb: TRzComboBox);
begin
  addSpecStrings(cb.Items);
end;

class procedure TPrepareUtil.addSpecStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select distinct 规格 from 规格');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('规格').AsString <> '' then
          sl.Add(FieldByName('规格').AsString);
        Next
      end
    end
  end
end;

class procedure TPrepareUtil.addWeightCar(cb: TComboBox);
begin
  addWeightCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addWeightCar(cb: TRzComboBox);
begin
  addWeightCarStrings(cb.Items);
end;

class procedure TPrepareUtil.addWeightCarStrings(sl: TStrings);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select distinct 车号 from 称重信息 order by 车号');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        if FieldByName('车号').AsString <> '' then
          sl.Add(FieldByName('车号').AsString);
        Next
      end
    end
  end;
end;

class function TPrepareUtil.getBackup10ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('备用10', code)
  else
    Result := getBaseInfoByCode('备用10', code);
end;

class function TPrepareUtil.getBackup11ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('备用11', code)
  else
    Result := getBaseInfoByCode('备用11', code);
end;

class function TPrepareUtil.getBackup12ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('备用12', code)
  else
    Result := getBaseInfoByCode('备用12', code);
end;

class function TPrepareUtil.getBackup13ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('备用13', code)
  else
    Result := getBaseInfoByCode('备用13', code);
end;

class function TPrepareUtil.getBackup14ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('备用14', code)
  else
    Result := getBaseInfoByCode('备用14', code);
end;

class function TPrepareUtil.getBackup1ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('备用1', code)
  else
    Result := getBaseInfoByCode('备用1', code);
end;

class function TPrepareUtil.getBackup2ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('备用2', code)
  else
    Result := getBaseInfoByCode('备用2', code);
end;

class function TPrepareUtil.getBackup3ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('备用3', code)
  else
    Result := getBaseInfoByCode('备用3', code);
end;

class function TPrepareUtil.getBackup4ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('备用4', code)
  else
    Result := getBaseInfoByCode('备用4', code);
end;

class function TPrepareUtil.getBackup5ByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('备用5', code)
  else
    Result := getBaseInfoByCode('备用5', code);
end;

class function TPrepareUtil.getBaseInfoByCode(field, code: string): string;
begin
  if code = '' then
    Exit;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ' + field + ' from ' + field + ' where 代码=:code';
    Parameters.ParamByName('code').Value := code;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName(field).AsString;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getBaseInfoByFilter(field,
  code: string): string;
begin
  if code = '' then
    Exit;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select ' + field + ' from ' + field + ' where 代码 like :code';
    Parameters.ParamByName('code').Value := '%' + code + '%';
    Open;
    if not IsEmpty then
    begin
      if RecordCount = 1 then
      begin
        Result := FieldByName(field).AsString;
      end
      else
      begin
        Application.CreateForm(TBaseInfoSelForm, BaseInfoSelForm);
        try
          First;
          BaseInfoSelForm.LBBaseInfo.Items.Clear;
          while not eof do
          begin
            BaseInfoSelForm.LBBaseInfo.Items.Add(FieldByName(field).AsString);
            Next;
          end;
          BaseInfoSelForm.LBBaseInfo.ItemIndex := 0;
          BaseInfoSelForm.ShowModal;
          if BaseInfoSelForm.ModalResult = mrOK then
          begin
            if BaseInfoSelForm.LBBaseInfo.ItemIndex <> -1 then
              Result := BaseInfoSelForm.LBBaseInfo.Items[BaseInfoSelForm.LBBaseInfo.ItemIndex]
            else
              Result := code;
          end
          else
          begin
            Result := code;
          end;
        finally
          BaseInfoSelForm.Free;
        end;
      end;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getCarByFilter(code: string): string;
begin
  if code = '' then
    Exit;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 车号 from 车号 where 车号 like :code';
    Parameters.ParamByName('code').Value := '%' + code + '%';
    Open;
    if not IsEmpty then
    begin
      if RecordCount = 1 then
      begin
        Result := FieldByName('车号').AsString;
      end
      else
      begin
        Application.CreateForm(TBaseInfoSelForm, BaseInfoSelForm);
        try
          First;
          BaseInfoSelForm.LBBaseInfo.Items.Clear;
          while not eof do
          begin
            BaseInfoSelForm.LBBaseInfo.Items.Add(FieldByName('车号').AsString);
            Next;
          end;
          BaseInfoSelForm.LBBaseInfo.ItemIndex := 0;
          BaseInfoSelForm.ShowModal;
          if BaseInfoSelForm.ModalResult = mrOK then
          begin
            if BaseInfoSelForm.LBBaseInfo.ItemIndex <> -1 then
              Result := BaseInfoSelForm.LBBaseInfo.Items[BaseInfoSelForm.LBBaseInfo.ItemIndex]
            else
              Result := code;
          end
          else
          begin
            Result := code;
          end;
        finally
          BaseInfoSelForm.Free;
        end;
      end;
    end
    else
    begin
      Result := code;
    end;
  end;
end;

class function TPrepareUtil.getCarCheat(carNo: string): Double;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 修正 from 车号 where 车号=:car';
    Parameters.ParamByName('car').Value := carNo;
    Open;
    if not IsEmpty then
    begin
      Result := StrToFloatDef(FieldByName('修正').AsString, 0);
    end
    else
    begin
      Result := 0;
    end;
  end;
end;

class function TPrepareUtil.getCarTare(carNo: string): Double;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 皮重 from 车号 where 车号=:car';
    //SQL.Text := 'select top 1 皮重 from 称重信息 where (车号=:car) and (净重<>0) order by 序号 desc';
    Parameters.ParamByName('car').Value := carNo;
    Open;
    if not IsEmpty then
    begin
      Result := StrToFloatDef(FieldByName('皮重').AsString, 0);
    end
    else
    begin
      Result := 0;
    end;
  end;
end;

class function TPrepareUtil.getFaHuoByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('发货单位', code)
  else
    Result := getBaseInfoByCode('发货单位', code);
end;

class function TPrepareUtil.getGoodsByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('货名', code)
  else
    Result := getBaseInfoByCode('货名', code);
end;

class function TPrepareUtil.getGoodsCode(goods: string): string;
begin
  with QueryDataModule.ADOQExec2 do
  begin
    Close;
    SQL.Text := 'select 代码 from 货名 where 货名=:goods';
    Parameters.ParamByName('goods').Value := goods;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('代码').AsString;
    end
    else
    begin
      Result := '00';
    end;
  end;
end;

class function TPrepareUtil.getGoodsId(goods: string): Integer;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 序号 from 货名 where 货名=:goods';
    Parameters.ParamByName('goods').Value := goods;
    Open;
    if not IsEmpty then
      Result := FieldByName('序号').AsInteger;
  end;
end;

class function TPrepareUtil.getGoodsInfo(goods: string; var price,
  scale: Double): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from 货名 where 货名=:goods';
    Parameters.ParamByName('goods').Value := goods;
    Open;
    if not IsEmpty then
    begin
      price := FieldByName('单价').AsFloat;
      scale := FieldByName('折方系数').AsFloat;
    end;
  end;
end;

class function TPrepareUtil.getShouHuoByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('收货单位', code)
  else
    Result := getBaseInfoByCode('收货单位', code);
end;

class function TPrepareUtil.getShouHuoCode(shouHuo: string): string;
begin
  with QueryDataModule.ADOQExec2 do
  begin
    Close;
    SQL.Text := 'select 代码 from 收货单位 where 收货单位=:shouHuo';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('代码').AsString;
    end
    else
    begin
      Result := '00';
    end;
  end;
end;

class function TPrepareUtil.getSpecByCode(code: string): string;
begin
  if MainForm.systemConfig.useFilterForm then
    Result := getBaseInfoByFilter('规格', code)
  else
    Result := getBaseInfoByCode('规格', code);
end;

class function TPrepareUtil.importBackup1(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 备用1 from 备用1 where 备用1=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into 备用1(代码,备用1) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup10(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 备用10 from 备用10 where 备用10=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into 备用10(代码,备用10) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup11(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 备用11 from 备用11 where 备用11=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into 备用11(代码,备用11) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup12(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 备用12 from 备用12 where 备用12=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into 备用12(代码,备用12) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup13(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 备用13 from 备用13 where 备用13=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into 备用13(代码,备用13) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup14(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 备用14 from 备用14 where 备用14=:backup1');
        Parameters.ParamByName('backup1').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into 备用14(代码,备用14) values(:code,:backup1)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup1').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup2(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 备用2 from 备用2 where 备用2=:backup2');
        Parameters.ParamByName('backup2').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into 备用2(代码,备用2) values(:code,:backup2)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup2').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup3(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 备用3 from 备用3 where 备用3=:backup3');
        Parameters.ParamByName('backup3').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into 备用3(代码,备用3) values(:code,:backup3)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup3').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup4(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 备用4 from 备用4 where 备用4=:backup4');
        Parameters.ParamByName('backup4').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into 备用4(代码,备用4) values(:code,:backup4)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup4').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importBackup5(strBackup: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strBackup), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 备用5 from 备用5 where 备用5=:backup5');
        Parameters.ParamByName('backup5').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into 备用5(代码,备用5) values(:code,:backup5)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('backup5').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importCar(strCar: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strCar), sr) > 0 then
    begin
      updateCarTare(sr.Strings[0], sr.Strings[1]);
    end
    else
    begin
      updateCarTare(sr.Strings[0], '0');
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importFaHuo(strFaHuo: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strFaHuo), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 发货单位 from 发货单位 where 发货单位=:faHuo');
        Parameters.ParamByName('faHuo').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into 发货单位(代码,发货单位) values(:code,:faHuo)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('faHuo').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importGoods(strGoods: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strGoods), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 货名 from 货名 where 货名=:goods');
        Parameters.ParamByName('goods').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into 货名(代码,货名) values(:code,:goods)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('goods').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importShouHuo(strShouHuo: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strShouHuo), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 收货单位 from 收货单位 where 收货单位=:shouHuo');
        Parameters.ParamByName('shouHuo').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into 收货单位(代码,收货单位) values(:code,:shouHuo)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('shouHuo').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.importSpec(strSpec: string): Boolean;
var sr: TStringList;
begin
  sr := TStringList.Create;
  try
    if ExtractStrings([',', #9], [], PChar(strSpec), sr) > 0 then
    begin
      with QueryDataModule.ADOQExec do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 规格 from 规格 where 规格=:spec');
        Parameters.ParamByName('spec').Value := sr.Strings[1];
        Open;
        if RecordCount = 0 then
        begin
          SQL.Clear;
          SQL.Add('insert into 规格(代码,规格) values(:code,:spec)');
          Parameters.ParamByName('code').Value := sr.Strings[0];
          Parameters.ParamByName('spec').Value := sr.Strings[1];
          ExecSQL;
        end
      end;
    end;
  finally
    sr.Free;
  end;
end;

class function TPrepareUtil.lookupCarNo(carNo: string): Boolean;
begin
  with QueryDataModule.ADOQCarFilter do
  begin
    Close;
    SQL.Text := 'select 车号 from 车号 where 车号 like :carNo';
    Parameters.ParamByName('carNo').Value := '%' + carNo + '%';
    Open;
  end;
end;

class procedure TPrepareUtil.prepareBackupInfo(backup1, backup2, backup3,
  backup4, backup5: string);
begin
  with QueryDataModule.ADOQExec do
  begin
    if backup1 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用1 from 备用1 where 备用1=:backup1');
      Parameters.ParamByName('backup1').Value := backup1;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用1(备用1) values(:backup1)');
        Parameters.ParamByName('backup1').Value := backup1;
        ExecSQL
      end
    end;
    if backup2 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用2 from 备用2 where 备用2=:backup2');
      Parameters.ParamByName('backup2').Value := backup2;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用2(备用2) values(:backup2)');
        Parameters.ParamByName('backup2').Value := backup2;
        ExecSQL
      end
    end;
    if backup3 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用3 from 备用3 where 备用3=:backup3');
      Parameters.ParamByName('backup3').Value := backup3;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用3(备用3) values(:backup3)');
        Parameters.ParamByName('backup3').Value := backup3;
        ExecSQL
      end
    end;
    if backup4 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用4 from 备用4 where 备用4=:backup4');
      Parameters.ParamByName('backup4').Value := backup4;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用4(备用4) values(:backup4)');
        Parameters.ParamByName('backup4').Value := backup4;
        ExecSQL
      end
    end;
    if backup5 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用5 from 备用5 where 备用5=:backup5');
      Parameters.ParamByName('backup5').Value := backup5;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用5(备用5) values(:backup5)');
        Parameters.ParamByName('backup5').Value := backup5;
        ExecSQL
      end
    end;
  end
end;

class procedure TPrepareUtil.prepareBackupInfo2(backup10, backup11,
  backup12, backup13, backup14: string);
begin
  with QueryDataModule.ADOQExec do
  begin
    if backup10 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用10 from 备用10 where 备用10=:backup10');
      Parameters.ParamByName('backup10').Value := backup10;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用10(备用10) values(:backup10)');
        Parameters.ParamByName('backup10').Value := backup10;
        ExecSQL
      end
    end;
    if backup11 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用11 from 备用11 where 备用11=:backup11');
      Parameters.ParamByName('backup11').Value := backup11;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用11(备用11) values(:backup11)');
        Parameters.ParamByName('backup11').Value := backup11;
        ExecSQL
      end
    end;
    if backup12 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用12 from 备用12 where 备用12=:backup12');
      Parameters.ParamByName('backup12').Value := backup12;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用12(备用12) values(:backup12)');
        Parameters.ParamByName('backup12').Value := backup12;
        ExecSQL
      end
    end;
    if backup13 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用13 from 备用13 where 备用13=:backup13');
      Parameters.ParamByName('backup13').Value := backup13;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用13(备用13) values(:backup13)');
        Parameters.ParamByName('backup13').Value := backup13;
        ExecSQL
      end
    end;
    if backup14 <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 备用14 from 备用14 where 备用14=:backup14');
      Parameters.ParamByName('backup14').Value := backup14;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 备用14(备用14) values(:backup14)');
        Parameters.ParamByName('backup14').Value := backup14;
        ExecSQL
      end
    end;
  end
end;

class procedure TPrepareUtil.prepareInfo(Car, faHuo, shouHuo, goods,
  spec: string);
begin
  with QueryDataModule.ADOQExec do
  begin
    if car <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 车号 from 车号 where 车号=:car');
      Parameters.ParamByName('car').Value := car;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 车号(车号) values(:car)');
        Parameters.ParamByName('car').Value := car;
        ExecSQL
      end
    end;
    if faHuo <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 发货单位 from 发货单位 where 发货单位=:fahuo');
      Parameters.ParamByName('faHuo').Value := faHuo;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 发货单位(发货单位) values(:fahuo)');
        Parameters.ParamByName('fahuo').Value := faHuo;
        ExecSQL
      end
    end;
    if shouHuo <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 收货单位 from 收货单位 where 收货单位=:shouhuo');
      Parameters.ParamByName('shouhuo').Value := shouHuo;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 收货单位(收货单位) values(:shouhuo)');
        Parameters.ParamByName('shouhuo').Value := shouHuo;
        ExecSQL
      end
    end;
    if goods <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select 货名 from 货名 where 货名=:goods');
      Parameters.ParamByName('goods').Value := goods;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into 货名(货名) values(:goods)');
        Parameters.ParamByName('goods').Value := goods;
        ExecSQL
      end
    end;
    if spec <> '' then
    begin
      Close;
      SQL.Text := 'select 规格 from 规格 where 规格=:spec';
      Parameters.ParamByName('spec').Value := spec;
      Open;
      if RecordCount = 0 then
      begin
        Close;
        SQL.Text := 'insert into 规格(规格) values(:spec)';
        Parameters.ParamByName('spec').Value := spec;
        ExecSQL;
      end;
    end;
  end
end;

class function TPrepareUtil.searchBackup1(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,备用1 as [' + MainForm.poWeightSetConfig.backup1Caption +
      '] from 备用1 where 备用1 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup10(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,备用10 as [' + MainForm.poWeightSetConfig.backup10Caption
      + '] from 备用10 where 备用10 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup11(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,备用11 as [' + MainForm.poWeightSetConfig.backup11Caption
      + '] from 备用11 where 备用11 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup12(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,备用12 as [' + MainForm.poWeightSetConfig.backup12Caption
      + '] from 备用12 where 备用12 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup13(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,备用13 as [' + MainForm.poWeightSetConfig.backup13Caption
      + '] from 备用13 where 备用13 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup14(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,备用14 as [' + MainForm.poWeightSetConfig.backup14Caption
      + '] from 备用14 where 备用14 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup2(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,备用2 as [' + MainForm.poWeightSetConfig.backup2Caption
      + '] from 备用2 where 备用2 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup3(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,备用3 as [' + MainForm.poWeightSetConfig.backup3Caption
      + '] from 备用3 where 备用3 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup4(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,备用4 as [' + MainForm.poWeightSetConfig.backup4Caption
      + '] from 备用4 where 备用4 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchBackup5(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,备用5 as [' + MainForm.poWeightSetConfig.backup5Caption
      + '] from 备用5 where 备用5 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchCarNo(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 车号 as [' + MainForm.poWeightSetConfig.carCaption
      + '],皮重,备注 from 车号 where 车号 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchFaHuo(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,发货单位 as [' + MainForm.poWeightSetConfig.faHuoCaption
      + '] from 发货单位 where 发货单位 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchGoods(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,货名 as [' + MainForm.poWeightSetConfig.goodsCaption
      + '],单价 as [' + MainForm.poWeightSetConfig.priceCaption + '],折方系数 as ['
      + MainForm.poWeightSetConfig.scaleCaption + '] from 货名 where 货名 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchShouHuo(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,收货单位 as [' + MainForm.poWeightSetConfig.shouHuoCaption
      + '],当前金额,信用额度 from 收货单位 where 收货单位 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.searchSpec(search: string): Boolean;
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    SQL.Text := 'select 代码,规格 as [' + MainForm.poWeightSetConfig.specCaption
      + '] from 规格 where 规格 like :search';
    Parameters.ParamByName('search').Value := '%' + search + '%';
    Open;
  end;
end;

class function TPrepareUtil.updateCarTare(carNo, tare: string): Boolean;
begin
  if carNo = '' then
  begin
    Result := False;
    Exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 车号 from 车号 where 车号=:carNo';
    Parameters.ParamByName('carNo').Value := carNo;
    Open;
    if IsEmpty then
    begin
      SQL.Text := 'insert into 车号(车号,皮重) values (:carNo,:tare)';
      Parameters.ParamByName('tare').Value := StrToFloatDef(tare, 0);
      Parameters.ParamByName('carNo').Value := carNo;
      Result := ExecSQL = 1;
    end
    else
    begin
      SQL.Text := 'update 车号 set 皮重 = :tare where 车号=:carNo';
      Parameters.ParamByName('tare').Value := StrToFloatDef(tare, 0);
      Parameters.ParamByName('carNo').Value := carNo;
      Result := ExecSQL = 1;
    end;
  end;
end;

end.
