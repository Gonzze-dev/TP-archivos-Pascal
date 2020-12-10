Unit Graph_Graficos;

interface

procedure Mostrar_MSJ(Mensaje_1,Mensaje_2: String);
procedure Graficar_torta_de_tres_variables(X, Y, RadX, RadY, Cant_1,Cant_2,Cant_3, Total: word);

implementation
uses graph;

procedure Mostrar_MSJ(Mensaje_1,Mensaje_2: String);
begin

    SetLineStyle(Solidln, ThickWidth, ThickWidth);
    Rectangle(3*16, 16*11, 56*16,16*15);
    SetLineStyle(Solidln, 0, NormWidth);
    SetFillStyle(SolidFill, 15);
    Bar((3*16), 16*11, 56*16,16*15);
    SetFillStyle(SolidFill, 91);

    OutTextXY(4*16, 128+16*4, Mensaje_1);
    OutTextXY(4*16, 128+16*5, Mensaje_2);

end;

procedure Graficar_torta_de_tres_variables(X, Y, RadX, RadY, Cant_1,Cant_2,Cant_3, Total: word);
var
    Porsion1,Porsion2, Porsion3:word;
begin

    Porsion1:= Round(((360 / total)*Cant_1));
    Porsion2:= Round(((360 / total)*Cant_2));
    Porsion3:= Round(((360 / total)*Cant_3));

    SetFillStyle(SolidFill, 1);
    Sector(X, Y, 0 ,Porsion1, RadX, RadY);
    SetFillStyle(SolidFill, 2);
    Sector(X, Y, Porsion1, Porsion1+Porsion2, RadX, RadY);
    SetFillStyle(SolidFill, 4);
    Sector(X, Y, Porsion1+Porsion2, Porsion1+Porsion2+Porsion3, RadX, RadY);
    SetFillStyle(SolidFill, 91);

end;

end.