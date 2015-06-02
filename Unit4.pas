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
    Label2: TLabel;
    ImageControl1: TImageControl;
    procedure FormCreate(Sender: TObject);
    procedure TetheringManager1PairedFromLocal(const Sender: TObject;
      const AManagerInfo: TTetheringManagerInfo);
    procedure TetheringAppProfile1Resources0ResourceReceived(
      const Sender: TObject; const AResource: TRemoteResource);
    procedure TetheringAppProfile1Resources1ResourceReceived(
      const Sender: TObject; const AResource: TRemoteResource);
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

procedure TForm4.TetheringAppProfile1Resources0ResourceReceived(
  const Sender: TObject; const AResource: TRemoteResource);
begin
  Label2.Text := AResource.Value.AsString;
end;

procedure TForm4.TetheringAppProfile1Resources1ResourceReceived(
  const Sender: TObject; const AResource: TRemoteResource);
begin
  Aresource.Value.AsStream.Position := 0;
  ImageControl1.Bitmap.LoadFromStream(Aresource.Value.AsStream);
end;

procedure TForm4.TetheringManager1PairedFromLocal(const Sender: TObject;
  const AManagerInfo: TTetheringManagerInfo);
begin
  Label1.Text := Format('Connected : %s %s', [AManagerInfo.ManagerIdentifier, AManagerInfo.ManagerName]);
end;

end.
