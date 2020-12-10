unit Funciones_Ordenar;

interface
uses 
    ARCH_REG_Estadisticas, ARCH_REG_Pacientes;

procedure insercion_de_menor_a_mayor_de_DNI_De_Archivos(VAR ARCH_Pacinetes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
procedure insercion_alfabetica_de_nombres_De_Archivos(VAR ARCH_Pacinetes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);

implementation
uses FUNC_REG_Pacientes, FUNC_REG_Estadisticas;

procedure insercion_de_menor_a_mayor_de_DNI_De_Archivos(VAR ARCH_Pacinetes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
var 
    i,j: integer;
    R_Persona_J, R_Persona_aux: REG_Persona;
    R_Estadisticas_de_Persona_J, R_Estadisticas_de_Persona_aux: REG_Estadisticas;

begin

    for i:= 1 to FileSize(ARCH_Pacinetes)-1 do
    begin
        j:= i-1;
        
        Seek(ARCH_Pacinetes, i);
        Read(ARCH_Pacinetes, R_Persona_aux);

        Seek(ARCH_Estadisticas, i);
        Read(ARCH_Estadisticas, R_Estadisticas_de_Persona_aux);

        Seek(ARCH_Pacinetes, j);
        Read(ARCH_Pacinetes, R_Persona_J);

        Seek(ARCH_Estadisticas, j);
        Read(ARCH_Estadisticas, R_Estadisticas_de_Persona_J);

        while (j>-1) and (R_Persona_J.DNI > R_Persona_aux.DNI) do
        begin
            Seek(ARCH_Pacinetes, j+1);
            Write(ARCH_Pacinetes, R_Persona_J);

            Seek(ARCH_Estadisticas, j+1);
            Write(ARCH_Estadisticas, R_Estadisticas_de_Persona_J);

            j:=j-1;

            if j > -1 then
            begin
                Seek(ARCH_Pacinetes, j);
                Read(ARCH_Pacinetes, R_Persona_J);

                Seek(ARCH_Estadisticas, j);
                Read(ARCH_Estadisticas, R_Estadisticas_de_Persona_J);
            end;

        end;

        Seek(ARCH_Pacinetes, j+1);
        Write(ARCH_Pacinetes, R_Persona_aux);

        Seek(ARCH_Estadisticas, j+1);
        Write(ARCH_Estadisticas, R_Estadisticas_de_Persona_aux);

    end;

end;

procedure insercion_alfabetica_de_nombres_De_Archivos(VAR ARCH_Pacinetes: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
var 
    i,j: integer;
    R_Persona_J, R_Persona_aux: REG_Persona;
    R_Estadisticas_de_Persona_J, R_Estadisticas_de_Persona_aux: REG_Estadisticas;

begin

    for i:= 1 to FileSize(ARCH_Pacinetes)-1 do
    begin
        j:= i-1;
        Seek(ARCH_Pacinetes, i);
        Read(ARCH_Pacinetes, R_Persona_aux);

        Seek(ARCH_Estadisticas, i);
        Read(ARCH_Estadisticas, R_Estadisticas_de_Persona_aux);


        Seek(ARCH_Pacinetes, j);
        Read(ARCH_Pacinetes, R_Persona_J);

        Seek(ARCH_Estadisticas, j);
        Read(ARCH_Estadisticas, R_Estadisticas_de_Persona_J);


        while (j>-1) and (R_Persona_J.Apellido_y_Nombre > R_Persona_aux.Apellido_y_Nombre) do
        begin
            Seek(ARCH_Pacinetes, j+1);
            Write(ARCH_Pacinetes, R_Persona_J);

            Seek(ARCH_Estadisticas, j+1);
            Write(ARCH_Estadisticas, R_Estadisticas_de_Persona_J);

            j:=j-1;

            if j > -1 then
            begin
                Seek(ARCH_Pacinetes, j);
                Read(ARCH_Pacinetes, R_Persona_J);

                Seek(ARCH_Estadisticas, j);
                Read(ARCH_Estadisticas, R_Estadisticas_de_Persona_J);
            end;

        end;

        Seek(ARCH_Pacinetes, j+1);
        Write(ARCH_Pacinetes, R_Persona_aux);

        Seek(ARCH_Estadisticas, j+1);
        Write(ARCH_Estadisticas, R_Estadisticas_de_Persona_aux);

    end;

end;

end.