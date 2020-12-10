Unit ARCH_REG_Provincia;

interface
uses FUNC_REG_Provincias;

    const
        limite = 23;
        Directorio_provincia = '.\Datos\Datos Provincias.dat';
    type

    ARCHIVO_Provincia = File Of REG_provincia;

procedure Cargar_todas_las_provincias_en_el_archivo_provincias(VAR ARCH_Provincia: ARCHIVO_Provincia; VAR Provincia : REG_provincia);
function tomar_y_devolver_reg_provincia_del_archivo(VAR ARCH_Provincia: ARCHIVO_Provincia; VAR Provincia : REG_provincia; POS: LongWord) : REG_provincia;
implementation

procedure Abrir_archivo_provincia_para_lectura_escritura(VAR ARCH_Provincia: ARCHIVO_Provincia);
const
    Directorio = Directorio_provincia;
begin

    assign(ARCH_Provincia, Directorio);
    {$I-} reset(ARCH_Provincia); {$I+}

end;

procedure Guarda_Registro_Provincias(VAR ARCH_Provincia: ARCHIVO_Provincia; Provincia : REG_provincia);
begin
    Abrir_archivo_provincia_para_lectura_escritura(ARCH_Provincia);

    if ioresult <> 0 then
    begin
        rewrite(ARCH_Provincia);
        seek(ARCH_Provincia,0);
        write(ARCH_Provincia, Provincia);
    end
    else
    begin
        seek(ARCH_Provincia,filesize(ARCH_Provincia));
        write(ARCH_Provincia, Provincia);
    end;

    Close(ARCH_Provincia);
end;

procedure Cargar_todas_las_provincias_en_el_archivo_provincias(VAR ARCH_Provincia: ARCHIVO_Provincia; VAR Provincia : REG_provincia);
const
        arreglo_Provincias: array [1..limite] of REG_provincia = (
            (Nombre_Provincia: 'Salta';  Codigo_de_provincia: 1; Telefono_de_contacto: '911'),
            (Nombre_Provincia: 'Provincia de Buenos Aires';  Codigo_de_provincia: 2; Telefono_de_contacto: '148'),
            (Nombre_Provincia: 'San Luis';  Codigo_de_provincia: 3; Telefono_de_contacto: '107'),
            (Nombre_Provincia: 'Entre Rios';  Codigo_de_provincia: 4; Telefono_de_contacto: '0800-777-8476'),
            (Nombre_Provincia: 'La Rioja';  Codigo_de_provincia: 5; Telefono_de_contacto: '107'),
            (Nombre_Provincia: 'Santiago del Estero';  Codigo_de_provincia: 6; Telefono_de_contacto: '0800-888-6737'),
            (Nombre_Provincia: 'Chaco';  Codigo_de_provincia: 7; Telefono_de_contacto: '0800-444-0829'),
            (Nombre_Provincia: 'San Juan';  Codigo_de_provincia: 8; Telefono_de_contacto: '107'),
            (Nombre_Provincia: 'Catamarca';  Codigo_de_provincia: 9; Telefono_de_contacto: '383-15-423-8872'),
            (Nombre_Provincia: 'La Pampa';  Codigo_de_provincia: 10; Telefono_de_contacto: '0800-333-1135'),
            (Nombre_Provincia: 'Mendoza';  Codigo_de_provincia: 11; Telefono_de_contacto: '0800-800-26843'),
            (Nombre_Provincia: 'Misiones';  Codigo_de_provincia: 12; Telefono_de_contacto: '0800-444-3400'),
            (Nombre_Provincia: 'Formosa';  Codigo_de_provincia: 13; Telefono_de_contacto: '107'),
            (Nombre_Provincia: 'Neuquen';  Codigo_de_provincia: 14; Telefono_de_contacto: '0800-333-1002'),
            (Nombre_Provincia: 'Rio Negro';  Codigo_de_provincia: 15; Telefono_de_contacto: '911'),
            (Nombre_Provincia: 'Santa Fe';  Codigo_de_provincia: 16; Telefono_de_contacto: '0800-555-6549'),
            (Nombre_Provincia: 'Tucuman';  Codigo_de_provincia: 17; Telefono_de_contacto: '0800-555-8478'),
            (Nombre_Provincia: 'Chubut';  Codigo_de_provincia: 18; Telefono_de_contacto: '0800-222-2676'),
            (Nombre_Provincia: 'Tierra del Fuego';  Codigo_de_provincia: 19; Telefono_de_contacto: '107'),
            (Nombre_Provincia: 'Corrientes';  Codigo_de_provincia: 20; Telefono_de_contacto: '0379-497-4811'),
            (Nombre_Provincia: 'Cordoba';  Codigo_de_provincia: 21; Telefono_de_contacto: '0800-122-1444'),
            (Nombre_Provincia: 'Jujuy';  Codigo_de_provincia: 22; Telefono_de_contacto: '0800-888-4767'),
            (Nombre_Provincia: 'Santa Cruz';  Codigo_de_provincia: 23; Telefono_de_contacto: '0800-222-2676')
            );

VAR
    i: Integer;
begin

    for i:= 0 to 22 do
    begin
        Provincia:= arreglo_Provincias[i+1];
        Guarda_Registro_Provincias(ARCH_Provincia, Provincia);
    end;

end;

function tomar_y_devolver_reg_provincia_del_archivo(VAR ARCH_Provincia: ARCHIVO_Provincia; VAR Provincia : REG_provincia; POS: LongWord) : REG_provincia;
BEGIN

    Abrir_archivo_provincia_para_lectura_escritura(ARCH_Provincia);

    if ioresult <> 0 then
    begin
        Cargar_todas_las_provincias_en_el_archivo_provincias(ARCH_Provincia, Provincia);
        Abrir_archivo_provincia_para_lectura_escritura(ARCH_Provincia);
        Seek(ARCH_Provincia, POS);
        Read(ARCH_Provincia, Provincia);
        Close(ARCH_Provincia);
    end
    else
    begin
        Seek(ARCH_Provincia, POS);
        Read(ARCH_Provincia, Provincia);
        Close(ARCH_Provincia);
    end;

    tomar_y_devolver_reg_provincia_del_archivo:= Provincia;
END;

end.