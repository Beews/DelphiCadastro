program Cadastro;

uses
  Vcl.Forms,
  UCadastroProduto in 'UCadastroProduto.pas' {FCadastroProduto},
  UDataModulo in 'UDataModulo.pas' {dataModulo: TDataModule},
  UProduto in 'UProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdataModulo, dataModulo);
  Application.CreateForm(TFCadastroProduto, FCadastroProduto);
  Application.Run;
end.
