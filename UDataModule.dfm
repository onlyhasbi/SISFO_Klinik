object dm: Tdm
  OldCreateOrder = False
  Left = 1008
  Top = 143
  Height = 310
  Width = 234
  object zkon: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Port = 0
    Left = 24
    Top = 16
  end
  object zkue: TZQuery
    Params = <>
    Left = 24
    Top = 72
  end
  object vtkunjungan: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    FieldDefs = <
      item
        Name = 'No'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nama Pasien'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Terapis'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Tanggal'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Waktu'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 11
      end>
    Left = 88
    Top = 16
    Data = {
      0300060002004E6F01000A00000000000B004E616D612050617369656E010019
      00000000000700546572617069730100140000000000070054616E6767616C01
      000A0000000000050057616B7475010009000000000006005374617475730100
      0B0000000000000000000000}
  end
  object dsKunjungan: TDataSource
    Left = 88
    Top = 72
  end
  object vtHerbal: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Active = True
    FieldDefs = <
      item
        Name = 'Kode'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Nama'
        DataType = ftString
        Size = 26
      end
      item
        Name = 'Harga'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Diskon'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Jumlah'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'SubTotal'
        DataType = ftString
        Size = 13
      end>
    Left = 24
    Top = 136
    Data = {
      0300060004004B6F6465010009000000000004004E616D6101001A0000000000
      0500486172676101000A000000000006004469736B6F6E01000A000000000006
      004A756D6C616801000700000000000800537562546F74616C01000D00000000
      00000000000000}
  end
  object dsHerbal: TDataSource
    DataSet = vtHerbal
    Left = 24
    Top = 192
  end
  object vtTerapi: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Active = True
    FieldDefs = <
      item
        Name = 'Kode'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Nama'
        DataType = ftString
        Size = 26
      end
      item
        Name = 'Harga'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Diskon'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Jumlah'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'Subtotal'
        DataType = ftString
        Size = 13
      end>
    Left = 88
    Top = 136
    Data = {
      0300060004004B6F6465010009000000000004004E616D6101001A0000000000
      0500486172676101000A000000000006004469736B6F6E01000A000000000006
      004A756D6C616801000700000000000800537562746F74616C01000D00000000
      00000000000000}
  end
  object dsTerapi: TDataSource
    DataSet = vtTerapi
    Left = 88
    Top = 192
  end
  object vtPembelian: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Active = True
    FieldDefs = <
      item
        Name = 'Kode'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Nama'
        DataType = ftString
        Size = 27
      end
      item
        Name = 'Harga Beli'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Diskon'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Jumlah'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'SubTotal'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Harga Jual'
        DataType = ftString
        Size = 10
      end>
    Left = 160
    Top = 136
    Data = {
      0300070004004B6F6465010009000000000004004E616D6101001B0000000000
      0A0048617267612042656C6901000A000000000006004469736B6F6E01000800
      0000000006004A756D6C616801000600000000000800537562546F74616C0100
      0A00000000000A004861726761204A75616C01000A0000000000000000000000}
  end
  object dsPembelian: TDataSource
    DataSet = vtPembelian
    Left = 160
    Top = 192
  end
end
