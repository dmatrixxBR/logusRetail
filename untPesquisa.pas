unit untPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmPesquisa = class(TForm)
    Edinicial: TEdit;
    EdFinal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Edcrm: TEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function decodeData(data:Tdate):string;
  public
    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation
uses  untData;

{$R *.dfm}

procedure TfrmPesquisa.Button1Click(Sender: TObject);

var lSQL:string;
begin

lSQL := ' SELECT a.dataConsulta as DataMarcada, a.horaConsulta as hora , e.descricao as especialidade, '+
        ' c.descricaoConsult as consultorio, a.crm , m.nome as medico ,p.nome as paciente ,a.obs' +
        ' FROM agenda a'+
        ' JOIN  especialidade e on a.idEspecialidade = e.idEspecialidade'+
        ' JOIN  consultorios c on a.idConsultorio = c.idconsultorios'+
        ' JOIN  medicos m on a.crm = m.crm '+
        ' JOIN pacientes p on a.cpfPaciente = p.cpf ';

 try
   if trim(edinicial.Text) <> '' then
      Begin
        lSQL := lSQL + ' WHERE a.dataConsulta >= ' + QuotedStr(decodeData(strTodate(edinicial.Text)));

        if trim(edFinal.Text) <> '' then
            lSQL := lSQL + ' AND a.dataConsulta <= ' + QuotedStr(decodeData(strTodate(edfinal.Text)))
        else
            lSQL := lSQL + ' AND a.dataConsulta <= ' + QuotedStr(decodeData(strTodate(edinicial.Text)));

      End;

    if trim(Edcrm.Text) <> '' then
        lSQL := lSQL + ' AND a.crm = ' +edcrm.Text;

        LSQL := lSQL + ' ORDER BY dataConsulta,horaConsulta ASC ;';


 except
    On e:Exception do
      Begin
        showMessage('Erro :' + E.Message);
      End;

 end;


DM.FDQconsulta.Close;
DM.FDQconsulta.SQL.Clear;
DM.FDQconsulta.SQL.Text:=lSQL;
DM.FDQConsulta.open;

end;

function TfrmPesquisa.decodeData(data: Tdate): string;
var
ano, mes, dia:word;
begin
DecodeDate(Data, ano, mes, dia);
Result:= intToStr(ano)+'-'+intToStr(mes)+'-'+intToStr(dia);
end;

end.
