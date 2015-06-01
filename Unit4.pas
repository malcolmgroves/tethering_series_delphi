unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, System.Actions,
  FMX.ActnList;

type
  TForm4 = class(TForm)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TetheringManager1PairedFromLocal(const Sender: TObject;
      const AManagerInfo: TTetheringManagerInfo);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.FormCreate(Sender: TObject);
begin
  Caption := Format('App2 : %s', [TetheringManager1.Identifier]);
end;

procedure TForm4.TetheringManager1PairedFromLocal(const Sender: TObject;
  const AManagerInfo: TTetheringManagerInfo);
begin
  Label1.Text := Format('Connected : %s %s', [AManagerInfo.ManagerIdentifier, AManagerInfo.ManagerName]);
end;

end.
