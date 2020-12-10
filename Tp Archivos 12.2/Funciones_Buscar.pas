Unit Funciones_Buscar;

interface
uses  ARCH_REG_Pacientes;

PROCEDURE BBIN_DNI (VAR ARCH: ARCHIVO_Pacientes; BUSCADO: LongWord; VAR POS: LongInt);

implementation
uses FUNC_REG_Pacientes;

PROCEDURE BBIN_DNI (VAR ARCH: ARCHIVO_Pacientes; BUSCADO: LongWord; VAR POS: LongInt);
VAR 
    R1: REG_Persona;
    PRI,ULT,MED: LONGINT;
BEGIN
    PRI:= 0;
    ULT:= FILESIZE (ARCH)-1;
    POS := -1;
    WHILE (POS = -1) AND (PRI<= ULT) DO
    BEGIN
        MED:= (PRI + ULT) DIV 2;
        SEEK (ARCH,MED);
        READ (ARCH,R1);

        IF R1.DNI = BUSCADO THEN 
            POS:= MED
        ELSE
            IF R1.DNI > BUSCADO THEN 
                ULT:= MED -1
        ELSE 
            PRI:= MED +1;
    END;
END;


end.