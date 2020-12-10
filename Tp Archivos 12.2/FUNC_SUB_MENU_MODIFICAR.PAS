unit FUNC_SUB_MENU_MODIFICAR;

interface
uses FUNC_REG_Pacientes, FUNC_REG_Estadisticas, 
    ARCH_REG_Pacientes, ARCH_REG_Estadisticas;

procedure Modificar_Registro(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);
implementation
uses
    FUNC_Registros, FUNC_ARCH_REGITROS_PACIENTES_Y_ESTADISTICAS, Funciones_Buscar, 
    FUNC_REG_Provincias, graph, wincrt, Graph_Graficos;

procedure Cargar_DNI_Modificar(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR R_Persona: REG_Persona);
var
    DNI_ANTERIOR: LongWord;
    DNI_SRT: string;
    Existencia_de_DNI: Boolean;
begin
    DNI_ANTERIOR:= R_Persona.DNI;
    Existencia_de_DNI:= False;

    repeat
        Cargar_DNI(R_Persona.DNI);

        if R_Persona.DNI > 0 then
        begin
            Abrir_archivo_pacientes_para_lectura_escritura(ARCH_Pacientes);
            Existencia_de_DNI:= Verificar_Existencia_del_DNI(ARCH_Pacientes, R_Persona.DNI);
            Close(ARCH_Pacientes);

            if (Existencia_de_DNI = False) OR (R_Persona.DNI = DNI_ANTERIOR) then
            begin

            end
            else
            begin
                Str(R_Persona.DNI, DNI_SRT);
                Mostrar_MSJ('Error, el DNI ' + DNI_SRT + ' ya existe','Pulse una tecla para volver a igresar el DNI...');
                Readkey;
                Bar(2*16, 10*16, 57*16,18*16);
            end;
        end;
    until((Existencia_de_DNI = False) OR (R_Persona.DNI = DNI_ANTERIOR));
end;

procedure Elijo_campo(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; 
                        VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas; opcion: Char; pos: LongInt);
begin

    CASE opcion Of
        'A', 'C'..'G', 'I'..'K':
        begin
            CASE opcion OF
                'A':
                begin
                    Cargar_Apellido_y_Nombre(R_Persona.Apellido_y_Nombre);
                end;
                'C':
                begin
                    Cargar_Calle(R_Persona.Domicilio.Calle);
                end;
                'D':
                begin
                    Cargar_numero_de_calle(R_Persona.Domicilio.Numero);
                end;
                'E':
                begin
                    Cargar_el_Piso(R_Persona.Domicilio.Piso);
                end;
                'F':
                begin
                    Cargar_Ciudad(R_Persona.Domicilio.Ciudad);
                end;
                'G':
                begin
                    Cargar_Codigo_postal(R_Persona.Domicilio.Codigo_Postal);
                end;
                'I':
                begin
                    Cargar_Numero_de_telefono(R_Persona.Domicilio.Telefono_de_contacto);
                end;
                'J':
                begin
                    Cargar_Email(R_Persona.Email);
                end;
                'K':
                begin
                    Cargar_fecha_de_nacimiento(R_Persona.Fecha_de_nacimiento.dia, R_Persona.Fecha_de_nacimiento.mes, R_Persona.Fecha_de_nacimiento.ano);
                end;
            end;
        end;
        'B', 'H','L'..'N':
        begin
            CASE opcion OF
                'B':
                begin
                    Cargar_DNI_Modificar(ARCH_Pacientes, R_Persona);
                    R_Estadisticas.DNI:= R_Persona.DNI;
                end;
                'H':
                begin
                    Cargar_Registro_Provincia_y_le_paso_el_nombre_al_registro_persona(R_Estadisticas.Codigo_Provincia);
                    R_Persona.Domicilio.Codigo_Provincia:= R_Estadisticas.Codigo_Provincia;
                end;
                'L':
                begin
                    Cargo_estado_del_paciente(R_Estadisticas.Estado);
                end;
                'M':
                begin
                    Cargo_Forma_de_contagio(R_Estadisticas.Forma_de_contagio);
                end;
                'N':
                begin
                    Cargar_DNI_Modificar(ARCH_Pacientes, R_Persona);
                    Cargar_Datos(R_Persona, R_Estadisticas);
                end;         
            end;
            
        end;
        
    end;

    if R_Persona.DNI  > 0 then
    begin
        Bar((3*16), (15*16), 68*16,(34*16));

        Rectangle(3*16, 18*16, 63*16, 32*16);

        SetFillStyle(SolidFill, 92);
        bar(3*16+1, 18*16+1, 63*16-1, 32*16-1);
        SetFillStyle(SolidFill, 91);

        Mostrar_Datos_del_paciente(R_Persona, R_Estadisticas);
    end;
end;

procedure Elijo_campo_a_modificar(Var Opcion: Char);
begin

    Rectangle(3*16, (16*16), (57*16),16*34);
    SetFillStyle(SolidFill, 92);
    bar((3*16)+1, (16*16)+1, 57*16-1,16*34-1);
    SetFillStyle(SolidFill, 91);
        
    OutTextXY(4*16, 17*16,'[A]-Apellido y nombre');
    OutTextXY(4*16, 18*16,'[B]-DNI');
    OutTextXY(4*16, 19*16,'[C]-Nombre de la Calle');
    OutTextXY(4*16, 20*16,'[D]-Numero de Calle');
    OutTextXY(4*16, 21*16,'[E]-Piso');
    OutTextXY(4*16, 22*16,'[F]-Ciudad');
    OutTextXY(4*16, 23*16,'[G]-Codigo Postal');
    OutTextXY(4*16, 24*16,'[H]-Provincia');
    OutTextXY(4*16, 25*16,'[I]-Numero de telefono');
    OutTextXY(4*16, 26*16,'[J]-Email');
    OutTextXY(4*16, 27*16,'[K]-Fecha de Nacimiento');
    OutTextXY(4*16, 28*16,'[L]-Estado del Paciente');
    OutTextXY(4*16, 29*16,'[M]-Forma de Contagio');
    OutTextXY(4*16, 31*16,'[N]-Re-Cargar Paciente');
    OutTextXY(4*16, 32*16,'[ESC]-Volver al Menu General');

    repeat
        Opcion:= readkey;
    until((Opcion in ['A'..'N', 'a'..'n']) OR (Opcion = #27));

    Bar((57*16), (16*16), 3*16,16*34);

    if Opcion in ['a'..'n'] then
        Opcion:= upcase(Opcion);

end;

procedure Modificar_Registro(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);
var
    pos: LongInt;
    Opcion, op: Char;
    DNI_SRT:  String;
begin
    Abrir_ARCHIVO_pacientes_y_Estadisticas(ARCH_Pacientes, ARCH_Estadisticas);

    if IoResult <> 0 then
    begin
        Mostrar_MSJ('Error, archivo no encontrado', 'Presione una tecla para volver al menu principal');
        Readkey;
        Bar(3*15, 16*10, 57*16,16*16);
    end
    else
    begin
        Inicializar_Registro_Persona(R_Persona);
        Inicializar_Registro_Estadisticas(R_Estadisticas);

        Cargar_DNI(R_Persona.DNI);
        if R_Persona.DNI > 0 then
        begin
            
            BBIN_DNI(ARCH_Pacientes, R_Persona.DNI, pos);
            Str(R_Persona.DNI, DNI_SRT);
            
            if pos > -1 then
            begin
                Bar((57*16), (152+16*23), 3*16,256);
                cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(ARCH_Estadisticas, R_Estadisticas, pos);

                if R_Estadisticas.Dado_de_baja = False then
                begin
                    cargar_un_elemento_del_archivo_pacientes_una_posicion_especifica(ARCH_Pacientes, R_Persona, pos);
                    Cerrar_ARCHIVO_pacientes_y_Estadisticas(ARCH_Pacientes, ARCH_Estadisticas);
                    
                    Elijo_campo_a_modificar(Opcion);

                    if Opcion in ['A'..'N'] then
                    begin
                        Elijo_campo(ARCH_Pacientes, ARCH_Estadisticas, R_Persona, R_Estadisticas, opcion, pos);
                            if R_Persona.DNI  > 0 then
                            begin
                                Mostrar_MSJ('Esta seguro que desea realizar la modificacion?', '[Y] / [N]');
                            
                                repeat
                        
                                    op:= Upcase(readkey);

                                until(op in ['Y','N']);

                                Bar(3*15, 16*10, 57*16,16*16);

                                if (op = 'Y') then
                                begin
                                    if (opcion in ['A', 'C'..'G', 'I'..'K']) then
                                    begin
                                        Abrir_archivo_pacientes_para_lectura_escritura(ARCH_Pacientes);
                                        Sobre_escribir_un_elemento_en_archivo_paciente(ARCH_Pacientes, R_Persona, pos);
                                        Close(ARCH_Pacientes);
                                    end
                                    else
                                    begin
                                        if (opcion in ['B', 'H','L'..'N']) then
                                        begin
                                            Abrir_ARCHIVO_pacientes_y_Estadisticas(ARCH_Pacientes, ARCH_Estadisticas);
                                            Sobre_escribir_un_elemento_en_archivo_pacientes_y_estadisticas(ARCH_Pacientes, ARCH_Estadisticas, R_Persona, R_Estadisticas, pos);
                                            Cerrar_ARCHIVO_pacientes_y_Estadisticas(ARCH_Pacientes, ARCH_Estadisticas);
                                        end;
                                    end;
                                    Mostrar_MSJ('El registro se sobre escribio con exito.', 'Presione  una tecla para continuar...');    
                                    Readkey;
                                    Bar(3*15, 16*10, 57*16,16*16);
                                end;
                            end;
                    end;
                end
                else
                begin
                    Cerrar_ARCHIVO_pacientes_y_Estadisticas(ARCH_Pacientes, ARCH_Estadisticas);
                    Mostrar_MSJ('El usuario con DNI '+ DNI_SRT + ' esta dado de baja', 'Presione una tecla para continuar');
                    Readkey;
                    Bar(3*15, 16*10, 57*16,16*16);
                end;
            end
            else
            begin
                Cerrar_ARCHIVO_pacientes_y_Estadisticas(ARCH_Pacientes, ARCH_Estadisticas);
                Mostrar_MSJ('No se encontro ningun paciente con el DNI ' + DNI_SRT, 'Presione una tecla para continuar');
                Readkey;
                Bar(3*15, 16*10, 57*16,16*16);
            end;
        end
        else
            Cerrar_ARCHIVO_pacientes_y_Estadisticas(ARCH_Pacientes, ARCH_Estadisticas)

    end;

end;

end.