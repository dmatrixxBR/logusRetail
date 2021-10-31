unit untMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Cadas1: TMenuItem;
    ConsultasMdicas1: TMenuItem;
    Mdicos1: TMenuItem;
    Pacientes1: TMenuItem;
    Consultrios1: TMenuItem;
    Agendamento1: TMenuItem;
    Pesquisa1: TMenuItem;
    Sair1: TMenuItem;
    Especialidades1: TMenuItem;
    procedure Mdicos1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Pacientes1Click(Sender: TObject);
    procedure Consultrios1Click(Sender: TObject);
    procedure Especialidades1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Agendamento1Click(Sender: TObject);
    procedure Pesquisa1Click(Sender: TObject);
  private
    { Private declarations }
    procedure openConnections;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses untCadMedicos,untData, untConsultorios, untCadEspecialidades,
  untCadPacientes, untAgenda, untPesquisa;

procedure TfrmMain.Agendamento1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmAgenda, frmAgenda);
  frmAgenda.ShowModal;
  frmAgenda.Release;
end;

procedure TfrmMain.Consultrios1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmConsultorios, frmConsultorios);
     frmConsultorios.ShowModal;
     frmConsultorios.Release;

end;

procedure TfrmMain.Especialidades1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmEspecialidades, frmEspecialidades);
     frmEspecialidades.ShowModal;
     frmEspecialidades.Release;

end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
 openConnections;
end;

procedure TfrmMain.Mdicos1Click(Sender: TObject);
begin

     Application.CreateForm(TfrmMedicos, frmMedicos);
     frmMedicos.ShowModal;
     frmMedicos.Release;

end;

procedure TfrmMain.openConnections;
begin
dm.FDConnection1.Connected:=true;
end;

procedure TfrmMain.Pacientes1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmPacientes, frmPacientes);
     frmPacientes.ShowModal;
     frmPacientes.Release;

end;

procedure TfrmMain.Pesquisa1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  frmPesquisa.ShowModal;
  frmPesquisa.Release;
end;

procedure TfrmMain.Sair1Click(Sender: TObject);
begin
frmMain.Close;
end;

end.
