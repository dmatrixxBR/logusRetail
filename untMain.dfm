object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Teste Logus Retail'
  ClientHeight = 628
  ClientWidth = 1052
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 312
    Top = 16
    object Cadas1: TMenuItem
      Caption = '&Cadastros'
      object Mdicos1: TMenuItem
        Caption = '&M'#233'dicos'
        OnClick = Mdicos1Click
      end
      object Pacientes1: TMenuItem
        Caption = '&Pacientes'
        OnClick = Pacientes1Click
      end
      object Consultrios1: TMenuItem
        Caption = '&Consult'#243'rios'
        OnClick = Consultrios1Click
      end
      object Especialidades1: TMenuItem
        Caption = 'Especialidades'
        OnClick = Especialidades1Click
      end
    end
    object ConsultasMdicas1: TMenuItem
      Caption = 'C&onsultas M'#233'dicas'
      object Agendamento1: TMenuItem
        Caption = '&Agendamento'
        OnClick = Agendamento1Click
      end
      object Pesquisa1: TMenuItem
        Caption = 'Pes&quisa'
        OnClick = Pesquisa1Click
      end
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
      OnClick = Sair1Click
    end
  end
end
