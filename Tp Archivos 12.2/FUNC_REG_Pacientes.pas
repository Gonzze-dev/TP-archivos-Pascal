unit FUNC_REG_Pacientes;

interface

type
    REG_Fecha_de_nacimiento = record
            dia, mes: Byte;
            ano: Word;
        end;

    REG_domiciolio = record
            Calle: String[30];
            Numero: Word;
            Piso: String[5];
            Ciudad: String[32];
            Codigo_Provincia: Byte;
            Codigo_Postal: Word;
            Telefono_de_contacto: LongWord;
        end;

    REG_Persona = record
            Apellido_y_Nombre: String[49];
            DNI: LongWord;
            Domicilio: REG_domiciolio;
            Email: String;
            Fecha_de_nacimiento: REG_Fecha_de_nacimiento;
        end;

procedure Inicializar_Registro_Persona (VAR REG: REG_Persona);

procedure Cargar_Apellido_y_Nombre(VAR Apellido_y_Nombre: String);
procedure Cargar_DNI(var DNI: LongWord);
procedure Cargar_Calle(var Calle: string);
procedure Cargar_numero_de_calle(var Numero_de_calle: Word);
procedure Cargar_el_Piso(VAR Piso: String);
procedure Cargar_Ciudad(var ciudad: String);
procedure Cargar_Codigo_postal(var Codigo_Postal: Word);
procedure Cargar_Numero_de_telefono(var Numero_de_telefono: LongWord);
procedure Cargar_Email(var Email: String);
procedure Cargar_fecha_de_nacimiento(Var dia, mes: Byte; var ano: Word);


implementation
uses graph, GraphCrt, wincrt, Graph_Graficos;

procedure Inicializar_Registro_Persona (VAR REG: REG_Persona);
begin

    REG.Apellido_y_Nombre:= '';
    REG.DNI:= 0;
    REG.Domicilio.Calle:= '';
    REG.Domicilio.Numero:= 0;
    REG.Domicilio.Piso:= '';
    REG.Domicilio.Codigo_Provincia:= 0;
    REG.Domicilio.Codigo_Postal:= 0;
    REG.Domicilio.Telefono_de_contacto:= 0;
    REG.Email:= '';
    REG.Fecha_de_nacimiento.dia:= 0;
    REG.Fecha_de_nacimiento.mes:= 0;
    REG.Fecha_de_nacimiento.ano:= 0;

end;

function mostrar_fecha_valida(diaa, mess: Byte; anno: word): Boolean;
begin
    if (anno >= 1898) AND (anno <= 2020)then
    begin
        CASE mess OF
            1, 3, 5, 7, 8, 10, 12:
            begin
                if ((diaa >= 1) AND (diaa <= 31)) then
                begin
                    mostrar_fecha_valida:= True;
                end
                else
                begin
                    mostrar_fecha_valida:= False;
                end;
            end;

            4, 6, 9, 11:
            begin
                if ((diaa >= 1) AND (diaa <= 30)) then
                begin
                    mostrar_fecha_valida:= True;
                end
                else
                begin
                    mostrar_fecha_valida:= False;
                end;
            end;

            2:
            begin
                if ((diaa >= 1) AND (diaa <= 29)) then
                begin
                    mostrar_fecha_valida:= True;
                end
                else
                begin
                    mostrar_fecha_valida:= False;
                end;
            end;
            else
            begin
                mostrar_fecha_valida:= False;
            end;

        end;
    end;


end;



procedure Cargar_Apellido_y_Nombre(VAR Apellido_y_Nombre: String);
begin
    repeat
        MoveTo(4*16, 18*16);
        OutText('Ingrese el apellido y el nombre: ');
        ReadLnInGraph(Apellido_y_Nombre, 30, ['A'..'Z', 'a'..'z', #32]);
        if Apellido_y_Nombre = '' then
        begin
            Mostrar_MSJ('El campo no puede estar vacio.', 'Presione una tecla para volver a ingresarlo...');
            Readkey;
            Bar(3*15, 16*10, 57*16,16*16);
        end;
     until not (Apellido_y_Nombre = '');
end;


procedure Cargar_DNI(var DNI: LongWord);
var
    DNI_Str: String[10];
begin

    repeat
        DNI:= 0;
        DNI_Str:= '';

        MoveTo(4*16, 17*16);
        OutText('Ingrerse el DNI: ');
        ReadLnInGraph(DNI_Str, 8, ['0'..'9', #27]);

        If DNI_Str <> #27 then
        begin
            Val(DNI_Str, DNI);

            if DNI = 0 then
            begin
                Mostrar_MSJ('El campo no puede estar vacio.', 'Presione una tecla para volver a ingresarlo...');
                Readkey;
                Bar(2*16, 10*16, 57*16,16*16);
                SetFillStyle(SolidFill, 91);
                Bar(GetX, GetY, 29*16, 128+10*16);
            end;
        end;
    
        
    until((DNI > 0) OR (DNI_Str = #27));

end;

procedure Cargar_Calle(var Calle: string);
begin
    repeat
        MoveTo(4*16, 19*16);
        OutText('Nombre de la Calle: ');
        ReadLnInGraph(Calle, 30,['A'..'Z','a'..'z', #32]);
    
        if Calle = '' then
        begin
            Mostrar_MSJ('El campo no puede estar vacio.', 'Presione una tecla para volver a ingresarlo...');
            Readkey;
            Bar(2*16, 10*16, 57*16,16*16);
        end;
    until not (Calle = '');

end;

procedure Cargar_numero_de_calle(var Numero_de_calle: Word);
var
    Numero_de_calle_Str: String[10];
begin
    repeat
        MoveTo(4*16, 20*16);
        OutText('Ingrese el Numero de la calle: ');
        ReadLnInGraph(Numero_de_calle_Str, 10, ['0'..'9']);
        Val(Numero_de_calle_Str, Numero_de_calle);

        if Numero_de_calle = 0 then
        begin
            Mostrar_MSJ('El campo no puede estar vacio.', 'Presione una tecla para volver a ingresarlo...');
            Readkey;
            Bar(2*16, 10*16, 57*16,16*16);
            Bar(35*16, 20*16, 45*16, 21*16);
        end;

    until not (Numero_de_calle = 0);

end;

procedure Cargar_el_Piso(VAR Piso: String);
begin

    MoveTo(4*16, 21*16);
    OutText('Ingrese el Numero del Piso: ');
    ReadLnInGraph(Piso, 10, ['A'..'Z', 'a'..'z','0'..'9', #32]);

end;

procedure Cargar_Ciudad(var ciudad: String);
begin

    repeat
        MoveTo(4*16, 22*16);
        OutText('Ingrese el nombre de su ciudad: ');
        ReadLnInGraph(ciudad, 32, ['A'..'Z','a'..'z', #32]);

        if ciudad = '' then
        begin
            Mostrar_MSJ('El campo no puede estar vacio.', 'Presione una tecla para volver a ingresarlo...');
            Readkey;
            Bar(2*16, 10*16, 57*16,16*16);
        end;

    until not (ciudad = '');
end;

procedure Cargar_Codigo_postal(var Codigo_Postal: Word);
var
    Codigo_Postal_Str: String[4];
begin
    repeat
        MoveTo(4*16, 23*16);
        OutText('Ingrese el codigo postal: ');
        ReadLnInGraph(Codigo_Postal_Str, 4,['0'..'9']);
        Val(Codigo_Postal_Str, Codigo_Postal);

        if Codigo_Postal = 0 then
        begin
            Mostrar_MSJ('El campo no puede estar vacio.', 'Presione una tecla para volver a ingresarlo...');
            Readkey;
            Bar(2*16, 10*16, 57*16,16*16);
            Bar(30*16, 23*16, 34*16, 24*16);
        end;

    until not (Codigo_Postal = 0);
end;

procedure Cargar_Numero_de_telefono(var Numero_de_telefono: LongWord);
var
    Numero_de_telefono_Str: String;
begin
    Numero_de_telefono_Str:= '0';
    MoveTo(4*16, 24*16);
    OutText('Ingrese el numero de telefono: ');
    ReadLnInGraph(Numero_de_telefono_Str, 10,['0'..'9']);
    Val(Numero_de_telefono_Str, Numero_de_telefono);
end;

procedure Cargar_Email(var Email: String);
begin
    MoveTo(4*16, 25*16);
    OutText('Ingrese su email: ');
    ReadLnInGraph(Email, 30, ['A'..'Z','a'..'z','0'..'9','.','@']);
end;

procedure Cargar_fecha_de_nacimiento(Var dia, mes: Byte; var ano: Word);
var
    Numero_Str: String;
    Y_dia, Y_mes, Y_ano: Integer;
begin

    repeat
        repeat
            MoveTo(4*16, 17*16);
            OutText('Ingrese el dia en que nacio: ');
            Y_dia:= GetY;
            ReadLnInGraph(Numero_Str, 2, ['0'..'9']);
            Val(Numero_Str, dia);

            if dia = 0 then
            begin
                Mostrar_MSJ('El campo no puede estar vacio.', 'Presione una tecla para volver a ingresarlo...');
                Readkey;
                Bar(2*16, 10*16, 57*16,16*16);
                Bar(33*16, 17*16, 35*16, 18*16);
            end;
        until not (dia = 0);
        
        repeat
            MoveTo(4*16, 18*16);
            OutText('Ingrese el mes en que nacio: ');
            Y_mes:= GetY;
            ReadLnInGraph(Numero_Str, 2, ['0'..'9']);
            Val(Numero_Str, mes);

            if mes = 0 then
            begin
                Mostrar_MSJ('El campo no puede estar vacio.', 'Presione una tecla para volver a ingresarlo...');
                Readkey;
                Bar(3*15, 16*10, 57*16,16*16);
                Bar(33*16, 18*16, 35*16, 19*16);
            end;

        until not (mes = 0);
        
        repeat
            MoveTo(4*16, 19*16);
            OutText('Ingrese el ano en que nacio: ');
            Y_ano:= GetY;
            ReadLnInGraph(Numero_Str, 4, ['0'..'9']);
            Val(Numero_Str, ano);

            if ano = 0 then
            begin
                Mostrar_MSJ('El campo no puede estar vacio.', 'Presione una tecla para volver a ingresarlo...');
                Readkey;
                Bar(3*15, 16*10, 57*16,16*16);
                Bar(33*16, 19*16, 38*16, 20*16);
            end;

        until not (ano = 0);

        if mostrar_fecha_valida(dia, mes, ano) = False then
        begin
            Bar(GetX, Y_dia, 46*16, 128 + (Y_dia+1)*16);
            Bar(GetX, Y_mes, 46*16, 128 + (Y_mes+1)*16);
            Bar(GetX, Y_ano, 46*16, 128 + (Y_ano+1)*16);
            
            Mostrar_MSJ('Error, ingrese una fecha valida.', 'Presione una telca para continuar...');
            Readkey;
            Bar(3*15, 16*10, 57*16,16*16);
        end;

    until(mostrar_fecha_valida(dia, mes, ano));

end;

end.