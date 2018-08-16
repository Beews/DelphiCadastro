object FCadastroProduto: TFCadastroProduto
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  Caption = 'Formul'#225'rio de Produto'
  ClientHeight = 531
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Visible = True
  WindowState = wsMaximized
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 818
    Height = 49
    Align = alTop
    Color = clInactiveCaptionText
    ParentBackground = False
    TabOrder = 0
    object buttonIncluir: TSpeedButton
      Left = 1
      Top = 1
      Width = 81
      Height = 47
      Align = alLeft
      Caption = 'Incluir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = buttonIncluirClick
      ExplicitLeft = 49
      ExplicitTop = 17
    end
    object buttonEditar: TSpeedButton
      Left = 82
      Top = 1
      Width = 81
      Height = 47
      Align = alLeft
      Caption = 'Editar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = buttonEditarClick
      ExplicitLeft = 88
      ExplicitTop = -4
    end
    object buttonExcluir: TSpeedButton
      Left = 163
      Top = 1
      Width = 81
      Height = 47
      Align = alLeft
      Caption = 'Excluir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = buttonExcluirClick
      ExplicitLeft = 157
      ExplicitTop = -4
    end
    object buttonSalvar: TSpeedButton
      Left = 244
      Top = 1
      Width = 81
      Height = 47
      Align = alLeft
      Caption = 'Salvar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = buttonSalvarClick
      ExplicitLeft = 250
    end
    object buttonCancelar: TSpeedButton
      Left = 325
      Top = 1
      Width = 81
      Height = 47
      Align = alLeft
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = buttonCancelarClick
      ExplicitLeft = 381
    end
    object buttonPrimeiro: TSpeedButton
      Left = 406
      Top = 1
      Width = 81
      Height = 47
      Align = alLeft
      Caption = 'Primeiro'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = buttonPrimeiroClick
      ExplicitLeft = 453
      ExplicitTop = 0
    end
    object buttonAnterior: TSpeedButton
      Left = 487
      Top = 1
      Width = 81
      Height = 47
      Align = alLeft
      Caption = 'Anterior'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = buttonAnteriorClick
      ExplicitLeft = 542
    end
    object buttonProximo: TSpeedButton
      Left = 568
      Top = 1
      Width = 81
      Height = 47
      Align = alLeft
      Caption = 'Pr'#243'ximo'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = buttonProximoClick
      ExplicitLeft = 599
      ExplicitTop = 0
    end
    object buttonUltimo: TSpeedButton
      Left = 649
      Top = 1
      Width = 81
      Height = 47
      Align = alLeft
      Caption = #218'ltimo'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = buttonUltimoClick
      ExplicitLeft = 680
      ExplicitTop = 0
    end
    object buttonSair: TSpeedButton
      Left = 736
      Top = 1
      Width = 81
      Height = 47
      Align = alRight
      Caption = 'Sair'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = buttonSairClick
      ExplicitLeft = 737
      ExplicitTop = 0
    end
  end
  object paginaControle: TPageControl
    Left = 0
    Top = 49
    Width = 818
    Height = 482
    ActivePage = abaConsulta
    Align = alClient
    TabOrder = 1
    OnChange = paginaControleChange
    object abaConsulta: TTabSheet
      Caption = 'Consulta'
      object dbGridProduto: TDBGrid
        Left = 0
        Top = 0
        Width = 810
        Height = 454
        Align = alClient
        DataSource = dataModulo.dsProduto
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbGridProdutoDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE'
            Title.Caption = 'Estoque'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE_MEDIDA'
            Title.Caption = 'Unidade de Medida'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_CUSTO'
            Title.Caption = 'Pre'#231'o de Custo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_VENDA'
            Title.Caption = 'Pre'#231'o de Venda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Title.Caption = 'Observa'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 800
            Visible = True
          end>
      end
    end
    object abaCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        810
        454)
      object Label3: TLabel
        Left = 8
        Top = 4
        Width = 50
        Height = 21
        AutoSize = False
        Caption = 'C'#211'DIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object Label4: TLabel
        Left = 134
        Top = 2
        Width = 87
        Height = 21
        AutoSize = False
        Caption = 'DESCRI'#199#195'O *'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object Label5: TLabel
        Left = 8
        Top = 43
        Width = 125
        Height = 13
        Caption = 'C'#211'DIGO DE BARRAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 10
        Top = 95
        Width = 147
        Height = 13
        Caption = 'UNIDADE DE MEDIDA *'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 10
        Top = 290
        Width = 59
        Height = 13
        Caption = 'ESTOQUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 10
        Top = 336
        Width = 84
        Height = 13
        Caption = 'OBSERVA'#199#195'O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edCod: TDBEdit
        Left = 63
        Top = 3
        Width = 65
        Height = 21
        Color = clSilver
        DataField = 'CODIGO'
        DataSource = dataModulo.dsProduto
        Enabled = False
        MaxLength = 8
        TabOrder = 0
      end
      object edNome: TDBEdit
        Left = 224
        Top = 3
        Width = 577
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dataModulo.dsProduto
        TabOrder = 1
      end
      object EdCodBarras: TDBEdit
        Left = 8
        Top = 60
        Width = 185
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODIGO_BARRAS'
        DataSource = dataModulo.dsProduto
        MaxLength = 13
        TabOrder = 2
      end
      object gbDadosDeValores: TGroupBox
        Left = 10
        Top = 152
        Width = 183
        Height = 121
        Caption = 'Dados de Valores'
        TabOrder = 3
        object Label13: TLabel
          Left = 15
          Top = 18
          Width = 108
          Height = 13
          Caption = 'PRE'#199'O DE CUSTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 15
          Top = 68
          Width = 109
          Height = 13
          Caption = 'PRE'#199'O DE VENDA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdPrecust: TDBEdit
          Left = 15
          Top = 33
          Width = 154
          Height = 21
          DataField = 'PRECO_CUSTO'
          DataSource = dataModulo.dsProduto
          MaxLength = 8
          TabOrder = 0
        end
        object EdvendaA: TDBEdit
          Left = 15
          Top = 87
          Width = 154
          Height = 21
          DataField = 'PRECO_VENDA'
          DataSource = dataModulo.dsProduto
          MaxLength = 8
          TabOrder = 1
        end
      end
      object edEstoque: TDBEdit
        Left = 8
        Top = 309
        Width = 185
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ESTOQUE'
        DataSource = dataModulo.dsProduto
        TabOrder = 4
      end
      object edObservacao: TDBEdit
        Left = 8
        Top = 355
        Width = 793
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        DataField = 'OBSERVACAO'
        DataSource = dataModulo.dsProduto
        TabOrder = 5
      end
      object comboBoxUnidadeMedida: TDBComboBox
        Left = 8
        Top = 114
        Width = 185
        Height = 22
        Style = csOwnerDrawFixed
        CharCase = ecUpperCase
        DataField = 'UNIDADE_MEDIDA'
        DataSource = dataModulo.dsProduto
        Items.Strings = (
          'UN'
          'P'#199
          'KG'
          'LT')
        TabOrder = 6
      end
    end
  end
end
