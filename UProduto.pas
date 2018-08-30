unit UProduto;

interface

uses  Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
Variants, Contnrs,  DBXFirebird, SqlExpr,  StrUtils, inifiles;

type
    TProduto = Class

    private
        FCodigo         : Integer;
        FDescricao      : String;
        FCodigo_Barras  : Integer;
        FUnidade_Medida : String;
        FPreco_Custo    : Currency;
        FPreco_Venda    : Currency;
        FEstoque        : Currency;
        FObservacao     : String;
        SQL_Query       : TSQLQuery;
        FStatus         : String;

        procedure SetCodigo(Value: Integer);
        function GetCodigo : Integer;
        procedure SetDescricao(Value: String);
        function GetDescricao : String;
        procedure SetCodigo_Barras(Value: Integer);
        function GetCodigo_Barras : Integer;
        procedure SetUnidade_Medida(Value: String);
        function GetUnidade_Media : String;
        procedure SetPreco_Custo(Value: Currency);
        function GetPreco_Custo : Currency;
        procedure SetPreco_Venda(Value: Currency);
        function GetPreco_Venda : Currency;
        procedure SetEstoque(Value: Currency);
        function GetEstoque : Currency;
        procedure SetObservacao(Value: String);
        function GetObservacao : String;
        procedure SetStatus(Value: String);
        function GetStatus : String;
    public
        constructor Create;

        function proximoID(GERNERATO : String) : Integer;
        function inserirProduto : Boolean;
        function editarProduto  : Boolean;
        function excluirProduto : Boolean;

    published
        property Codigo        : Integer read GetCodigo write SetCodigo ;
        property Descricao     : String read GetDescricao write SetDescricao;
        property CodigoBarras  : Integer read GetCodigo_Barras write SetCodigo_Barras ;
        property UnidadeMedida : String read GetUnidade_Media write SetUnidade_Medida;
        property PrecoCusto    : Currency read GetPreco_Custo write SetPreco_Custo;
        property PrecoVenda    : Currency read GetPreco_Venda write SetPreco_Venda;
        property Estoque       : Currency read GetEstoque write SetEstoque;
        property Observacao    : String read GetObservacao write SetObservacao;
        property Status        : String read FStatus write SetStatus;
    end;

implementation

uses UDataModulo;

constructor TProduto.Create;
begin
      SQL_Query := TSQLQuery.Create(Application);
      SQL_Query.SQLConnection := dataModulo.conexao;
end;

function TProduto.proximoID(GERNERATO : String) : Integer;
begin
     SQL_Query.Close;
     SQL_Query.SQL.Clear;
     SQL_Query.SQL.Add(' select GEN_ID (' + GERNERATO +',1) AS ID_ATUAL FROM RDB$DATABASE');
     SQL_Query.Open;
     Result := SQL_Query.FieldByName('ID_ATUAL').AsInteger;
end;

procedure TProduto.SetCodigo(Value: Integer);
begin
    FCodigo := Value;
end;

procedure TProduto.SetCodigo_Barras(Value: Integer);
begin
    FCodigo_Barras := Value;
end;

procedure TProduto.SetDescricao(Value: String);
begin
    FDescricao := Value;
end;

procedure TProduto.SetEstoque(Value: Currency);
begin
    FEstoque := Value;
end;

procedure TProduto.SetObservacao(Value: String);
begin
    FObservacao := Value;
end;

procedure TProduto.SetPreco_Custo(Value: Currency);
begin
    FPreco_Custo := Value;
end;

procedure TProduto.SetPreco_Venda(Value: Currency);
begin
    FPreco_Venda := Value;
end;

procedure TProduto.SetStatus(Value: String);
begin
     FStatus := Value;
end;

procedure TProduto.SetUnidade_Medida(Value: String);
begin
    FUnidade_Medida := Value;
end;


function TProduto.editarProduto : Boolean;
begin
    try
        SQL_Query.Close;
        SQL_Query.SQL.Clear;

        SQL_Query.SQL.Text := '  UPDATE tb_produto SET ' +
                  '  codigo = ' + IntToStr(FCodigo) +
                  ', descricao = ' + QuotedStr(FDescricao) +
                  ', codigo_barras = ' + IntToStr(FCodigo_Barras) +
                  ', unidade_medida = ' + QuotedStr(FUnidade_Medida) +
                  ', preco_custo = ' + CurrToStr(FPreco_Custo) +
                  ', preco_venda = ' + CurrToStr(FPreco_Venda) +
                  ', estoque = ' + CurrToStr(FEstoque) +
                  ', observacao = ' + QuotedStr(FObservacao) +
                  ' WHERE codigo = ' + IntToStr(FCodigo);
        SQL_Query.ExecSQL;

        Result := true;
    except on E: Exception do
          begin
               Application.MessageBox( PWideChar(WideString('Erro ao Editar. ' + #13 + ' Mensagem original: ' + e.Message)), 'Atenção', MB_ICONEXCLAMATION);
               Result := false
          end;
    end;
end;

function TProduto.excluirProduto : Boolean;
begin
    try
        SQL_Query.Close;
        SQL_Query.SQL.Clear;
        SQL_Query.SQL.Text := ' DELETE FROM tb_produto ' +
                              ' WHERE codigo = ' + IntToStr(FCodigo);
        SQL_Query.ExecSQL;

        Result := true;
    except on E: Exception do
        Result := false;
    end;
end;

function TProduto.GetCodigo: Integer;
begin
    Result := FCodigo;
end;

function TProduto.GetCodigo_Barras: Integer;
begin
    Result := FCodigo_Barras;
end;

function TProduto.GetDescricao: String;
begin
    Result := FDescricao;
end;

function TProduto.GetEstoque: Currency;
begin
    Result := FEstoque;
end;

function TProduto.GetObservacao: String;
begin
    Result := Observacao;
end;

function TProduto.GetPreco_Custo: Currency;
begin
    Result := PrecoCusto;
end;

function TProduto.GetPreco_Venda: Currency;
begin
    Result := PrecoVenda;
end;

function TProduto.GetStatus: String;
begin
    Result := FStatus;
end;

function TProduto.GetUnidade_Media: String;
begin
    Result := UnidadeMedida;
end;

function TProduto.inserirProduto : Boolean;
var
    sSQL : String;
begin
    try
        SQL_Query.Close;
        SQL_Query.SQL.Clear;

        sSQL := ' INSERT INTO tb_produto ( ' +
                  '  codigo' +
                  ', descricao' +
                  ', codigo_barras' +
                  ', unidade_medida' +
                  ', preco_custo' +
                  ', preco_venda' +
                  ', estoque' +
                  ', observacao)' +
                  ' VALUES (' +
                  IntToStr(FCodigo) +
                  ', ' + QuotedStr(FDescricao) +
                  ', ' + IntToStr(FCodigo_Barras) +
                  ', ' + QuotedStr(FUnidade_Medida) +
                  ', ' + CurrToStr(FPreco_Custo) +
                  ', ' + CurrToStr(FPreco_Venda) +
                  ', ' + CurrToStr(FEstoque) +
                  ', ' + QuotedStr(FObservacao) +
                  ')';

        SQL_Query.SQL.Text := sSQL;
        SQL_Query.ExecSQL;

        Result := true;
    except on E: Exception do
          begin
               Application.MessageBox( PWideChar(WideString('Erro ao salvar. ' + #13 + ' Mensagem original: ' + e.Message)), 'Atenção', MB_ICONEXCLAMATION);
               Result := false
          end;
    end;
end;

end.
