unit UDataModulo;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  Data.DBXFirebird, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider,
  Forms;

type
  TdataModulo = class(TDataModule)
    conexao: TSQLConnection;
    sdsProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    cdsProdutoCODIGO: TIntegerField;
    cdsProdutoDESCRICAO: TStringField;
    cdsProdutoCODIGO_BARRAS: TIntegerField;
    cdsProdutoUNIDADE_MEDIDA: TStringField;
    cdsProdutoPRECO_CUSTO: TFMTBCDField;
    cdsProdutoPRECO_VENDA: TFMTBCDField;
    cdsProdutoESTOQUE: TFMTBCDField;
    cdsProdutoOBSERVACAO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dataModulo: TdataModulo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdataModulo.DataModuleCreate(Sender: TObject);
begin
   conexao.ConnectionName := 'TESTE_CADASTRO';
   conexao.LoadParamsFromIniFile(ExtractFilePath(Application.ExeName)+'servidor.ini');
   conexao.Open;
end;

end.
