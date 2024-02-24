(****************************************

Criado pelo Professor Giovani Da Cruz
https://giovanidacruz.com.br

****************************************)
program SalvarImgHttp;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uExemplo
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFrmImagemWeb, FrmImagemWeb);
  Application.Run;
end.

