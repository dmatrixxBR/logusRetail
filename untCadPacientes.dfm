object frmPacientes: TfrmPacientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Pacientes'
  ClientHeight = 392
  ClientWidth = 582
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
    Left = 56
    Top = 48
    Width = 456
    Height = 289
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 454
      Height = 25
      Align = alTop
      Alignment = taCenter
      Caption = 'Pacientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 101
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 80
      Width = 425
      Height = 193
      DataSource = DM.DtPacientes
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
          FieldName = 'cpf'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'idade'
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 16
      Top = 49
      Width = 420
      Height = 25
      DataSource = DM.DtPacientes
      TabOrder = 1
    end
  end
end
