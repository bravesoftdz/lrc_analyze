unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls ,StrUtils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    op1: TOpenDialog;
    m1: TMemo;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}
      //ͨ����ת�ַ���ȡ��ĳ���ַ������ֵ�λ��
{function myLastPos(SubStr:String, S: String): Integer;
var
  i : Integer;
begin
  i := Pos(ReverseString(SubStr), ReverseString(S));
  if i > 0 then i := Length(S) - i - Length(SubStr) + 2;
  Result := i;
end;    }
procedure TForm1.Button1Click(Sender: TObject);
var  str: WideString;
FTextList  :TStrings;
i:integer;
k:integer;

timestr:String;
content:WideString;
lastIndex:integer;
timeNum:integer;
n:integer;

nextStr: WideString;
nextContent:WideString;
nextlastIndex:integer;
begin
FTextList:=TStringList.create;
if(op1.Execute) then
   begin
     FTextList.loadFromfile(op1.FileName);
     for i:=0 to FTextList.count -1 do
     begin
     str := FTextList[i];

     lastIndex:=LastDelimiter(']',str);
     //showmessage(inttostr(lastIndex));
     //���洦��time��ǩ
     timeNum:=lastIndex div 10;
     //showmessage(inttostr(timeNum));
            content :=copy(str,lastIndex+1,length(str)-lastIndex) ;

      if(i<FTextList.count -1)then begin  nextStr:=   FTextList[i+1];nextlastIndex:=LastDelimiter(']',nextStr);nextContent :=copy(nextStr,nextlastIndex+1,length(nextStr)-nextlastIndex) ; showmessage(nextContent);  end;
     //m1.Lines.Add(content);
         if timeNum=0 then   m1.Lines.Add(str) //����
         else
             if (POS('ti',str)>0) or (POS('ar',str)>0)  or (POS('al',str)>0)  or (POS('by',str)>0)  then  m1.Lines.Add(str) else //ȥ��ͷ��Ϣ
             if(timeNum=1) and (length(trim(str))=10) then begin showmessage(nextContent);  m1.Lines.Add(str+nextContent) ;end else    //�ϲ�������ʱ���ǩ
         for n:=0 to timeNum-1 do
         begin
           timestr:=copy(str,n*10+1,10) ;
           m1.Lines.Add(timestr+content);
         end;


      end;
    end;
end;









end.
