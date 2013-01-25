program dd_teclado_virtual;

uses
  Forms,
  uni_DDTecladoVirtual in '..\pas\uni_DDTecladoVirtual.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
