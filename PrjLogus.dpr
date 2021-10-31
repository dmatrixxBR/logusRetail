program PrjLogus;

uses
  Vcl.Forms,
  untMain in 'untMain.pas' {frmMain},
  untData in 'untData.pas' {DM: TDataModule},
  untCadMedicos in 'untCadMedicos.pas' {frmMedicos},
  untCadEspecialidades in 'untCadEspecialidades.pas' {frmEspecialidades},
  untConsultorios in 'untConsultorios.pas' {frmConsultorios},
  untCadPacientes in 'untCadPacientes.pas' {frmPacientes},
  untAgenda in 'untAgenda.pas' {frmAgenda},
  untPesquisa in 'untPesquisa.pas' {frmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
