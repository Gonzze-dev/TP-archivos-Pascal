unit FUNC_Registros;

interface
uses FUNC_REG_Pacientes, FUNC_REG_Estadisticas;

procedure Cargar_Datos(VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);

procedure Mostrar_Datos_del_paciente(R_Persona: REG_Persona; R_Estadisticas: REG_Estadisticas);
procedure Pos_Datos_Ingresados(Dato: String; PosX, PosY: Integer);
implementation
uses graph, FUNC_REG_Provincias;

procedure Pos_Datos_Ingresados(Dato: String; PosX, PosY: Integer);
begin

    SetTextStyle(SansSerifFont, 0, 1);
    OutTextXY(27*PosX, 16*PosY, Dato);
    SetTextStyle(SansSerifFont, 0, 2);


end;

procedure Cargar_Datos(VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas);
Var
    Dato_numerico_a_string, Datos_Concatenados: String;
begin
    Dato_numerico_a_string:= '';

    Cargar_Apellido_y_Nombre(R_Persona.Apellido_y_Nombre);
    Pos_Datos_Ingresados('Apellido Y Nombre: ' + R_Persona.Apellido_y_Nombre, 16, 2);
    
    Cargar_Calle(R_Persona.Domicilio.Calle);

    Cargar_numero_de_calle(R_Persona.Domicilio.Numero);
    str(R_Persona.Domicilio.Numero, Dato_numerico_a_string);

    Cargar_el_Piso(R_Persona.Domicilio.Piso);
    
    Cargar_Ciudad(R_Persona.Domicilio.Ciudad);

    Datos_Concatenados:= 'Domicilio: ' + R_Persona.Domicilio.Calle + ' ' + Dato_numerico_a_string  + ' ' + R_Persona.Domicilio.Piso;

    Cargar_Codigo_postal(R_Persona.Domicilio.Codigo_Postal);
    str(R_Persona.Domicilio.Codigo_Postal, Dato_numerico_a_string);

    Datos_Concatenados += ' ' + Dato_numerico_a_string;

    Bar((3*16), (16*16), 68*16,(33*16));

    Cargar_Registro_Provincia_y_le_paso_el_nombre_al_registro_persona(R_Estadisticas.Codigo_Provincia);
    R_Persona.Domicilio.Codigo_Provincia:= R_Estadisticas.Codigo_Provincia;

    Cargo_nombre_de_provincia(R_Persona.Domicilio.Codigo_Provincia, Dato_numerico_a_string);
    Datos_Concatenados += ' ' + Dato_numerico_a_string;

    Pos_Datos_Ingresados(Datos_Concatenados, 16, 4);

    Bar((3*16), (16*16), 57*16,(33*16));

    Cargar_Numero_de_telefono(R_Persona.Domicilio.Telefono_de_contacto);
    Str(R_Persona.Domicilio.Telefono_de_contacto , Dato_numerico_a_string);
    Pos_Datos_Ingresados('Numero de telefono: ' + Dato_numerico_a_string, 16, 5);

    Cargar_Email(R_Persona.Email);
    
    Pos_Datos_Ingresados(R_Persona.Email, 16, 6);

    Bar((3*16), (16*16), 57*16,(33*16));
    
    Cargar_fecha_de_nacimiento(R_Persona.Fecha_de_nacimiento.dia, R_Persona.Fecha_de_nacimiento.mes, R_Persona.Fecha_de_nacimiento.ano);
    
    Str(R_Persona.Fecha_de_nacimiento.dia, Dato_numerico_a_string);
    Datos_Concatenados:=  Dato_numerico_a_string + '/';

    Str(R_Persona.Fecha_de_nacimiento.mes, Dato_numerico_a_string);
    Datos_Concatenados +=  Dato_numerico_a_string + '/';

    Str(R_Persona.Fecha_de_nacimiento.ano, Dato_numerico_a_string);
    Datos_Concatenados +=  Dato_numerico_a_string;

    Pos_Datos_Ingresados(Datos_Concatenados, 16, 7);

    Bar((3*16), (15*16), 57*16,(34*16));

    Cargar_Registro_Estadisticas(R_Estadisticas, R_Persona.DNI);

    Datos_Concatenados:= 'Estado: ' + R_Estadisticas.Estado;
    Pos_Datos_Ingresados(Datos_Concatenados, 16, 8);
    Datos_Concatenados:= 'Forma de Contagio: ' + R_Estadisticas.Forma_de_contagio;
    Pos_Datos_Ingresados(Datos_Concatenados, 16, 9);
end;

procedure Mostrar_Datos_del_paciente(R_Persona: REG_Persona; R_Estadisticas: REG_Estadisticas);
var
   Telefono_de_contacto_por_covid, Nombre_Provincia, DNI_Str, Numero_de_calle_Str,
   Codigo_postal_Str, Telefono_de_contacto_Str,dia, mes, ano: String;
begin
    Telefono_de_contacto_por_covid:= '';
    Nombre_Provincia:= '';
    Cargo_Telefono_de_contacto_por_covid(R_Estadisticas.Codigo_Provincia, Telefono_de_contacto_por_covid);
    Cargo_nombre_de_provincia(R_Persona.Domicilio.Codigo_Provincia, Nombre_Provincia);

    Str(R_Persona.DNI, DNI_Str);
    Str(R_Persona.Domicilio.Numero, Numero_de_calle_Str);
    Str(R_Persona.Domicilio.Telefono_de_contacto, Telefono_de_contacto_Str);
    Str(R_Persona.Domicilio.Codigo_Postal, Codigo_postal_Str);
    Str(R_Persona.Fecha_de_nacimiento.dia, dia);
    Str(R_Persona.Fecha_de_nacimiento.mes, mes);
    Str(R_Persona.Fecha_de_nacimiento.ano, ano);

    OutTextXY(4*16, 128+16*11, ('Nombre: ' + R_Persona.Apellido_y_Nombre));
    OutTextXY(4*16, 128+16*12, ('DNI: ' + DNI_Str));
    OutTextXY(4*16, 128+16*13, ('Domicilio: ' + R_Persona.Domicilio.Calle + ' ' + Numero_de_calle_Str + ' ' + R_Persona.Domicilio.Piso));
    OutTextXY(4*16, 128+16*14, ('Numero de contacto: ' + Telefono_de_contacto_Str));
    OutTextXY(4*16, 128+16*15, ('Ciudad: ' + R_Persona.Domicilio.Ciudad));
    OutTextXY(4*16, 128+16*16, ('Codigo postal: ' + Codigo_postal_Str));
    OutTextXY(4*16, 128+16*17, ('Telefono de contacto por covid19: ' + Telefono_de_contacto_por_covid));
    OutTextXY(4*16, 128+16*18, ('Provincia: ' + Nombre_Provincia));
    OutTextXY(4*16, 128+16*19, ('Email: ' + R_Persona.Email));
    OutTextXY(4*16, 128+16*20, ('Fecha de nacimiento: ' + dia + '/' + mes + '/' + ano));
    OutTextXY(4*16, 128+16*21, ('Estado: ' + R_Estadisticas.Estado));
    OutTextXY(4*16, 128+16*22, ('Forma de Contagio: ' + R_Estadisticas.Forma_de_contagio));

end;



end.
