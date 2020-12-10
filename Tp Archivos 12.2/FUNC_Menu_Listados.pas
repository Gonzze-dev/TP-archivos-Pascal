Unit FUNC_Menu_Listados;

interface
uses
    FUNC_REG_Pacientes, FUNC_REG_Estadisticas, ARCH_REG_Estadisticas, ARCH_REG_Pacientes;
    
procedure Menu_Listados(VAR ARCH_Personas: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;
                VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);
implementation
uses 
    wincrt, graph, Graph_Graficos,
    FUNC_ARCH_REGITROS_PACIENTES_Y_ESTADISTICAS, Funciones_Ordenar, FUNC_REG_Provincias;

procedure Listado_ordenado_alfabeticamente(VAR ARCH_Personas: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;
                VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);
begin
    Abrir_ARCHIVO_pacientes_y_Estadisticas(ARCH_Personas, ARCH_Estadisticas);
    
    if IoResult <> 0 then
    begin
        Mostrar_MSJ('Error, archivo no encontrado', 'Presione una tecla para volver al menu principal');
        Readkey;
        Bar(3*15, 16*10, 57*16,16*16);
    end
    else
    begin
        insercion_alfabetica_de_nombres_De_Archivos(ARCH_Personas, ARCH_Estadisticas);
        Cargar_datos_de_Archivo_pacientes_a_Registro_Paciente_y_Estadisticas_y_Mostrar_datos_de_los_paciente_Activos(ARCH_Personas, ARCH_Estadisticas, R_Persona, R_Estadisticas);
        Cerrar_ARCHIVO_pacientes_y_Estadisticas(ARCH_Personas, ARCH_Estadisticas);
    end;
end;

procedure Mostrar_Lista_ordenada_alfabeticamente_por_provincia(VAR ARCH_Personas: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;
                VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);
VAR
    Opcion: Char;
    Codigo_Provincia: Byte;
begin
    Abrir_ARCHIVO_pacientes_y_Estadisticas(ARCH_Personas, ARCH_Estadisticas);

    if IoResult <> 0 then
    begin
        Mostrar_MSJ('Error, archivo no encontrado', 'Presione una tecla para volver al menu principal');
        Readkey;
        Bar(3*15, 16*10, 57*16,16*16);
    end
    else
    begin
        Menu_provincias(Opcion);

        Bar((3*16), (15*16), 57*16,(34*16));
        
        Cargo_Codigo(Opcion, Codigo_Provincia);

        insercion_alfabetica_de_nombres_De_Archivos(ARCH_Personas, ARCH_Estadisticas);
        
        Cargar_datos_de_Archivo_pacientes_a_Registro_Paciente_y_Estadisticas_y_Mostrar_datos_de_los_paciente_de_una_provincia(ARCH_Personas, ARCH_Estadisticas, R_Persona, R_Estadisticas, Codigo_Provincia);
        
        Cerrar_ARCHIVO_pacientes_y_Estadisticas(ARCH_Personas, ARCH_Estadisticas);
    end;
end;

procedure Menu_Listados(VAR ARCH_Personas: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;
                            VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);
Var
    opcion: Char;

begin
    cleardevice;

    Rectangle(3*16,16*2, 43*16,16*7);
    SetFillStyle(SolidFill, 92);
    bar(3*16+1,16*2+1, 43*16-1,7*16-1);
    SetFillStyle(SolidFill, 91);

    OutTextXY(4*16, 16*3,'[1]-Listado de pacientes por provincia');
    OutTextXY(4*16, 16*4,'[2]-Listado de pacientes de Argentina');
    OutTextXY(4*16, 16*5,'[ESC]-Salir');
    
    

    repeat
        opcion:= upcase(readkey);
    until ((opcion in ['1','2']) OR (opcion = #27));

    CASE opcion OF
        '1':
            Mostrar_Lista_ordenada_alfabeticamente_por_provincia(ARCH_Personas, ARCH_Estadisticas, R_Persona, R_Estadisticas);
        '2':
            Listado_ordenado_alfabeticamente(ARCH_Personas, ARCH_Estadisticas, R_Persona, R_Estadisticas);
    end;
end;

end.