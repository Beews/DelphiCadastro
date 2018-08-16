unit UCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, UProduto, DBClient;

type
  TFCadastroProduto = class(TForm)
    Panel1: TPanel;
    buttonIncluir: TSpeedButton;
    buttonEditar: TSpeedButton;
    buttonExcluir: TSpeedButton;
    buttonSalvar: TSpeedButton;
    buttonCancelar: TSpeedButton;
    buttonPrimeiro: TSpeedButton;
    buttonAnterior: TSpeedButton;
    buttonProximo: TSpeedButton;
    buttonUltimo: TSpeedButton;
    buttonSair: TSpeedButton;
    paginaControle: TPageControl;
    abaConsulta: TTabSheet;
    abaCadastro: TTabSheet;
    dbGridProduto: TDBGrid;
    Label3: TLabel;
    edCod: TDBEdit;
    Label4: TLabel;
    edNome: TDBEdit;
    Label5: TLabel;
    EdCodBarras: TDBEdit;
    Label23: TLabel;
    gbDadosDeValores: TGroupBox;
    EdPrecust: TDBEdit;
    Label13: TLabel;
    Label43: TLabel;
    EdvendaA: TDBEdit;
    Label1: TLabel;
    edEstoque: TDBEdit;
    Label2: TLabel;
    edObservacao: TDBEdit;
    comboBoxUnidadeMedida: TDBComboBox;
    procedure buttonPrimeiroClick(Sender: TObject);
    procedure buttonAnteriorClick(Sender: TObject);
    procedure buttonProximoClick(Sender: TObject);
    procedure buttonUltimoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure paginaControleChange(Sender: TObject);
    procedure buttonSairClick(Sender: TObject);
    procedure buttonIncluirClick(Sender: TObject);
    procedure buttonCancelarClick(Sender: TObject);
    procedure buttonEditarClick(Sender: TObject);
    procedure buttonExcluirClick(Sender: TObject);
    procedure buttonSalvarClick(Sender: TObject);
    procedure dbGridProdutoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    validacaoDeRegistro : Boolean;
    procedure habilita_botao( Status : boolean; Tipo: String);
    procedure novoProduto;
    procedure incluirProduto;
    procedure editarProduto;
    procedure valida_Dados;
  public

     FProduto : TProduto;
    { Public declarations }
  end;

var
  FCadastroProduto: TFCadastroProduto;

const
  NOVO : String     = 'NOVO';
  INCLUIR : String  = 'INCLUIR';
  ALTERAR : String  = 'ALTERAR';

implementation

{$R *.dfm}

uses UDataModulo;

procedure TFCadastroProduto.buttonAnteriorClick(Sender: TObject);
begin
    dataModulo.cdsProduto.Prior;
end;

procedure TFCadastroProduto.buttonCancelarClick(Sender: TObject);
begin
     if Application.MessageBox('Deseja realmente cancelar?', 'Atenção', MB_YESNO + MB_ICONQUESTION ) = IdYes then
     begin
          dataModulo.cdsProduto.Cancel;
          habilita_botao(false,NOVO);
          paginaControle.Pages[0].Enabled := True;
     end;
end;

procedure TFCadastroProduto.buttonEditarClick(Sender: TObject);
begin
     if dataModulo.cdsProduto.IsEmpty then EXIT;

     paginaControle.ActivePage := abaCadastro;
     ActiveControl := edNome;
     paginaControle.Pages[0].Enabled := false;

     editarProduto;
end;

procedure TFCadastroProduto.buttonExcluirClick(Sender: TObject);
begin
     if dataModulo.cdsProduto.IsEmpty then EXIT;

     if dataModulo.cdsProduto.State in [dsBrowse] then
     begin
          if Application.MessageBox('Deseja realmente excluir registro selecionado ?', 'Atenção', mb_YesNo + MB_ICONQUESTION ) = IdYes then
          begin
              validacaoDeRegistro := FProduto.excluirProduto;
              if validacaoDeRegistro = false then
                  Application.MessageBox('Ocorreu um erro ao excluir o registro', 'Atenção', MB_ICONEXCLAMATION);
          end;
     end
     else
          Application.MessageBox( 'Só é possível excluir um registro durante uma consulta.', 'Atenção', MB_ICONEXCLAMATION);
end;

procedure TFCadastroProduto.buttonIncluirClick(Sender: TObject);
begin
    paginaControle.ActivePage := abaCadastro;
    ActiveControl := edNome;
    paginaControle.Pages[0].Enabled := false;
    incluirProduto;
end;

procedure TFCadastroProduto.buttonPrimeiroClick(Sender: TObject);
begin
    dataModulo.cdsProduto.First;
end;

procedure TFCadastroProduto.buttonProximoClick(Sender: TObject);
begin
    dataModulo.cdsProduto.Next;
end;

procedure TFCadastroProduto.buttonSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFCadastroProduto.buttonSalvarClick(Sender: TObject);
begin
     try
          Valida_Dados;
     except
          On e: Exception do
          begin
               Exit;
          end;
     end;

     validacaoDeRegistro := FProduto.inserirProduto;
     if validacaoDeRegistro = false then
        Abort;

     habilita_botao(false, NOVO);
     paginaControle.Pages[0].Enabled := True;
end;

procedure TFCadastroProduto.buttonUltimoClick(Sender: TObject);
begin
    dataModulo.cdsProduto.Last;
end;

procedure TFCadastroProduto.dbGridProdutoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
     if not Odd((dbGridProduto.DataSource.DataSet as TClientDataSet).RecNo) then
     begin
          if not (gdSelected in State) then
          begin
               dbGridProduto.Canvas.Brush.Color := $00CBEAFE;
               dbGridProduto.Canvas.FillRect(Rect);
               dbGridProduto.DefaultDrawDataCell(Rect,Column.Field,State);
          end;
     end;

     dbGridProduto.Canvas.Font.Color := clBlack;

     if gdSelected in State then
     begin
          dbGridProduto.Canvas.Brush.Color:= $00F3EBD1;
          dbGridProduto.Canvas.FillRect(rect);
     end;
     dbGridProduto.DefaultDrawDataCell(Rect,dbGridProduto.Columns[DataCol].Field, State);
end;

procedure TFCadastroProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #13) and not (ActiveControl is TMemo ) then
     begin
          //Key := #0;
          Perform(WM_NEXTDLGCTL,0,0);
     end;
end;

procedure TFCadastroProduto.FormShow(Sender: TObject);
begin
    FProduto := TProduto.Create;
    paginaControle.ActivePage := abaConsulta;
    habilita_botao(false, NOVO);

    dataModulo.sdsProduto.Close;
    dataModulo.cdsProduto.Close;
    dataModulo.cdsProduto.Open;
end;

procedure TFCadastroProduto.habilita_botao(Status: Boolean; Tipo: string);
begin
     if Tipo = NOVO then
     begin
          buttonExcluir.Enabled  := Not(Status);
          buttonEditar.Enabled   := Not(Status);
          buttonIncluir.Enabled  := Not(Status);
          buttonSalvar.Enabled   := Status;
          buttonCancelar.Enabled := Status;
     end
     Else
     if (Tipo = INCLUIR) Or (Tipo = ALTERAR) then
     begin
          buttonExcluir.Enabled  := Status;
          buttonEditar.Enabled   := Status;
          buttonIncluir.Enabled  := Status;
          buttonSalvar.Enabled   := Not(Status);
          buttonCancelar.Enabled := Not(Status);
     end;

     buttonPrimeiro.Enabled := Status;
     buttonAnterior.Enabled := Status;
     buttonProximo.Enabled  := Status;
     buttonUltimo.Enabled   := Status;

     if (paginaControle.ActivePage = abaCadastro) And (buttonSalvar.Enabled = false)  then
     begin
         buttonPrimeiro.Enabled := true;
         buttonAnterior.Enabled := true;
         buttonProximo.Enabled  := true;
         buttonUltimo.Enabled   := true;
     end;
end;

procedure TFCadastroProduto.novoProduto;
begin
    habilita_botao(false, NOVO);
end;

procedure TFCadastroProduto.paginaControleChange(Sender: TObject);
begin
     if paginaControle.Pages[0].Enabled = false then
     begin
          Application.MessageBox('Não é possível sair desta aba sem resolver a condição.','Atenção',MB_ICONEXCLAMATION);
          paginaControle.ActivePage := abaCadastro;
          Exit;
     end;

     novoProduto;
end;

procedure TFCadastroProduto.editarProduto;
begin
    habilita_botao(false, ALTERAR);
    validacaoDeRegistro := FProduto.editarProduto;
    if validacaoDeRegistro = false then
        Application.MessageBox('Ocorreu um erro ao editar o registro', 'Atenção', MB_ICONEXCLAMATION);
end;

procedure TFCadastroProduto.incluirProduto;
begin
    habilita_botao(false, INCLUIR);

    validacaoDeRegistro := FProduto.incluirProduto;
    if validacaoDeRegistro = false then
        Application.MessageBox('Ocorreu um erro ao incluir novo registro', 'Atenção', MB_ICONEXCLAMATION);
end;

procedure TFCadastroProduto.Valida_Dados;
begin
     if Trim(edNome.Text) = '' then
     begin
          Application.MessageBox('Nome em branco !','Atenção',MB_ICONEXCLAMATION);
          paginaControle.ActivePage := abaCadastro;
          ActiveControl := edNome;
          Abort;
     end;

     if Trim(comboBoxUnidadeMedida.Text) = '' then
     begin
          Application.MessageBox('Informe a Unidade de Medida !', 'Atenção', MB_ICONINFORMATION);
          paginaControle.ActivePage := abaCadastro;
          ActiveControl := comboBoxUnidadeMedida;
          Abort;
     end;
end;

end.
