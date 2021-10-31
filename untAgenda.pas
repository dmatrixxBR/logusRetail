unit untAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.UItypes,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Firedac.Stan.Param,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmAgenda = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    cbPaciente: TDBLookupComboBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    cbEspecialidade: TDBLookupComboBox;
    Label6: TLabel;
    spSave: TSpeedButton;
    SpCancel: TSpeedButton;
    EditAgenda: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBLookupListBox1: TDBLookupListBox;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure SpCancelClick(Sender: TObject);
    procedure spSaveClick(Sender: TObject);
    procedure DBLookupListBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure habilitaCampos(estado:boolean);
    procedure verificaAgendamento;
  public
    { Public declarations }
  end;

var
  frmAgenda: TfrmAgenda;

implementation
uses untData;

{$R *.dfm}

procedure TfrmAgenda.Button1Click(Sender: TObject);
begin
habilitaCampos(true);
DM.FdQOAgenda.Append;
end;

procedure TfrmAgenda.DBLookupListBox1Click(Sender: TObject);
begin
   verificaAgendamento;
end;

procedure TfrmAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.FDQmedicos.Close();
DM.FDQConsultorios.Close();
DM.FDQPacientes.Close();
DM.FDQEspecialidades.Close();
DM.FdQOAgenda.Close();
end;

procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
DM.FDQmedicos.Open();
DM.FDQConsultorios.Open();
DM.FDQPacientes.Open();
DM.FDQEspecialidades.Open();
DM.FdQOAgenda.Open();
habilitacampos(false);
end;

procedure TfrmAgenda.habilitaCampos(estado:boolean);
begin
if estado then
 Begin
  DM.FdQOAgenda.EnableControls;
  panel1.Enabled:=true;
  DateTimePicker1.SetFocus;
  button1.Enabled:=false;
  dbnavigator1.Enabled:=false;
  DateTimePicker1.Date:=now();
 End
 else
   Begin
    DM.FdQOAgenda.DisableControls;
    panel1.Enabled:=false;
    dbnavigator1.Enabled:=true;
    button1.Enabled:=true;
   End;


end;

procedure TfrmAgenda.verificaAgendamento;
begin
  DM.FDQTemp.Close;
  DM.FDQTemp.Params[0].Value := DateTimePicker1.Date;
  DM.FDQTemp.Params[1].Value := DM.FdQOAgendacpfPaciente.Value;
  DM.FDQTemp.Params[2].Value := DM.FdQOAgendacrm.Value;
  DM.FDQTemp.Params[3].Value := DM.FdQOAgendaidConsultorio.Value;
  DM.FDQTemp.Params[4].Value := DM.FdQOAgendaidEspecialidade.Value;
  DM.FDQTemp.Prepare;
  DM.FDQTemp.Open;
  if DM.FDQTemp.RecordCount > 0 then
  begin
    if trim(DM.FDQTEmp.FieldByName('STATUS').Value) = 'OK' then
       Begin
        DM.FdQOAgendadataConsulta.Value:= DateTimePicker1.Date;
        DM.FdQOAgendahoraConsulta.Value:= strtoTime(string(DM.FDQTempRESULTADO.Value));
        spsave.OnClick(self);
        DM.FDQTemp.Close;
       End
    else
    begin
      raise Exception.Create('Erro no Agendamento => ' + string(DM.FDQTempRESULTADO.Value));
      DM.FDQTemp.Close;
    end;
  end;
end;

procedure TfrmAgenda.SpCancelClick(Sender: TObject);
begin
DM.FdQOAgenda.Cancel;
habilitacampos(false);
end;

procedure TfrmAgenda.spSaveClick(Sender: TObject);
begin

if messageDlg('Confirma Agendamento?',mtConfirmation,[mbyes,mbno],0)=mryes then
 Begin

   DM.FdQOAgenda.Post;
   habilitaCampos(false);
 End;

end;

end.
