object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa de Consultas'
  ClientHeight = 383
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 122
    Height = 13
    Caption = 'Data inicial (dd/mm/aaaa)'
  end
  object Label2: TLabel
    Left = 152
    Top = 8
    Width = 117
    Height = 13
    Caption = 'Data final (dd/mm/aaaa)'
  end
  object Label3: TLabel
    Left = 304
    Top = 8
    Width = 22
    Height = 13
    Caption = 'CRM'
  end
  object Edinicial: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EdFinal: TEdit
    Left = 152
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 54
    Width = 766
    Height = 321
    DataSource = DM.DtConsulta
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 667
    Top = 8
    Width = 102
    Height = 40
    Caption = 'pesquisar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edcrm: TEdit
    Left = 304
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
