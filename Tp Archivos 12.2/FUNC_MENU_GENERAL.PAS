unit FUNC_MENU_GENERAL;

interface
    uses FUNC_REG_Pacientes, FUNC_REG_Estadisticas, 
    ARCH_REG_Pacientes, ARCH_REG_Estadisticas;
    

    procedure Menu_General(VAR ARCH_Personas: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;
                        VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas; var Opcion: Char);

implementation
uses
    FUNC_Menu_Listados, FUNC_Menu_ABMC, FUNC_MENU_ESTADISTICAS, graph, wincrt;

procedure Menu_General(VAR ARCH_Personas: ARCHIVO_Pacientes; VAR ARCH_Estadisticas: ARCHIVO_Estadisticas;
                VAR R_Persona: REG_Persona; VAR R_Estadisticas: REG_Estadisticas; var Opcion: Char);

begin
    cleardevice;

    Rectangle(3*16,2*16, 27*16,8*16);
    SetFillStyle(SolidFill, 92);
    bar(3*16+1,2*16+1, 27*16-1,8*16-1);
    SetFillStyle(SolidFill, 91);

    OutTextXY(4*16, 16*3,'[1]-Menu ABMC');
    OutTextXY(4*16, 16*4,'[2]-Lista de pacientes');
    OutTextXY(4*16, 16*5,'[3]-Menu Estadisticas');
    OutTextXY(4*16, 16*6,'[ESC]-Salir');
    
    repeat
        Opcion:= ReadKey;
    until((Opcion in ['1'..'3']) OR (Opcion = #27));

    CASE Opcion OF
        '1':
            Menu_ABMC(ARCH_Personas, ARCH_Estadisticas, R_Persona, R_Estadisticas);
        '2':
            Menu_Listados(ARCH_Personas, ARCH_Estadisticas, R_Persona, R_Estadisticas);
        '3':
            Menu_Estadisticas(ARCH_Estadisticas, ARCH_Personas);
    end;
end;

end.