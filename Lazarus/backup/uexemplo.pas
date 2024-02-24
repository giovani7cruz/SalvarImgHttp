(****************************************

Criado pelo Professor Giovani Da Cruz
https://giovanidacruz.com.br

****************************************)
unit uExemplo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFrmImagemWeb }

  TFrmImagemWeb = class(TForm)
    BtnColetarImagem: TButton;
    CheckStretch: TCheckBox;
    EdtLink: TEdit;
    Image1: TImage;
    ImgImagemColetada: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LblSite: TLabel;
    PnlImagem: TPanel;
    procedure BtnColetarImagemClick(Sender: TObject);
    procedure CheckStretchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LblSiteClick(Sender: TObject);
  private

  public

  end;

var
  FrmImagemWeb: TFrmImagemWeb;

implementation

{$R *.lfm}

{ TFrmImagemWeb }

uses
  fphttpclient, opensslsockets, LazUtils, Windows;

procedure TFrmImagemWeb.BtnColetarImagemClick(Sender: TObject);
var
  HttpClient: TFPHttpClient;
  ImageStream: TMemoryStream;
begin
  HttpClient := TFPHttpClient.Create(nil);
  ImageStream := TMemoryStream.Create;
  PnlImagem.Caption:= 'Sem Imagem';

  try
    try
      // Baixa a imagem da URL
      HttpClient.Get(EdtLink.Text, ImageStream);

      // Se a resposta for bem-sucedida, carrega a imagem no TImage
      if HttpClient.ResponseStatusCode = 200 then
      begin
        ImageStream.Position := 0;
        ImgImagemColetada.Picture.LoadFromStream(ImageStream);
        PnlImagem.Caption:= '';
      end
      else
        ShowMessage('Erro ao baixar a imagem: ' + IntToStr(HttpClient.ResponseStatusCode));
    except
      on E: Exception do
        ShowMessage('Erro ao baixar a imagem: ' + E.Message);
    end;
  finally
    HttpClient.Free;
    ImageStream.Free;
  end;

end;

procedure TFrmImagemWeb.CheckStretchClick(Sender: TObject);
begin
  ImgImagemColetada.Stretch:= CheckStretch.Checked;
end;

procedure TFrmImagemWeb.FormCreate(Sender: TObject);

begin



end;

procedure TFrmImagemWeb.LblSiteClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(LblSite.Caption), nil, nil, SW_SHOWMAXIMIZED);
end;

end.

