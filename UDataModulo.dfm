object dataModulo: TdataModulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 466
  Width = 551
  object conexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      
        'Database=localhost:C:\Projetos Delphi\Teste 01 - Cadastro Produt' +
        'o\Dados\Cadastro.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Connected = True
    Left = 40
    Top = 16
  end
  object sdsProduto: TSQLDataSet
    CommandText = 'SELECT * FROM tb_produto'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conexao
    Left = 112
    Top = 16
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 144
    Top = 16
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 112
    Top = 48
    object cdsProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object cdsProdutoCODIGO_BARRAS: TIntegerField
      FieldName = 'CODIGO_BARRAS'
    end
    object cdsProdutoUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Size = 2
    end
    object cdsProdutoPRECO_CUSTO: TFMTBCDField
      FieldName = 'PRECO_CUSTO'
      DisplayFormat = 'R$ #,###,##0.00'
      EditFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      DisplayFormat = 'R$ #,###,##0.00'
      EditFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cdsProdutoESTOQUE: TFMTBCDField
      FieldName = 'ESTOQUE'
      Precision = 18
      Size = 3
    end
    object cdsProdutoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 500
    end
  end
  object dsProduto: TDataSource
    AutoEdit = False
    DataSet = cdsProduto
    Left = 144
    Top = 48
  end
end
