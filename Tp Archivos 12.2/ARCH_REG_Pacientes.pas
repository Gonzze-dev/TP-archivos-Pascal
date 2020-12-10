unit ARCH_REG_Pacientes;

interface
uses FUNC_REG_Pacientes;

const
    Directorio_Paciente = '.\Datos\Datos Pacientes.dat';

type
    ARCHIVO_Pacientes = File Of REG_Persona;

procedure Abrir_archivo_pacientes_para_lectura_escritura(VAR ARCH_Pacientes: ARCHIVO_Pacientes);
procedure Guarda_Registro_Persona(VAR ARCH_Pacientes: ARCHIVO_Pacientes; R_Persona : REG_Persona);
procedure Sobre_escribir_un_elemento_en_archivo_paciente(VAR ARCH_Pacientes: ARCHIVO_Pacientes; R_Persona : REG_Persona; pos: LongInt);
procedure cargar_un_elemento_del_archivo_pacientes_una_posicion_especifica(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR R_Persona : REG_Persona; pos: LongInt);
function Verificar_Existencia_del_DNI(VAR ARCH_Pacientes: ARCHIVO_Pacientes; DNI: LongWord): Boolean;

implementation
uses Funciones_Buscar;

function Verificar_Existencia_del_DNI(VAR ARCH_Pacientes: ARCHIVO_Pacientes; DNI: LongWord): Boolean;
VAR
    pos: LongInt;
begin
    BBIN_DNI(ARCH_Pacientes, DNI, pos);

    if pos = -1 then
        Verificar_Existencia_del_DNI:= False
    else
        Verificar_Existencia_del_DNI:= True
end;

procedure Abrir_archivo_pacientes_para_lectura_escritura(VAR ARCH_Pacientes: ARCHIVO_Pacientes);
const
    Directorio = Directorio_Paciente;
begin

    assign(ARCH_Pacientes, Directorio);
    {$I-} reset(ARCH_Pacientes); {$I+}

end;

procedure Sobre_escribir_un_elemento_en_archivo_paciente(VAR ARCH_Pacientes: ARCHIVO_Pacientes; R_Persona : REG_Persona; pos: LongInt);
begin


    seek(ARCH_Pacientes, pos);
    write(ARCH_Pacientes, R_Persona);

end;

procedure cargar_un_elemento_del_archivo_pacientes_una_posicion_especifica(VAR ARCH_Pacientes: ARCHIVO_Pacientes; VAR R_Persona : REG_Persona; pos: LongInt);
begin

    Seek(ARCH_Pacientes, pos);
    Read(ARCH_Pacientes, R_Persona);

end;

procedure Guarda_Registro_Persona(VAR ARCH_Pacientes: ARCHIVO_Pacientes; R_Persona : REG_Persona);
begin

    Abrir_archivo_pacientes_para_lectura_escritura(ARCH_Pacientes);
    
    if ioresult <> 0 then
    begin
        rewrite(ARCH_Pacientes);
        Sobre_escribir_un_elemento_en_archivo_paciente(ARCH_Pacientes, R_Persona, 0);
    end
    else
    begin
        Sobre_escribir_un_elemento_en_archivo_paciente(ARCH_Pacientes, R_Persona, filesize(ARCH_Pacientes));
    end;

    close(ARCH_Pacientes);

end;

end.