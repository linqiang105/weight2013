unit WeightRecord;

interface

uses SysUtils, Variants, Dialogs;

type
  TWeightRecord = class
  private
  public
    id: Integer;
    glideNo: string;
    carNo: string;
    weightType: string;
    faHuo: string;
    shouHuo: string;
    goods: string;
    spec: string;
    gross: Double;
    tare: Double;
    net: Double;
    bundle: Double;
    real: Double;
    price: Double;
    sum: Double;
    scale: Double;
    quanter: Double;
    cost: Double;
    grossMan: string;
    tareMan: string;
    grossAddr: string;
    tareAddr: string;
    grossTime: TDateTime;
    tareTime: TDateTime;
    firstTime: TDateTime;
    secondTime: TDateTime;
    updateUser: string;
    updateTime: TDateTime;
    memo: string;
    printCount: Integer;
    upload: Boolean;
    backup1: string;
    backup2: string;
    backup3: string;
    backup4: string;
    backup5: string;
    backup6: Double;
    backup7: Double;
    backup8: Double;
    backup9: Double;
    backup10: string;
    backup11: string;
    backup12: string;
    backup13: string;
    backup14: string;
    backup15: Double;
    backup16: Double;
    backup17: Double;
    backup18: Double;
    function toString(): string;
  end;

  TWeightRecordUtil = class
  private
  public
    class function save(var w: TWeightRecord): Boolean; //保存称重记录
    class function get(glideNo: string; var w: TWeightRecord): Boolean;
  end;

implementation

uses
  QueryDM, WeightUtil, Classes;

{ TWeightUtil }

class function TWeightRecordUtil.get(glideNo: string;
  var w: TWeightRecord): Boolean;
begin
  Result := False;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where 流水号=:glideNo';
    Parameters.ParamByName('glideNo').Value := glideNo;
    Open;
    if not IsEmpty then
    begin
      w.id := FieldByName('序号').AsInteger;
      w.glideNo := FieldByName('流水号').AsString;
      w.carNo := FieldByName('车号').AsString;
      w.faHuo := FieldByName('发货单位').AsString;
      w.shouHuo := FieldByName('收货单位').AsString;
      w.goods := FieldByName('货名').AsString;
      w.spec := FieldByName('规格').AsString;
      w.grossMan := FieldByName('毛重司磅员').AsString;
      w.tareMan := FieldByName('皮重司磅员').AsString;
      w.grossAddr := FieldByName('毛重磅号').AsString;
      w.tareAddr := FieldByName('皮重磅号').AsString;
      if not FieldByName('毛重时间').IsNull then
        w.grossTime := FieldByName('毛重时间').AsDateTime;
      if not FieldByName('皮重时间').IsNull then
        w.tareTime := FieldByName('皮重时间').AsDateTime;
      w.gross := FieldByName('毛重').AsFloat;
      w.tare := FieldByName('皮重').AsFloat;
      w.net := FieldByName('净重').AsFloat;
      w.bundle := FieldByName('扣重').AsFloat;
      w.real := FieldByName('实重').AsFloat;
      w.price := FieldByName('单价').AsFloat;
      w.sum := FieldByName('金额').AsFloat;
      w.scale := FieldByName('折方系数').AsFloat;
      w.quanter := FieldByName('方量').AsFloat;
      w.cost := FieldByName('过磅费').AsFloat;
      w.firstTime := FieldByName('一次过磅时间').AsDateTime;
      w.secondTime := FieldByName('二次过磅时间').AsDateTime;
      w.updateUser := FieldByName('更新人').AsString;
      w.updateTime := FieldByName('更新时间').AsDateTime;
      w.memo := FieldByName('备注').AsString;
      w.printCount := FieldByName('打印次数').AsInteger;
      w.upload := FieldByName('上传否').AsBoolean;
      w.backup1 := FieldByName('备用1').AsString;
      w.backup2 := FieldByName('备用2').AsString;
      w.backup3 := FieldByName('备用3').AsString;
      w.backup4 := FieldByName('备用4').AsString;
      w.backup5 := FieldByName('备用5').AsString;
      w.backup6 := FieldByName('备用6').AsFloat;
      w.backup7 := FieldByName('备用7').AsFloat;
      w.backup8 := FieldByName('备用8').AsFloat;
      w.backup9 := FieldByName('备用9').AsFloat;
      w.backup10 := FieldByName('备用10').AsString;
      w.backup11 := FieldByName('备用11').AsString;
      w.backup12 := FieldByName('备用12').AsString;
      w.backup13 := FieldByName('备用13').AsString;
      w.backup14 := FieldByName('备用14').AsString;
      w.backup15 := FieldByName('备用15').AsFloat;
      w.backup16 := FieldByName('备用16').AsFloat;
      w.backup17 := FieldByName('备用17').AsFloat;
      w.backup18 := FieldByName('备用18').AsFloat;
      Result := True;
    end;
  end;
end;

class function TWeightRecordUtil.save(var w: TWeightRecord): Boolean;
var sqlStr: string;
begin
  if w.glideNo = '' then
  begin
    sqlStr := 'insert into 称重信息(流水号,车号,过磅类型,发货单位,收货单位,'
      + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,方量,过磅费,'
      + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,一次过磅时间,'
      + '二次过磅时间,更新人,更新时间,备注,打印次数,上传否,备用1,备用2,备用3,'
      + '备用4,备用5,备用6,备用7,备用8,备用9,备用10,备用11,备用12,备用13,'
      + '备用14,备用15,备用16,备用17,备用18)';

    sqlStr := sqlStr + ' values(:glideNo,:car,:weightType,:fahuo,:shouhuo,:goods,'
      + ':spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,:quanter,:cost,'
      + ':grossMan,:tareMan,:grossAddr,:tareAddr,:grosstime,:taretime,:firstTime,:secondTime,'
      + ':updateUser,:updateTime,:memo,:printCount,:upload,:backup1,:backup2,:backup3,'
      + ':backup4,:backup5,:backup6,:backup7,:backup8,:backup9,:backup10,:backup11,:backup12,'
      + ':backup13,:backup14,:backup15,:backup16,:backup17,:backup18)';
    w.glideNo := TWeightUtil.getMaxGlideNo;
  end
  else
  begin
    sqlStr := 'update 称重信息 set 流水号=:glideNo,车号=:car,过磅类型=:weightType,'
      + '发货单位=:fahuo,收货单位=:shouhuo,货名=:goods,规格=:spec,毛重=:gross,'
      + '皮重=:tare,净重=:net,扣重=:bundle,实重=:real,单价=:price,金额=:sum,'
      + '折方系数=:scale,方量=:quanter,过磅费=:cost,毛重司磅员=:grossMan,'
      + '皮重司磅员=:tareMan,毛重磅号=:grossAddr,皮重磅号=:tareAddr,毛重时间=:grosstime,'
      + '皮重时间=:taretime,一次过磅时间=:firstTime,二次过磅时间=:secondTime,'
      + '更新人=:updateUser,更新时间=:updateTime,备注=:memo,打印次数=:printCount,'
      + '上传否=:upload,备用1=:backup1,备用2=:backup2,备用3=:backup3,'
      + '备用4=:backup4,备用5=:backup5,备用6=:backup6,备用7=:backup7,备用8=:backup8,'
      + '备用9=:backup9,备用10=:backup10,备用11=:backup11,备用12=:backup12,备用13=:backup13,'
      + '备用14=:backup14,备用15=:backup15,备用16=:backup16,备用17=:backup17,备用18=:backup18 '
      + 'where 序号=:id';
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := sqlStr;
    if w.id <> 0 then
      Parameters.ParamByName('id').Value := w.id;
    Parameters.ParamByName('glideno').Value := w.glideNo;
    Parameters.ParamByName('car').Value := w.carNo;
    Parameters.ParamByName('weightType').Value := w.weightType;
    Parameters.ParamByName('fahuo').Value := w.faHuo;
    Parameters.ParamByName('shouhuo').Value := w.shouHuo;
    Parameters.ParamByName('goods').Value := w.goods;
    Parameters.ParamByName('spec').Value := w.spec;
    Parameters.ParamByName('gross').Value := w.gross;
    Parameters.ParamByName('tare').Value := w.tare;
    Parameters.ParamByName('net').Value := w.net;
    Parameters.ParamByName('bundle').Value := w.bundle;
    Parameters.ParamByName('real').Value := w.real;
    Parameters.ParamByName('price').Value := w.price;
    Parameters.ParamByName('sum').Value := w.sum;
    Parameters.ParamByName('cost').Value := w.cost;
    Parameters.ParamByName('scale').Value := w.scale;
    Parameters.ParamByName('quanter').Value := w.quanter;
    if (w.gross <> 0) and (w.tare <> 0) then
    begin
      Parameters.ParamByName('grossMan').Value := w.grossMan;
      Parameters.ParamByName('tareMan').Value := w.tareMan;
      Parameters.ParamByName('grosstime').Value := w.grossTime;
      Parameters.ParamByName('taretime').Value := w.tareTime;
      Parameters.ParamByName('grossAddr').Value := w.grossAddr;
      Parameters.ParamByName('tareAddr').Value := w.tareAddr;
    end
    else if (w.gross <> 0) then
    begin
      Parameters.ParamByName('grossMan').Value := w.grossMan;
      Parameters.ParamByName('grosstime').Value := w.grossTime;
      Parameters.ParamByName('taretime').Value := null;
      Parameters.ParamByName('grossAddr').Value := w.grossAddr;
    end
    else if (w.tare <> 0) then
    begin
      Parameters.ParamByName('tareMan').Value := w.tareMan;
      Parameters.ParamByName('grosstime').Value := null;
      Parameters.ParamByName('taretime').Value := w.tareTime;
      Parameters.ParamByName('tareAddr').Value := w.tareAddr;
    end;
    Parameters.ParamByName('updateUser').Value := w.updateUser;
    Parameters.ParamByName('updateTime').Value := Now;
    Parameters.ParamByName('memo').Value := w.memo;
    Parameters.ParamByName('printCount').Value := w.printCount;
    Parameters.ParamByName('upload').Value := w.upload;
    Parameters.ParamByName('backup1').Value := w.backup1;
    Parameters.ParamByName('backup2').Value := w.backup2;
    Parameters.ParamByName('backup3').Value := w.backup3;
    Parameters.ParamByName('backup4').Value := w.backup4;
    Parameters.ParamByName('backup5').Value := w.backup5;
    Parameters.ParamByName('backup6').Value := w.backup6;
    Parameters.ParamByName('backup7').Value := w.backup7;
    Parameters.ParamByName('backup8').Value := w.backup8;
    Parameters.ParamByName('backup9').Value := w.backup9;
    Parameters.ParamByName('backup10').Value := w.backup10;
    Parameters.ParamByName('backup11').Value := w.backup11;
    Parameters.ParamByName('backup12').Value := w.backup12;
    Parameters.ParamByName('backup13').Value := w.backup13;
    Parameters.ParamByName('backup14').Value := w.backup14;
    Parameters.ParamByName('backup15').Value := w.backup15;
    Parameters.ParamByName('backup16').Value := w.backup16;
    Parameters.ParamByName('backup17').Value := w.backup17;
    Parameters.ParamByName('backup18').Value := w.backup18;

    try
      ExecSQL;
      Result := True;
    except on e: Exception do
      begin
        MessageDlg(PChar(Format('数据保存失败!%s', [e.Message])), mtError, [mbOK], 0);
        Result := False;
      end;
    end;
  end;
end;

{ TWeightRecord }

function TWeightRecord.toString: string;
var s: string;
begin
  s := s + glideNo + ',' + carNo + ',' + faHuo + ',' + shouHuo + ','
    + goods + ',' + spec + ',' + FloatToStr(gross) + ',' + FloatToStr(tare) + ','
    + FloatToStr(net) + ',' + FloatToStr(bundle) + ',' + FloatToStr(real) + ','
    + FloatToStr(price) + ',' + FloatToStr(sum) + ',' + FloatToStr(scale) + ','
    + FloatToStr(quanter) + ',' + FloatToStr(cost) + ',' + grossMan + ','
    + tareMan + ',' + grossAddr + ',' + tareAddr + ',' + memo + ','
    + backup1 + ',' + backup2 + ',' + backup3 + ',' + backup4 + ',' + backup5 + ','
    + FloatToStr(backup6) + ',' + FloatToStr(backup7) + ','
    + FloatToStr(backup8) + ',' + FloatToStr(backup9) + ',' + backup10 + ','
    + backup11 + ',' + backup12 + ',' + backup13 + ',' + backup14 + ','
    + FloatToStr(backup15) + ',' + FloatToStr(backup16) + ','
    + FloatToStr(backup17) + ',' + FloatToStr(backup18);
  Result := s;
end;

end.

