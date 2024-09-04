unit Edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfEdit }

    TfEdit = class(TForm)
    bCancel: TBitBtn;
    bSave: TBitBtn;
    CBNote: TComboBox;
    CBSmotr: TComboBox;
    eCountry: TEdit;
    eGod: TEdit;
    Regh: TEdit;
    eName: TEdit;
    Lname: TLabel;
    Lcountry: TLabel;
    LJanr: TLabel;
    YkGod: TLabel;
    LSmotr: TLabel;
    LRegh: TLabel;
    procedure bSaveClick(Sender: TObject);
    procedure CBNoteChange(Sender: TObject);
    procedure eCountryChange(Sender: TObject);
    procedure eDlitChange(Sender: TObject);
    procedure eGodChange(Sender: TObject);
    procedure eNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LReghClick(Sender: TObject);
    procedure ReghChange(Sender: TObject);
    procedure eGodKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  fEdit: TfEdit;

implementation

{$R *.lfm}

{ TfEdit }

procedure TfEdit.bSaveClick(Sender: TObject);
begin

end;

procedure TfEdit.CBNoteChange(Sender: TObject);
begin

end;

procedure TfEdit.eCountryChange(Sender: TObject);
begin

end;

procedure TfEdit.eDlitChange(Sender: TObject);
begin

end;

procedure TfEdit.eGodChange(Sender: TObject);
begin

end;

procedure TfEdit.eNameChange(Sender: TObject);
begin

end;

procedure TfEdit.FormCreate(Sender: TObject);
begin

end;

procedure TfEdit.FormShow(Sender: TObject);
begin
  eName.SetFocus;
end;

procedure TfEdit.LReghClick(Sender: TObject);
begin

end;

procedure TfEdit.ReghChange(Sender: TObject);
begin

end;

procedure TfEdit.eGodKeyPress(Sender: TObject; var Key:char);
begin
     if not (Key in ['0'..'9', #8]) then Key := #0;
end;


end.

