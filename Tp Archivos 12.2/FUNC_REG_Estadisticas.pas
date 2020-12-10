unit FUNC_REG_Estadisticas;

interface

type
    REG_Estadisticas = record
        ID: LongWord;
        DNI: LongWord;
        Codigo_Provincia: Byte;
        Estado: String[10];
        Dado_de_baja: Boolean;
        Forma_de_contagio: String[25];
    end;

procedure Inicializar_Registro_Estadisticas (VAR REG: REG_Estadisticas);
procedure Cargar_Registro_Estadisticas (VAR R_Estadisticas: REG_Estadisticas; DNI: LongWord);

procedure Cargo_estado_del_paciente(VAR Estado_paciente: String);
procedure Cargo_Forma_de_contagio(VAR Forma_de_contagio_del_paciente: String);
procedure Cargar_dado_de_baja(VAR Estado_Baja: Boolean);

implementation
uses graph, wincrt, Graph_Graficos;

procedure Inicializar_Registro_Estadisticas (VAR REG: REG_Estadisticas);
begin

    REG.ID:= 0;
    REG.DNI:= 0;
    REG.Codigo_Provincia:= 0;
    REG.Estado:= '';
    REG.Dado_de_baja:= False;
    REG.Forma_de_contagio:= '';

end;

function Devuelvo_la_Forma_de_contagio(Opcion: Char) : String;
begin
    CASE Opcion OF
        '1':
            Devuelvo_la_Forma_de_contagio:= 'Contagio directo';
        '2':
            Devuelvo_la_Forma_de_contagio:= 'Transmision comunitaria';
        '3':
            Devuelvo_la_Forma_de_contagio:= 'Desconocida';
    end;
end;

function Devuelvo_el_Estado_del_Paciente(Opcion: Char) : String;
begin
    CASE Opcion OF
        '1':
            Devuelvo_el_Estado_del_Paciente:= 'ACTIVO';
        '2':
            Devuelvo_el_Estado_del_Paciente:= 'RECUPERADO';
        '3':
            Devuelvo_el_Estado_del_Paciente:= 'FALLECIDO';
    end;
end;

procedure Cargo_estado_del_paciente(VAR Estado_paciente: String);
var
    Opcion: Char;
begin

    Rectangle((3*16), (17*16), 26*16,22*16);
    SetFillStyle(SolidFill, 92);
    bar((3*16)+1, (17*16)+1, 26*16-1,22*16-1);
    SetFillStyle(SolidFill, 91);

    OutTextXY(5*16, 15*16, 'Estado del paciente');
    OutTextXY(4*16, 18*16, '[1]-ACTIVO');
    OutTextXY(4*16, 19*16, '[2]-RECUPERADO');
    OutTextXY(4*16, 20*16, '[3]-FALLECIDO');

    repeat
        Opcion:= Upcase(readkey);
    until(Opcion in ['1', '2','3']);

    Estado_paciente:= Devuelvo_el_Estado_del_Paciente(Opcion);
end;

procedure Cargo_Forma_de_contagio(VAR Forma_de_contagio_del_paciente: String);
var
    Opcion: Char;
begin

    Rectangle((3*16), (17*16), 32*16,22*16);
    SetFillStyle(SolidFill, 92);
    bar((3*16)+1, (17*16)+1, 32*16-1,22*16-1);
    SetFillStyle(SolidFill, 91);

    OutTextXY(9*16, 15*16, 'Forma de contagio');
    OutTextXY(4*16, 18*16, '[1]-Contagio directo');
    OutTextXY(4*16, 19*16, '[2]-Transmision comunitaria');
    OutTextXY(4*16, 20*16, '[3]-Desconocida');

    repeat
        Opcion:= Upcase(readkey);
    until(Opcion in ['1', '2','3']);

    Forma_de_contagio_del_paciente:= Devuelvo_la_Forma_de_contagio(Opcion);
end;

procedure Cargar_dado_de_baja(VAR Estado_Baja: Boolean);
Var
    opcion: char;
begin

    if Estado_Baja = False then
    begin
        Estado_Baja:= True;
        Mostrar_MSJ('El usuairo fue dado de baja con exito!', 'Presione una tecla para continuar...');
        readkey;
    end
    else
    begin
        Mostrar_MSJ('El usuario ya eesta dado de baja', 'Desea darlo de alta? [Y] / [N]');

        repeat
            opcion:= upcase(readkey);
        until(opcion in ['Y', 'N']);

        if opcion = 'Y' then
        begin
            Estado_Baja:= False;
            Mostrar_MSJ('El usuairo fue dado de alta con exito!', 'Presione una tecla para continuar...');
            readkey;
        end;

        Bar((57*16), (152+16*23), 3*16,256);
    end;

end;

procedure Cargar_Registro_Estadisticas (VAR R_Estadisticas: REG_Estadisticas; DNI: LongWord);
begin
    R_Estadisticas.DNI:= DNI;
    R_Estadisticas.Dado_de_baja:= False;

    Cargo_estado_del_paciente(R_Estadisticas.Estado);

    Bar((32*16), (128+16*7), 3*16,128+16*16);
    
    Cargo_Forma_de_contagio(R_Estadisticas.Forma_de_contagio);

    Bar((32*16), (128+16*7), 3*16,128+16*16);
end;

END.