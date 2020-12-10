unit ARCH_REG_Estadisticas;

interface
uses FUNC_REG_Estadisticas;

Const
    Directorio_Estadisticas = '.\Datos\Datos Estadisticas.dat';

type
    ARCHIVO_Estadisticas = File of REG_Estadisticas;

procedure Abrir_archivo_estadisticas_para_lectura_escritura(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
procedure cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; VAR R_Estadisticas : REG_Estadisticas; pos: LongInt);

procedure Guarda_Registro_Estadisticas(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; R_Estadisticas : REG_Estadisticas);
procedure Sobre_escribir_un_elemento_en_archivo_Estadisticas(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; R_Estadisticas : REG_Estadisticas; pos: LongInt);

implementation

procedure Abrir_archivo_estadisticas_para_lectura_escritura(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas);
const
    Directorio = Directorio_Estadisticas;
begin

    assign(ARCH_Estadisticas, Directorio);
    {$I-} reset(ARCH_Estadisticas); {$I+}

end;

procedure Sobre_escribir_un_elemento_en_archivo_Estadisticas(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; R_Estadisticas : REG_Estadisticas; pos: LongInt);
begin

    seek(ARCH_Estadisticas, pos);
    write(ARCH_Estadisticas, R_Estadisticas);

end;

procedure cargar_un_elemento_del_archivo_estadisticas_una_posicion_especifica(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; VAR R_Estadisticas : REG_Estadisticas; pos: LongInt);
begin


    Seek(ARCH_Estadisticas, pos);
    Read(ARCH_Estadisticas, R_Estadisticas);

end;


procedure Guarda_Registro_Estadisticas(VAR ARCH_Estadisticas: ARCHIVO_Estadisticas; R_Estadisticas : REG_Estadisticas);
begin
    Abrir_archivo_estadisticas_para_lectura_escritura(ARCH_Estadisticas);

    if ioresult <> 0 then
    begin
        rewrite(ARCH_Estadisticas);
        R_Estadisticas.ID:= FileSize(ARCH_Estadisticas) + 1;
        Sobre_escribir_un_elemento_en_archivo_Estadisticas(ARCH_Estadisticas, R_Estadisticas, 0);
    end
    else
    begin
        R_Estadisticas.ID:= FileSize(ARCH_Estadisticas) + 1;
        Sobre_escribir_un_elemento_en_archivo_Estadisticas(ARCH_Estadisticas, R_Estadisticas, filesize(ARCH_Estadisticas));
    end;
    
    close(ARCH_Estadisticas);
end;

end.