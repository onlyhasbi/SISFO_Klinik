unit UHargaTerapi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  Tfhargaterapi = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ekode: TEdit;
    enama: TEdit;
    ebiaya: TEdit;
    mdeskripsi: TMemo;
    bsimpan: TButton;
    bbatal: TButton;
    sbinfo: TStatusBar;
    bhapus: TButton;
    procedure FormActivate(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure ekodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ekodeChange(Sender: TObject);
    procedure bhapusClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function validateData:Boolean;

  public
    procedure loadData;

  end;

var
  fhargaterapi: Tfhargaterapi;
  id:string;

implementation

uses DatabaseScript, FormScript, UDataModule;

{$R *.dfm}

procedure Tfhargaterapi.FormActivate(Sender: TObject);
begin
KeyPreview:=true;
bbatal.Click;
end;

procedure Tfhargaterapi.bbatalClick(Sender: TObject);
begin
  batal(Self,id);
  ekode.Text:=generateKode('TI','data_terapi');
  enama.SetFocus;
end;

procedure Tfhargaterapi.bsimpanClick(Sender: TObject);
const
  kolom:array [0..3] of string = ('kode','nama','biaya','deskripsi');

var
  data : array [0..3] of string;
  updateKolom:array of string;
  insertKolom:array of string;
  i:integer;

begin
if validateKode(id,'TI',ekode.Text,'data_terapi',sbinfo,ekode) and validateData then
   begin
    data[0]:=ekode.Text;
    data[1]:=enama.Text;
    data[2]:=ebiaya.Text;
    data[3]:=mdeskripsi.Text;

    if id='' then
         begin
           SetLength(insertKolom,4);
           for i:=0 to 3 do
                insertKolom[i]:=kolom[i];
           runKueri(insertKueri(insertKolom,data,'data_terapi'),False);
           sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah ditambahkan';
         end
      else
          begin
            SetLength(updateKolom,4);
            for i:=1 to 3 do
                 updateKolom[i]:=kolom[i];
            runKueri(updateKueri(updateKolom,Data,'data_terapi',id),False);
            sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah disunting';
          end;
    bbatal.Click;
   end;               
end;

procedure Tfhargaterapi.ekodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  temp : string;

begin
if (Key=VK_delete) or (Key=VK_BACK) then
   begin
   runKueri(openKueri('*','data_terapi',' where kode='+QuotedStr(TEdit(Sender).Text)));
   if dm.zkue.RecordCount>0 then
          loadData
   else
       begin
       id:='';
       temp:=ekode.Text;
       batal(Self,id);
       ekode.Text:=temp;
       ekode.SetFocus;
       ekode.SelStart:=Length(ekode.Text);
       end;
   end;
end;

procedure Tfhargaterapi.ekodeChange(Sender: TObject);
begin
CodeChar(sender);
runKueri(openKueri('*','data_terapi',' where kode='+QuotedStr(TEdit(Sender).Text)));
if dm.zkue.RecordCount>0 then
      loadData
else
   id:='';
end;

procedure Tfhargaterapi.loadData;
var
  kode,nama,biaya,deskripsi:String;

begin
with dm.zkue do
    begin
    id:=Fields[0].AsString;
    kode:=Fields[1].AsString;
    nama:=Fields[2].AsString;
    biaya:=Fields[3].AsString;
    deskripsi:=Fields[4].AsString;
    end;

ekode.Text:=kode;
enama.Text:=nama;
ebiaya.Text:=biaya;
mdeskripsi.Text:=deskripsi;
ekode.SetFocus;
end;

function Tfhargaterapi.validateData: Boolean;
var
 cek:Boolean;
 j,i:Integer;

begin
cek:=True;
 for i:=1 to 4 do
     begin
     for j:=0 to ComponentCount-1 do
          begin
          if (Components[j] is TEdit) and (TEdit(Components[j]).TabOrder=i) then
              begin
              if (TEdit(Components[j]).Text=TEdit(Components[j]).Hint) then
                  Begin
                  sbinfo.Panels[1].Text:='Isian teks belum diisi ';
                  TEdit(Components[j]).SetFocus;
                  cek:=False;
                  Break;
                  end
              end;
          if (Components[j] is TComboBox) and (TComboBox(Components[j]).TabOrder=i) then
              begin
              if (TComboBox(Components[j]).Text=TComboBox(Components[j]).Hint) then
                  Begin
                  sbinfo.Panels[1].Text:='Anda belum memilih';
                  TComboBox(Components[j]).SetFocus;
                  cek:=False;
                  Break;
                  end;
              end;
          if (Components[j] is TMemo) and (TMemo(Components[j]).TabOrder=i) then
              begin
                if (TMemo(Components[j]).Text=TMemo(Components[j]).Hint) then
                  Begin
                  sbinfo.Panels[1].Text:='Isian teks belum diisi';
                  TMemo(Components[j]).SetFocus;
                  cek:=False;
                  Break;
                  end;
              end;
            end;
  if not(cek) then Break;
  end;
 Result:=cek;
end;

procedure Tfhargaterapi.bhapusClick(Sender: TObject);
var
  deleted:integer;
begin
deleted:=MessageDlg('Anda yakin ingin menghapus data ?',mtConfirmation,[mbyes,mbNo],0);
if deleted=mrYes then
   begin
    runKueri(deleteKueri('data_terapi',id),false);
    sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah dihapus';
    bbatal.Click;
   end;
end;

procedure Tfhargaterapi.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) or (key=#27) then
   begin       
   if key=#27 then
      Self.Close;
   key:=#0;
   end;
end;

end.
