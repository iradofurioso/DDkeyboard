{
  Sobre: Exemplo de um prot�tipo de teclado virtual para fins educacionais.
         Testado em Windows XP SP3
  
  Autor: Dicas Delphi <www.dicasdelphi.com.br - contato@dicasdelphi.com.br>
  Data:  11/06/2011

}

unit uni_DDTecladoVirtual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton51: TSpeedButton;
    SpeedButton52: TSpeedButton;
    btnBackSpace: TSpeedButton;
    SpeedButton57: TSpeedButton;
    SpeedButton58: TSpeedButton;
    SpeedButton60: TSpeedButton;
    SpeedButton61: TSpeedButton;
    SpeedButton63: TSpeedButton;
    SpeedButton64: TSpeedButton;
    SpeedButton65: TSpeedButton;
    SpeedButton66: TSpeedButton;
    btnReturn: TSpeedButton;
    btnSpace: TSpeedButton;
    btnCaps: TSpeedButton;
    btnShift: TSpeedButton;
    SpeedButton20: TSpeedButton;
    imgLed: TImage;
    SpeedButton21: TSpeedButton;
    SpeedButton29: TSpeedButton;
    imgShift: TImage;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton47: TSpeedButton;
    SpeedButton48: TSpeedButton;
    Label1: TLabel;
    procedure SpeedButton37Click(Sender: TObject);
    procedure btnSpaceClick(Sender: TObject);
    procedure btnBackSpaceClick(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure btnCapsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnShiftClick(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure SpeedButton66Click(Sender: TObject);
    procedure SpeedButton58Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton47Click(Sender: TObject);
    procedure SpeedButton48Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }

    //variaveis
    MyHandle          : THandle;
    HandleMaeFocus    : THandle;
    HandleFilhaFocus  : THandle;
    altState          : boolean;
    shiftState        : boolean;
    vsPath            : string;
    
    //metodos
    procedure processLetter(letra: char);
    procedure trataJanelas;
    procedure processSpecialKeys(scanCode: Integer);
    procedure SetCapsLock(State: boolean);

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}


{Construtor do teclado virtual}
//============================================================================//
procedure TForm2.FormCreate(Sender: TObject);
//============================================================================//
begin
  //Estado inicial da tecla alt.
  altState := false;

  //Estado inicial da tecla shift
  shiftState := false;
  
  vsPath := ExtractFilePath( Application.ExeName );
end;


procedure TForm2.Label2Click(Sender: TObject);
begin

end;

{M�todo respons�vel pela cria��o do s�mbolo do dolar}
//============================================================================//
procedure TForm2.SpeedButton20Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;
  
  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);
  
  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);
  
  //Processa o valor da tecla baseado no scanCode.
  keybd_event(52, 0, 0, 0);
  keybd_event(52, 0, KEYEVENTF_KEYUP, 0);

  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel pela cria��o do s�mbolo arroba}
//============================================================================//
procedure TForm2.SpeedButton21Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);

  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(50, 0, 0, 0);
  keybd_event(50, 0, KEYEVENTF_KEYUP, 0);

  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel pela cria��o do s�mbolo de interroga��o}
//============================================================================//
procedure TForm2.SpeedButton29Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);

  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(193, 0, 0, 0);
  keybd_event(193, 0, KEYEVENTF_KEYUP, 0);
  
  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel por colocar as aspas nas palavras.}
//============================================================================//
procedure TForm2.SpeedButton30Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);

  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(192, 0, 0, 0);
  keybd_event(192, 0, KEYEVENTF_KEYUP, 0);

  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel para colocar o acento circunflexo nas palavras.}
//============================================================================//
procedure TForm2.SpeedButton31Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);

  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(222, 0, 0, 0);
  keybd_event(222, 0, KEYEVENTF_KEYUP, 0);

  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel por colocar Crase nas palavras.}
//============================================================================//
procedure TForm2.SpeedButton32Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);

  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(219, 0, 0, 0);
  keybd_event(219, 0, KEYEVENTF_KEYUP, 0);

  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel pela cria��o do s�mbolo cerquilha.}
//============================================================================//
procedure TForm2.SpeedButton33Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);

  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(51, 0, 0, 0);
  keybd_event(51, 0, KEYEVENTF_KEYUP, 0);

  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel pela cria��o do s�mbolo de adi��o.}
//============================================================================//
procedure TForm2.SpeedButton34Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);

  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(187, 0, 0, 0);
  keybd_event(187, 0, KEYEVENTF_KEYUP, 0);

  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel pela cria��o do s�mbolo underline.}
//============================================================================//
procedure TForm2.SpeedButton35Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);

  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(189, 0, 0, 0);
  keybd_event(189, 0, KEYEVENTF_KEYUP, 0);

  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel pela cria��o do s�mbolo de porcentagem.}
//============================================================================//
procedure TForm2.SpeedButton36Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);

  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(53, 0, 0, 0);
  keybd_event(53, 0, KEYEVENTF_KEYUP, 0);

  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo principal processa todas as letras e n�meros.}
//============================================================================//
procedure TForm2.SpeedButton37Click(Sender: TObject);
//============================================================================//
var
  btnValue  : string;
  valueChar : char;
begin
  btnValue := TSpeedButton(Sender).Caption;
  valueChar := btnValue[1];
  processLetter(valueChar);
end;


{M�todo respons�vel por colocar os dois pontos.}
//============================================================================//
procedure TForm2.SpeedButton47Click(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);

  //Segura o Shift
  keybd_event(VK_SHIFT, 0, 0, 0);

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(191, 0, 0, 0);
  keybd_event(191, 0, KEYEVENTF_KEYUP, 0);

  //Solta o shift
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

end;


{Finaliza o teclado virtual.}
//============================================================================//
procedure TForm2.SpeedButton48Click(Sender: TObject);
//============================================================================//
begin
  self.Close;
end;


{M�todo respons�vel por colocar o acento agudo.}
//============================================================================//
procedure TForm2.SpeedButton58Click(Sender: TObject);
//============================================================================//
begin
  //Trata o foco das janelas.
  trataJanelas;
  
  //Processa o valor da tecla baseado no scanCode.
  keybd_event(219, 0, 0, 0);
  keybd_event(219, 0, KEYEVENTF_KEYUP, 0);
end;


{M�todo respons�vel por colocar o acento til.}
//============================================================================//
procedure TForm2.SpeedButton61Click(Sender: TObject);
//============================================================================//
begin
  //Trata o foco das janelas.
  trataJanelas;

  //Processa o valor da tecla baseado no scanCode.
  keybd_event(222, 0, 0, 0);
  keybd_event(222, 0, KEYEVENTF_KEYUP, 0);
end;


{M�todo respons�vel pela cria��o do s�mbolo de Contra barra.}
//============================================================================//
procedure TForm2.SpeedButton66Click(Sender: TObject);
//============================================================================//
begin
  //Trata o foco das janelas.
  trataJanelas;
  
  //Processa o valor da tecla baseado no scanCode.
  keybd_event(193, 0, 0, 0);
  keybd_event(193, 0, KEYEVENTF_KEYUP, 0);
end;


{M�todo respons�vel por tratar o foco das janelas.}
//============================================================================//
procedure TForm2.trataJanelas;
//============================================================================//
begin

  //Interrompe a aplicacao para que o windows possa processar as mensagens.
  Application.HandleMessage;

  //Handle da janela do teclado
  MyHandle := FindWindow('TForm2',nil);


  if GetActiveWindow = MyHandle then
    HandleMaeFocus := GetNextWindow(MyHandle,GW_HWNDNEXT);

  
  Sendmessage(HandleFilhaFocus,WM_SETFOCUS,0,0);
  SetActiveWindow(HandleFilhaFocus);

end;


{M�todo respons�vel pela execu��o do backspace.}
//============================================================================//
procedure TForm2.btnBackSpaceClick(Sender: TObject);
//============================================================================//
begin
  //Backspace	8
  processSpecialKeys(8);
end;


{M�todo respons�vel pela execu��o do capslock.}
//============================================================================//
procedure TForm2.btnCapsClick(Sender: TObject);
//============================================================================//
begin
  if altState = true then
  begin
    SetCapsLock(false);
    altState := false;
    imgLed.Picture.LoadFromFile(vsPath + '..\pas\images\ledoff.bmp');
  end
  else
  begin
    SetCapsLock(true);
    altState := true;
    imgLed.Picture.LoadFromFile(vsPath + '..\pas\images\ledon.bmp');
  end;

end;


{M�todo respons�vel pela execu��o do enter.}
//============================================================================//
procedure TForm2.btnReturnClick(Sender: TObject);
//============================================================================//
begin

  //Trata o foco das janelas.
  trataJanelas;
  
  //Processa o valor da tecla baseado no scanCode.
  keybd_event(VK_RETURN, 0, 0, 0);
  keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel pela execu��o do shift.}
//============================================================================//
procedure TForm2.btnShiftClick(Sender: TObject);
//============================================================================//
begin
  if shiftState = true then
  begin
    if altState = true then begin
      SetCapsLock(false);
      imgLed.Picture.LoadFromFile(vsPath + '..\pas\images\ledoff.bmp');
      altState := false;
    end;
    
    shiftState := false;
    imgShift.Picture.LoadFromFile(vsPath + '..\pas\images\ledoff.bmp');
  end
  else
  begin
    if altState = true then begin
      SetCapsLock(false);
      imgLed.Picture.LoadFromFile(vsPath + '..\pas\images\ledoff.bmp');
      altState := false;
    end;
    
    shiftState := true;
    imgShift.Picture.LoadFromFile(vsPath + '..\pas\images\ledon.bmp');
  end;

end;


{M�todo respons�vel pela execu��o do espa�o.}
//============================================================================//
procedure TForm2.btnSpaceClick(Sender: TObject);
//============================================================================//
begin
  //Space Bar	32
  processSpecialKeys(32);
end;


{
  M�todo respons�vel para enviar a letra informada
  para o software em uso.
}
//============================================================================//
procedure TForm2.processLetter(letra: char);
//============================================================================//
var
  layoutKeyboard : HKL;
  Key            : integer;
begin
  
  //Trata o foco das janelas.
  trataJanelas;
  
  //Segura o Shift
  if shiftState = true then
    keybd_event(VK_SHIFT, 0, 0, 0);    


  layoutKeyboard := GetKeyboardLayout(0);

  Key := VkKeyScanEx(letra,layoutKeyboard);

  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);
  
  keybd_event(LoByte(Key), 0, 0, 0);
  keybd_event(LoByte(Key), 0, KEYEVENTF_KEYUP, 0);

    
  //Solta o shift
  if shiftState = true then begin
    keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);
    shiftState := false;
    imgShift.Picture.LoadFromFile(vsPath + '..\pas\images\ledoff.bmp');
  end;


end;

{M�todo respons�vel por processar os caracters especiais do teclado.}
//============================================================================//
procedure TForm2.processSpecialKeys(scanCode: Integer);
//============================================================================//
begin
  
  //Trata o foco das janelas.
  trataJanelas;
  
  //Caso seja um edit prepara o cursor
  keybd_event(39, 0, 0, 0);
  keybd_event(39, 0, KEYEVENTF_KEYUP, 0);
  
  //Processa o valor da tecla baseado no scanCode.
  keybd_event(scanCode, 0, 0, 0);
  keybd_event(scanCode, 0, KEYEVENTF_KEYUP, 0);

end;


{M�todo respons�vel por Ligar e Desligar o capslock do teclado virtual.}
//============================================================================//
procedure TForm2.SetCapsLock(State: boolean);
//============================================================================//
begin
  if (State and ((GetKeyState(VK_CAPITAL) and 1) = 0)) or
     ((not State) and ((GetKeyState(VK_CAPITAL) and 1) = 1)) then
  begin
    keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;


end.
