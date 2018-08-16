unit UProduto;

interface

uses  Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
Variants, Contnrs,  DBXFirebird, SqlExpr,  StrUtils, inifiles;

type
    TProduto = Class

    private
        SQL_Consulta : TSQLQuery;
    public
        constructor Create;

        function proximoID(GERNERATO : String) : Integer;
        function incluirProduto : Boolean;
        function inserirProduto : Boolean;
        function editarProduto  : Boolean;
        function excluirProduto : Boolean;
    end;

implementation

uses UDataModulo;

constructor TProduto.Create;
begin
      SQL_Consulta := TSQLQuery.Create(Application);
      SQL_Consulta.SQLConnection := dataModulo.conexao;
end;

function TProduto.proximoID(GERNERATO : String) : Integer;
begin
     SQL_Consulta.Close;
     SQL_Consulta.SQL.Clear;
     SQL_Consulta.SQL.Add(' select GEN_ID (' + GERNERATO +',1) AS ID_ATUAL FROM RDB$DATABASE');
     SQL_Consulta.Open;
     Result := SQL_Consulta.FieldByName('ID_ATUAL').AsInteger;
end;

function TProduto.incluirProduto : Boolean;
begin
    try
        dataModulo.cdsProduto.Insert;
        dataModulo.cdsProdutoCODIGO.AsInteger := proximoID('GEN_TBPROD_ID');
        Result := true;
    except on E: Exception do
        Result := false;
    end;

end;

function TProduto.editarProduto : Boolean;
begin
    try
        dataModulo.cdsProduto.Edit;
        Result := true;
    except on e: Exception do
        Result := false;
    end;

end;

function TProduto.excluirProduto : Boolean;
begin
    try
        dataModulo.cdsProduto.Delete;
        dataModulo.cdsProduto.ApplyUpdates(0);
        dataModulo.cdsProduto.Refresh;

        Result := true;
    except on E: Exception do
        Result := false;
    end;
end;

function TProduto.inserirProduto : Boolean;
begin
    try
        dataModulo.cdsProduto.ApplyUpdates(0);
        Result := true;
    except on E: Exception do
          begin
               Application.MessageBox( PWideChar(WideString('Erro ao salvar. ' + #13 + ' Mensagem original: ' + e.Message)), 'Atenção', MB_ICONEXCLAMATION);
               Result := false
          end;
    end;
end;

end.
