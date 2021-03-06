unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  FMX.Layouts, SG.ScriptGate, FMX.TabControl, FMX.Objects, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    WebBrowser1: TWebBrowser;
    Rectangle1: TRectangle;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Button3: TButton;
    Text1: TText;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Button4: TButton;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sgobj:TScriptGate;
  end;

var
  Form1: TForm1;

implementation

uses UnitDM;

{$R *.fmx}
//可视化
procedure TForm1.Button1Click(Sender: TObject);
var
  golon, golat, finishlon, finishlat, cmd: string;
  I : Integer;
begin
  UnitDM.DataModule2.UniQuery1.Close;
  UnitDM.DataModule2.UniQuery1.ParamByName('takeoffpoint').AsString := Edit1.Text.Trim;
  UnitDM.DataModule2.UniQuery1.Open;

  for I := 1 to UnitDM.DataModule2.UniQuery1.RecordCount do
  begin
    golon := UnitDM.DataModule2.UniQuery1.Fields[1].AsString;
    golat := UnitDM.DataModule2.UniQuery1.Fields[0].AsString;
    finishlon := UnitDM.DataModule2.UniQuery1.Fields[3].AsString;
    finishlat := UnitDM.DataModule2.UniQuery1.Fields[2].AsString;

    cmd := 'drawline("' + golon + '@' + golat + '+' + finishlon + '@' +
      finishlat + '")';

    sgobj.CallScript(cmd,
      procedure(const iresult: string)
      begin
      end);
    UnitDM.DataModule2.UniQuery1.Next;
  end;
end;
//展示航线
procedure TForm1.Button2Click(Sender: TObject);
 var
  golon, golat, finishlon, finishlat, cmd: string;
  k :integer;
begin
  UnitDM.DataModule2.UniQuery2.Close;
  UnitDM.DataModule2.UniQuery2.ParamByName('startcity').AsString := Edit2.Text.Trim;
  UnitDM.DataModule2.UniQuery2.ParamByName('arrivecity').AsString := Edit3.Text.Trim;
  UnitDM.DataModule2.UniQuery2.Open;


  for k := 1 to UnitDM.DataModule2.UniQuery2.RecordCount do
  begin
    golon := UnitDM.DataModule2.UniQuery2.Fields[1].AsString;
    golat := UnitDM.DataModule2.UniQuery2.Fields[0].AsString;
    finishlon := UnitDM.DataModule2.UniQuery2.Fields[3].AsString;
    finishlat := UnitDM.DataModule2.UniQuery2.Fields[2].AsString;

     cmd := 'gogogo("' + golon + '@' + golat + '+' + finishlon + '@' +
     finishlat + '")';
    sgobj.CallScript(cmd,
      procedure(const iresult: string)
      begin
      end);
    UnitDM.DataModule2.UniQuery2.Next;
  end;
end;
//清除
procedure TForm1.Button3Click(Sender: TObject);
begin
  sgobj.CallScript('clearmap()',
  procedure(const iresult: string)
      begin
      end);

end;
//绘制大地线
procedure TForm1.Button4Click(Sender: TObject);
var
  g: string;
begin
   g := Edit4.Text + '@' + Edit5.Text + '+' + Edit6.Text + '@' + Edit7.Text;
  sgobj.CallScript('drawlandline(' + g + ')',
    procedure(const s: string)
    begin

    end);
end;
//绘制直线
procedure TForm1.Button5Click(Sender: TObject);
var
  g: string;
begin
  g := Edit4.Text + '@' + Edit5.Text + '+' + Edit6.Text + '@' + Edit7.Text;
  sgobj.CallScript('drawline(' + g + ')',
    procedure(const s: string)
    begin

    end);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //WebBrowser1.Navigate('http://xgblack.top/web/AIRmap/');
  //WebBrowser1.Navigate('http://localhost:63342/WebstormProjects/map0629/index.html?_ijt=ej5iefgdl0dn3kmfjlbbivf90f');
  //WebBrowser1.Navigate('file:///D:/WebstormProjects/map0629/index.html');
  //WebBrowser1.Navigate('http://localhost:63342/WebstormProjects/map0629/index.html?_ijt=s9etfrp5nr8tnjjd5pvtcrr41q');
  WebBrowser1.Navigate('http://xgblack.top/web/map0629/');
  sgObj:=TScriptGate.create(self,webbrowser1,'delphi');
end;

end.
