unit FUNC_Menu_ABMC;

interface
uses FUNC_REG_Pacientes, FUNC_REG_Estadisticas, 
     FUNC_Registros, ARCH_REG_Pacientes, ARCH_REG_Estadisticas;

procedure Menu_ABMC(VAR ARCH_Personas: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;
                VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);
                
implementation
uses graph, wincrt, Graph_Graficos, FUNC_ARCH_REGITROS_PACIENTES_Y_ESTADISTICAS, 
    Funciones_Buscar, Funciones_Ordenar, FUNC_SUB_MENU_MODIFICAR;

procedure Alta(VAR ARCH_Personas: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;
                VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);
Var
    Existencia_de_DNI: Boolean;
    DNI_Str: string;
    opcion: Char;
begin
    repeat
        DNI_Str:= '';
        Inicializar_Registro_Persona(R_Persona);
        Inicializar_Registro_Estadisticas(R_Estadisticas);

        Abrir_archivo_pacientes_para_lectura_escritura(ARCH_Personas);
        
        IF ioresult = 0 THEN
        begin
            Close(ARCH_Personas);
            repeat
                Cargar_DNI(R_Persona.DNI);
                If R_Persona.DNI > 0 then
                begin
                    Abrir_archivo_pacientes_para_lectura_escritura(ARCH_Personas);
                    Existencia_de_DNI:= Verificar_Existencia_del_DNI(ARCH_Personas, R_Persona.DNI);
                    Close(ARCH_Personas);

                    Str(R_Persona.DNI, DNI_Str);

                    if Existencia_de_DNI = False then
                    begin
                        Pos_Datos_Ingresados(('DNI: ' + DNI_Str), 16, 3);
                        Cargar_Datos(R_Persona,R_Estadisticas);
                    end
                    else
                    begin
                        Bar(GetX, GetY, 29*16, 128+10*16);
                        Mostrar_MSJ(('Error, el DNI ' + DNI_Str + ' ya existe'),'Pulse una tecla para volver a igresar el DNI...');
                        Readkey;
                        Bar(3*15, 16*10, 57*16,16*16);
                    end;
                end;
            until((Existencia_de_DNI = False) OR (R_Persona.DNI = 0));
        end
        else
        begin
            Str(R_Persona.DNI, DNI_Str);
            Cargar_DNI(R_Persona.DNI);
            if R_Persona.DNI > 0 then
            begin
                Pos_Datos_Ingresados(('DNI: ' + DNI_Str), 16, 3);
                Cargar_Datos(R_Persona,R_Estadisticas);
            end;
        end;

        if ((R_Persona.DNI > 0) AND (Existencia_de_DNI = False)) then
        begin
            Mostrar_MSJ('Esta seguro de agregar a esta persona al sistema?', '[Y]/[N]');
            
            repeat

                opcion:= Upcase(readkey);

            until(opcion in ['Y', 'N']);

            if (opcion = 'Y') then
            begin
                Guarda_Registro_Persona(ARCH_Personas, R_Persona);
                Guarda_Registro_Estadisticas(ARCH_Estadisticas, R_Estadisticas);

                Mostrar_MSJ('El paciente persona fue agregada con exito', 'Presione una tecla para continuar');
                
            end
            else
            begin

                Mostrar_MSJ('El paciente no fue agregada al sistema', 'Presione una tecla para continuar');

            end;
            readkey;

            Mostrar_MSJ('Desea volver a ingresar otra persona al sistema?', '[Y]/[N]');
            
            repeat

                opcion:= Upcase(readkey);

            until(opcion in ['Y', 'N']);

            if opcion = 'Y' then
            begin
                Bar(3*15, 10*16, 57*16,16*16);
                SetFillStyle(SolidFill, 91);
                Bar(27*16, 2*16, 27*16+46*16, 10*16);
            end;
        end;
    until not ((opcion = 'Y'));
    
    cleardevice;
end;

procedure Consulta(VAR ARCH_Personas: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
var
    DNI: LongWord;
    DNI_STR: String;
    Pos: LongInt;
    R_Persona: REG_Persona;
    R_Estadisticas: REG_Estadisticas;
begin 
    DNI_STR:= '';
    Abrir_ARCHIVO_pacientes_y_Estadisticas(ARCH_Personas, ARCH_Estadisticas);

    if IoResult <> 0 then
    begin
        Mostrar_MSJ(('Error, archivo no encontrado'),  'Pulse una tecla para continuar');
        Readkey;
        Bar(3*15, 16*10, 57*16,16*16);
    end
    else
    begin
        Cargar_DNI(DNI);
        if DNI > 0 then
        begin
            Str(DNI, DNI_STR);
            BBIN_DNI(ARCH_Personas, DNI, Pos);
            
                if Pos > -1 then
                begin
                    cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(ARCH_Estadisticas, R_Estadisticas, Pos);
                    if R_Estadisticas.Dado_de_baja = False  then
                    begin
                        Rectangle(3*16, 18*16, 63*16, 32*16);

                        SetFillStyle(SolidFill, 92);
                        bar(3*16+1, 18*16+1, 63*16-1, 32*16-1);
                        SetFillStyle(SolidFill, 91);

                        cargar_un_elemento_del_archivo_pacientes_una_posicion_especifica(ARCH_Personas, R_Persona, Pos);
                        Mostrar_Datos_del_paciente(R_Persona, R_Estadisticas);
                        readkey;
                    end
                    else
                    begin
                        Mostrar_MSJ(('El usuario con DNI ' + DNI_STR + ' esta dado de baja'),  'Pulse una tecla para continuar');
                        Readkey;
                        Bar(3*15, 16*10, 57*16,16*16);
                    end;
                end
                else
                begin
                    Mostrar_MSJ(('No se encontro ningun paciente con el DNI ' + DNI_STR),  'Pulse una tecla para continuar');
                    Readkey;
                    Bar(3*15, 16*10, 57*16,16*16);
                end;

        end;
        Cerrar_ARCHIVO_pacientes_y_Estadisticas(ARCH_Personas, ARCH_Estadisticas);
    end;
    
end;

procedure Baja(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; VAR ARCH_Personas: ARCHIVO_Pacientes; VAR R_Estadisticas: REG_Estadisticas);
Var
    DNI: LongWord;
    DNI_STR: String;
    Pos: LongInt;
begin
    DNI:= 0;
    Abrir_archivo_estadisticas_para_lectura_escritura(ARCH_Estadisticas);

    if IoResult <> 0 then
    begin
        Mostrar_MSJ(('Error, archivo no encontrado'),  'Pulse una tecla para continuar');
        Readkey;
        Bar(3*15, 16*10, 57*16,16*16);
    end
    else
    begin
        Cargar_DNI(DNI);
        if DNI > 0 then
        begin
            Abrir_archivo_pacientes_para_lectura_escritura(ARCH_Personas);
            BBIN_DNI(ARCH_Personas, DNI, Pos);
            Close(ARCH_Personas);
            if Pos > -1 then
            begin
                cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(ARCH_Estadisticas, R_Estadisticas, Pos);
                Cargar_dado_de_baja(R_Estadisticas.Dado_de_baja);
                Sobre_escribir_un_elemento_en_archivo_Estadisticas(ARCH_Estadisticas, R_Estadisticas, Pos);
            end
            else
            begin
                Str(DNI, DNI_STR);
                Mostrar_MSJ(('No se encontro ningun paciente con el DNI ' + DNI_STR),  'Pulse una tecla para continuar');
                Readkey;
                Bar(3*15, 16*10, 57*16,16*16);
            end;
        end;
        Close(ARCH_Estadisticas);
    end;
end;

procedure Menu_ABMC(VAR ARCH_Personas: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;
                VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);
var
    opcion: Char;
begin
    Abrir_ARCHIVO_pacientes_y_Estadisticas(ARCH_Personas, ARCH_Estadisticas);
    if ioresult = 0 then
    begin
        insercion_de_menor_a_mayor_de_DNI_De_Archivos(ARCH_Personas, ARCH_Estadisticas);
        Cerrar_ARCHIVO_pacientes_y_Estadisticas(ARCH_Personas, ARCH_Estadisticas);
    end;

    cleardevice;

    Rectangle(3*16,16*2, 26*16,16*9);
    SetFillStyle(SolidFill, 92);
    Bar(3*16+1,2*16+1, 26*16-1,9*16-1);
    SetFillStyle(SolidFill, 91);
    
    OutTextXY(4*16, 16*3,'[1]-Alta');
    OutTextXY(4*16, 16*4,'[2]-Baja');
    OutTextXY(4*16, 16*5,'[3]-Modificacion');
    OutTextXY(4*16, 16*6,'[4]-Consulta');
    OutTextXY(4*16, 16*7,'[ESC]-Atras');
    
    repeat
        Opcion:= Upcase(readkey);
    until((Opcion in ['1'..'4']) OR (Opcion = #27));

    CASE Opcion OF
        '1':
            Alta(ARCH_Personas, ARCH_Estadisticas, R_Persona, R_Estadisticas);
        '2':
            Baja(ARCH_Estadisticas, ARCH_Personas, R_Estadisticas);
        '3':
            Modificar_Registro(ARCH_Personas, ARCH_Estadisticas, R_Persona, R_Estadisticas); 
        '4':
            Consulta(ARCH_Personas, ARCH_Estadisticas);   
    end;

end;

end.