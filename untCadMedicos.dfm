object frmMedicos: TfrmMedicos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de M'#233'dicos'
  ClientHeight = 392
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 64
    Top = 48
    Width = 537
    Height = 289
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 535
      Height = 25
      Align = alTop
      Alignment = taCenter
      Caption = 'M'#233'dicos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 85
    end
    object DBGrid1: TDBGrid
      Left = 40
      Top = 80
      Width = 441
      Height = 193
      DataSource = DM.Dtmedicos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'crm'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'idade'
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 48
      Top = 49
      Width = 420
      Height = 25
      DataSource = DM.Dtmedicos
      TabOrder = 1
    end
  end
end
