unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, System.Actions, FMX.ActnList;

type
  TForm3 = class(TForm)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    EditButton1: TEditButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TetheringManager1PairedToRemote(const Sender: TObject;
      const AManagerInfo: TTetheringManagerInfo);
    procedure TetheringManager1RequestManagerPassword(const Sender: TObject;
      const ARemoteIdentifier: string; var Password: string);
    procedure EditButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}

procedure TForm3.Button1Click(Sender: TObject);
begin
  TetheringManager1.AutoConnect;
end;

procedure TForm3.EditButton1Click(Sender: TObject);
begin
  TetheringAppProfile1.Resources.FindByName('SomeText').Value := Edit1.Text;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Caption := Format('App1 : %s', [TetheringManager1.Identifier]);
end;

procedure TForm3.TetheringManager1PairedToRemote(const Sender: TObject;
  const AManagerInfo: TTetheringManagerInfo);
begin
  Label1.Text := Format('Connected : %s %s', [AManagerInfo.ManagerIdentifier, AManagerInfo.ManagerName]);
end;

procedure TForm3.TetheringManager1RequestManagerPassword(const Sender: TObject;
  const ARemoteIdentifier: string; var Password: string);
begin
  Password := 'The wingless dove protects its nest';
end;

end.
