unit untData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  FireDAC.Moni.Base, FireDAC.Moni.FlatFile, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FDQTemp: TFDQuery;
    dtTemp: TDataSource;
    FDQmedicos: TFDQuery;
    FDQConsultorios: TFDQuery;
    FDQPacientes: TFDQuery;
    FdQOAgenda: TFDQuery;
    dtAgenda: TDataSource;
    DtPacientes: TDataSource;
    dtConsultorios: TDataSource;
    Dtmedicos: TDataSource;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
    FDConnection1: TFDConnection;
    FDQmedicoscrm: TIntegerField;
    FDQmedicosnome: TStringField;
    FDQmedicosidade: TIntegerField;
    FDQConsultoriosidconsultorios: TFDAutoIncField;
    FDQConsultoriosdescricaoConsult: TStringField;
    FDQPacientescpf: TStringField;
    FDQPacientesnome: TStringField;
    FDQPacientesidade: TIntegerField;
    FdQOAgendadataConsulta: TDateField;
    FdQOAgendahoraConsulta: TTimeField;
    FdQOAgendaidEspecialidade: TIntegerField;
    FdQOAgendacrm: TIntegerField;
    FdQOAgendaidConsultorio: TIntegerField;
    FdQOAgendacpfPaciente: TStringField;
    FdQOAgendaobs: TMemoField;
    FDQEspecialidades: TFDQuery;
    FDQEspecialidadesidespecialidade: TIntegerField;
    FDQEspecialidadesdescricao: TStringField;
    DtEspecialidades: TDataSource;
    FdQOAgendanomeMedico: TStringField;
    FDQTempRESULTADO: TStringField;
    FDQTempSTATUS: TStringField;
    FDQconsulta: TFDQuery;
    DtConsulta: TDataSource;
    FDQconsultaDataMarcada: TDateField;
    FDQconsultahora: TTimeField;
    FDQconsultaespecialidade: TStringField;
    FDQconsultaconsultorio: TStringField;
    FDQconsultacrm: TIntegerField;
    FDQconsultamedico: TStringField;
    FDQconsultapaciente: TStringField;
    FDQconsultaobs: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
