unit untCadPacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPacientes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPacientes: TfrmPacientes;

implementation

{$R *.dfm}
uses untData;

procedure TfrmPacientes.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if not Odd(DM.FDQPacientes.RecNo) then
    begin
       if not(gdSelected in State) then
          begin
            DBGrid1.Canvas.Brush.Color:= $00B3DFAA;
            DBGrid1.Canvas.FillRect(rect);
            DBGrid1.DefaultDrawDataCell(rect,Column.field,state);

          end;

    end;
end;

procedure TfrmPacientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm.FDQPacientes.Close;
end;

procedure TfrmPacientes.FormCreate(Sender: TObject);
begin
dm.FDQPacientes.Open;
end;

end.
