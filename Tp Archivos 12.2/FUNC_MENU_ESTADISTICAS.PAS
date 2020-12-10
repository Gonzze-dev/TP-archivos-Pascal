UNIT FUNC_MENU_ESTADISTICAS;

interface
uses
    ARCH_REG_Estadisticas, ARCH_REG_Pacientes;


procedure Menu_Estadisticas(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; VAR ARCH_Pacientes: ARCHIVO_Pacientes);

implementation

uses wincrt, graph, Graph_Graficos, FUNC_REG_Estadisticas,FUNC_REG_Provincias, FUNC_ARCH_REGITROS_PACIENTES_Y_ESTADISTICAS,
    FUNC_REG_Pacientes;

function Verificar_que_pacientes_pertenece_a_la_elegida_provincia(Codigo_Provincia_del_paciente, Codigo_Provincia_Elegido: Byte; Estado_Baja: Boolean): Boolean;
begin

    if ((Codigo_Provincia_Elegido = Codigo_Provincia_del_paciente) AND (Estado_Baja = False)) then
    begin
        Verificar_que_pacientes_pertenece_a_la_elegida_provincia:= True;
    end
    else
    begin
        Verificar_que_pacientes_pertenece_a_la_elegida_provincia:= False;
    end;

end;

procedure Contar_Paciente_segun_su_estado(Estado: String; VAR cant_activos: LongWord; VAR cant_Recuperados: LongWord; VAR cant_fallecidos: LongWord);
begin

    if Estado = 'ACTIVO' then
        inc(cant_activos)
    else
        if Estado = 'RECUPERADO' then
            inc(cant_Recuperados)
        else
            if Estado = 'FALLECIDO' then
                inc(cant_fallecidos)

end;

function porcentaje(pors_a_sacar, cant_de_personas: integer):Real;
begin

    porcentaje:= (pors_a_sacar*100) / cant_de_personas;

end;

procedure Mostrar_la_cantidad_de_fallecidos(cant_activos, cant_Recuperados, cant_fallecidos, total: LongWord; Nombre_Provincia: String);
Var
    cant_activos_Str, cant_Recuperados_Str, cant_fallecidos_Str,
    Pors_cant_activos_Str, Pors_cant_Recuperados_Str, Pors_cant_fallecidos_Str, Titulo: String;
begin
    Str(cant_activos, cant_activos_Str);
    Str(cant_Recuperados, cant_Recuperados_Str);
    Str(cant_fallecidos, cant_fallecidos_Str);

    Str(porcentaje(cant_activos, total):0:2, Pors_cant_activos_Str);
    Str(porcentaje(cant_Recuperados, total):0:2, Pors_cant_Recuperados_Str);
    Str(porcentaje(cant_fallecidos, total):0:2, Pors_cant_fallecidos_Str);

    
    Titulo:= 'CANTIDAD DE ACTIVOS RECUPERADOS Y FALLECIDOS EN ' + Nombre_Provincia;
    SetTextStyle(SansSerifFont, 0, 1);
    OutTextXY(Abs((46*16 div 2)-Length(Titulo)*9), 12*13, ((Titulo)));
    SetTextStyle(SansSerifFont, 0, 2);

    Rectangle(8,11*16,46*16,31*16);
    
    SetFillStyle(SolidFill, 92);
    Bar(9,11*16+1,46*16-1,31*16-1);
    SetFillStyle(SolidFill, 91);

    OutTextXY(16, 12*16, ('Cantidad de ACTIVOS:  ' + cant_activos_Str));
    OutTextXY(16, 13*16, ('Cantidad de RECUPERADOS:  ' + cant_Recuperados_Str));
    OutTextXY(16, 14*16, ('Cantidad de FALLECIDOS: ' + cant_fallecidos_Str));

    OutTextXY(16, 15*16, ('porcentaje de ACTIVOS:  ' + Pors_cant_activos_Str + '%'));
    OutTextXY(16, 16*16, ('porcentaje de RECUPERADOS: ' + Pors_cant_Recuperados_Str + '%'));
    OutTextXY(16, 17*16, ('porcentaje de FALLECIDOS: ' + Pors_cant_fallecidos_Str + '%'));

    MoveTo(16, 17*18);
    OutText('ACTIVOS');
    SetFillStyle(SolidFill, 1);
    Bar(GetX + 16*2, GetY, GetX + 16*3, GetY+16);
    MoveTo(16*16, 17*18);
    OutText('RECUPERADOS');
    SetFillStyle(SolidFill, 2);
    Bar(GetX + 16*2, GetY, GetX + 16*3, GetY+16);
    MoveTo(31*16, 17*18);
    OutText('FALLECIDOS');
    SetFillStyle(SolidFill, 4);
    Bar(GetX + 16*2, GetY, GetX + 16*3, GetY+16);

    Graficar_torta_de_tres_variables(6*16, 26*16, 16*4, 16*4, cant_activos, cant_Recuperados, cant_fallecidos, total);
    readkey;
end;

procedure Mostrar_la_cantidad_de_edades(cant_menores_a_18, cant_entre_18_y_49, cant_mayores_a_49, total: LongWord);
Var
    cant_menores_a_18_Str, cant_entre_18_y_49_Str, cant_mayores_a_49_Str,
    Pors_cant_menores_a_18_Str,  Pors_cant_entre_18_y_49_Str,  Pors_cant_mayores_a_49_Str: String;
begin
    Str(cant_menores_a_18, cant_menores_a_18_Str);
    Str(cant_entre_18_y_49, cant_entre_18_y_49_Str);
    Str(cant_mayores_a_49, cant_mayores_a_49_Str);
    Str(porcentaje(cant_menores_a_18, total):0:2, Pors_cant_menores_a_18_Str);
    Str(porcentaje(cant_entre_18_y_49, total):0:2, Pors_cant_entre_18_y_49_Str);
    Str(porcentaje(cant_mayores_a_49, total):0:2, Pors_cant_mayores_a_49_Str);


    OutTextXY((53*16 div 2)-38*8, 12*13, ('CANTIDAD DE PACIENTES POR RANGO ETARIO'));

    Rectangle(8,11*16,60*16,31*16);

    SetFillStyle(SolidFill, 92);
    Bar(9,11*16+1,60*16-1,31*16-1);
    SetFillStyle(SolidFill, 91);

    OutTextXY(16, 12*16, ('Cantidad de pacientes MENORES A 18:  ' + cant_menores_a_18_Str));
    OutTextXY(16, 13*16, ('Cantidad de pacientes ENTRE 18 Y MENORES A 49: ' + cant_entre_18_y_49_Str));
    OutTextXY(16, 14*16, ('Cantidad de pacientes MAYORES A 49: ' + cant_mayores_a_49_Str));

    OutTextXY(16, 15*16, ('porcentaje pacientes MENORES A 18:  ' + Pors_cant_menores_a_18_Str + '%'));
    OutTextXY(16, 16*16, ('porcentaje pacientes ENTRE 18 Y MENORES A 49: ' + Pors_cant_entre_18_y_49_Str + '%'));
    OutTextXY(16, 17*16, ('porcentaje pacientes MAYORES A 49: ' + Pors_cant_mayores_a_49_Str + '%'));

    MoveTo(16, 17*18);
    OutText('MENORES A 18');
    SetFillStyle(SolidFill, 1);
    Bar(GetX + 16*2, GetY, GetX + 16*3, GetY+16);
    MoveTo(GetX+16*4, GetY);
    OutText('ENTRE 18 Y MENORES A 49');
    SetFillStyle(SolidFill, 2);
    Bar(GetX + 16*2, GetY, GetX + 16*3, GetY+16);
    MoveTo(GetX+16*4, GetY);
    OutText('MAYORES A 49');
    SetFillStyle(SolidFill, 4);
    Bar(GetX + 16*2, GetY, GetX + 16*3, GetY+16);

    Graficar_torta_de_tres_variables(6*16, 26*16, 16*4, 16*4, cant_menores_a_18,cant_entre_18_y_49,cant_mayores_a_49, total);
    readkey;
end;

procedure Estadisticas_de_casos_por_provincia(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
Var
    opcion: Char;
    i, Cant_activos, Cant_Recuperados, Cant_Fallecidos: LongWord;
    Codigo_Provincia: Byte;
    Nombre_Provincia: String;
    R_Estadisticas: REG_Estadisticas;
begin
    Cant_activos:= 0;
    Cant_Recuperados:= 0;
    Cant_Fallecidos:= 0;

    Abrir_archivo_estadisticas_para_lectura_escritura(ARCH_Estadisticas);

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
        Cargo_nombre_de_provincia(Codigo_Provincia, Nombre_Provincia);

        for i:=0 to FileSize(ARCH_Estadisticas)-1 do
        begin
            cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(ARCH_Estadisticas, R_Estadisticas, i);
            if Verificar_que_pacientes_pertenece_a_la_elegida_provincia(R_Estadisticas.Codigo_Provincia, Codigo_Provincia, R_Estadisticas.Dado_de_baja) = true then
            begin
                Contar_Paciente_segun_su_estado(R_Estadisticas.Estado, Cant_activos, Cant_Recuperados, Cant_Fallecidos);
            end;
        end;
        Close(ARCH_Estadisticas);
        
        if (Cant_activos + Cant_Recuperados + Cant_Fallecidos) > 0 then
        begin
            Mostrar_la_cantidad_de_fallecidos(Cant_activos, Cant_Recuperados, Cant_Fallecidos, (Cant_activos + Cant_Recuperados + Cant_Fallecidos), Nombre_Provincia);
        end
        else
        begin
            Mostrar_MSJ('No hay casos en ' + Nombre_Provincia, 'Presione una tecla para volver al menu principal');
            Readkey;
            Bar(3*15, 16*10, 57*16,16*16);
        end;
    end;

end;

procedure Estadisticas_de_casos_en_Argentina(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
Var
    i, Cant_activos, Cant_Recuperados, Cant_Fallecidos: LongWord;
    Nombre_Pais: String;
    R_Estadisticas: REG_Estadisticas;
begin
    Cant_activos:= 0;
    Cant_Recuperados:= 0;
    Cant_Fallecidos:= 0;
    Nombre_Pais:= '';
    
    Abrir_archivo_estadisticas_para_lectura_escritura(ARCH_Estadisticas);

    if IoResult <> 0 then
    begin
        Mostrar_MSJ('Error, archivo no encontrado', 'Presione una tecla para volver al menu principal');
        Readkey;
        Bar(3*15, 16*10, 57*16,16*16);
    end
    else
    begin
        Nombre_Pais:= 'ARGENTINA';

        for i:=0 to FileSize(ARCH_Estadisticas)-1 do
        begin
            cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(ARCH_Estadisticas, R_Estadisticas, i);

            if (R_Estadisticas.Dado_de_baja = false) then 
                Contar_Paciente_segun_su_estado(R_Estadisticas.Estado, Cant_activos, Cant_Recuperados, Cant_Fallecidos)
        end;
        Close(ARCH_Estadisticas);

        if (Cant_activos + Cant_Recuperados + Cant_Fallecidos) > 0 then
        begin
            Mostrar_la_cantidad_de_fallecidos(Cant_activos, Cant_Recuperados, Cant_Fallecidos, (Cant_activos + Cant_Recuperados + Cant_Fallecidos), Nombre_Pais);
        end
        else
        begin
            Mostrar_MSJ('No hay casos en ' + Nombre_Pais, 'Presione una tecla para volver al menu principal');
            Readkey;
            Bar(3*15, 16*10, 57*16,16*16);
        end;
    end;

end;

procedure Estadisticas_de_casos(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
Var
    opcion: char;
begin
    cleardevice;

    Rectangle(3*11,2*16, 52*16,7*16);

    SetFillStyle(SolidFill, 92);
    Bar(3*16+1,2*16+1, 52*16-1,7*16-1);
    SetFillStyle(SolidFill, 91);

    OutTextXY(4*16, 16*3,'[1]-Estadisticas de casos por provincia');
    OutTextXY(4*16, 16*4,'[2]-Estadisticas de casos a nivel nacional');
    OutTextXY(4*16, 16*5,'[ESC]-Salir');
    
    
    repeat
        opcion:= readkey;
    until ((opcion in ['1', '2']) OR (opcion = #27));

    CASE Opcion OF
        '1':
            Estadisticas_de_casos_por_provincia(ARCH_Estadisticas);
        '2':
            Estadisticas_de_casos_en_Argentina(ARCH_Estadisticas);
    end;
end;

procedure Cant_Pacientes_Segun_su_edad(EDAD: byte; VAR cant_menores_a_18: LongWord;VAR cant_entre_18_y_49: LongWord;VAR cant_mayores_a_49: LongWord);
begin
    if (EDAD < 18) then
        Inc(cant_menores_a_18)
        else
            if ((EDAD >= 18) AND (EDAD < 49))  then
                Inc(cant_entre_18_y_49)
                else
                    if (EDAD >= 49) then
                        Inc(cant_mayores_a_49)
end;

procedure Estadisticas_por_rango_etario(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
VAR
    R_Paciente: REG_Persona;
    R_Estadisticas: REG_Estadisticas;
    i: LongWord;
    cant_menores_a_18, cant_entre_18_y_49, cant_mayores_a_49: LongWord;
begin
    cant_menores_a_18:= 0;
    cant_entre_18_y_49:= 0;
    cant_mayores_a_49:= 0;


    Abrir_ARCHIVO_pacientes_y_Estadisticas(ARCH_Pacientes, ARCH_Estadisticas);
    IF IoResult <> 0 then
    begin
        Mostrar_MSJ('Error, archivo no encontrado', 'Presione una tecla para volver al menu principal');
        Readkey;
        Bar(3*15, 16*10, 57*16,16*16);
    end
    else
    begin
        for i:=0 to FileSize(ARCH_Pacientes)-1 do
        begin
            cargar_un_elemento_del_archivo_pacientes_una_posicion_especifica(ARCH_Pacientes, R_Paciente, i);
            cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(ARCH_Estadisticas, R_Estadisticas, i);

            if R_Estadisticas.Dado_de_baja = False then
                Cant_Pacientes_Segun_su_edad((2020-R_Paciente.Fecha_de_nacimiento.ano), cant_menores_a_18, cant_entre_18_y_49, cant_mayores_a_49)
        end;

        Cerrar_ARCHIVO_pacientes_y_Estadisticas(ARCH_Pacientes, ARCH_Estadisticas);

        if (cant_menores_a_18 + cant_entre_18_y_49 + cant_mayores_a_49) > 0 then
        begin
            Mostrar_la_cantidad_de_edades(cant_menores_a_18, cant_entre_18_y_49, cant_mayores_a_49, (cant_menores_a_18 + cant_entre_18_y_49 + cant_mayores_a_49));
        end
        else
        begin
            Mostrar_MSJ('La suma de las edades es igual a 0', 'Presione una tecla para volver al menu principal');
            Readkey;
            Bar(3*15, 16*10, 57*16,16*16);
        end;
    end;
end;

procedure Cont_cant_forma_de_contagios(Forma_de_contagio: string; VAR Cant_de_contagio_directo: LongWord; VAR cant_transmision_comunitaria: LongWord; VAR cant_desconocida: LongWord);
begin
    
    if Forma_de_contagio = 'Contagio directo' then
        inc(Cant_de_contagio_directo)
    else
        if Forma_de_contagio = 'Desconocida' then
            inc(cant_desconocida)
        else
            if Forma_de_contagio = 'Transmision comunitaria' then
                inc(cant_transmision_comunitaria)
end;

procedure Mostrar_estadisticas_de_forma_de_contagio(Cant_de_contagio_directo, cant_transmision_comunitaria, cant_desconocida, total: LongWord);
Var
    Cant_de_contagio_directo_Str, cant_transmision_comunitaria_Str, cant_desconocida_Str,
    Pors_Cant_de_contagio_directo_Str, Pors_cant_transmision_comunitaria_Str, Pors_cant_desconocida_Str: String;
begin
    OutTextXY((68*16 div 2)-33*8, 12*13, ('ESTADISTICAS DE FORMA DE CONTAGIO'));

    Rectangle(8,12*15,68*16,31*16);
    
    SetFillStyle(SolidFill, 92);
    bar(9,12*15+1,68*16-1,31*16-1);
    SetFillStyle(SolidFill, 91);
    Str(Cant_de_contagio_directo, Cant_de_contagio_directo_Str);
    Str(cant_transmision_comunitaria, cant_transmision_comunitaria_Str);
    Str(cant_desconocida, cant_desconocida_Str);

    Str(porcentaje(Cant_de_contagio_directo, total):0:2, Pors_Cant_de_contagio_directo_Str);
    Str(porcentaje(cant_transmision_comunitaria, total):0:2, Pors_cant_transmision_comunitaria_Str);
    Str(porcentaje(cant_desconocida, total):0:2, Pors_cant_desconocida_Str);

    OutTextXY(16, 12*16, ('Cantidad de Contagiados directamente:  ' + Cant_de_contagio_directo_Str));
    OutTextXY(16, 13*16, ('Cantidad de forma de contagio por transmision comunitaria:  ' + cant_transmision_comunitaria_Str));
    OutTextXY(16, 14*16, ('Cantidad de forma de contagio desconocida: : ' + cant_desconocida_Str));

    OutTextXY(16, 15*16, ('porcentaje de Contagiados directamente:  ' + Pors_Cant_de_contagio_directo_Str + '%'));
    OutTextXY(16, 16*16, ('porcentaje de forma de contagio por transmision comunitaria: ' + Pors_cant_transmision_comunitaria_Str + '%'));
    OutTextXY(16, 17*16, ('porcentaje de Contagiados desconocida: ' + Pors_cant_desconocida_Str + '%'));

    MoveTo(5*16, 17*18);
    OutText('DIRECTAMENTE');
    SetFillStyle(SolidFill, 1);
    Bar(GetX + 16*2, GetY, GetX + 16*3, GetY+16);
    MoveTo(GetX+16*4, GetY);
    OutText('COMUNITARIA');
    SetFillStyle(SolidFill, 2);
    Bar(GetX + 16*2, GetY, GetX + 16*3, GetY+16);
    MoveTo(GetX+16*4, GetY);
    OutText('DESCONOCIDA');
    SetFillStyle(SolidFill, 4);
    Bar(GetX + 16*2, GetY, GetX + 16*3, GetY+16);

    Graficar_torta_de_tres_variables(6*16, 26*16, 16*4, 16*4, Cant_de_contagio_directo,cant_transmision_comunitaria,cant_desconocida, total);
    readkey;
end;

procedure Estadisticas_por_forma_de_contaigo(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
VAR
    R_Estadisticas: REG_Estadisticas;
    i: LongWord;
    Cant_de_contagio_directo, cant_transmision_comunitaria, cant_desconocida: LongWord;
begin
    Cant_de_contagio_directo:= 0;
    cant_transmision_comunitaria:= 0;
    cant_desconocida:= 0;

    Abrir_archivo_estadisticas_para_lectura_escritura(ARCH_Estadisticas);

    IF IoResult <> 0 then
    begin
        Mostrar_MSJ('Error, archivo no encontrado', 'Presione una tecla para volver al menu principal');
        Readkey;
        Bar(3*15, 16*10, 57*16,16*16);
    end
    else
    begin
        for i:=0 to FileSize(ARCH_Estadisticas)-1 do
        begin
            cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(ARCH_Estadisticas, R_Estadisticas, i);

            if R_Estadisticas.Dado_de_baja = False then
                Cont_cant_forma_de_contagios(R_Estadisticas.Forma_de_contagio, Cant_de_contagio_directo, cant_transmision_comunitaria, cant_desconocida)
        end;

        Close(ARCH_Estadisticas);

        if (Cant_de_contagio_directo + cant_transmision_comunitaria + cant_desconocida) > 0 then
        begin
            Mostrar_estadisticas_de_forma_de_contagio(Cant_de_contagio_directo, cant_transmision_comunitaria, cant_desconocida, (Cant_de_contagio_directo + cant_transmision_comunitaria + cant_desconocida))
        end
        else
        begin
            Mostrar_MSJ('Las formas de contagio son 0', 'Presione una tecla para volver al menu principal');
            Readkey;
            Bar(3*15, 16*10, 57*16,16*16);
        end;
    end;
end;

procedure Menu_Estadisticas(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; VAR ARCH_Pacientes: ARCHIVO_Pacientes);
Var
    opcion: char;
begin
    cleardevice;

    Rectangle(3*16,2*16, 48*16, 8*16);
    SetFillStyle(SolidFill, 92);
    Bar(3*16+1,2*16+1, 48*16-1, 8*16-1);
    SetFillStyle(SolidFill, 91);
    OutTextXY(4*16, 16*3,'[1]-Estadisticas de casos');
    OutTextXY(4*16, 16*4,'[2]-Estadisticas por rango etario');
    OutTextXY(4*16, 16*5,'[3]-Estadisticas por forma de contagio');
    OutTextXY(4*16, 16*6,'[ESC]-Salir');

    repeat
        opcion:= readkey;
    until ((opcion in ['1'..'3']) OR (opcion = #27));

    CASE Opcion OF
        '1':
            Estadisticas_de_casos(ARCH_Estadisticas);
        '2':
            Estadisticas_por_rango_etario(ARCH_Pacientes, ARCH_Estadisticas);
        '3':
            Estadisticas_por_forma_de_contaigo(ARCH_Estadisticas);
    end;

end;

end.