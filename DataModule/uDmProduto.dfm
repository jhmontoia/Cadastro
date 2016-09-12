object dmProduto: TdmProduto
  OldCreateOrder = False
  Height = 368
  Width = 460
  object cnProduto: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object tranProduto: TFDTransaction
    Connection = cnProduto
    Left = 48
    Top = 72
  end
  object qrTblProdutos: TFDQuery
    Connection = cnProduto
    UpdateTransaction = tranProduto
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_PROD_ID'
    UpdateOptions.AutoIncFields = 'PROD_ID'
    SQL.Strings = (
      'select '
      '   PROD_ID,'
      '   PROD_DESCRICAO,'
      '   PROD_VALOR_CUSTO,'
      '   PROD_VALOR_VENDA,'
      '   PROD_QTDE_ESTOQUE,'
      '   PROD_DATA_CADASTRO,'
      '   PROD_DATA_ALTERACAO'
      'from produto')
    Left = 48
    Top = 136
    object qrTblProdutosPROD_ID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'ID do Produto'
      FieldName = 'PROD_ID'
      Origin = 'PROD_ID'
      ReadOnly = True
    end
    object qrTblProdutosPROD_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'PROD_DESCRICAO'
      Origin = 'PROD_DESCRICAO'
      Size = 100
    end
    object qrTblProdutosPROD_VALOR_CUSTO: TBCDField
      DisplayLabel = 'Valor de custo'
      FieldName = 'PROD_VALOR_CUSTO'
      Origin = 'PROD_VALOR_CUSTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrTblProdutosPROD_VALOR_VENDA: TBCDField
      DisplayLabel = 'Valor de venda'
      FieldName = 'PROD_VALOR_VENDA'
      Origin = 'PROD_VALOR_VENDA'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrTblProdutosPROD_QTDE_ESTOQUE: TIntegerField
      DisplayLabel = 'Qtde em Estoque'
      FieldName = 'PROD_QTDE_ESTOQUE'
      Origin = 'PROD_QTDE_ESTOQUE'
    end
    object qrTblProdutosPROD_DATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'PROD_DATA_CADASTRO'
      Origin = 'PROD_DATA_CADASTRO'
    end
    object qrTblProdutosPROD_DATA_ALTERACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Altera'#231#227'o'
      FieldName = 'PROD_DATA_ALTERACAO'
      Origin = 'PROD_DATA_ALTERACAO'
    end
  end
  object dsqrTblProdutos: TDataSource
    DataSet = qrTblProdutos
    Left = 48
    Top = 192
  end
end
