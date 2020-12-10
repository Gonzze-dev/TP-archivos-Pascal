unit FUNC_ARCH_REGITROS_PACIENTES_Y_ESTADISTICAS;

interface
uses ARCH_REG_Pacientes, ARCH_REG_Estadisticas, 
    FUNC_REG_Pacientes, FUNC_REG_Estadisticas;
    


procedure Abrir_ARCHIVO_pacientes_y_Estadisticas(VAR ARCH_Pacinetes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
procedure cargar_un_elemento_del_archivo_pacientes_y_un_elemento_del_archivo_estadisticas_en_una_posicion_especifica(VAR ARCH_Pacientes: ARCHIVO_Pacientes;VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; VAR R_Persona: REG_Persona; VAR R_Estadisticas : REG_Estadisticas; pos: LongInt);

procedure Cerrar_ARCHIVO_pacientes_y_Estadisticas(VAR ARCH_Pacinetes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);

procedure Sobre_escribir_un_elemento_en_archivo_pacientes_y_estadisticas(VAR ARCH_Pacientes: ARCHIVO_Pacientes;VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; R_Persona: REG_Persona; R_Estadisticas : REG_Estadisticas; pos: LongInt);
procedure Cargar_datos_de_Archivo_pacientes_a_Registro_Paciente_y_Estadisticas_y_Mostrar_datos_de_los_paciente_de_una_provincia(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; Paciente: REG_Persona; Estadisticas: REG_Estadisticas; Codigo_Provincia: Byte);
procedure Cargar_datos_de_Archivo_pacientes_a_Registro_Paciente_y_Estadisticas_y_Mostrar_datos_de_los_paciente_Activos(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; Paciente: REG_Persona; Estadisticas: REG_Estadisticas);


implementation
    uses wincrt, Graph_Graficos, graph, FUNC_Registros;

procedure Abrir_ARCHIVO_pacientes_y_Estadisticas(VAR ARCH_Pacinetes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
begin
    Abrir_archivo_pacientes_para_lectura_escritura(ARCH_Pacinetes);
    Abrir_archivo_estadisticas_para_lectura_escritura(ARCH_Estadisticas);
end;


procedure Cerrar_ARCHIVO_pacientes_y_Estadisticas(VAR ARCH_Pacinetes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
begin
    Close(ARCH_Pacinetes);
    Close(ARCH_Estadisticas);
end;

procedure Mostrar_datos_cargados_del_paciente(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; Var Paciente: REG_Persona; Estadisticas: REG_Estadisticas; Pos: LongWord);
begin

    cargar_un_elemento_del_archivo_pacientes_una_posicion_especifica(ARCH_Pacientes, Paciente, Pos);

    Mostrar_Datos_del_paciente(Paciente, Estadisticas);
    Mostrar_MSJ('Presione cualquier tecla para continuar', '');

end;

procedure Sobre_escribir_un_elemento_en_archivo_pacientes_y_estadisticas(VAR ARCH_Pacientes: ARCHIVO_Pacientes;VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;R_Persona: REG_Persona; R_Estadisticas : REG_Estadisticas; pos: LongInt);
begin
    Sobre_escribir_un_elemento_en_archivo_paciente(ARCH_Pacientes, R_Persona, pos);
    Sobre_escribir_un_elemento_en_archivo_Estadisticas(ARCH_Estadisticas, R_Estadisticas, pos);
end;

procedure cargar_un_elemento_del_archivo_pacientes_y_un_elemento_del_archivo_estadisticas_en_una_posicion_especifica(VAR ARCH_Pacientes: ARCHIVO_Pacientes;VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; VAR R_Persona: REG_Persona; VAR R_Estadisticas : REG_Estadisticas; pos: LongInt);
begin

    cargar_un_elemento_del_archivo_pacientes_una_posicion_especifica(ARCH_Pacientes, R_Persona, pos);
    cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(ARCH_Estadisticas, R_Estadisticas, pos);

end;

procedure Cargar_datos_de_Archivo_pacientes_a_Registro_Paciente_y_Estadisticas_y_Mostrar_datos_de_los_paciente_Activos(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; Paciente: REG_Persona; Estadisticas: REG_Estadisticas);
Var
    i: Integer;
begin

    if IoResult <> 0 then
    begin
        Mostrar_MSJ('Error al intentar cargar los datos', 'Presione una tecla para continuar');
        Readkey;
        Bar(3*15, 16*10, 57*16,16*16);
    end
    else
    begin
        Rectangle(3*16, 18*16, 63*16, 32*16);

        for i:= 0 to (FileSize(ARCH_Estadisticas)-1) do
        begin
            cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(ARCH_Estadisticas, Estadisticas, i);

            if (Estadisticas.Dado_de_baja = False) then
            begin
                SetFillStyle(SolidFill, 92);
                bar(3*16+1, 18*16+1, 63*16-1, 32*16-1);
                Mostrar_datos_cargados_del_paciente(ARCH_Pacientes, ARCH_Estadisticas, Paciente, Estadisticas, i);
                
                if Readkey = #27 then
                    Break
            end;  
                
        end;

        SetFillStyle(SolidFill, 91);
    end;

end;

procedure Cargar_datos_de_Archivo_pacientes_a_Registro_Paciente_y_Estadisticas_y_Mostrar_datos_de_los_paciente_de_una_provincia(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; Paciente: REG_Persona; Estadisticas: REG_Estadisticas; Codigo_Provincia: Byte);
Var
    i: Integer;
begin

    if IoResult <> 0 then
    begin
        Mostrar_MSJ('Error al intentar cargar los datos', 'Presione una tecla para continuar');
        Readkey;
        Bar(3*15, 16*10, 57*16,16*16);
    end
    else
    begin
        Rectangle(3*16, 18*16, 63*16, 32*16);
        
        for i:= 0 to (FileSize(ARCH_Estadisticas)-1) do
        begin
            cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(ARCH_Estadisticas, Estadisticas, i);

            if ((Codigo_Provincia = Estadisticas.Codigo_Provincia) AND (Estadisticas.Dado_de_baja = False)) then
            begin
                SetFillStyle(SolidFill, 92);
                bar(3*16+1, 18*16+1, 63*16-1, 32*16-1);
                Mostrar_datos_cargados_del_paciente(ARCH_Pacientes, ARCH_Estadisticas, Paciente, Estadisticas, i);
                
                if readkey = #27 then
                    Break
            end;

        end;

        SetFillStyle(SolidFill, 91);
    end;

end;

end.