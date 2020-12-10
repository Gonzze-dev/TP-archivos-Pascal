Unit GraphCrt;

interface
type
    Conjutno_de_caracteres = set of char;

procedure ReadLnInGraph(Var texto_formado: String; Max_Escritura: Integer; Conjunto: Conjutno_de_caracteres);

implementation
    uses graph, wincrt;

procedure ReadLnInGraph(Var texto_formado: String; Max_Escritura: Integer; Conjunto: Conjutno_de_caracteres);
Var
    Pos, Color_letra, Color_Bakground: Word;
    Tecla: char;
    Texto: String;
begin
    Pos:= 0;
    Texto:= '';
    Color_letra:= GetColor;
    Color_Bakground:= GetBkColor();
    
    Repeat
        Tecla:= readkey;
        if Tecla in Conjunto then
        begin

            if Tecla = #27 then
            Begin
                Texto:= #27;
            end
            else
            begin
                If Length(Texto) < Max_Escritura then
                begin
                    SetColor(Color_letra);
                    Pos := Length(Texto)*8*2;
                    Texto += Tecla;
                    OutTextXY(GetX+Pos, GetY, Tecla);
                end;
            end;
        end
        else
        begin
            if Tecla = #8 then
            begin
                if Length(Texto) > 0 then
                begin
                    SetColor(Color_Bakground);
                    OutTextXY(GetX+Pos,GetY,Texto[Length(Texto)]);
                    Delete(Texto, Length(Texto),1);
                    Dec(Pos, (8*2));
                end;
            end;
        end;
    Until ((Tecla = #13) OR (Texto = #27));
    SetColor(250);
    
    texto_formado:= Texto;
end;

end.