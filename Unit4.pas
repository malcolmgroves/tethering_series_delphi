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
    Edit1: TEdit;
    EditButton1: TEditButton;
    Button1: TButton;
    ImageControl2: TImageControl;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure TetheringManager1PairedFromLocal(const Sender: TObject;
      const AManagerInfo: TTetheringManagerInfo);
    procedure TetheringAppProfile1Resources0ResourceReceived(
      const Sender: TObject; const AResource: TRemoteResource);
    procedure TetheringAppProfile1Resources1ResourceReceived(
      const Sender: TObject; const AResource: TRemoteResource);
    procedure EditButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button1Click(Sender: TObject);
var
  LStream : TMemoryStream;
begin
  if OpenDialog1.Execute then
  begin
    ImageControl2.LoadFromFile(OpenDialog1.FileName);

    LStream := TMemoryStream.Create;
    ImageControl2.Bitmap.SaveToStream(LStream);
    LStream.Position := 0;
    TetheringAppProfile1.SendStream(TetheringManager1.RemoteProfiles.First,
                                    'ReplyImage',
                                    LStream);
  end;
end;


procedure TForm4.EditButton1Click(Sender: TObject);
begin
  TetheringAppProfile1.SendString(TetheringManager1.RemoteProfiles.First,
                                  'ReplyText',
                                  Edit1.Text);
end;

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
