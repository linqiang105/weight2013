unit OtherUtil;

interface

uses SysUtils, DB, Classes, Variants, RzCmboBx, ADODB, IdMessage, SpeechLib_TLB;

type

  TUserUtil = class
  private
  public
    //查询用户是否有权限
    class function HasAuthority(Authority: string): Boolean;
    class function addUserStrings(sl: TStrings): Boolean;
    class function addUser(cb: TRzComboBox): Boolean;
    class function getModAuthority(username: string;
      var car: Boolean; var faHuo: Boolean; var shouHuo: Boolean; var goods: Boolean;
      var spec: Boolean; var gross: Boolean; var tare: Boolean;
      var bundle: Boolean; var price: Boolean; var scale: Boolean; var cost: Boolean;
      var backup1: Boolean; var backup2: Boolean; var backup3: Boolean;
      var backup4: Boolean; var backup5: Boolean; var backup6: Boolean;
      var backup7: Boolean; var backup8: Boolean; var backup9: Boolean;
      var backup10: Boolean; var backup11: Boolean; var backup12: Boolean;
      var backup13: Boolean; var backup14: Boolean;
      var backup15: Boolean; var backup16: Boolean; var backup17: Boolean;
      var backup18: Boolean): Boolean;
    class function isDefaultPass(): Boolean;
    class function resetPass(user: string): Boolean;
    class function getPassword(user: string): string;
  end;

  TLogUtil = class
  private
  public
    //记录日志
    class procedure AddLog(content: string);
  end;

  TMailUtil = class
  private
  public
    class function showTodayRecord(): Boolean;
    class function showToWeekRecord(): Boolean;
    class function showToMonthRecord(): Boolean;
    class function showToYearRecord(): Boolean;
  end;

  TPriceUtil = class
  private
  public
    class function showShouHuo(): Boolean;
    class function showPrice(shouHuo: Integer): Boolean;
    class function savePrice(shouHuo, goods: Integer; price: Double = 0): Boolean;
    class function deletePrice(shouHuo, goods: Integer): Boolean;
    class function getPrice(shouHuo, goods: string): Double;
    class function resetPrice(): Boolean;
  end;

implementation

uses QueryDM, Main, CommonUtil, DateUtils, Dialogs;

{ TUserUtil }

class function TUserUtil.addUser(cb: TRzComboBox): Boolean;
begin
  addUserStrings(cb.Items);
end;

class function TUserUtil.addUserStrings(sl: TStrings): Boolean;
begin
  with QueryDataModule.ADOQUser do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select 用户名 from 用户信息 order by 用户名');
    Open;
    if not IsEmpty then
    begin
      sl.Clear;
      First;
      while not Eof do
      begin
        sl.Add(FieldByName('用户名').AsString);
        Next
      end
    end
  end;
end;

class function TUserUtil.getModAuthority(username: string;
  var car, faHuo, shouHuo, goods, spec,
  gross, tare, bundle, price, scale, cost, backup1, backup2, backup3,
  backup4, backup5, backup6, backup7, backup8, backup9, backup10, backup11,
  backup12, backup13, backup14, backup15, backup16, backup17,
  backup18: Boolean): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from 用户信息 where 用户名=:user';
    Parameters.ParamByName('user').Value := username;
    Open;
    if not IsEmpty then
    begin
      car := FieldByName('修改车号').AsBoolean;
      faHuo := FieldByName('修改发货单位').AsBoolean;
      shouHuo := FieldByName('修改收货单位').AsBoolean;
      goods := FieldByName('修改货名').AsBoolean;
      spec := FieldByName('修改规格').AsBoolean;
      gross := FieldByName('修改毛重').AsBoolean;
      tare := FieldByName('修改皮重').AsBoolean;
      bundle := FieldByName('修改扣重').AsBoolean;
      price := FieldByName('修改单价').AsBoolean;
      scale := FieldByName('修改折方系数').AsBoolean;
      cost := FieldByName('修改过磅费').AsBoolean;
      backup1 := FieldByName('修改备用1').AsBoolean;
      backup2 := FieldByName('修改备用2').AsBoolean;
      backup3 := FieldByName('修改备用3').AsBoolean;
      backup4 := FieldByName('修改备用4').AsBoolean;
      backup5 := FieldByName('修改备用5').AsBoolean;
      backup6 := FieldByName('修改备用6').AsBoolean;
      backup7 := FieldByName('修改备用7').AsBoolean;
      backup8 := FieldByName('修改备用8').AsBoolean;
      backup9 := FieldByName('修改备用9').AsBoolean;
      backup10 := FieldByName('修改备用10').AsBoolean;
      backup11 := FieldByName('修改备用11').AsBoolean;
      backup12 := FieldByName('修改备用12').AsBoolean;
      backup13 := FieldByName('修改备用13').AsBoolean;
      backup14 := FieldByName('修改备用14').AsBoolean;
      backup15 := FieldByName('修改备用15').AsBoolean;
      backup16 := FieldByName('修改备用16').AsBoolean;
      backup17 := FieldByName('修改备用17').AsBoolean;
      backup18 := FieldByName('修改备用18').AsBoolean;
    end;
  end;
end;

class function TUserUtil.getPassword(user: string): string;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 密码 from 用户信息 where 用户名=:u';
    Parameters.ParamByName('u').Value := user;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('密码').AsString;
    end;
  end;
end;

class function TUserUtil.HasAuthority(Authority: string): boolean;
begin
  result := False;
  with QueryDataModule.ADOQUser do
  begin
    Close;
    SQL.Text := 'select ' + Authority + ' from 用户信息 where 用户名=:user';
    Parameters.ParamByName('user').Value := MainForm.CurrentUser;
    Open;
    if not IsEmpty then
    begin
      result := FieldByName(Authority).AsBoolean;
    end
  end;
end;

class function TUserUtil.isDefaultPass: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 用户名,密码 from 用户信息 where 用户名=:u';
    Parameters.ParamByName('u').Value := '管理员';
    Open;
    if not IsEmpty then
    begin
      Result := UpperCase(FieldByName('密码').AsString) = TCommonUtil.md5('123');
    end
    else
    begin
      Result := False;
    end;
  end;
end;

class function TUserUtil.resetPass(user: string): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'update 用户信息 set 密码=:p where 用户名=:u';
    Parameters.ParamByName('p').Value := TCommonUtil.md5('123');
    Parameters.ParamByName('u').Value := user;
    ExecSQL;
  end;
end;

{ TLogUtil }

class procedure TLogUtil.AddLog(content: string);
var i, j: Integer;
  s: string;
begin
  if MainForm.systemConfig.useLog then
  begin
    j := 1;
    with QueryDataModule.ADOQLog do
    begin
      Close;
      for i := 1 to Length(content) do
      begin
        s := s + content[i];
        Inc(j);
        if j = 200 then
        begin
          SQL.Text := 'insert into 日志(修改人,时间,日志) values(:user,:time,:content)';
          Parameters.ParamByName('user').Value := MainForm.CurrentUser;
          Parameters.ParamByName('time').Value := Now;
          Parameters.ParamByName('content').Value := s;
          ExecSQL;
          j := 1;
          s := '';
        end;
      end;
      SQL.Text := 'insert into 日志(修改人,时间,日志) values(:user,:time,:content)';
      Parameters.ParamByName('user').Value := MainForm.CurrentUser;
      Parameters.ParamByName('time').Value := Now;
      Parameters.ParamByName('content').Value := s;
      ExecSQL;
    end;
  end;
end;

{ TPriceUtil }

class function TPriceUtil.deletePrice(shouHuo, goods: Integer): Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from tbl_price where shouHuo=:shouHuo and goods=:goods';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Parameters.ParamByName('goods').Value := goods;
    ExecSQL;
    Result := True;
  end;
end;

class function TPriceUtil.getPrice(shouHuo, goods: string): Double;
var shouHuoId, goodsId: Integer;
begin
  if (shouHuo = '') and (goods = '') then
  begin
    Result := 0;
    Exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 序号 from 货名 where 货名=:goods';
    Parameters.ParamByName('goods').Value := goods;
    Open;
    if not IsEmpty then
    begin
      goodsId := FieldByName('序号').AsInteger;
    end
    else
    begin
      goodsId := 0;
    end;

    SQL.Text := 'select 序号 from 收货单位 where 收货单位=:shouHuo';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Open;
    if not IsEmpty then
    begin
      shouHuoId := FieldByName('序号').AsInteger;
    end
    else
    begin
      shouHuoId := 0;
    end;

    Close;
    SQL.Text := 'select [price] from tbl_price where (shouHuo=:s) and ([goods]=:goods)';
    Parameters.ParamByName('goods').Value := goodsId;
    Parameters.ParamByName('s').Value := shouHuoId;
    try
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('price').AsFloat;
      end
      else
      begin
        SQL.Text := 'select 单价 from 货名 where 货名=:goods';
        Parameters.ParamByName('goods').Value := goods;
        Open;
        if not IsEmpty then
        begin
          Result := FieldByName('单价').AsFloat;
        end
        else
        begin
          Result := 0;
        end;
      end;
    except
      SQL.Text := 'select 单价 from 货名 where 货名=:goods';
      Parameters.ParamByName('goods').Value := goods;
      Open;
      if not IsEmpty then
      begin
        Result := FieldByName('单价').AsFloat;
      end
      else
      begin
        Result := 0;
      end;
    end;
  end;
end;

class function TPriceUtil.resetPrice: Boolean;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'delete from tbl_price';
    ExecSQL;

    SQL.Text := 'select 序号 from 收货单位';
    Open;
    if not IsEmpty then
    begin
      First;
      while not Eof do
      begin

        with QueryDataModule.ADOQExec2 do
        begin
          Close;
          SQL.Text := 'select 序号,单价 from 货名';
          Open;
          if not IsEmpty then
          begin
            First;
            while not Eof do
            begin

              with QueryDataModule.ADOQExec3 do
              begin
                Close;
                SQL.Text := 'insert into tbl_price(shouHuo,goods,price) values (:shouHuo,:goods,:price)';
                Parameters.ParamByName('shouHuo').Value := QueryDataModule.ADOQExec.FieldByName('序号').AsInteger;
                Parameters.ParamByName('goods').Value := QueryDataModule.ADOQExec2.FieldByName('序号').AsInteger;
                Parameters.ParamByName('price').Value := QueryDataModule.ADOQExec2.FieldByName('单价').AsFloat;
                ExecSQL;
              end;

              Next;
            end;
          end;
        end;

        Next;
      end;
    end;
    Result := True;
  end;
end;

class function TPriceUtil.savePrice(shouHuo, goods: Integer;
  price: Double): Boolean;
begin
  with QueryDataModule.ADOQExec2 do
  begin
    Close;
    SQL.Text := 'select id from tbl_price where (shouHuo=:shouHuo) and (goods=:goods)';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Parameters.ParamByName('goods').Value := goods;
    Open;
    if IsEmpty then
    begin
      SQL.Text := 'insert into tbl_price(shouHuo,goods,price) values (:shouHuo,:goods,:price)';
      Parameters.ParamByName('shouHuo').Value := shouHuo;
      Parameters.ParamByName('goods').Value := goods;
      Parameters.ParamByName('price').Value := price;
      ExecSQL;
      Result := True;
    end
    else
    begin
      SQL.Text := 'update tbl_price set price=:price where (shouHuo=:shouHuo) and (goods=:goods)';
      Parameters.ParamByName('shouHuo').Value := shouHuo;
      Parameters.ParamByName('goods').Value := goods;
      Parameters.ParamByName('price').Value := price;
      ExecSQL;
      Result := True;
    end;
  end;
end;

class function TPriceUtil.showPrice(shouHuo: Integer): Boolean;
begin
  with QueryDataModule.ADOQPrice do
  begin
    Close;
    SQL.Text := 'select t1.shouHuo,t1.goods as goodsId,t1.price,t2.货名 as goods '
      + 'from tbl_price as t1,货名 as t2 where (t1.shouHuo=:shouHuo) and (t1.goods=t2.序号)';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Open;
  end;
end;

class function TPriceUtil.showShouHuo: Boolean;
begin
  with QueryDataModule.ADOQPriceShouHuo do
  begin
    Close;
    SQL.Text := 'select * from 收货单位';
    Open;
  end;
end;

{ TMailUtil }

class function TMailUtil.showTodayRecord: Boolean;
begin
  with QueryDataModule.ADOQMail do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where 更新时间 between :startDate and :endDate';
    Parameters.ParamByName('startDate').Value := IncDay(Now, -1);
    Parameters.ParamByName('endDate').Value := Now;
    Open;
  end;
end;

class function TMailUtil.showToMonthRecord: Boolean;
begin
  with QueryDataModule.ADOQMail do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where 更新时间 between :startDate and :endDate';
    Parameters.ParamByName('startDate').Value := IncMonth(Now, -1);
    Parameters.ParamByName('endDate').Value := Now;
    Open;
  end;
end;

class function TMailUtil.showToWeekRecord: Boolean;
begin
  with QueryDataModule.ADOQMail do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where 更新时间 between :startDate and :endDate';
    Parameters.ParamByName('startDate').Value := IncWeek(Now, -1);
    Parameters.ParamByName('endDate').Value := Now;
    Open;
  end;
end;

class function TMailUtil.showToYearRecord: Boolean;
begin
  with QueryDataModule.ADOQMail do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where 更新时间 between :startDate and :endDate';
    Parameters.ParamByName('startDate').Value := IncYear(Now, -1);
    Parameters.ParamByName('endDate').Value := Now;
    Open;
  end;
end;

end.

