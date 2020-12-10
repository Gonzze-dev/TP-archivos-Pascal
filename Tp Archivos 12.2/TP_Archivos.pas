PROGRAM TP_Archivos;

uses FUNC_REG_Pacientes, FUNC_REG_Estadisticas, 
    FUNC_REG_Provincias, FUNC_Registros, ARCH_REG_Provincia,
    ARCH_REG_Pacientes, ARCH_REG_Estadisticas, FUNC_MENU_GENERAL, graph;

Var
    Persona: REG_Persona;
    Estadisticas: REG_Estadisticas;
    ARCH_Personas: ARCHIVO_Pacientes;
    ARCH_Estadisticas: ARCHIVO_Estadisticas;
    Opcion: char;
    Driver, GraphMode: Integer;

BEGIN
    Driver:= detect;
    initgraph(Driver,GraphMode,'');
    
    SetColor(250);
    SetTextStyle(SansSerifFont, 0, 2);
    SetFillStyle(SolidFill, 91);
    SetBkColor((91));

    repeat

        Menu_General(ARCH_Personas, ARCH_Estadisticas, Persona, Estadisticas, Opcion);
        
    until (Opcion = #27);

END.
