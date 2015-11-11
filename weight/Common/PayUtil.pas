unit PayUtil;

interface

uses SysUtils, DB, Variants, ADODB;

type
  TPayUtil = class
  private
  public
    class function showHistory(): Boolean; overload;
    class function showHistory(startDate, endDate: TDateTime): Boolean; overload;
    class function showCompany(): Boolean;
    class function charge(shouHuo, p: string): Boolean; //充值
    class function pay(shouHuo, sum: string): Boolean; //扣费
    class function lowCredit(shouHuo: string; sum: Double): Boolean; //信用等级不够
    class function getLeft(shouHuo: string): Double;
  end;

implementation

uses QueryDM;

{ TPayUtil }

class function TPayUtil.charge(shouHuo, p: string): Boolean;
var sum, credit: string;
begin
  if shouHuo = '' then
  begin
    Result := True;
    Exit;
  end;
  QueryDataModule.DBConnection.BeginTrans;
  try
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 收货单位 where 收货单位 = :shouHuo';
      Parameters.ParamByName('shouHuo').Value := shouHuo;
      Open;
      if RecordCount > 0 then
      begin
        sum := FieldByName('当前金额').AsString;
        credit := FieldByName('信用额度').AsString;
        if sum = '' then
        begin
          SQL.Text := 'update 收货单位 set 当前金额=0 where 收货单位 = :shouHuo';
          Parameters.ParamByName('shouHuo').Value := shouHuo;
          ExecSQL;
        end;
        if credit = '' then
        begin
          SQL.Text := 'update 收货单位 set 信用额度=0 where 收货单位 = :shouHuo';
          Parameters.ParamByName('shouHuo').Value := shouHuo;
          ExecSQL;
        end;
        SQL.Text := 'update 收货单位 set 当前金额=当前金额+:sum where 收货单位=:shouHuo';
        Parameters.ParamByName('sum').Value := StrToFloatDef(p, 0);
        Parameters.ParamByName('shouHuo').Value := shouHuo;
        ExecSQL;
        //写入充值历史
        SQL.Text := 'insert into tbl_pay_history(shouHuo,updateTime,price) '
          + 'values(:shouHuo,:update_time,:price)';
        Parameters.ParamByName('shouHuo').Value := shouHuo;
        Parameters.ParamByName('update_time').Value := Now;
        Parameters.ParamByName('price').Value := StrToFloatDef(p, 0);
        ExecSQL;
        Result := True;
      end
      else
      begin
        Result := False;
      end;
    end;
    QueryDataModule.DBConnection.CommitTrans;
  except
    QueryDataModule.DBConnection.RollbackTrans;
    Result := False;
  end;
end;

class function TPayUtil.getLeft(shouHuo: string): Double;
begin
  if shouHuo = '' then
  begin
    Result := 0;
    Exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 当前金额 from 收货单位 where 收货单位=:shouHuo';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('当前金额').AsFloat;
    end;
  end;
end;

class function TPayUtil.lowCredit(shouHuo: string; sum: Double): Boolean;
begin
  if shouHuo = '' then
  begin
    Result := False;
    Exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select 当前金额,信用额度 from 收货单位 where 收货单位=:shouHuo';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Open;
    if not IsEmpty then
    begin
      Result := FieldByName('当前金额').AsFloat - sum < FieldByName('信用额度').AsFloat;
    end;
  end;
end;

class function TPayUtil.pay(shouHuo, sum: string): Boolean;
begin
  if shouHuo = '' then
  begin
    Result := True;
    Exit;
  end;
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'update 收货单位 set 当前金额 = 当前金额 - :sum where 收货单位 = :shouHuo';
    Parameters.ParamByName('sum').Value := StrToFloatDef(sum, 0);
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Result := ExecSQL > 0;

    //写入充值历史
    SQL.Text := 'insert into tbl_pay_history(shouHuo,updateTime,price) '
      + 'values(:shouHuo,:update_time,:price)';
    Parameters.ParamByName('shouHuo').Value := shouHuo;
    Parameters.ParamByName('update_time').Value := Now;
    Parameters.ParamByName('price').Value := 0 - StrToFloatDef(sum, 0);
    ExecSQL;
  end;
end;

class function TPayUtil.showCompany: Boolean;
begin
  with QueryDataModule.ADOQPay do
  begin
    Close;
    SQL.Text := 'select * from 收货单位';
    Open;
  end;
end;

class function TPayUtil.showHistory: Boolean;
begin
  with QueryDataModule.ADOQPayHistory do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tbl_pay_history order by id desc');
    Open
  end
end;

class function TPayUtil.showHistory(startDate,
  endDate: TDateTime): Boolean;
begin
  with QueryDataModule.ADOQPayHistory do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tbl_pay_history '
      + 'where updateTime between :start and :end order by id desc');
    Parameters.ParamByName('start').Value := FormatDateTime('yyyy-MM-dd 00:00:00', startDate);
    Parameters.ParamByName('end').Value := FormatDateTime('yyyy-MM-dd 23:59:59', endDate);
    Open
  end
end;


end.

